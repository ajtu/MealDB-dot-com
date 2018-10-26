//
//  RecipeInfoViewModel.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//


import Foundation

struct RecipeInfoViewModel {
    
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let idMeal: String
    
    // Dependency Injection (DI)
    init(recipe: Recipe) {
        self.strMeal = recipe.strMeal
        self.idMeal = recipe.idMeal
        self.strMealThumb = recipe.strMealThumb
        self.strInstructions = recipe.strInstructions
        self.strCategory = recipe.strCategory
        
        

    }
    
}
