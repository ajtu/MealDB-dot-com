//
//  Recipe.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import Foundation
struct FoodCategory: Decodable {
    let meals:[Meal]
}


struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
