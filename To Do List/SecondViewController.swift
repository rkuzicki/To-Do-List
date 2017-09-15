//
//  SecondViewController.swift
//  To Do List
//
//  Created by Radoslaw Kuzicki on 14/09/2017.
//  Copyright © 2017 radek. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var toDo: UITextField!

    @IBAction func addItem(_ sender: Any) {
        if(toDo.text != "") {
            let itemsObject = UserDefaults.standard.object(forKey: "items")
        
            var items: [String] = []
            if let tempItems = itemsObject as? [String] {
                items = tempItems
                items.append(toDo.text!)
            
            }
            else {
                items = [toDo.text!]
            }
            UserDefaults.standard.set(items, forKey: "items")
            toDo.text = ""
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

