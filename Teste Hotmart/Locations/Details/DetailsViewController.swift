//
//  DetailsViewController.swift
//  Teste Hotmart
//
//  Created by Rafa on 06/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit
import Cosmos

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var companyImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var evaluationView: CosmosView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var aboutLbl: UILabel!
    @IBOutlet weak var scheduleLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var evaluationLbl: UILabel!
    
    private let detailsPresenter = DetailsPresenter()
    
    var location: LocationDetails?
    var reviews: [Review]?
    var identifier: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsPresenter.getDetails(identifier: identifier)
        reviews = detailsPresenter.getReviews()
        detailsPresenter.attachView(self)
        let contentWidth = scrollView.bounds.width
        scrollView.contentSize = CGSize(width: contentWidth, height: 1425)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupView() {
        nameLbl.text = location?.name
        aboutLbl.text = location?.about
        phoneLbl.text = location?.phone
        addressLbl.text = location?.adress
        scheduleLbl.text = location?.formattedSchedule()
        evaluationView.rating = location?.review ?? 0.0
        evaluationLbl.text = "\(location?.review ?? 0.0)"
    }
    
    @IBAction func shareBtn(_ sender: Any) {
        let objectsToShare = [self.location?.name, self.location?.adress]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension DetailsViewController: DetailsDelegate {
    
    func setupDetails(details: LocationDetails) {
        self.location = details
        setupView()
        
    }
}

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsTableViewCell.reuseCell, for: indexPath) as? ReviewsTableViewCell {
            cell.setupReview(reviews: self.reviews?[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReviewsTableViewCell.reuseCell, for: indexPath)
            return cell
        }
    }
}
