//
//  Config.swift
//  testSwiftUI
//
//  Created by teamdoc on 31/05/2024.
//

import Foundation
import SwiftUI

class Config: NSObject {

    static var instance = Config()

    var token: String
    /*var user: User?
    
    var placeOfPractice: [WorkingInfo]
    var occupation: [WorkingInfo]
    var specialities: [WorkingInfo]*/
    
    
    
    override init() {
        token    = ""
        /*user     = nil
        placeOfPractice = []
        occupation = []
        specialities = []*/
        super.init()
    }

    func reset() {
        UserDefaults.standard.removeObject(forKey: "MediAppToken")
        Config.instance = Config()
    }

    
}

