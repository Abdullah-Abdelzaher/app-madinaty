//
//  SigneUp.swift
//  Madinaty
//
//  Created by Abdullah on 11/19/20.
//

import UIKit
import SystemConfiguration
import MBProgressHUD
class SigneUp: UIViewController {
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var townTF: UITextField!
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var phoneNumTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var repeatPasswordTF: UITextField!
    
   
    
    var reachability: Reachability?
    var selectedTown: String?
    var listTown = ["Banisuef","Alex","Tanta","Mansoura","Minia","Asyuot","Sohag","Kena","Aswan"]
    
    var selectedCountry: String?
    var listCountry = ["Egypt","Corea","Jaban","China","Italy","Espanish","USA","Cameron"]
    override func viewDidLoad() {
        super.viewDidLoad()
        createAndSetupPickerView()
        dismissAndClosePickerView()
         dismissAction()
        self.HideKeyboard()
        
    }
    func createAndSetupPickerView(){
        let countryPickerView = UIPickerView()
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        self.countryTF.inputView = countryPickerView
        countryPickerView.tag = 1
        let townPickerView = UIPickerView()
        townPickerView.delegate = self
        townPickerView.dataSource = self
        self.townTF.inputView = townPickerView
        townPickerView.tag = 2
     }
    
    func dismissAndClosePickerView(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissAction))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        self.countryTF.inputAccessoryView = toolBar
        self.townTF.inputAccessoryView = toolBar
    }

    @objc func dismissAction(){
        self.view.endEditing(true)
     }

    @IBAction func SigneUpBtn(_ sender: Any) {
        let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = mainstoryboard.instantiateViewController(identifier: "ConfirmNumber") as! ConfirmNumber
        
        self.navigationController?.pushViewController(newViewController, animated: true)
        
        if userNameTF.text != "" && phoneNumTF.text != "" && passwordTF.text != "" && repeatPasswordTF.text != "" && countryTF.text != "" && townTF.text != "" {
            
            //call api
        }else {
            let alert = UIAlertController(title: "", message: "please all field are required", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel) { (action) in
                print("close")
            }
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func apiCalling(){
        
        do {
        self.reachability = try Reachability.init()
        }catch {
            print("unable to start notifier")
        }
            if ((reachability!.connection) != .none) {
                
                MBProgressHUD.showAdded(to: self.view, animated: true)
             let params = [
                "username":self.userNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines) as! AnyObject,
                "phone":self.phoneNumTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) as? AnyObject,
                "city_name":self.countryTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) as? AnyObject,
                "area_name":self.townTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) as? AnyObject,
                
             ]
               
                
            }else{
                }
            
 
            
            
                let alert = UIAlertController(title: "", message: "please check your internet", preferredStyle: .alert)
                let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel) { (action) in
                    print("close")
                }
                alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
            
        }
}


extension SigneUp: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return self.listCountry.count
        case 2:
            return self.listTown.count
        default:
            return 1
        }
    
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.listCountry[row]
        case 2:
            return self.listTown[row]
        default:
            return "there isn't data"
        
        
        
    }
    
   


}

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.selectedCountry = self.listCountry[row]
            self.countryTF.text = self.selectedCountry
        case 2:
            self.selectedTown = self.listTown[row]
            self.townTF.text = self.selectedTown
        default:
            1
        }
    }
    
}


extension UIViewController {
    
    func HideKeyboard(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
    }
    
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}







