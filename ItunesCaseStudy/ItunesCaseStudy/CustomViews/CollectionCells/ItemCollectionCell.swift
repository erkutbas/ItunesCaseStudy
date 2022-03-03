//
//  ItemCollectionCell.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 02.02.2021.
//

import UIKit

struct ItemCollectionCellModel {
    let infoViewData: CollectionInfoViewComponentData
    let imageContainer: CustomImageViewComponentData
}

class ItemCollectionCell: BaseCollectionViewCell {
    
    private var itemView: ItemView!
    
    override func addMajorViews() {
        super.addMajorViews()
        addItemView()
    }
    
    private func addItemView() {
        itemView = ItemView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemView)
        
        NSLayoutConstraint.activate([
        
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    func setupCell(with data: ItemCollectionCellModel)
    {
        itemView.setData(data: data)
    }

    
}

