//
//  MainViewController.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    weak var delegate: MainViewCoordinatorDelegate?
    
    override var viewTitle: String? {
        return MainViewLocalizables.viewTitle.value
    }

    private var segmentedButton: SegmentedButtonComponent!
    private var itemCollectionComponent: ItemCollectionComponent!
    private var dimmingView: DimmingView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        setupViewConfigurations()
        addItemCollectionComponent()
        addSegmentedButtonComponent()
        setupSearchControllerConfigurations()
        listenViewModelDataState()
        addDimmingView()

        viewModel.getData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode =  .always
        checkItemsToBeDeleted()
    }
    
    private func setupViewConfigurations() {
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    private func addItemCollectionComponent() {
        
        itemCollectionComponent = ItemCollectionComponent(data: ItemCollectionComponentData(segmentedButtonData: viewModel.segmentedButtonComponentData))
        itemCollectionComponent.setupDelegation(with: self)
        itemCollectionComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(itemCollectionComponent)
        
        NSLayoutConstraint.activate([
        
            itemCollectionComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemCollectionComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemCollectionComponent.topAnchor.constraint(equalTo: view.topAnchor),
            itemCollectionComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
        
    }
    
    private func addSegmentedButtonComponent() {
        segmentedButton = SegmentedButtonComponent(frame: CGRect(origin: .zero, size: SizeValues.segmentedButtonSize.value), data: viewModel.segmentedButtonComponentData)
        segmentedButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedButton)
        
        NSLayoutConstraint.activate([
            segmentedButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedButton.heightAnchor.constraint(equalToConstant: 40),
            segmentedButton.widthAnchor.constraint(equalToConstant: SizeValues.segmentedButtonSize.value.width)
        ])
        
    }
    
    private func addDimmingView() {
        dimmingView = DimmingView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dimmingView)
        
        NSLayoutConstraint.activate([
        
            dimmingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dimmingView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    private func listenViewModelDataState() {
        viewModel.listenCollectionState { [weak self](state) in
            switch state {
            case .done:
                self?.itemCollectionComponent.reloadCollectionComponent()
                self?.dimmingView.activationManager(activate: false)
            case .loading:
                self?.dimmingView.activationManager(activate: true)
            case .reloadIndex(let indexPath):
                self?.itemCollectionComponent.reloadItem(at: indexPath)
            }
        }
    }
    
    private func checkItemsToBeDeleted() {
        guard let indexPath = viewModel.deletedIndex else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.itemCollectionComponent.removeItem(at: indexPath, completion: { (finish) in
                self?.viewModel.deletedIndex = nil
            })
        }
    }
    
}

// MARK: - Component Delegate Methods -
extension MainViewController: ItemCollectionComponentDelegate {
    func getNumberOfSection() -> Int {
        return viewModel.getNumberOfSection()
    }
    
    func getItemCount(in section: Int) -> Int {
        return viewModel.getNumberOfItem(in: section)
    }
    
    func getData(at index: Int) -> ItemCollectionCellModel {
        return viewModel.getItem(at: index)
    }
    
    func getMoreData() {
        viewModel.fetchMoreData()
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return viewModel.isLoadingCell(for: index)
    }
    
    func selectedItem(at index: Int) {
        viewModel.selectedItem(at: index)
    }

    func contentOffsetActivation(isHidden: Bool) {
        segmentedButton.activationManager(isHidden: isHidden)
    }
    
}

// MARK: - Filter Controller Methods -
extension MainViewController {
    
    private func setupSearchControllerConfigurations() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = viewModel.getSearchResultUpdater()
        searchController.searchBar.placeholder = MainViewLocalizables.searchBarPlaceHolder.value
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}
