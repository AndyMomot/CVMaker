//
//  GradientButton.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit

class GradientButton: UIButton {
    
    let gradient = CAGradientLayer()
    
    init(colors: [CGColor]) {
        super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = colors
        gradient.cornerRadius = 20
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
