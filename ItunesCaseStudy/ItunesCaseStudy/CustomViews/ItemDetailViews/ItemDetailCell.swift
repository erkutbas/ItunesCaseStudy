//
//  ItemDetailCell.swift
//  ItunesCodeCase
//
//  Created by Erkut Bas on 28.02.2021.
//

import UIKit

class ItemDetailCell: BaseTableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contentAdvisoryRatingContainer: UIView!
    @IBOutlet weak var contentAdvisoryRatingInfo: UILabel!
    @IBOutlet weak var primaryGenreNameInfo: UILabel!
    @IBOutlet weak var countryInfo: UILabel!
    @IBOutlet weak var currencyInfo: UILabel!
    @IBOutlet weak var longDescription: UILabel!
    @IBOutlet weak var rentPrice: UILabel!
    @IBOutlet weak var purchasePrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViewConfigurations()
    }
    
    private func setupViewConfigurations() {
        contentAdvisoryRatingContainer.layer.borderWidth = 1
        contentAdvisoryRatingContainer.layer.cornerRadius = 2
        contentAdvisoryRatingContainer.layer.shadowColor = UIColor.gray.cgColor
        contentAdvisoryRatingContainer.layer.shadowOffset = .zero
        contentAdvisoryRatingContainer.layer.shadowRadius = 2
        contentAdvisoryRatingContainer.layer.shadowOpacity = 0.8
        contentAdvisoryRatingContainer.layer.borderColor = UIColor.lightGray.cgColor
        contentAdvisoryRatingContainer.backgroundColor = .white
    }
    
    func setupView(with data: ItemDetailData) {
        title.text = data.itunesSearchResult.trackName ?? data.itunesSearchResult.collectionName
        contentAdvisoryRatingInfo.text = data.itunesSearchResult.contentAdvisoryRating
        primaryGenreNameInfo.text = data.itunesSearchResult.primaryGenreName
        countryInfo.text = data.itunesSearchResult.country
        currencyInfo.text = data.itunesSearchResult.currency
        longDescription.text = data.itunesSearchResult.longDescription
        
        setRentPrice(with: data.itunesSearchResult.trackRentalPrice)
        setPurchasePrice(with: data.itunesSearchResult.trackPrice)
    }
    
    private func setRentPrice(with data: Double?) {
        guard let data = data else { return }
        rentPrice.text = "\(ItemDetailLocalizables.rent.value) $\(data)"
    }
    
    private func setPurchasePrice(with data: Double?) {
        guard let data = data else { return }
        rentPrice.text = "\(ItemDetailLocalizables.buy.value) $\(data)"
    }
    
}
