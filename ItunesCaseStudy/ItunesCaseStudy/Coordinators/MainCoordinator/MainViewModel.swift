//
//  MainViewModel.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 25.02.2021.
//

import Foundation
import DomainLayer
import Combine
import NetworkEntityLayer

typealias CollectionLoadingStateBlock = (CollectionLoadingState) -> Void

class MainViewModel: BaseViewModelDelegate {
    
    // Coordinator delegates to inform specific actions about routing - if necessary -
    public weak var delegate: MainViewCoordinatorDelegate?
 
    // Dependend modules
    private(set) var itunesSearchUseCase: ItunesSearchUseCase
    private(set) var callBack: ItunesSearchCallBack
    
    // Search result updater module
    private lazy var searchResultUpdater = SearchResultUpdater(delegate: self)
    
    // Local data instances
    private var searchData = [ItunesSearchResult]()
    private var itemCollectionCellModelData = [ItemCollectionCellModel]()
    private var paginationInfo = PaginationInfo()
    private var requestData = ItunesSearchRequest(term: "test", media: FilterSearchStore.selectedFilter)
    public var deletedIndex: IndexPath?

    // state control to reload main view
    private var collectionState: CollectionLoadingStateBlock?
    
    init(useCase: ItunesSearchUseCase, callBack: ItunesSearchCallBack) {
        self.itunesSearchUseCase = useCase
        self.callBack = callBack
        initData()
    }
    
    func getData(forPagination: Bool = false) {
        
        if !forPagination { updateCollectionState(with: .loading) }
        
        callBack.commonResult { [weak self](result) in
            self?.callBackHandler(with: result)
        }

        itunesSearchUseCase.execute(useCaseCallBack: callBack, params: requestData.setLimit(by: paginationInfo.limit).setOffset(by: paginationInfo.offset))
    }

    // MARK: - Public Methods -
    func listenCollectionState(completion: @escaping CollectionLoadingStateBlock) {
        collectionState = completion
    }
    
    func fetchMoreData() {
        guard paginationInfo.checkLoadingMore() else { return }
        paginationInfo.nextOffset()
        getData(forPagination: true)
    }
    
    func getSearchResultUpdater() -> SearchResultUpdater {
        return searchResultUpdater
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        let count = searchData.count
        return (paginationInfo.limit <= paginationInfo.resultCount) ? count + 1: count
    }
    
    func getItem(at index: Int) -> ItemCollectionCellModel {
        return itemCollectionCellModelData[index]
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return index >= itemCollectionCellModelData.count
    }
    
    func selectedItem(at index: Int) {
        delegate?.fireSelectedItem(with: ItemDetailData(itunesSearchResult: searchData[index], itemIndex: index))
    }
    
    func dismissCoordinator() {
        delegate?.dismissCoordinator()
    }
    
    lazy var segmentedButtonComponentData: SegmentedButtonComponentData = {
        let tempArray = [MediaButtonData(mediaItemType: .movies).appendNewAction(with: buttonClickedListener),
                         MediaButtonData(mediaItemType: .music).appendNewAction(with: buttonClickedListener),
                         MediaButtonData(mediaItemType: .app).appendNewAction(with: buttonClickedListener),
                         MediaButtonData(mediaItemType: .books).appendNewAction(with: buttonClickedListener)]
        return SegmentedButtonComponentData(buttonContainerData: ButtonContainerComponentData(buttons:  tempArray)).setFocusedSegment(by: tempArray.firstIndex(where: { $0.mediaItemType.value.metadata == FilterSearchStore.selectedFilter }))
    }()
    
    // MARK: - Private Methods -
    private func updateCollectionState(with state: CollectionLoadingState) {
        collectionState?(state)
    }
    
    private func callBackHandler(with response: Result<ItunesSearchResponse, ErrorResponse>) {
        paginationInfo.fetching = false
        
        switch response {
        case .failure(let error):
            handleError(with: error)
        case .success(let data):
            handleResponse(with: data)
            updateCollectionState(with: .done)
        }
    }
    
    private func handleResponse(with data: ItunesSearchResponse) {
        guard let itunesResult = data.results else { return }
        searchData.append(contentsOf: itunesResult)
        itemCollectionCellModelData = searchData.map({ ItemCollectionCellModel(infoViewData: CollectionInfoViewComponentData(price: $0.collectionPrice ?? 0, name: $0.collectionName ?? "unKnown", release: $0.releaseDate?.readableData() ?? "N/A"), imageContainer: CustomImageViewComponentData(imageUrl: $0.artworkUrl100?.replacingOccurrences(of: "100x100", with: "400x400") ?? "")) })
        paginationInfo.resultCount = data.resultCount ?? 0
    }
    
    private func handleError(with data: ErrorResponse) {
        let data = AlertViewData(icon: VisualContents.iconWarning.value, title: AlertViewLocalizables.warningTitle.value, subTitle: data.localizedDescription)
            .setButtons(by: createButtonData())

        delegate?.fireAlert(with: data)
    }
    
    private func createButtonData() -> [AlertButtonData] {
        let okButton = AlertButtonData(buttonTitle: AlertViewLocalizables.okButton.value, backgroundColor: #colorLiteral(red: 0.1148234084, green: 0.1298957467, blue: 0.1381868422, alpha: 1))
            .setTitleTextColor(by: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        return [okButton]
    }
    
    private func initData() {
        paginationInfo = PaginationInfo()
        searchData.removeAll()
        itemCollectionCellModelData.removeAll()
    }
    
    private func refreshList() {
        initData()
        getData()
    }
    
    private lazy var buttonClickedListener: ButtonActionType = { [weak self] (actionIndex) in
        guard let self = self else { return }
        self.requestData.media = self.segmentedButtonComponentData.buttonContainerData.buttons[actionIndex].mediaItemType.value.metadata
        FilterSearchStore.selectedFilter = self.requestData.media
        self.refreshList()
    }
}

// MARK: - Search Result Updater Methods -
extension MainViewModel: SearchResultUpdaterDelegate {
    
    func updatedText(with text: String?) {
        guard let text = text else { return }
        requestData = ItunesSearchRequest(term: text, media: FilterSearchStore.selectedFilter)
        refreshList()
    }
    
}
