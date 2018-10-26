//
//  Services.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchCourses(completion: @escaping ([Course]?, Error?) -> ()) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else {return }
            //            let dataString = String(data: data, encoding: .utf8)
            //            print(dataString)
            
            do {
                let category = try JSONDecoder().decode(Category.self, from: data)
                let courses = category.categories
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
    
    
    
    
    func fetchCategoriesList(categoryName:String, completion: @escaping ([Meal]?, Error?) -> ()) {
        let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(categoryName)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else {return }
            
            do {
                let category = try JSONDecoder().decode(FoodCategory.self, from: data)
                //                print(category)
                //            print(category.categories)
                //
                let meals = category.meals
                DispatchQueue.main.async {
                    completion(meals, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
    
    
    
    func fetchRecipeFor(mealName:String, completion: @escaping ([Recipe]?, Error?) -> ()) {
        var formattedMealName = mealName.replacingOccurrences(of: "   ",  with: "%20", options: .literal, range: nil)
        formattedMealName = mealName.replacingOccurrences(of: "  ",  with: "%20", options: .literal, range: nil)
        formattedMealName = mealName.replacingOccurrences(of: " ",  with: "%20", options: .literal, range: nil)
        
        let urlString = "https://www.themealdb.com/api/json/v1/1/search.php?s=\(formattedMealName)"
        print(formattedMealName)
        print(urlString)
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch courses:", err)
                return
            }
            
            // check response
            
            guard let data = data else {return }
            
            do {
                let category = try JSONDecoder().decode(RecipeCategory.self, from: data)
                //                print(category)
                //            print(category.categories)
                //
                let recipes = category.meals
                print(recipes)
                
                DispatchQueue.main.async {
                    completion(recipes, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
}
}
