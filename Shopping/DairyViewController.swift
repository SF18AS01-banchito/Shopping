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
    
    //var shoppingCart :[String: (numberAlreadyPurchased: Int, price: Double)]? = nil;
    var shoppingCart: ShoppingCart? = nil;
    
    
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
            if shoppingCart == nil {
                shoppingCart = [String: (numberAlreadyPurchased: Int, price: Double)]();
                
            }
             if var tuple: (numberAlreadyPurchased: Int, price: Double) = shoppingCart?[item]{
                tuple.numberAlreadyPurchased += 1;
                shoppingCart?[item] = (tuple.numberAlreadyPurchased, tuple.price);
             } else {
                shoppingCart?[item] = (1,c);
            }
           name = item;
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let totalViewController: TotalViewController = segue.destination as? TotalViewController {
            totalViewController.totals += total;
            totalViewController.qty += object;
            totalViewController.name = name;
            totalViewController.shoppingCart = shoppingCart;
            
        }else if let vegetablesViewController: VegetablesViewController = segue.destination as? VegetablesViewController {
            vegetablesViewController.total += total;
            vegetablesViewController.object += object;
            vegetablesViewController.name = name;
            vegetablesViewController.shoppingCart = shoppingCart;
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
