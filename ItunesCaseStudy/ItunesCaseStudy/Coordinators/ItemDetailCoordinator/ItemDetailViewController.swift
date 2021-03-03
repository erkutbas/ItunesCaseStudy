//
//  ItemDetailViewController.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 28.02.2021.
//

import UIKit

class ItemDetailViewController: BaseViewController<ItemDetailViewModel>, AwakingStoryBoardDelegate {

    @IBOutlet weak var tableHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var headerView: HeaderView!
    
    static var storyboard: ApplicationStoryBoards {
        return .itemDetail
    }
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        setupViewConfigurations()
        addHeaderView()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.largeTitleDisplayMode =  .never
    }
    
    deinit {
        print("DEINIT ItemDetailViewController")
    }
    
    private func setupViewConfigurations() {
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        
    }
    
    private func addHeaderView() {
        headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300))
        tableView.tableHeaderView = headerView
        guard let data = viewModel.returnLargeImageLoadingData() else { return }
        headerView.setImages(with: data)
        
    }
    
}

// MARK: - TableView Delegate MEthods -
extension ItemDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemDetailCell.identifier, for: indexPath) as? ItemDetailCell else { fatalError() }
        cell.setupView(with: viewModel.data)
        return cell
    }
    
}
