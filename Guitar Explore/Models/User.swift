//
//  User.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 21/03/2024.
//

import Foundation

struct User: Codable {
    var id: Int
    var email: String
    var username: String
    var profilePicture: String
    
    init(id: Int, email: String, username: String, profilePicture: String) {
        self.id = id
        self.email = email
        self.username = username
        self.profilePicture = profilePicture
    }
}
