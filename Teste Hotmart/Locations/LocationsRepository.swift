//
//  LocationsRepository.swift
//  Teste Hotmart
//
//  Created by Rafa on 06/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit
import Alamofire

class LocationsRepository {
    
    func getLocations(_ completion:@escaping (AFResult<Locations>) -> Void) {
        AF.request(APIRouter.locations)
            .responseDecodable { (response: AFDataResponse<Locations>) in
                completion(response.result)
        }
    }
    
    func getDetails(identifier: Int, _ completion:@escaping (AFResult<LocationDetails>) -> Void) {
        AF.request(APIRouter.details(id: identifier))
            .responseDecodable { (response: AFDataResponse<LocationDetails>) in
                completion(response.result)
        }
    }
    
    func loadJson() -> Reviews? {
        if let url = Bundle.main.url(forResource: "ReviewMock", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Reviews.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
