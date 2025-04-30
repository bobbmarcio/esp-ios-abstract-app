//
//  ProfileViewController.swift
//  AbstractApp
//
//  Created by Márcio Flores on 22/03/25.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleLogout(_ sender: Any) {
        print("logout")
        dismiss(animated: true, completion: nil)
    }
    
}
