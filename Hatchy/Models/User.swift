//
//  User.swift
//  Hatchy
//
//  Created by Mete Alp Kizilcay on 6.11.2020.
//

import Foundation


struct User: Codable, Identifiable {
    let id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String?
    var email: String
    var address: String
    var about: String
    var tags: [String]
    
    var registered: String
    var registeredDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:registered)!
        return date
    }
    
    var friends: [Friend]
}
