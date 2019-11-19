//
//  GalleryCollectionViewCell.swift
//  VideoJournal
//
//  Created by Пенькевич Василий on 11/7/19.
//  Copyright © 2019 Пенькевич Василий. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    var index: Int = 0
    var didDeleteAssetBlock: ((Int) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    @IBAction func didDeleteAsset(_ sender: Any) {
        didDeleteAssetBlock?(index)
    }
}
