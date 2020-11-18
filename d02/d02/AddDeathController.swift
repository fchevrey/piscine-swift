//
//  AddDeath.swift
//  d02
//
//  Created by Fabien CHEVREY on 18/11/2020.
//

import UIKit

class AddDeathController : UIViewController
{
    
    @IBOutlet weak var deathtxtField: UITextField!
    
    let datePicker = UIDatePicker()
    @IBOutlet weak var nameTxtField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createDatePicker()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        print("coucou")
        if let vc = segue.destination as? ViewController
        {
            vc.AddField(name:nameTxtField.text!,date:deathtxtField.text!, how:descriptionTextField.text!)
        }
    }
    
    func createDatePicker()
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //validation button
        let okBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([okBtn], animated: true)
        
        //assign toolbar to keyboard
        deathtxtField.inputAccessoryView = toolbar
        deathtxtField.inputView = datePicker
        datePicker.datePickerMode = .dateAndTime
    }
    
    @objc func donePressed()
    {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.timeStyle = .short
        
        deathtxtField.text = dateFormat.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
