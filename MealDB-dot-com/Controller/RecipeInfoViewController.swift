//
//  RecipeInfoViewController.swift
//  MealDB-dot-com
//
//  Created by Alvin on 10/26/18.
//  Copyright © 2018 AlvinTu. All rights reserved.
//


import UIKit

class RecipeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var courseViewModels = [RecipeInfoViewModel]()
    let cellId = "cellId"
    var recipeName = ""
    var imageView = UIImageView()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupNavBar()
        
        setupTableView()
        fetchData()
        
        
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchRecipeFor(mealName:recipeName) { (courses, err) in
            if let err = err {
                print("Failed to fetch courses:", err)
                return
            }
            
            self.courseViewModels = courses?.map({return RecipeInfoViewModel(recipe: $0)}) ?? []
            print(self.courseViewModels[0])
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        print(courseViewModels[indexPath.row])
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCell
        
        
        //        let recipe = self.courseViewModels[objectforKey:]
        if(!self.courseViewModels.isEmpty){
            let recipeInfo = self.courseViewModels[0]
            let indexPath = indexPath.row
            let urlString = URL(string: recipeInfo.strMealThumb)
            imageView.load(url: urlString!)
            
            if indexPath == 0 {
                
                cell.textLabel?.text = recipeInfo.strMeal
            }
            
            if indexPath == 1 {
                cell.textLabel?.text = recipeInfo.strCategory
            }
            if indexPath == 2 {
                cell.textLabel?.text = recipeInfo.strInstructions
            }
            if indexPath == 3 {
                cell.textLabel?.text = recipeInfo.strMealThumb
            }
            
            if indexPath == 4{
                cell.textLabel?.text = recipeInfo.idMeal
            }
            
            
        }
        
        
        return cell
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        print(scrollView.contentOffset.y)
        if scrollView == self.tableView {
            
            var frame = imageView.frame
            
            if scrollView.contentOffset.y == 0 {
                
                frame.origin.y = 0
                imageView.frame = frame
                tableView.frame.origin.y = 250

            }
            
            if scrollView.contentOffset.y < 0 {
                
                frame.origin.y = 0
                imageView.frame = frame
                tableView.frame.origin.y = 250

            }
            
            
            if scrollView.contentOffset.y > 0 {
                
                frame.origin.y = -scrollView.contentOffset.y/3
                imageView.frame = frame
                tableView.frame.origin.y = 0
            }
            
            
            
            
            
        }
    }
    
    
    fileprivate func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect.init(x: 0, y: 250, width: self.view.frame.width, height: self.view.frame.height)
        
        
        
        tableView.register(RecipeCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.addSubview(tableView)
        
        imageView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.width, height: 250))
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
        
        
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Info"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 250, g: 80, b: 40)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    
}



extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
