//
//  ViewController.swift
//  AssignmentRestaurantApp
//
//  Created by Wu Guanguan on 2/19/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let restaurantData = ["Chipotle", "Mcdonald's"]
    let foodData = [
        ["Burrito", "Taco", "Salad"],
        ["Burgers", "Snacks", "Beverages", "Desserts"]
    ]
    
    @IBOutlet weak var restaurantTableView: UITableView!
    @IBOutlet weak var foodTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        restaurantTableView.dataSource = self
        restaurantTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.delegate = self
        restaurantTableView.reloadData()

        restaurantTableView.register(UITableViewCell.self, forCellReuseIdentifier: "RestaurantCell")
        foodTableView.register(UITableViewCell.self, forCellReuseIdentifier: "FoodCell")
        
        // Initially, the food table view is hided
        foodTableView.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == restaurantTableView {
            return restaurantData.count
        } else {
            let selectedRestaurantIndex = restaurantTableView.indexPathForSelectedRow?.row ?? 0
            return foodData[selectedRestaurantIndex].count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == restaurantTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
            cell.textLabel?.text = restaurantData[indexPath.row]
                return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)
            let selectedRestaurantIndex = restaurantTableView.indexPathForSelectedRow?.row ?? 0
                cell.textLabel?.text = foodData[selectedRestaurantIndex][indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if tableView == restaurantTableView {
            foodTableView.reloadData()
            foodTableView.isHidden = false
        }
    }

}
