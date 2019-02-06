//
//  ViewController.swift
//  Shopping
//
//  Created by Esteban Ordonez on 2/4/19.
//  Copyright © 2019 Esteban Ordonez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func unwind(unwindSwgue: UIStoryboardSegue){
        
    }
    
    @IBAction func veggieTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Vegetables", sender: nil)
    }
    
    @IBAction func dairyTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "Dairy", sender: nil)
    }
}

