//
//  Constants.swift
//  Teste Hotmart
//
//  Created by Rafa on 10/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import Foundation

enum Constants {
    static let brasileiraoTournamentID = 10

    enum Networking {
        static let baseURL = mainURL
        static let bearer = "Bearer " + APIKey
        private static let mainURL = "https://hotmart-mobile-app.herokuapp.com"
        private static let apiVersion = "/v1/"

        #if DEBUG
        private static let APIKey = "test_9a8ed2bce233b0f06a32f08fe73b21"
        #else
        private static let APIKey = "live_353fc2ef3fb5208683a6ef33994c9f"
        #endif

        //    struct APIParameterKey {
        //        static let password = "password"
        //        static let email = "email"
        //    }
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
