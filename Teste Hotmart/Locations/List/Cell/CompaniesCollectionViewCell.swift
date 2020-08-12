//
//  CompaniesCollectionViewCell.swift
//  Teste Hotmart
//
//  Created by Rafa on 06/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit
import Cosmos

class CompaniesCollectionViewCell: UICollectionViewCell {
    static let reuseCell = "CompaniesCell"
    
    @IBOutlet weak var locationImg: UIImageView!
    @IBOutlet weak var locationNameLbl: UILabel!
    @IBOutlet weak var locationTypeLbl: UILabel!
    @IBOutlet weak var review: CosmosView!
    @IBOutlet weak var noteLabel: UILabel!
    
    func setupView(company: Location?) {
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.7
        self.layer.cornerRadius = 20
        
        guard let location = company else {
            return
        }
        locationNameLbl.text = location.name
        locationTypeLbl.text = location.type
        noteLabel.text = "\(location.review)"
        review.rating = location.review
        
    }
    
}
