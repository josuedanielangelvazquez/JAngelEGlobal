//
//  ViewController.swift
//  JAngelEGlobal
//
//  Created by MacBookMBA6 on 13/04/23.
//

import UIKit

class ViewController: UIViewController {

    
    var authenticationviewmodel = AutenticationViewModel()
    @IBOutlet weak var UserText: UITextField!
    
    @IBOutlet weak var Passwordtext: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserText.text = "josuedanielangelvazquez@gmail.com"
        Passwordtext.text = "12345"
stylestoView()
    }
    func stylestoView(){
        if Passwordtext.text != nil{
            Passwordtext.isSecureTextEntry = true
        }
    }
    func alertfalselogin(){
        let alert = UIAlertController(title: nil, message: "Ingrese credenciales validas", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        
        self.present(alert, animated: true)
    }
    func gettoken(){
        guard let usertext = UserText.text, UserText.text != nil, UserText.text != "" else{
            UserText.backgroundColor = .red
            return
        }
        guard let password = Passwordtext.text, Passwordtext.text != nil, Passwordtext.text != "" else{
            Passwordtext.backgroundColor = .red
            return
        }
        var user = JAngelEGlobal.gettoken(user: usertext, password: password)
        
        authenticationviewmodel.gettoken(user: user) { Token in
            DispatchQueue.main.async {
                print(Token?.Token_user, Token?.correct)
            }
        }
    }
    
    @IBAction func buttonaction(_ sender: Any) {
        gettoken()
    }
    


}

