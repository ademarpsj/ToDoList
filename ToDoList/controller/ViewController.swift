//
//  ViewController.swift
//  ToDoList
//
//  Created by Ademar on 9/17/17.
//  Copyright © 2017 Ademar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let telaPrincipal = storyboard.instantiateViewController(withIdentifier: "principal")
        
        self.present(telaPrincipal, animated: true, completion: nil)
    }

}

