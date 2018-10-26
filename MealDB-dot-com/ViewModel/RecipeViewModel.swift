//
//  RecipeViewModel.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import Foundation
import Foundation

struct FoodCategoryViewModel {
    
    let strMeal: String
    let idMeal: String
    let strMealThumb: String
    
    // Dependency Injection (DI)
    init(meal: Meal) {
        self.strMeal = meal.strMeal
        self.idMeal = meal.idMeal
        self.strMealThumb = meal.strMealThumb
    }
    
}
