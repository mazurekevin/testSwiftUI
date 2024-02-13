//
//  author.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import SwiftyJSON
import Combine

struct Author: Identifiable {
    let id: Int
    let honorificPrefix: String
    let shortFormHonorific: String
    let firstName: String
    let lastName: String
    let placeOfPractice: String
    let placeOfPracticeAndTown: String
    let occupationPlaceOfPracticeAndTown: String
    let occupation: String
    let city: String
    let country: String
    let picture: String
    @Published var favorite: Bool
    let about: String

    init(json: JSON) {
        id = json["id"].intValue
        honorificPrefix = json["honorificPrefix"].stringValue
        shortFormHonorific = json["shortFormHonorific"].stringValue
        firstName = json["firstName"].stringValue
        lastName = json["lastName"].stringValue
        placeOfPractice = json["placeOfPractice"].stringValue
        placeOfPracticeAndTown = json["placeOfPracticeAndTown"].stringValue
        occupationPlaceOfPracticeAndTown = json["occupationPlaceOfPracticeAndTown"].stringValue
        occupation = json["occupation"].stringValue
        city = json["city"].stringValue
        country = json["country"].stringValue
        picture = json["picture"].stringValue
        favorite = json["favorite"].boolValue
        about = json["about"].stringValue
    }
}
