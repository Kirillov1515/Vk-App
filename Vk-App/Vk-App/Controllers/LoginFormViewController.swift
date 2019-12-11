//
//  LoginFormViewController.swift
//  Vk-App
//
//  Created by Macbook on 05/12/2019.
//  Copyright © 2019 AK. All rights reserved.
//

import UIKit

class LoginFormViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeybboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView.addGestureRecognizer(hideKeybboardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // MARK: - Sign In functions
    
    @IBAction func signInButton(_ sender: Any) {
        if checkUserData() {
            performSegue(withIdentifier: "signInSegue", sender: self)
        }
        else {
            showAlertWindow()
        }
    }
    
    func checkUserData() -> Bool {
        if let login = loginTextField.text, let password = passwordTextField.text {
            if login == "", password == "" {
                return true
            }
        }
        return false
    }
    
    func showAlertWindow() {
        let alertWindow = UIAlertController(title: "Error", message: "Wrong login or password", preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertWindow.addAction(alertButton)
        present(alertWindow, animated: true, completion: nil)
    }
    
    // MARK: - Keyboard Functions
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let keyboardSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
    }
    
    @objc func hideKeyboard() {
        scrollView.endEditing(true)
    }
    
    // MARK: - Exit to LoginForm segue
    
    @IBAction func exitToLoginForm(unwindsegue: UIStoryboardSegue) {
    }
}
