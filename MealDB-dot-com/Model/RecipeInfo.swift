//
//  RecipeInfo.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

struct RecipeCategory: Decodable {
    let meals:[Recipe]
}


struct Recipe: Decodable {
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let idMeal: String
}
