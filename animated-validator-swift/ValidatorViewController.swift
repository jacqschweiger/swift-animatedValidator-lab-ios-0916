//
//  ValidatorViewController.swift
//  animated-validator-swift
//
//  Created by Flatiron School on 6/27/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ValidatorViewController: UIViewController, UITextFieldDelegate {

    
    //Text field outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailConfirmationTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!

    
    //Exited text field outlets
    
    @IBAction func emailEditingDidEnd(_ sender: UITextField) {
        print("emailTextField is called")
        print(emailTextFieldIsValid())
        
        if emailTextFieldIsValid() == false {
            animateRedAndPulse(field: emailTextField)
        } else {
            removeAnimatation(field: emailTextField)
        }
        
        submitIsValid()
    }
    
    
    @IBAction func confirmEditingDidEnd(_ sender: AnyObject) {
        print("confirm field is called")
        print(confirmEmailIsTrue())
        
        if confirmEmailIsTrue() == false {
            animateRedAndPulse(field: emailConfirmationTextField)
        } else {
            removeAnimatation(field: emailConfirmationTextField)
        }
        
        submitIsValid()
    }
    
    
    @IBAction func phoneEditingDidEnd(_ sender: AnyObject) {
        print("phone field is called")
        print(phoneIsValid())
        
        if phoneIsValid() == false {
            animateRedAndPulse(field: phoneTextField)
        } else {
            removeAnimatation(field: phoneTextField)
        }
        
        submitIsValid()
    }
    
    
    
    @IBAction func passwordEditingDidEnd(_ sender: AnyObject) {
        print("password field is called")
        print(passwordIsValid())
        
        if passwordIsValid() == false {
            animateRedAndPulse(field: passwordTextField)
        } else {
            removeAnimatation(field: passwordTextField)
        }
        
        submitIsValid()
    }
    
    @IBAction func confirmPasswordEditingDidEnd(_ sender: AnyObject) {
        print("confirm password field is called")
        print(confirmPasswordIsValid())
            
            if confirmPasswordIsValid() == false {
                animateRedAndPulse(field: passwordConfirmTextField)
            } else {
                removeAnimatation(field: passwordConfirmTextField)
        }
        
        submitIsValid()
    }
    
    //Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view, typically from a nib.
        self.submitButton.accessibilityLabel = Constants.SUBMITBUTTON
        self.emailTextField.accessibilityLabel = Constants.EMAILTEXTFIELD
        self.emailConfirmationTextField.accessibilityLabel = Constants.EMAILCONFIRMTEXTFIELD
        self.phoneTextField.accessibilityLabel = Constants.PHONETEXTFIELD
        self.passwordTextField.accessibilityLabel = Constants.PASSWORDTEXTFIELD
        self.passwordConfirmTextField.accessibilityLabel = Constants.PASSWORDCONFIRMTEXTFIELD
        
        self.submitButton.isEnabled = false
        
    }
    
    
    //Functions to check for valid text fields
    
    func emailTextFieldIsValid() -> Bool {
        var message = Bool()
        var charStringArray = [String]()
        if emailTextField.text != nil {
            let characters = emailTextField.text!.characters
            for char in characters {
                let charString = "\(char)"
                charStringArray.append(charString)
                if charStringArray.contains("@") && charStringArray.contains(".") {
                    message = true
                }
                else {
                    message = false
                }
            }
        }
        else {
            message = false
        }
        return message
    }
    
    func confirmEmailIsTrue() -> Bool {
        var message = Bool()
        if emailTextField.text != nil {
            if emailTextField.text == emailConfirmationTextField.text {
                message = true
            }
            else {
                message = false
            }
        }
        else {
            message = false
        }
    return message
    }
    
    func phoneIsValid() -> Bool {
        var message = Bool()
        if phoneTextField.text != nil {
            let num = phoneTextField.text
            if (num?.characters.count)! >= 7 {
                let numInt = Int(num!)
                if numInt != nil {
                    message = true
                }
            }
        }
        return message
    }
    
    
    func passwordIsValid() -> Bool {
        var message = Bool()
        if passwordTextField.text != nil {
            if (passwordTextField.text?.characters.count)! >= 6 {
                message = true
            }
        }
        return message
    }
    
    func confirmPasswordIsValid() -> Bool {
        var message = Bool()
        if passwordConfirmTextField.text != nil {
            if passwordTextField.text == passwordConfirmTextField.text {
                message = true
            }
            else {
                message = false
            }
        }
        else {
            message = false
        }
        return message
    }
    
    
    //Animation Functions
    
    func animateRedAndPulse(field: UITextField! ) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .autoreverse, animations: {
            field.backgroundColor = UIColor.red
            }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .autoreverse, animations: {
            field.transform = CGAffineTransform(scaleX: 0.91, y: 0.91)
            }, completion: { (success) in
                field.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimatation(field: UITextField!) {
        UIView.animate(withDuration: 0.2) { 
            field.backgroundColor = UIColor.white
        }
    }
    
    
    
    // Submit button is valid

    func submitIsValid() {
        if emailTextFieldIsValid() == true && confirmEmailIsTrue() == true && phoneIsValid() == true && passwordIsValid() == true && confirmPasswordIsValid() == true {
            
            self.submitButton.isEnabled = true
        }
    }
    
}
