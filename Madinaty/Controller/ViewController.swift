//
//  ViewController.swift
//  Madinaty
//
//  Created by Abdullah on 11/18/20.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var logInBt: UIButton!
    @IBOutlet weak var notNowBt: UIButton!
    @IBOutlet weak var signFacebook: UIButton!
    @IBOutlet weak var signGoogle: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedElements()
        addImgToElements()
        HideKeyboard()
    }

// func of add smalle icons
    func addRightImage(textField: UITextField , andImage img: UIImage) {
        
        let rightImageView = UIImageView(frame: CGRect(x: 0.0, y: 50, width: 13.0, height: 13.0))
        rightImageView.image = img
        textField.rightView = rightImageView
        textField.rightViewMode = .always
        
    }
    func roundedElements(){
        //rounded text field
        phoneTF.layer.cornerRadius = phoneTF.frame.height / 2
        phoneTF.clipsToBounds = true
       
        passwordTF.layer.cornerRadius = passwordTF.frame.height / 2
        passwordTF.clipsToBounds = true
        
        logInBt.layer.cornerRadius = logInBt.frame.height / 2
        logInBt.clipsToBounds = true
        
        notNowBt.layer.cornerRadius = notNowBt.frame.height / 2
        notNowBt.clipsToBounds = true
        notNowBt.layer.borderWidth = 1 / UIScreen.main.nativeScale
        
        signFacebook.layer.cornerRadius = signFacebook.frame.height / 2
        signFacebook.clipsToBounds = true
        
        signGoogle.layer.cornerRadius = signGoogle.frame.height / 2
        signGoogle.clipsToBounds = true
       
        
    }
    
    func addImgToElements() {
        // add small icons to text field
       
        let phoneIm = UIImage(named: "Exclusion 2")
        addRightImage(textField: phoneTF, andImage: phoneIm!)
        let passwordIm = UIImage(named: "Subtraction 6")
        addRightImage(textField: passwordTF, andImage: passwordIm!)
        
        
        signFacebook.setImage(UIImage(named: "Fill 1"), for: .normal)
        signFacebook.imageEdgeInsets = UIEdgeInsets(top: 6, left: 269, bottom: 6, right: 14)
        signFacebook.tintColor = .white
        
        signGoogle.setImage(UIImage(named: "search"), for: .normal)
        signGoogle.imageEdgeInsets = UIEdgeInsets(top: 6, left: 269, bottom: 6, right: 14)
        signGoogle.tintColor = .white
        
    }
    func sendCode() {
        
        
    }
    func getSigneInData(){
        SigneInApi.getSigneInData { (dataerror, issuccess, signeInData) in
             
        }
        
    }
    @IBAction func signeUpBtnTaped(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = mainstoryboard.instantiateViewController(identifier: "SigneUp") as! SigneUp
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
    }
}


