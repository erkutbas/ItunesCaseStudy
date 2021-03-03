//
//  ItemCollectionViewFlowLayout.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 26.02.2021.
//

import UIKit

class ItemCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private let data: ItemCollectionViewFlowLayoutData
    
    init(data: ItemCollectionViewFlowLayoutData) {
        self.data = data
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        let minColumnWidth: CGFloat = data.minimumWidth
        let cellHeight: CGFloat = data.itemHeight

        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let maxNumColumns = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down) - (CGFloat(CGFloat(maxNumColumns) * data.lineSpacing) + (data.edgeInset * 2))
        
        self.itemSize = CGSize(width: cellWidth / 2, height: cellHeight)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: data.edgeInset, bottom: data.edgeInset, right: data.edgeInset)
        self.minimumLineSpacing = data.lineSpacing
        self.sectionInsetReference = .fromSafeArea
        
        self.scrollDirection = .vertical
        
    }
    
}
