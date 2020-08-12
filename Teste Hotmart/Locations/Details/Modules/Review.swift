import UIKit

struct Reviews: Decodable {
    let review: [Review]
}

struct Review: Decodable {
    let evaluation: String
    let about: String
    let information: String
    let review: Double
    
    public init(evaluation: String, about: String, information: String, review: Double) {
        self.evaluation = evaluation
        self.about = about
        self.information = information
        self.review = review
    }
}
