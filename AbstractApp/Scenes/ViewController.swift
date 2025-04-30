//
//  ViewController.swift
//  AbstractApp
//
//  Created by Márcio Flores on 21/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var automaticLoginSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController carregada e pronta para o uso")
        login.delegate = self
        password.delegate = self
        loginBtn.isEnabled = false
        loginBtn.backgroundColor = .systemRed
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("View irá desaparecer em breve")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("View já não é mais visível ao usuário")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("View irá aparecer em breve")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("View já está sendo apresentada ao usuário")
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        print("Botão de login pressionado")
        
        guard let user = login.text, !user.isEmpty,
              let pass = password.text, !pass.isEmpty else {
            showToast(message: "Usuário e senha são obrigatórios")
            return
        }
        
        if automaticLoginSwitch.isOn {
            print("Login automático ativado")
        }
        showToast(message: "Login realizado.")
        loginBtn.backgroundColor = .green
    }
    
    func showToast(message: String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150,
                                               y: self.view.frame.size.height - 100,
                                               width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 14)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        self.view.addSubview(toastLabel)

        UIView.animate(withDuration: 3.0, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        login.resignFirstResponder()
        password.resignFirstResponder()
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        login.resignFirstResponder()
        password.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if (textField == password) {
            print(textField.text ?? "")
            if let passwordLength = password.text?.count, passwordLength >= 4 {
                loginBtn.isEnabled = true
                loginBtn.backgroundColor = .systemBlue
            } else {
                loginBtn.isEnabled = false
                loginBtn.backgroundColor = .systemRed
            }
        }
    }
}

