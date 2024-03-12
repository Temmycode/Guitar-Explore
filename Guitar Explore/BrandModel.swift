//
//  BrandModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct BrandModel: Identifiable {
    var id = UUID()
    var name: Brand
    var createdBy: String
    var year: String
    var logo: String
    var color: Color
    
    var logoImage: Image {
        Image(logo)
    }
}

enum Brand: String {
    case epiphone = "Epiphone"
    case fender = "Fender"
    case prs = "PRS"
    case gibson = "Gibson"
    case yamaha = "Yamaha"
}
