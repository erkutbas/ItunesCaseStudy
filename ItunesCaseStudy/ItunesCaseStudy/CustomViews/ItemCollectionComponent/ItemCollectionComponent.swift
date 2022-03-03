//
//  ItemCollectionComponent.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

class ItemCollectionComponent: GenericBaseView<ItemCollectionComponentData> {
    
    private weak var delegate: ItemCollectionComponentDelegate?
    
    private lazy var collectionView: UICollectionView = {
        let layout = ItemCollectionViewFlowLayout(data: getLayoutData())
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.keyboardDismissMode = .onDrag
        collection.contentInset = UIEdgeInsets(top: 60, left: 0, bottom: 0, right: 0)
        collection.register(ItemCollectionCell.self, forCellWithReuseIdentifier: ItemCollectionCell.identifier)
        collection.register(GeneralLoadingTableViewCell.self, forCellWithReuseIdentifier: GeneralLoadingTableViewCell.identifier)
        return collection
    }()
    
    private func getLayoutData() -> ItemCollectionViewFlowLayoutData {
        guard let data = returnData() else { return ItemCollectionViewFlowLayoutData() }
        return data.layoutData
    }
    
    override func addMajorFields() {
        super.addMajorFields()
        addCollectionView()
    }
    
    override func setupViews() {
        super.setupViews()
        setupColletionViewConfigurations()
    }
    
    private func setupColletionViewConfigurations() {
        collectionView.setContentOffset(CGPoint(x: 0, y: 60), animated: false)
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
        
    }
    
    func setupDelegation(with delegate: ItemCollectionComponentDelegate) {
        self.delegate = delegate
    }
    
    func reloadCollectionComponent() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
    func removeItem(at indexPath: IndexPath, completion: @escaping (Bool) -> Void) {
        collectionView.performBatchUpdates({ [weak self] in
            self?.collectionView.deleteItems(at: [indexPath])
        }, completion: completion)
    }
    
    func reloadItem(at indexPath: IndexPath) {
        collectionView.performBatchUpdates { [weak self] in
            self?.collectionView.reloadItems(at: [indexPath])
        }
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -
extension ItemCollectionComponent: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return delegate?.getNumberOfSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getItemCount(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralLoadingTableViewCell.identifier, for: indexPath) as? GeneralLoadingTableViewCell else { fatalError() }
            return cell
        } else {
            guard let data = delegate?.getData(at: indexPath.row) else { fatalError() }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCell.identifier, for: indexPath) as? ItemCollectionCell else { fatalError() }
            cell.setupCell(with: data)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ItemCollectionCell else { return }
        isUserInteractionEnabled = false
        cell.startPressedAnimationCommon { [weak self](finish) in
            self?.delegate?.selectedItem(at: indexPath.row)
            self?.isUserInteractionEnabled = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
}

// MARK: - UIScrollViewDelegate -
extension ItemCollectionComponent: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.contentOffsetActivation(isHidden: scrollView.contentOffset.y < -255)
    }
    
}
