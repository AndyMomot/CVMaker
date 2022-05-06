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
        textView.backgroundColor = .clear
        textView.text = "Логін"
        textView.textColor = .white
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Login
    let loginTxtFld: UITextField = {
        let textFild = UITextField()
        textFild.backgroundColor = .white
        textFild.layer.borderWidth = 2
        textFild.layer.borderColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        textFild.layer.cornerRadius = 10
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()
    
    let passwordTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = "Пароль"
        textView.textColor = .white
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    // Password
    let passwordTxtFld: UITextField = {
        let textFild = UITextField()
        textFild.backgroundColor = .white
        textFild.layer.borderWidth = 2
        textFild.layer.borderColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        textFild.layer.cornerRadius = 10
        textFild.translatesAutoresizingMaskIntoConstraints = false
        return textFild
    }()

    // Enter
    let enterButton: UIButton = {
        let button = GradientButton(colors: [
            UIColor(red: 100/255, green: 152/255, blue: 232/255, alpha: 1).cgColor,
            UIColor(red: 118/255, green: 100/255, blue: 232/255, alpha: 1).cgColor
        ])
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Почати роботу", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(enterBtnPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // registration
    let registrationBtn: UIButton = {
        let button = UIButton()
        button.setTitle("або зариєструватися", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        button.addTarget(self, action: #selector(registrationBtnTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Bacground().setBackground(view: self.view)
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
        frame.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        frame.widthAnchor.constraint(equalToConstant: 286).isActive = true
        frame.heightAnchor.constraint(equalToConstant: 339).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: frame.topAnchor, constant: 33).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 286).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        
        loginTextView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        loginTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        loginTextView.leftAnchor.constraint(equalTo: loginTxtFld.leftAnchor).isActive = true
        loginTextView.bottomAnchor.constraint(equalTo: loginTxtFld.topAnchor, constant: -3).isActive = true
        
        loginTxtFld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginTxtFld.topAnchor.constraint(equalTo: frame.bottomAnchor, constant: 45).isActive = true
        loginTxtFld.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginTxtFld.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        passwordTextView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        passwordTextView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        passwordTextView.leftAnchor.constraint(equalTo: passwordTxtFld.leftAnchor).isActive = true
        passwordTextView.bottomAnchor.constraint(equalTo: passwordTxtFld.topAnchor, constant: -3).isActive = true
        
        passwordTxtFld.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTxtFld.topAnchor.constraint(equalTo: loginTxtFld.bottomAnchor, constant: 50).isActive = true
        passwordTxtFld.widthAnchor.constraint(equalToConstant: 300).isActive = true
        passwordTxtFld.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        enterButton.bottomAnchor.constraint(equalTo: registrationBtn.bottomAnchor, constant: -50).isActive = true
        
        registrationBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registrationBtn.widthAnchor.constraint(equalToConstant: 300).isActive = true
        registrationBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registrationBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    @objc func enterBtnPressed() {
        print("Enter ...")
    }
    
    @objc func registrationBtnTapped() {
        print("Registration ...")
    }
    
}

