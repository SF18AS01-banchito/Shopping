//
//  Total.swift
//  Shopping
//
//  Created by Esteban Ordonez on 2/4/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import Foundation
import UIKit

class TotalViewController : UIViewController{
    
    var totals: Double = 0.0;
    var qty: Int = 0;
    var name: String = "";
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = (String(format: "Your total is $%.2f for %d items",totals,qty));
        
        print(totals)
        
    }
    
}
