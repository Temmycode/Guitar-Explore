//
//  BrandModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct BrandModel: Codable, Identifiable {
    var id = UUID()
    var name: Brand
    var createdBy: String
    var year: String
    var logo: String
    var color: String
}

enum Brand: String, Codable {
    case epiphone = "Epiphone"
    case fender = "Fender"
    case prs = "PRS"
    case gibson = "Gibson"
    case yamaha = "Yamaha"
}

extension BrandModel {
    var logoImage: Image {
        get {
            Image(self.logo)
        }
    }
    
    var colors: Color {
        get {
            Color(self.color)
        }
    }
}
