//
//  ImageCacheManager.swift
//  ItunesCaseStudy
//
//  Created by Erkut Bas on 24.02.2021.
//

import Foundation
import UIKit

class ImageCacheManager: Injectable {
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    func setImagesToCache(object: UIImage, key: String) {
        imageCache.setObject(object, forKey: NSString(string: key))
    }
    
    func returnImagesFromCache(key: String) -> UIImage? {
        return imageCache.object(forKey: NSString(string: key))
    }
    
}
