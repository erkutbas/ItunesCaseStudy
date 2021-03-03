//
//  CollectionInfoViewComponent.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 24.02.2021.
//

import UIKit

class CollectionInfoViewComponent: GenericBaseView<CollectionInfoViewComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [name, release, price])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fillEqually
        temp.axis = .vertical
        return temp
    }()
    
    private lazy var price: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.SourceSansPro.Regular(12).value
        temp.textColor = .gray
        return temp
    }()
    
    private lazy var name: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.SourceSansPro.SemiBold(12).value
        temp.textColor = .gray
        return temp
    }()
    
    private lazy var release: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.SourceSansPro.Light(12).value
        temp.textColor = .gray
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        
        addMainStackView()
    }
    
    private func addMainStackView() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        setViewData()
    }
    
    private func setViewData() {
        guard let data = returnData() else { return }
        price.text = "$\(data.price)"
        name.text = data.name
        release.text = data.release
    }
    
}
