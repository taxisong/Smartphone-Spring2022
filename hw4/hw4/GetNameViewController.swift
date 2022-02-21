//
//  GetNameViewController.swift
//  hw4
//
//  Created by 宋春雨 on 2/21/22.
//

import UIKit

protocol SendFirstAndLastNameDelegate {
    func setFirstAndLastName(firstName : String, lastName : String)
    func setWelcomeText(welcomeText : String)
}

class GetNameViewController: UIViewController {
    
    var firstname : String?
    var lastname : String?
    
    var sendFirstAndLastNameDelegate : SendFirstAndLastNameDelegate?

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let firstName = firstname else {
            return
        }

        guard let lastName = lastname else {
            return
        }

        txtFirstName.text = firstName
        txtLastName.text = lastName

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveName(_ sender: Any) {
        
        guard let first = txtFirstName.text else {return}
        guard let last = txtLastName.text else {return}
        
        sendFirstAndLastNameDelegate?.setFirstAndLastName(firstName: first, lastName: last)
        sendFirstAndLastNameDelegate?.setWelcomeText(welcomeText: "Welcome \(first), \(last)")
        
        self.navigationController?.popViewController(animated: true)
    }
    

}
