//
//  GuitarViewModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 26/03/2024.
//

import Observation
import SwiftUI

@Observable class GuitarViewModel {
    var lastExploredBrand: Brand?
    
    init() {
        getExploredBrand()
    }
    
    func setExploredBrand(brand: Brand) {
        // convert the brand model to an encoded Json Format
        
        do {
            let encodedBrand = try JSONEncoder().encode(brand)
            UserDefaults.standard.setValue(encodedBrand, forKey: "lastExploredBrand")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getExploredBrand() {
        guard let encodedBrand = UserDefaults.standard.data(forKey: "lastExploredBrand") else { return }
        // decode the json from the encodedBrand
        let brand = try? JSONDecoder().decode(Brand.self, from: encodedBrand)
        lastExploredBrand = brand
    }
}
