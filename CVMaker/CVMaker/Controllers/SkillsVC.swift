//
//  SkilsVCViewController.swift
//  CVMaker
//
//  Created by Андрей on 18.05.2022.
//

import UIKit

class SkillsVC: UIViewController {
    static let share = SkillsVC()
    
    let backButton: UIButton = {
        let image = UIImage(named: "arrow-to-left")
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor(red: 118/255, green: 100/255, blue: 232/255, alpha: 0.5)
        button.layer.cornerRadius = 10
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToPreviousVC), for: .touchUpInside)
        return button
    }()
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    // Profil info
    let frameForProfile: UIView = {
        let frame = UIView()
        frame.backgroundColor = .clear
        frame.layer.borderWidth = 2
        frame.layer.borderColor = UIColor.white.cgColor
        frame.layer.cornerRadius = 10
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    let imageForProfil: UIImageView = {
        let image = UIImageView(image: UIImage(named: "user"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let profilTitle: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Профіль", fontSize: 20)
        return textView
    }()
    
    let profilInfoTextView: UITextView = {
        let textView = UITextView()
        SetStyleForTextView.share.setStyleFor(textView: textView)
        return textView
    }()
    
    // Experiance info
    let frameForExperiance: UIView = {
        let frame = UIView()
        frame.backgroundColor = .clear
        frame.layer.borderWidth = 2
        frame.layer.borderColor = UIColor.white.cgColor
        frame.layer.cornerRadius = 10
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    let imageForExperiance: UIImageView = {
        let image = UIImageView(image: UIImage(named: "portfolio"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let experianceTitle: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Досвід роботи", fontSize: 20)
        return textView
    }()
    
    let experianceInfoTextView: UITextView = {
        let textView = UITextView()
        SetStyleForTextView.share.setStyleFor(textView: textView)
        return textView
    }()
    
    // Education info
    let frameForEducation: UIView = {
        let frame = UIView()
        frame.backgroundColor = .clear
        frame.layer.borderWidth = 2
        frame.layer.borderColor = UIColor.white.cgColor
        frame.layer.cornerRadius = 10
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    let imageForEducation: UIImageView = {
        let image = UIImageView(image: UIImage(named: "mortarboard"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let educationTitle: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Освіта", fontSize: 20)
        return textView
    }()
    
    let educationInfoTextView: UITextView = {
        let textView = UITextView()
        SetStyleForTextView.share.setStyleFor(textView: textView)
        return textView
    }()
    
    // Skills info
    let frameForSkills: UIView = {
        let frame = UIView()
        frame.backgroundColor = .clear
        frame.layer.borderWidth = 2
        frame.layer.borderColor = UIColor.white.cgColor
        frame.layer.cornerRadius = 10
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    let imageForSkills: UIImageView = {
        let image = UIImageView(image: UIImage(named: "settings"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let skillsTitle: UITextView = {
        let textView = UITextView()
        TextViewSemple.share.setStyleFor(name: textView, text: "Навички", fontSize: 20)
        return textView
    }()
    
    let skillsInfoTextView: UITextView = {
        let textView = UITextView()
        SetStyleForTextView.share.setStyleFor(textView: textView)
        return textView
    }()
    
    
    let nextButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Далі", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(nextBtnWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frameForConrentView = CGRect(x: 20, y: 0, width: view.frame.size.width - 40, height: view.frame.height * 2)
        
        BackgroundColor.share.setBackground(view: self.view)
        view.addSubview(backButton)
        
        contentView.frame = frameForConrentView
        
        scrollView.addSubview(contentView)
        
        
        contentView.addSubview(frameForProfile)
        contentView.addSubview(imageForProfil)
        contentView.addSubview(profilTitle)
        profilInfoTextView.delegate = self
        contentView.addSubview(profilInfoTextView)
        
        contentView.addSubview(frameForExperiance)
        contentView.addSubview(imageForExperiance)
        contentView.addSubview(experianceTitle)
        experianceInfoTextView.delegate = self
        contentView.addSubview(experianceInfoTextView)
        
        contentView.addSubview(frameForEducation)
        contentView.addSubview(imageForEducation)
        contentView.addSubview(educationTitle)
        educationInfoTextView.delegate = self
        contentView.addSubview(educationInfoTextView)
        
        contentView.addSubview(frameForSkills)
        contentView.addSubview(imageForSkills)
        contentView.addSubview(skillsTitle)
        skillsInfoTextView.delegate = self
        contentView.addSubview(skillsInfoTextView)
        
        scrollView.contentSize = contentView.bounds.size
        view.addSubview(scrollView)
        view.addSubview(nextButton)

        setAnchors()
        
    }
    
    
    private func setAnchors() {
        [
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 42),
            backButton.heightAnchor.constraint(equalToConstant: 42)
        ].forEach({$0.isActive = true})
            
        [
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20)
        ].forEach({$0.isActive = true})
            
            
        // Profil
        [
            frameForProfile.topAnchor.constraint(equalTo: contentView.topAnchor),
            frameForProfile.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            frameForProfile.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            frameForProfile.bottomAnchor.constraint(equalTo: profilInfoTextView.bottomAnchor, constant: 10)
        ].forEach({$0.isActive = true})
            
        [
            imageForProfil.topAnchor.constraint(equalTo: frameForProfile.topAnchor, constant: 10),
            imageForProfil.leadingAnchor.constraint(equalTo: frameForProfile.leadingAnchor, constant: 10),
            imageForProfil.heightAnchor.constraint(equalToConstant: 20),
            imageForProfil.widthAnchor.constraint(equalToConstant: 20)
        ].forEach({$0.isActive = true})
            
        [
            profilTitle.centerYAnchor.constraint(equalTo: imageForProfil.centerYAnchor),
            profilTitle.leadingAnchor.constraint(equalTo: imageForProfil.trailingAnchor, constant: 3),
            profilTitle.heightAnchor.constraint(equalToConstant: 35),
            profilTitle.widthAnchor.constraint(equalTo: frameForProfile.widthAnchor, constant: -30)
        ].forEach({$0.isActive = true})
            
        [
            profilInfoTextView.topAnchor.constraint(equalTo: profilTitle.bottomAnchor, constant: 10),
            profilInfoTextView.leadingAnchor.constraint(equalTo: frameForProfile.leadingAnchor, constant: 20),
            profilInfoTextView.trailingAnchor.constraint(equalTo: frameForProfile.trailingAnchor, constant: -20),
            profilInfoTextView.heightAnchor.constraint(equalToConstant: 40)

        ].forEach({$0.isActive = true})
            
            
        //Experiance
        [
            frameForExperiance.topAnchor.constraint(equalTo: frameForProfile.bottomAnchor, constant: 20),
            frameForExperiance.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            frameForExperiance.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            frameForExperiance.bottomAnchor.constraint(equalTo: experianceInfoTextView.bottomAnchor, constant: 10)
        ].forEach({$0.isActive = true})
            
        [
            imageForExperiance.topAnchor.constraint(equalTo: frameForExperiance.topAnchor, constant: 10),
            imageForExperiance.leadingAnchor.constraint(equalTo: frameForExperiance.leadingAnchor, constant: 10),
            imageForExperiance.heightAnchor.constraint(equalToConstant: 20),
            imageForExperiance.widthAnchor.constraint(equalToConstant: 20)
        ].forEach({$0.isActive = true})
            
            
        [
            experianceTitle.centerYAnchor.constraint(equalTo: imageForExperiance.centerYAnchor),
            experianceTitle.leadingAnchor.constraint(equalTo: imageForExperiance.trailingAnchor, constant: 3),
            experianceTitle.heightAnchor.constraint(equalToConstant: 35),
            experianceTitle.widthAnchor.constraint(equalTo: frameForProfile.widthAnchor, constant: -30)
            
        ].forEach({$0.isActive = true})
            
        [
            experianceInfoTextView.topAnchor.constraint(equalTo: experianceTitle.bottomAnchor, constant: 10),
            experianceInfoTextView.leadingAnchor.constraint(equalTo: frameForExperiance.leadingAnchor, constant: 20),
            experianceInfoTextView.trailingAnchor.constraint(equalTo: frameForExperiance.trailingAnchor, constant: -20),
            experianceInfoTextView.heightAnchor.constraint(equalToConstant: 40)
        
        ].forEach({$0.isActive = true})

        // Education
        [
            frameForEducation.topAnchor.constraint(equalTo: frameForExperiance.bottomAnchor, constant: 20),
            frameForEducation.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            frameForEducation.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            frameForEducation.bottomAnchor.constraint(equalTo: educationInfoTextView.bottomAnchor, constant: 10)
        ].forEach({$0.isActive = true})
            
        [
            imageForEducation.topAnchor.constraint(equalTo: frameForEducation.topAnchor, constant: 10),
            imageForEducation.leadingAnchor.constraint(equalTo: frameForEducation.leadingAnchor, constant: 10),
            imageForEducation.heightAnchor.constraint(equalToConstant: 20),
            imageForEducation.widthAnchor.constraint(equalToConstant: 20)
        ].forEach({$0.isActive = true})
            
        [
            educationTitle.centerYAnchor.constraint(equalTo: imageForEducation.centerYAnchor),
            educationTitle.leadingAnchor.constraint(equalTo: imageForExperiance.trailingAnchor, constant: 3),
            educationTitle.heightAnchor.constraint(equalToConstant: 35),
            educationTitle.widthAnchor.constraint(equalTo: frameForEducation.widthAnchor, constant: -30)
        ].forEach({$0.isActive = true})
            
        [
            educationInfoTextView.topAnchor.constraint(equalTo: educationTitle.bottomAnchor, constant: 10),
            educationInfoTextView.leadingAnchor.constraint(equalTo: frameForExperiance.leadingAnchor, constant: 20),
            educationInfoTextView.trailingAnchor.constraint(equalTo: frameForEducation.trailingAnchor, constant: -20),
            educationInfoTextView.heightAnchor.constraint(equalToConstant: 40)
        ].forEach({$0.isActive = true})
        
        // Skills
        [
            frameForSkills.topAnchor.constraint(equalTo: frameForEducation.bottomAnchor, constant: 20),
            frameForSkills.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            frameForSkills.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            frameForSkills.bottomAnchor.constraint(equalTo: skillsInfoTextView.bottomAnchor, constant: 10)
        ].forEach({$0.isActive = true})
            
        [
            imageForSkills.topAnchor.constraint(equalTo: frameForSkills.topAnchor, constant: 10),
            imageForSkills.leadingAnchor.constraint(equalTo: frameForSkills.leadingAnchor, constant: 10),
            imageForSkills.heightAnchor.constraint(equalToConstant: 20),
            imageForSkills.widthAnchor.constraint(equalToConstant: 20)
        ].forEach({$0.isActive = true})
            
        [
            skillsTitle.centerYAnchor.constraint(equalTo: imageForSkills.centerYAnchor),
            skillsTitle.leadingAnchor.constraint(equalTo: imageForSkills.trailingAnchor, constant: 3),
            skillsTitle.heightAnchor.constraint(equalToConstant: 35),
            skillsTitle.widthAnchor.constraint(equalTo: frameForSkills.widthAnchor, constant: -30)
        ].forEach({$0.isActive = true})
            
        [
            skillsInfoTextView.topAnchor.constraint(equalTo: skillsTitle.bottomAnchor, constant: 10),
            skillsInfoTextView.leadingAnchor.constraint(equalTo: frameForSkills.leadingAnchor, constant: 20),
            skillsInfoTextView.trailingAnchor.constraint(equalTo: frameForSkills.trailingAnchor, constant: -20),
            skillsInfoTextView.heightAnchor.constraint(equalToConstant: 40)
        ].forEach({$0.isActive = true})
            

            
        [
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 300),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ].forEach({$0.isActive = true})
            

    }
    
    @objc func goToPreviousVC() {
        print("Back")
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    @objc func nextBtnWasPressed() {
        print("tap")
    }

}

extension SkillsVC: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let maxHeight: CGFloat = view.frame.height / 4
        // profil
        let sizeForProfil = CGSize(width: profilInfoTextView.frame.width, height: .infinity)
        let estimateSizeForProfil = profilInfoTextView.sizeThatFits(sizeForProfil)
        profilInfoTextView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height &&  profilInfoTextView.frame.height < maxHeight {
                constraint.constant = estimateSizeForProfil.height
            }
        }
        
        //experiance
        let sizeForExperiance = CGSize(width: experianceInfoTextView.frame.width, height: .infinity)
        let estimateSizeForExperiance = experianceInfoTextView.sizeThatFits(sizeForExperiance)
        experianceInfoTextView.constraints.forEach { (constraint) in
           
            if constraint.firstAttribute == .height &&  experianceInfoTextView.frame.height < maxHeight {
                constraint.constant = estimateSizeForExperiance.height
            }
        }
    
        let sizeForEducation = CGSize(width: educationInfoTextView.frame.width, height: .infinity)
        let estimateSizeForEducation = educationInfoTextView.sizeThatFits(sizeForEducation)
        educationInfoTextView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height &&  educationInfoTextView.frame.height < maxHeight {
                constraint.constant = estimateSizeForEducation.height
            }
        }
        
        let sizeForSkills = CGSize(width: skillsInfoTextView.frame.width, height: .infinity)
        let estimateSizeForSkills = skillsInfoTextView.sizeThatFits(sizeForSkills)
        skillsInfoTextView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height &&  skillsInfoTextView.frame.height < maxHeight {
                constraint.constant = estimateSizeForSkills.height
            }
        }
        
        
        
    }
}
