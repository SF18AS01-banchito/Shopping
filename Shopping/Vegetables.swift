//
//  Vegetables.swift
//  Shopping
//
//  Created by Esteban Ordonez on 2/4/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import Foundation
import UIKit

class VegetablesViewController: UIViewController{
    
    var total: Double = 0.0;  // price
    var object: Int = 0;      // quantity
    var name: String = "";    // name
    
    
    var items: [String: (stock: Int, price: Double)] = [
        "🥑":(5,1.99),
        "🥕":(5,0.30),
        "🥔":(5,0.50),
        "🥒":(5,1.99),
        "🥦":(5,2.99),
        
        ]
    @IBOutlet weak var itemButtom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toDairy(_ sender: UIButton) {
       performSegue(withIdentifier: "Dairy", sender: nil)
    }
    
    @IBAction func totalTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Total", sender: nil)
    }
 
    @IBAction func itemButtonPressed(_ sender: UIButton) {
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
    
    //To Total.swift view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let totalViewController: TotalViewController = segue.destination as? TotalViewController {
            totalViewController.totals += total;
            totalViewController.qty += object;
            totalViewController.name = name;
            
            if let dairyViewController: DairyViewController = segue.destination as? DairyViewController {
                dairyViewController.total += total;
                dairyViewController.object += object;
                dairyViewController.name = name;
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
