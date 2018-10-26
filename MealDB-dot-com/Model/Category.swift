//
//  Category.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import Foundation
struct Category: Decodable {
    let categories:[Course]
}


struct Course: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}
