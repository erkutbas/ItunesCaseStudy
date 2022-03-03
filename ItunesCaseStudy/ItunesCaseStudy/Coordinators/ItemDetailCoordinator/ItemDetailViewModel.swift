//
//  ItemDetailViewModel.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import Foundation

struct ImageLoadingOptions {
    var url: String
    var imageId: String?
}

class ItemDetailViewModel: BaseViewModelDelegate {
    
    private weak var delegate: ItemDetailCoordinatorDelegate?
    
    private(set) var data: ItemDetailData
    
    init(delegate: ItemDetailCoordinatorDelegate, data: ItemDetailData) {
        self.delegate = delegate
        self.data = data
    }
    
    func returnLargeImageLoadingData() -> ImageLoadingOptions? {
        guard let url = data.itunesSearchResult.artworkUrl60 else { return nil }
        return ImageLoadingOptions(url: url.replacingOccurrences(of: "60x60", with: "800x800"), imageId: String(((data.itunesSearchResult.trackID ?? data.itunesSearchResult.collectionID)!)))
    }
    
    func dismissCoordinator() {
        delegate?.dismissCoordinator()
    }

    private lazy var deleteButtonListener: OnDismissed = { [weak self] in
        self?.delegate?.selfDestroy()
    }
    
    private func createButtonData() -> [AlertButtonData] {
        
        let cancelButton = AlertButtonData(buttonTitle: AlertViewLocalizables.cancelButton.value, backgroundColor: .white)
            .setTitleTextColor(by: #colorLiteral(red: 0.1148234084, green: 0.1298957467, blue: 0.1381868422, alpha: 1))

        let deleteButton = AlertButtonData(buttonTitle: AlertViewLocalizables.okButton.value, backgroundColor: #colorLiteral(red: 0.1148234084, green: 0.1298957467, blue: 0.1381868422, alpha: 1))
            .setTitleTextColor(by: .white)
            .setActionBlock(by: deleteButtonListener)
        
        return [cancelButton, deleteButton]
        
    }
    
    deinit {
        print("DEINIT ItemDetailViewModel")
    }
    
}
