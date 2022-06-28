//
//  PersonalDataVC.swift
//  CVMaker
//
//  Created by Андрей on 08.05.2022.
//

import UIKit
import CloudKit
import Firebase

class PersonalDataVC: UIViewController {
 
    var scrolView: UIScrollView = {
        var scrolView = UIScrollView()
        scrolView.showsVerticalScrollIndicator = false
        scrolView.showsHorizontalScrollIndicator = false
        scrolView.indicatorStyle = .white
        return scrolView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    // Заголовок
    let headlineTextView: UITextView = {
        let text = UITextView()
        TextViewSemple.share.setStyleFor(name: text, text: "Особисті данні", fontSize: 16)
        text.font = UIFont.boldSystemFont(ofSize: 25)
        return text
    }()
    
    let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Вийти", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        return button
    }()
    
    // Фото Профиля
    lazy var porofileImage: UIImageView = {
        let image = UIImage(named: "profile")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(chusePhoto)))
        return imageView
    }()
    
    // Блок ввода имени
    let nameTextView: UITextView = {
        let name = UITextView()
        TextViewSemple.share.setStyleFor(name: name, text: "Ім'я", fontSize: 16)
        return name
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        TextFieldSample.share.setStyleFor(name: textField)
        return textField
    }()
    
    // Блок ввода фамилии
    let surNameTextView: UITextView = {
        let name = UITextView()
        TextViewSemple.share.setStyleFor(name: name, text: "Прізвище", fontSize: 16)
        return name
    }()
    
    let surNameTextField: UITextField = {
        let textField = UITextField()
        TextFieldSample.share.setStyleFor(name: textField)
        return textField
    }()
    
    // Блок ввода Эмейла
    let emailTaxtView: UITextView = {
        let emailTaxtV = UITextView()
        TextViewSemple.share.setStyleFor(name: emailTaxtV, text: "Email", fontSize: 16)
        return emailTaxtV
    }()
    
    let emailTaxtFild: UITextField = {
        let emailTaxtF = UITextField()
        TextFieldSample.share.setStyleFor(name: emailTaxtF)
        return emailTaxtF
    }()
    
    // Блок ввода номера телефона
    let phoneNumberTaxtView: UITextView = {
        let phoneNumber = UITextView()
        TextViewSemple.share.setStyleFor(name: phoneNumber, text: "Номер телефону", fontSize: 16)
        return phoneNumber
    }()
    
    let phoneNumberTaxtFild: UITextField = {
        let phoneNumber = UITextField()
        TextFieldSample.share.setStyleFor(name: phoneNumber)
        return phoneNumber
    }()
    
    // Блок ввода почтового индекса
    let postCodeTaxtView: UITextView = {
        let postCode = UITextView()
        TextViewSemple.share.setStyleFor(name: postCode, text: "Індекс", fontSize: 16)
        return postCode
    }()
    
    let postCodeTaxtFild: UITextField = {
        let postCode = UITextField()
        TextFieldSample.share.setStyleFor(name: postCode)
        return postCode
    }()
    
    // Блок ввода места жительства
    let locationTaxtView: UITextView = {
        let location = UITextView()
        TextViewSemple.share.setStyleFor(name: location, text: "Місто проживання", fontSize: 16)
        return location
    }()
    
    let locationTaxtFild: UITextField = {
        let location = UITextField()
        TextFieldSample.share.setStyleFor(name: location)
        return location
    }()
    
    // Блок Кнопки для розкрытия доп. инфо.
    var plusInfoBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Додаткова інформація +", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openAdditionalInformation), for: .touchUpInside)
        return button
    }()
    
    let frameForDatepicker: UIView = {
        let frame = UIView()
        frame.backgroundColor = .white
        frame.layer.borderWidth = 2
        frame.layer.borderColor = UIColor.white.cgColor
        frame.layer.cornerRadius = 10
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    let dayOfBornTaxtView: UITextView = {
        let dayOfBorn = UITextView()
        TextViewSemple.share.setStyleFor(name: dayOfBorn, text: "Дата народження", fontSize: 16)
        return dayOfBorn
    }()
    
    var dayOfBornPicker: UIDatePicker = {
        var dayOfBorn = UIDatePicker()
        dayOfBorn.datePickerMode = .date
        dayOfBorn.preferredDatePickerStyle = .compact
        
        let localID = Locale.preferredLanguages.first
        dayOfBorn.locale = Locale(identifier: localID!)
        dayOfBorn.translatesAutoresizingMaskIntoConstraints = false
        return dayOfBorn
    }()
    
    // Блок ввода национальности
    let nationalityTaxtView: UITextView = {
        let nationality = UITextView()
        TextViewSemple.share.setStyleFor(name: nationality, text: "Національність", fontSize: 16)
        return nationality
    }()
    
    let nationalityTaxtFild: UITextField = {
        let nationality = UITextField()
        TextFieldSample.share.setStyleFor(name: nationality)
        return nationality
    }()
    
    // Блок ввода места рождения
    let placeOfBirthTaxtView: UITextView = {
        let placeOfBirth = UITextView()
        TextViewSemple.share.setStyleFor(name: placeOfBirth, text: "Місце народження", fontSize: 16)
        return placeOfBirth
    }()
    
    let placeOfBirthTaxtFild: UITextField = {
        let placeOfBirth = UITextField()
        TextFieldSample.share.setStyleFor(name: placeOfBirth)
        return placeOfBirth
    }()
    
    // Блок ввода web-site
    let webSiteTaxtView: UITextView = {
        let webSite = UITextView()
        TextViewSemple.share.setStyleFor(name: webSite, text: "Веб сайт", fontSize: 16)
        return webSite
    }()
    
    let webSiteTaxtFild: UITextField = {
        let webSite = UITextField()
        TextFieldSample.share.setStyleFor(name: webSite)
        return webSite
    }()
    
    let nextButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Далі", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(nextBtnWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    private var additionalInformationIsOpen = false
    private var topAnchorForNextBtn: NSLayoutConstraint?
    private var bottomAnchorForNextBtn: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackgroundColor().setBackground(view: view)
        view.addSubview(headlineTextView)
        view.addSubview(logOutButton)
        
        let scrolViewFrame = CGRect(x: 0, y: 116, width: view.frame.size.width, height: view.frame.size.height - 142)
        let contentViewFrame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 1000)
        
        scrolView = UIScrollView(frame: scrolViewFrame)
        contentView = UIView(frame: contentViewFrame)
       
        
        scrolView.addSubview(contentView)
        
        contentView.addSubview(porofileImage)
        
        contentView.addSubview(nameTextView)
        contentView.addSubview(nameTextField)
        
        contentView.addSubview(surNameTextView)
        contentView.addSubview(surNameTextField)
        
        contentView.addSubview(emailTaxtView)
        contentView.addSubview(emailTaxtFild)
        
        contentView.addSubview(phoneNumberTaxtView)
        contentView.addSubview(phoneNumberTaxtFild)
        
        contentView.addSubview(postCodeTaxtView)
        contentView.addSubview(postCodeTaxtFild)
        
        contentView.addSubview(locationTaxtView)
        contentView.addSubview(locationTaxtFild)
        
        contentView.addSubview(plusInfoBtn)
        
        contentView.addSubview(dayOfBornTaxtView)
        contentView.addSubview(frameForDatepicker)
        contentView.addSubview(dayOfBornPicker)
        
        contentView.addSubview(nationalityTaxtView)
        contentView.addSubview(nationalityTaxtFild)
        
        contentView.addSubview(placeOfBirthTaxtView)
        contentView.addSubview(placeOfBirthTaxtFild)
        
        contentView.addSubview(webSiteTaxtView)
        contentView.addSubview(webSiteTaxtFild)
        
        contentView.addSubview(nextButton)
        
        setAlfaForOverInfo()
        
        scrolView.contentSize = contentView.bounds.size
        
        view.addSubview(scrolView)
        setAnchoursForBasicInformation()
        
    }
    
    
    private func setAlfaForOverInfo() {
        self.placeOfBirthTaxtView.alpha = 0
        self.placeOfBirthTaxtFild.alpha = 0
        self.dayOfBornPicker.alpha = 0
        self.dayOfBornTaxtView.alpha = 0
        self.frameForDatepicker.alpha = 0
        self.nationalityTaxtView.alpha = 0
        self.nationalityTaxtFild.alpha = 0
        self.webSiteTaxtView.alpha = 0
        self.webSiteTaxtFild.alpha = 0
        
    }

    func setAnchoursForBasicInformation() {
        
        headlineTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 48).isActive = true
        headlineTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        headlineTextView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        headlineTextView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        logOutButton.topAnchor.constraint(equalTo: headlineTextView.topAnchor).isActive = true
        logOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        porofileImage.translatesAutoresizingMaskIntoConstraints = false
        porofileImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        porofileImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        porofileImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        porofileImage.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        nameTextView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameTextView.leadingAnchor.constraint(equalTo: porofileImage.trailingAnchor, constant: 6).isActive = true
        nameTextView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        nameTextView.heightAnchor.constraint(equalToConstant: 25).isActive = true

        nameTextField.topAnchor.constraint(equalTo: nameTextView.bottomAnchor, constant: 3).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: porofileImage.trailingAnchor, constant: 6).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        surNameTextView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 6).isActive = true
        surNameTextView.leadingAnchor.constraint(equalTo: porofileImage.trailingAnchor, constant: 6).isActive = true
        surNameTextView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        surNameTextView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        surNameTextField.topAnchor.constraint(equalTo: surNameTextView.bottomAnchor, constant: 3).isActive = true
        surNameTextField.leadingAnchor.constraint(equalTo: porofileImage.trailingAnchor, constant: 6).isActive = true
        surNameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        emailTaxtView.topAnchor.constraint(equalTo: porofileImage.bottomAnchor, constant: 6).isActive = true
        emailTaxtView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        emailTaxtView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        emailTaxtView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        emailTaxtFild.topAnchor.constraint(equalTo: emailTaxtView.bottomAnchor, constant: 3).isActive = true
        emailTaxtFild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        emailTaxtFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        phoneNumberTaxtView.topAnchor.constraint(equalTo: emailTaxtFild.bottomAnchor, constant: 6).isActive = true
        phoneNumberTaxtView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        phoneNumberTaxtView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        phoneNumberTaxtView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        phoneNumberTaxtFild.topAnchor.constraint(equalTo: phoneNumberTaxtView.bottomAnchor, constant: 3).isActive = true
        phoneNumberTaxtFild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        phoneNumberTaxtFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        postCodeTaxtView.topAnchor.constraint(equalTo: phoneNumberTaxtFild.bottomAnchor, constant: 6).isActive = true
        postCodeTaxtView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        postCodeTaxtView.widthAnchor.constraint(equalTo: postCodeTaxtFild.widthAnchor).isActive = true
        postCodeTaxtView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        postCodeTaxtFild.topAnchor.constraint(equalTo: postCodeTaxtView.bottomAnchor, constant: 3).isActive = true
        postCodeTaxtFild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        postCodeTaxtFild.widthAnchor.constraint(equalTo: frameForDatepicker.widthAnchor).isActive = true
        
        locationTaxtView.topAnchor.constraint(equalTo: phoneNumberTaxtFild.bottomAnchor, constant: 6).isActive = true
        locationTaxtView.leadingAnchor.constraint(equalTo: locationTaxtFild.leadingAnchor).isActive = true
        locationTaxtView.widthAnchor.constraint(equalTo: locationTaxtFild.widthAnchor).isActive = true
        locationTaxtView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        locationTaxtFild.topAnchor.constraint(equalTo: locationTaxtView.bottomAnchor, constant: 3).isActive = true
        locationTaxtFild.leadingAnchor.constraint(equalTo: postCodeTaxtFild.trailingAnchor, constant: 9).isActive = true
        locationTaxtFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        plusInfoBtn.topAnchor.constraint(equalTo: locationTaxtFild.bottomAnchor, constant: 40).isActive = true
        plusInfoBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        plusInfoBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        plusInfoBtn.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        dayOfBornTaxtView.topAnchor.constraint(equalTo: plusInfoBtn.bottomAnchor, constant: 20).isActive = true
        dayOfBornTaxtView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        dayOfBornTaxtView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        dayOfBornTaxtView.widthAnchor.constraint(equalToConstant: 170).isActive = true

        frameForDatepicker.topAnchor.constraint(equalTo: dayOfBornTaxtView.bottomAnchor, constant: 3).isActive = true
        frameForDatepicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        frameForDatepicker.heightAnchor.constraint(equalToConstant: 35).isActive = true
        frameForDatepicker.widthAnchor.constraint(equalToConstant: 145).isActive = true

        dayOfBornPicker.centerXAnchor.constraint(equalTo: frameForDatepicker.centerXAnchor).isActive = true
        dayOfBornPicker.centerYAnchor.constraint(equalTo: frameForDatepicker.centerYAnchor).isActive = true
        
        nationalityTaxtView.topAnchor.constraint(equalTo: plusInfoBtn.bottomAnchor, constant: 20).isActive = true
        nationalityTaxtView.leadingAnchor.constraint(equalTo: nationalityTaxtFild.leadingAnchor).isActive = true
        nationalityTaxtView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        nationalityTaxtView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        nationalityTaxtFild.topAnchor.constraint(equalTo: nationalityTaxtView.bottomAnchor, constant: 3).isActive = true
        nationalityTaxtFild.leadingAnchor.constraint(equalTo: frameForDatepicker.trailingAnchor, constant: 9).isActive = true
        nationalityTaxtFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true

        
        placeOfBirthTaxtView.topAnchor.constraint(equalTo: frameForDatepicker.bottomAnchor, constant: 6).isActive = true
        placeOfBirthTaxtView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        placeOfBirthTaxtView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40).isActive = true
        placeOfBirthTaxtView.heightAnchor.constraint(equalToConstant: 28).isActive = true

        placeOfBirthTaxtFild.topAnchor.constraint(equalTo: placeOfBirthTaxtView.bottomAnchor, constant: 3).isActive = true
        placeOfBirthTaxtFild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        placeOfBirthTaxtFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        
        webSiteTaxtView.topAnchor.constraint(equalTo: placeOfBirthTaxtFild.bottomAnchor, constant: 6).isActive = true
        webSiteTaxtView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        webSiteTaxtView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40).isActive = true
        webSiteTaxtView.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        webSiteTaxtFild.topAnchor.constraint(equalTo: webSiteTaxtView.bottomAnchor, constant: 3).isActive = true
        webSiteTaxtFild.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        webSiteTaxtFild.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true

        
        topAnchorForNextBtn = nextButton.topAnchor.constraint(equalTo: plusInfoBtn.bottomAnchor, constant: 20)
        bottomAnchorForNextBtn = nextButton.topAnchor.constraint(equalTo: webSiteTaxtFild.bottomAnchor, constant: 20)
        
        topAnchorForNextBtn?.isActive = true
        bottomAnchorForNextBtn?.isActive = false
        
        nextButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            printContent(error)
        }
    }
    
    @objc func chusePhoto() {
        print("chuse Foto")
    }
    
    @objc func openAdditionalInformation() {
        
        if additionalInformationIsOpen {
            topAnchorForNextBtn?.isActive = true
            bottomAnchorForNextBtn?.isActive = false
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.contentView.layoutIfNeeded()
                
                self.plusInfoBtn.setTitle("Додаткова інформація +", for: .normal)
                self.placeOfBirthTaxtView.alpha = 0
                self.placeOfBirthTaxtFild.alpha = 0
                self.dayOfBornPicker.alpha = 0
                self.dayOfBornTaxtView.alpha = 0
                self.frameForDatepicker.alpha = 0
                self.nationalityTaxtView.alpha = 0
                self.nationalityTaxtFild.alpha = 0
                self.webSiteTaxtView.alpha = 0
                self.webSiteTaxtFild.alpha = 0
            }
            
            self.additionalInformationIsOpen = false
            
        } else {
            topAnchorForNextBtn?.isActive = false
            bottomAnchorForNextBtn?.isActive = true
            
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut) {
                self.contentView.layoutIfNeeded()
                
                self.plusInfoBtn.setTitle("Додаткова інформація -", for: .normal)
                self.placeOfBirthTaxtView.alpha = 1.0
                self.placeOfBirthTaxtFild.alpha = 1.0
                self.dayOfBornPicker.alpha = 1.0
                self.dayOfBornTaxtView.alpha = 1.0
                self.frameForDatepicker.alpha = 1.0
                self.nationalityTaxtView.alpha = 1.0
                self.nationalityTaxtFild.alpha = 1.0
                self.webSiteTaxtView.alpha = 1.0
                self.webSiteTaxtFild.alpha = 1.0
            }
            
            self.additionalInformationIsOpen = true
        }
    }
    
    @objc func nextBtnWasPressed() {
        let goToSkillsVC = SkillsVC()
        goToSkillsVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(goToSkillsVC, animated: true)
        self.present(goToSkillsVC, animated: true, completion: nil)
        
    }
    
}
