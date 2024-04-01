//
//  AuthModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 24/03/2024.
//

import Foundation

struct AuthModel: Codable {
    var accessToken: String
    var user: User
}
