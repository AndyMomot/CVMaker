//
//  GradientButton.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit

class GradientButton: UIButton {
    
    let gradient = CAGradientLayer()
    
    init() {
        super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = [
            UIColor(red: 100/255, green: 152/255, blue: 232/255, alpha: 1).cgColor,
            UIColor(red: 118/255, green: 100/255, blue: 232/255, alpha: 1).cgColor
        ]
        gradient.cornerRadius = 10
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}
