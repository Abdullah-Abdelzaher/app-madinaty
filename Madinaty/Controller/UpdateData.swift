//
//  UpdateData.swift
//  Madinaty
//
//  Created by Abdullah on 11/25/20.
//

import UIKit

class UpdateData: UIViewController {

    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var townTF: UITextField!
    
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
  
    
    @objc func dismissAction(){
        self.view.endEditing(true)
        
        
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

}

extension UpdateData: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
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
    
    func hideKeyboard(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
    }
    
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}

