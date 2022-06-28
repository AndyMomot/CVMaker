//
//  ViewController.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class EntryVC: UIViewController {
    let registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Реєстрація"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Name
    let nameTextView: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Ім'я", fontSize: 16)
        return textView
    }()
    
    let nameTxtFld: UITextField = {
        let textFild = UITextField()
        TextFieldSample().setStyleFor(name: textFild)
        textFild.textContentType = .name
        textFild.autocapitalizationType = .words
        return textFild
    }()
    
    // Email
    let emailTextView: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Email", fontSize: 16)
        return textView
    }()
    
    let emailTxtFld: UITextField = {
        let textFild = UITextField()
        TextFieldSample().setStyleFor(name: textFild)
        textFild.textContentType = .emailAddress
        textFild.keyboardType = .emailAddress
        return textFild
    }()
    
    // Password
    let passwordTextView: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Пароль", fontSize: 16)
        return textView
    }()
    
    let passwordTxtFld: UITextField = {
        let textFild = UITextField()
        TextFieldSample().setStyleFor(name: textFild)
        textFild.isSecureTextEntry = true
        textFild.textContentType = .password
        return textFild
    }()
    
    let quastionLabel: UILabel = {
        let label = UILabel()
        label.text = "Вже є обліковий запис?"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var signUp = true {
        willSet {
            if signUp {
                registrationLabel.text = "Вхід"
                nameTextView.isHidden = true
                nameTxtFld.isHidden = true
                enterOrlogInButton.setTitle("Зареєструватися", for: .normal)
            } else {
                registrationLabel.text = "Реєстрація"
                nameTextView.isHidden = false
                nameTxtFld.isHidden = false
                enterOrlogInButton.setTitle("Ввійти", for: .normal)
            }
        }
    }
    
    let enterOrlogInButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setTitle("Ввійти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(enterOrRegistrBtnTapped), for: .touchUpInside)
        return button
    }()
    
    // Enter
    let nextButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Далі", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(nextBtnPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroundColor.share.setBackground(view: self.view)
        
        view.addSubview(registrationLabel)
        
        view.addSubview(nameTextView)
        view.addSubview(nameTxtFld)
        nameTxtFld.delegate = self
        
        view.addSubview(emailTextView)
        view.addSubview(emailTxtFld)
        emailTxtFld.delegate = self
        
        view.addSubview(passwordTextView)
        view.addSubview(passwordTxtFld)
        passwordTxtFld.delegate = self
        
        view.addSubview(quastionLabel)
        
        view.addSubview(enterOrlogInButton)
        view.addSubview(nextButton)
        
        setUpAutolayoud()
    }
    
    private func setUpAutolayoud() {
        
        registrationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        registrationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        registrationLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextView.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: 40).isActive = true
        nameTextView.leftAnchor.constraint(equalTo: emailTxtFld.leftAnchor).isActive = true
        nameTextView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nameTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true

        nameTxtFld.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 3).isActive = true
        nameTxtFld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTxtFld.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTxtFld.heightAnchor.constraint(equalToConstant: 35).isActive = true

        emailTextView.topAnchor.constraint(equalTo: nameTxtFld.bottomAnchor, constant: 20).isActive = true
        emailTextView.leftAnchor.constraint(equalTo: emailTxtFld.leftAnchor).isActive = true
        emailTextView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        emailTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true

        emailTxtFld.topAnchor.constraint(equalTo: emailTextView.bottomAnchor, constant: 3).isActive = true
        emailTxtFld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTxtFld.widthAnchor.constraint(equalToConstant: 300).isActive = true
        emailTxtFld.heightAnchor.constraint(equalToConstant: 35).isActive = true

        passwordTextView.topAnchor.constraint(equalTo: emailTxtFld.bottomAnchor, constant: 20).isActive = true
        passwordTextView.leftAnchor.constraint(equalTo: passwordTxtFld.leftAnchor).isActive = true
        passwordTextView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        passwordTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true

        passwordTxtFld.topAnchor.constraint(equalTo: passwordTextView.bottomAnchor, constant: 3).isActive = true
        passwordTxtFld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTxtFld.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTxtFld.heightAnchor.constraint(equalToConstant: 35).isActive = true

        quastionLabel.topAnchor.constraint(equalTo: passwordTxtFld.bottomAnchor, constant: 20).isActive = true
        quastionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quastionLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        quastionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        enterOrlogInButton.topAnchor.constraint(equalTo: quastionLabel.bottomAnchor, constant: 20).isActive = true
        enterOrlogInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    
    @objc func enterOrRegistrBtnTapped() {
        signUp = !signUp
        
    }
    
    @objc func nextBtnPressed() {
        enterOrRegistration()
        
    }
    
    func createWorningAlert() {
        let worningAlert = UIAlertController(title: "Помилка", message: "Заповніть усі поля", preferredStyle: .alert)
        worningAlert.addAction(UIAlertAction(title: "Добре", style: .default, handler: nil))
        present(worningAlert, animated: true, completion: nil)
    }
}

extension EntryVC: UITextFieldDelegate {
    
    func enterOrRegistration() {
        let name = nameTxtFld.text!
        let email = emailTxtFld.text!
        let password = passwordTxtFld.text!
        
        if signUp {
            // Регистрація
            if !name.isEmpty && !email.isEmpty && !password.isEmpty {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error == nil {
                        if let result = result {
                            print(result.user.uid)
                            let ref = Database.database().reference().child("users")
                            ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email])
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
                
            } else {
                createWorningAlert()
            }
            
        } else {
            // Авторизація
            if !email.isEmpty && !password.isEmpty {
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if error == nil {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            } else {
                createWorningAlert()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enterOrRegistration()
        return true
    }
}

