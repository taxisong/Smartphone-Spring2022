//
//  SecondViewController.swift
//  hw3.1
//
//  Created by 宋春雨 on 2/11/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblWelcome: UILabel!
    var welcomeStr = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWelcome.text = welcomeStr

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
