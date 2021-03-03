//
//  ItemCollectionComponentDelegate.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 3.03.2021.
//

import Foundation

protocol ItemCollectionComponentDelegate: AnyObject {
    func getNumberOfSection() -> Int
    func getItemCount(in section: Int) -> Int
    func getData(at index: Int) -> ItemCollectionCellModel
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
    func selectedItem(at index: Int)
    func contentOffsetActivation(isHidden: Bool)
}

extension ItemCollectionComponentDelegate {
    func contentOffsetActivation(isHidden: Bool) { }
}
