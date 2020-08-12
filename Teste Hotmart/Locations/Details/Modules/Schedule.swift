import UIKit

struct Schedule: Decodable {
    let open: String
    let close: String
    
    public init(open: String, close: String) {
        self.open = open
        self.close = close
    }
}
