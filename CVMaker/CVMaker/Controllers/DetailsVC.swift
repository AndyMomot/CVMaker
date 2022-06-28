//
//  DetailsVC.swift
//  CVMaker
//
//  Created by Андрей on 21.06.2022.
//

import UIKit

class DetailsVC: UIViewController {
    
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
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Назва стилю"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "cv"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let firstColorBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let secondColorBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let downloadButton: UIButton = {
        let button = GradientButton()
        button.setTitle("Завантажити", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        button.addTarget(self, action: #selector(downloadBtnWasPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroundColor.share.setBackground(view: view)
        view.addSubview(backButton)
        view.addSubview(contentView)
        contentView.addSubview(label)
        contentView.addSubview(image)
    
        view.addSubview(firstColorBtn)
        view.addSubview(secondColorBtn)
        
        view.addSubview(downloadButton)

        setConstrains()
    }
    
    private func setConstrains() {
        [
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 42),
            backButton.heightAnchor.constraint(equalToConstant: 42)
        ].forEach({$0.isActive = true})
        
        [
            contentView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            contentView.heightAnchor.constraint(equalToConstant: 540)
        
        ].forEach({$0.isActive = true})
        
        [
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 35)
        ].forEach({$0.isActive = true})
        
        [
            image.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ].forEach({$0.isActive = true})
        
        [
            firstColorBtn.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 25),
            firstColorBtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: (view.frame.size.width / 2) - 50),
            firstColorBtn.heightAnchor.constraint(equalToConstant: 30),
            firstColorBtn.widthAnchor.constraint(equalToConstant: 30)
        ].forEach({$0.isActive = true})
        
        [
            secondColorBtn.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 25),
            secondColorBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(view.frame.size.width / 2) + 50),
            secondColorBtn.heightAnchor.constraint(equalToConstant: 30),
            secondColorBtn.widthAnchor.constraint(equalToConstant: 30)
        ].forEach({$0.isActive = true})
        
        
        [
            downloadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 300),
            downloadButton.heightAnchor.constraint(equalToConstant: 50)
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
    
    @objc func downloadBtnWasPressed() {
        print("Downloading...")
    }
}
