//
//  ViewController.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit

class EntryVC: UIViewController, UITextFieldDelegate {
    
    
    let frame: UIView = {
        let frame = UIView()
        frame.backgroundColor = .clear
        frame.layer.borderWidth = 2
        frame.layer.borderColor = UIColor.white.cgColor
        frame.layer.cornerRadius = 10
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "curriculum-vitae"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let loginTextView: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Логін", fontSize: 16)
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

    // Enter
    let enterButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Почати роботу", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(enterBtnPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // registration
    let registrationBtn: UIButton = {
        let button = UIButton()
        button.setTitle("або зареєструватися", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.addTarget(self, action: #selector(registrationBtnTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundColor.share.setBackground(view: self.view)
        view.addSubview(frame)
        view.addSubview(imageView)
        view.addSubview(loginTextView)
        view.addSubview(loginTxtFld)
        view.addSubview(passwordTextView)
        view.addSubview(passwordTxtFld)
        view.addSubview(enterButton)
        view.addSubview(registrationBtn)
        
        setUpAutolayoud()
    }
    
    
    private func setUpAutolayoud() {
        
        frame.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        frame.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        frame.widthAnchor.constraint(equalToConstant: 232).isActive = true
        frame.heightAnchor.constraint(equalToConstant: 275).isActive = true
        
        
        imageView.topAnchor.constraint(equalTo: frame.topAnchor, constant: 33).isActive = true
        imageView.bottomAnchor.constraint(equalTo: frame.bottomAnchor, constant: -33).isActive = true
        imageView.leadingAnchor.constraint(equalTo: frame.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: frame.trailingAnchor).isActive = true
        
        
        loginTextView.topAnchor.constraint(equalTo: frame.bottomAnchor, constant: 20).isActive = true
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
        
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterButton.bottomAnchor.constraint(equalTo: registrationBtn.topAnchor, constant: -10).isActive = true
        
        registrationBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        registrationBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registrationBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    
    @objc func enterBtnPressed() {
        print("Enter ...")
        
        let goToPersonalDataVC = PersonalDataVC()
        goToPersonalDataVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(goToPersonalDataVC, animated: true)
        self.present(goToPersonalDataVC, animated:true, completion:nil)
        
    }
    
    @objc func registrationBtnTapped() {
        print("Registration ...")
    }
    
}

