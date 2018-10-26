//
//  CategoryViewModel.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import Foundation

struct CategoryViewModel {
    
    let name: String
    
    
    // Dependency Injection (DI)
    init(course: Course) {
        self.name = course.strCategory
    }
    
}
