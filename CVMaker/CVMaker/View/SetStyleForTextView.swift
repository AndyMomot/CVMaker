//
//  SetStyleForTextView.swift
//  CVMaker
//
//  Created by Андрей on 23.05.2022.
//

import UIKit

class SetStyleForTextView: UITextView {

    static let share = SetStyleForTextView ()
    
    func setStyleFor(textView: UITextView){
        textView.font = .systemFont(ofSize: 20)
        textView.backgroundColor = .white
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.init(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).cgColor
        textView.layer.cornerRadius = 10
        textView.translatesAutoresizingMaskIntoConstraints = false
    }

}
