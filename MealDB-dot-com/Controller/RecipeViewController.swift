//
//  RecipeViewController.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//

import UIKit

class CategoryListViewController: UITableViewController {
    
    var courseViewModels = [FoodCategoryViewModel]()
    let cellId = "cellId"
    var categoryName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchCategoriesList(categoryName:categoryName) { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
            self.courseViewModels = courses?.map({return FoodCategoryViewModel(meal: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MealCell
        let courseViewModel = courseViewModels[indexPath.row]
        cell.courseViewModel = courseViewModel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let courseViewModel = courseViewModels[indexPath.row]
        print(courseViewModel.strMeal)
        
        let recipeViewController = RecipeViewController()
        recipeViewController.recipeName = courseViewModel.strMeal
        navigationController?.pushViewController(recipeViewController, animated: true)
        
        
    }
    fileprivate func setupTableView() {
        tableView.register(MealCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Recipes"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 250, g: 40, b: 80)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
}



