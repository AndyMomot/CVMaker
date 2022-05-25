//
//  TextViewSemple.swift
//  CVMaker
//
//  Created by Андрей on 08.05.2022.
//

import UIKit

class TextViewSemple: UITextView {

    static let share = TextViewSemple()
    
    func setStyleFor(name: UITextView, text: String, fontSize: CGFloat) {
        name.text = text
        name.font = UIFont.boldSystemFont(ofSize: fontSize)
        name.backgroundColor = .clear
        name.textColor = .white
        name.textAlignment = .left
        name.isEditable = false
        name.isScrollEnabled = false
        name.translatesAutoresizingMaskIntoConstraints = false
    }

}
