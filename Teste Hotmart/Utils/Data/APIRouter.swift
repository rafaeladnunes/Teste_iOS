//
//  APIRouter.swift
//  Teste Hotmart
//
//  Created by Rafa on 10/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import Alamofire

enum APIRouter: URLRequestConvertible {

    case locations
    case details(id: Int)

    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .locations:
            return .get
        case .details( _):
            return .get
        }
    }

    // MARK: - Path
    private var path: String {
        switch self {
        case .locations:
            return "/locations"
        case .details(let id):
            return "/locations/\(id)"
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .locations:
            return nil
        case .details:
            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.Networking.baseURL.asURL()

        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(Constants.Networking.bearer, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)

        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        print(urlRequest)
        return urlRequest
    }
}
