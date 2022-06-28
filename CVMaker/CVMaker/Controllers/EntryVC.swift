//
//  ViewController.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit

class EntryVC: UIViewController, UITextFieldDelegate {
    let registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Реєстрація"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let nameTextView: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Ім'я", fontSize: 16)
        return textView
    }()
    
    let nameTxtFld: UITextField = {
        let textFild = UITextField()
        TextFieldSample().setStyleFor(name: textFild)
        return textFild
    }()
    
    let loginTextView: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Email", fontSize: 16)
        return textView
    }()
    
    // Login
    let loginTxtFld: UITextField = {
        let textFild = UITextField()
        TextFieldSample().setStyleFor(name: textFild)
        return textFild
    }()
    
    let passwordTextView: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Пароль", fontSize: 16)
        return textView
    }()
    
    // Password
    let passwordTxtFld: UITextField = {
        let textFild = UITextField()
        TextFieldSample().setStyleFor(name: textFild)
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
    
    var isRegistred = false
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
        button.addTarget(self, action: #selector(enterBtnPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        BackgroundColor.share.setBackground(view: self.view)
        view.addSubview(registrationLabel)
        view.addSubview(nameTextView)
        view.addSubview(nameTxtFld)
        view.addSubview(loginTextView)
        view.addSubview(loginTxtFld)
        view.addSubview(passwordTextView)
        view.addSubview(passwordTxtFld)
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
        nameTextView.leftAnchor.constraint(equalTo: loginTxtFld.leftAnchor).isActive = true
        nameTextView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nameTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true

        nameTxtFld.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 3).isActive = true
        nameTxtFld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTxtFld.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTxtFld.heightAnchor.constraint(equalToConstant: 35).isActive = true

        loginTextView.topAnchor.constraint(equalTo: nameTxtFld.bottomAnchor, constant: 20).isActive = true
        loginTextView.leftAnchor.constraint(equalTo: loginTxtFld.leftAnchor).isActive = true
        loginTextView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loginTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true

        loginTxtFld.topAnchor.constraint(equalTo: loginTextView.bottomAnchor, constant: 3).isActive = true
        loginTxtFld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTxtFld.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginTxtFld.heightAnchor.constraint(equalToConstant: 35).isActive = true

        passwordTextView.topAnchor.constraint(equalTo: loginTxtFld.bottomAnchor, constant: 20).isActive = true
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
        if isRegistred == false {
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
        isRegistred = !isRegistred
        
    }
    
    @objc func enterBtnPressed() {
        print("Enter ...")
        
//        let goToPersonalDataVC = PersonalDataVC()
//        goToPersonalDataVC.modalPresentationStyle = .fullScreen
//        self.navigationController?.pushViewController(goToPersonalDataVC, animated: true)
//        self.present(goToPersonalDataVC, animated:true, completion:nil)
        
    }
    
}

