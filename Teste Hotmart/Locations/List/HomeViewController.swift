//
//  HomeViewController.swift
//  Teste Hotmart
//
//  Created by Rafa on 05/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var router = LocationRouter()
    var location: Locations?
    private let locationPresenter = LocationPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationPresenter.attachView(self)
        self.locationPresenter.getLocations()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return location?.listLocations.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompaniesCollectionViewCell.reuseCell, for: indexPath) as? CompaniesCollectionViewCell {
            cell.setupView(company: location?.listLocations[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompaniesCollectionViewCell.reuseCell, for: indexPath)
            return cell 
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let identifier = indexPath.row + 1
        router.showDetails(identifier: identifier, navigation: self.navigationController!)
    }
    
}

extension HomeViewController: LocationDelegate {
    
    func setupLocations(locations: Locations) {
        self.location = locations
        self.collectionView.reloadData()
    }
    
}
