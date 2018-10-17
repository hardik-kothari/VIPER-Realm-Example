//
//  ArticleCell.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {

    // MARK: - IBOutlets -
    @IBOutlet weak var imgArticle: UIImageView!
    @IBOutlet weak var vwOverlay: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLaunchDate: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    // MARK: - Public Properties -
    var gradientLayer: CAGradientLayer!
    
    // MARK: - Lifecycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        gradientLayer = CAGradientLayer()
        let gradientColors: [CGColor] = [
            UIColor.clear.cgColor,
            UIColor.clear.cgColor,
            UIColor.black82.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.colors = gradientColors
        gradientLayer.frame = vwOverlay.bounds
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public methods -
    func setArticleDetails(_ article: Article) {
        lblTitle.text = article.title
        lblLaunchDate.text = article.launchDate.formattedDate
        lblDescription.text = article.ingress
        imgArticle.sd_setImage(with: URL(string: article.imageURL), placeholderImage: nil)
        vwOverlay.layer.insertSublayer(gradientLayer, at: 1)
    }
}
