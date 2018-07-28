//
//  ViewController.swift
//  RemoteAssignmentWeek3
//
//  Created by HsinYuLi on 2018/7/22.
//  Copyright © 2018年 laalee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var checkField: UITextField!
    @IBOutlet weak var checkLable: UILabel!
    
    var currentStatus: segmentStatus = .logIn
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        switchStatus(to: .logIn)
        
        // Control soft keyboard show and hide
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        self.accountField.delegate = self
        self.passwordField.delegate = self
        self.checkField.delegate = self

    }
    
    // Detect return key to hide keyboard or go to next textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == accountField {
            passwordField.becomeFirstResponder()
            return false
        } else if textField == passwordField && currentStatus == .signUp {
            checkField.becomeFirstResponder()
            return false
        } else {
            textField.resignFirstResponder()
            //self.view.endEditing(true)
            return true
        }
    }

    // Do not contain whitespace
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (string == " " || string == "  ") {
            return false
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchSegmentStatus(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            switchStatus(to: .logIn)
        } else {
            switchStatus(to: .signUp)
        }
    }
    
    @IBAction func buttomClick(_ sender: UIButton) {
        var loginStatus: Bool = false
        var signupStatus: Bool = false
        var alertMessage: String = ""
        
        do {
            switch currentStatus {
                case .logIn: loginStatus = try logIn()
                case .signUp: signupStatus = try signUp()
            }
        } catch errors.emptyValue(let description) {
            print("Error 1: \(description)")
            alertMessage = description
        } catch errors.logInFail(let description) {
            print("Error 2: \(description)")
            alertMessage = description
        } catch errors.signUpFail(let description){
            print("Error 3: \(description)")
            alertMessage = description
        } catch {
            print("Other error: \(error)")
            alertMessage = "\(error)"
        }

        if loginStatus == true || signupStatus == true {
            let successAlert = UIAlertController(title: "Success", message: nil, preferredStyle: .alert)
            successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(successAlert, animated: true, completion: nil)
        } else {
            let errorAlert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(errorAlert, animated: true, completion: nil)
        }
    }

    func switchStatus(to status: segmentStatus) {
        print("Switch status to \(status)")
        if status == .logIn {
            currentStatus = .logIn
            checkField.isUserInteractionEnabled = false
            checkField.backgroundColor = .gray
            checkLable.textColor = .lightGray
            accountField.text = ""
            passwordField.text = ""
            checkField.text = ""
        } else {
            currentStatus = .signUp
            checkField.isUserInteractionEnabled = true
            checkField.backgroundColor = .white
            checkLable.textColor = .black
            accountField.text = ""
            passwordField.text = ""
        }
    }
    
    func logIn() throws -> Bool {
        print("Log in method")
        guard let loginAccount = accountField.text, !loginAccount.isEmpty else {
            throw errors.emptyValue(description: "Account should not be empty.")
        }
        guard let loginPassword = passwordField.text, !loginPassword.isEmpty else {
            throw errors.emptyValue(description: "Password should not be empty.")
        }
        guard loginAccount == "luke@gmail.com" && loginPassword == "1234" else {
            throw errors.logInFail(description: "Login fail")
        }
        
        return true
    }
    
    func signUp() throws -> Bool {
        print("Sign up method")
        guard let signupAccount = accountField.text, !signupAccount.isEmpty else {
            throw errors.emptyValue(description: "Account should not be empty.")
        }
        guard let signupPassword = passwordField.text, !signupPassword.isEmpty else {
            throw errors.emptyValue(description: "Password should not be empty.")
        }
        guard let signupCheak = checkField.text, !signupCheak.isEmpty else {
            throw errors.emptyValue(description: "Check Password should not be empty.")
        }
        guard signupPassword == signupCheak else {
            throw errors.signUpFail(description: "Signup fail")
        }
        
        return true
    }
    
    
}

enum segmentStatus {
    case logIn
    case signUp
}

enum errors: Error {
    case emptyValue(description: String)
    case logInFail(description: String)
    case signUpFail(description: String)
}



