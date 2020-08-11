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
        guard let location = company else {
            return
        }
        
        locationNameLbl.text = location.name
        locationTypeLbl.text = location.type
        noteLabel.text = "\(location.review)"
        review.rating = location.review
        
    }
    
}
