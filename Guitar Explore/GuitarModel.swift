//
//  GuitarModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct GuitarModel: Identifiable {
    var id = UUID()
    var name: String
    var year: Int
    var brand: Brand
    var title: String
    var subtitle: String
    var imageUrl: String
    
    var image: Image {
        Image(imageUrl)
    }
}

let guitars: [GuitarModel] = [
    GuitarModel(name: "FENDER STRATOCASTER", year: 1952, brand: .fender, title: "", subtitle: "", imageUrl: "strat"),
    GuitarModel(name: "FENDER TELECASTER", year: 1949, brand: .fender, title: "", subtitle: "", imageUrl: "tele"),
    GuitarModel(name: "FENDER JAZZMASTER", year: 1958, brand: .fender, title: "", subtitle: "", imageUrl: "jazzmaster"),
    GuitarModel(name: "FENDER JAGUAR", year: 1962, brand: .fender, title: "", subtitle: "", imageUrl: "jaguar"),
]
