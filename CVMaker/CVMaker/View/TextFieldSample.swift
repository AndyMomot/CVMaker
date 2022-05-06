//
//  TextFieldSample.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit

class TextFieldSample: UITextField {

    func setStyleFor(name: UITextField) {
        name.font = UIFont.systemFont(ofSize: 16)
        name.textColor = UIColor.black
        name.backgroundColor = UIColor.white
        name.clearButtonMode = UITextField.ViewMode.whileEditing
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor.systemGray.cgColor
        name.layer.cornerRadius = 10
    }
    
}
