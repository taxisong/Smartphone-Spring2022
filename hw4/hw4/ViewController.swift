//
//  ViewController.swift
//  hw4
//
//  Created by 宋春雨 on 2/21/22.
//

import UIKit

class ViewController: UIViewController, SendFirstAndLastNameDelegate {

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getName(_ sender: Any) {
        performSegue(withIdentifier: "segueGetNeme", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetNeme" {
            let getNameVC = segue.destination as! GetNameViewController
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else {return}
            
            getNameVC.firstname = lblFirstName.text!
            getNameVC.lastname = lblLastName.text!
            
            getNameVC.sendFirstAndLastNameDelegate = self
        }
    }
    
    func setFirstAndLastName(firstName: String, lastName: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
    }
    
    func setWelcomeText(welcomeText: String) {
        lblWelcome.text = welcomeText
    }
    
}

