//
//  TextFieldSample.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit

class TextFieldSample: UITextField {
    
    static let share = TextFieldSample()

    func setStyleFor(name: UITextField) {
        name.backgroundColor = .white
        name.heightAnchor.constraint(equalToConstant: 35).isActive = true
        name.layer.borderWidth = 2
        name.layer.borderColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        name.layer.cornerRadius = 10
        name.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
