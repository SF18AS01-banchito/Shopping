//
//  Dairy.swift
//  Shopping
//
//  Created by Esteban Ordonez on 2/4/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import Foundation
import UIKit

class DairyViewController: UIViewController{
    
    var total: Double = 0.0;   // price
    var object: Int = 0;       // quantity
    var name: String = "";     // name
    
    
    @IBOutlet weak var itemButtom: UIButton!
    
    var items: [String: (stock: Int, price: Double)] = [
        "🥛": (10, 0.99),
        "🥚": (10, 0.50),
        "🧀": (10, 4.50),
        "🍨": (10, 6.99),
        
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func toVegetables(_ sender: UIButton) {
        performSegue(withIdentifier: "Veggie", sender: nil)
    }
    @IBAction func totalTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Total", sender: nil)
    }
    
    @IBAction func itemButtom(_ sender: UIButton) {
        if let itemString = sender.title(for: .normal){
            let item = String(itemString.lowercased());
            
            guard let c: Double = cost(of: item) else{
                print("\(item) not in stock.");
                return;
            }
            print(String(format: "cost of %@ is $%.2f", item, c));
            total += c;
            object += 1;
            name = item;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let totalViewController: TotalViewController = segue.destination as? TotalViewController {
            totalViewController.totals += total;
            totalViewController.qty += object;
            totalViewController.name = name;
            
            if let vegetablesViewController: VegetablesViewController = segue.destination as? VegetablesViewController {
                vegetablesViewController.total += total;
                vegetablesViewController.object += object;
                vegetablesViewController.name = name;
            }
        }
    }
    
    func cost (of article: String)-> Double?{
        if let tuple:(stock: Int, price: Double) = items[article],
            tuple.stock > 0 {
            return tuple.price
        }
        return nil;
    }
}
