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
    
    func getLocations(_ completion:@escaping (Result<Locations, Error>) -> Void) {
        AF.request(APIRouter.locations)
            .responseString { response in
                switch response.result {
                case let .success(data):
                    completion(self.parseResultList(data))
                case let .failure(error):
                    completion(.failure(error))
                }
        }
    }
    
    private func parseResultList(_ json : String) -> Result<Locations, Error>{
        let jsonData = json
            .data(using: .utf8)
        
        do{
            let location = try JSONDecoder().decode(Locations.self, from: jsonData!)
            return  Result.success(location)
        }catch {
            return Result.failure(error)
        }
    }
    
    func getDetails(identifier: Int, _ completion:@escaping (Result<LocationDetails, Error>) -> Void) {
        AF.request(APIRouter.details(id: identifier))
            .responseString { response in
                switch response.result {
                case let .success(data):
                    completion(self.parseResultDetails(data))
                case let .failure(error):
                    completion(.failure(error))
                }
        }
    }
    
    private func parseResultDetails(_ json : String) -> Result<LocationDetails, Error>{
        let jsonData = json
            .replacingOccurrences(of: "[", with: "")
            .replacingOccurrences(of: "]", with: "")
            .data(using: .utf8)
        
        do{
            let locationDetail = try JSONDecoder().decode(LocationDetails.self, from: jsonData!)
            return  Result.success(locationDetail)
        }catch {
            return Result.failure(error)
        }
    }
    
    func loadJson() -> [Review]? {
        if let url = Bundle.main.url(forResource: "ReviewMock", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Array<Review>.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
