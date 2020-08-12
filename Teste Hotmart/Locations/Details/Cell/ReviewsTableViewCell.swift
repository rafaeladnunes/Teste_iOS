//
//  ReviewsTableViewCell.swift
//  Teste Hotmart
//
//  Created by Rafa on 10/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit
import Cosmos

class ReviewsTableViewCell: UITableViewCell {
    static var reuseCell = "ReviewsCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var reviewView: CosmosView!
    @IBOutlet weak var evaluationLbl: UILabel!
    @IBOutlet weak var aboutEvaluationLbl: UILabel!
    @IBOutlet weak var informationProfileLbl: UILabel!
    
    func setupReview(reviews: Review?) {
        guard let review = reviews  else {
            return
        }
        reviewView.rating = review.review
        evaluationLbl.text = review.evaluation
        aboutEvaluationLbl.text = review.about
        informationProfileLbl.text = review.information
    }
    
}
