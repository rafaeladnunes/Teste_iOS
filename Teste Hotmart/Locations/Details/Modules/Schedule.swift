//
//  Schedule.swift
//  Teste Hotmart
//
//  Created by Rafa on 07/08/20.
//  Copyright © 2020 Rafa. All rights reserved.
//

import UIKit

struct Schedule: Decodable {
    let open: String
    let close: String
    
    public init(open: String, close: String) {
        self.open = open
        self.close = close
    }
}
