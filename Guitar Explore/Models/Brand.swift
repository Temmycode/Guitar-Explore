//
//  BrandModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct Brand: Codable, Identifiable {
    var id = UUID()
    var name: Brands
    var createdBy: String
    var year: String
    var logo: String
    var color: String
}

enum Brands: String, Codable {
    case epiphone = "Epiphone"
    case fender = "Fender"
    case prs = "PRS"
    case gibson = "Gibson"
    case yamaha = "Yamaha"
}

extension Brand {
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
