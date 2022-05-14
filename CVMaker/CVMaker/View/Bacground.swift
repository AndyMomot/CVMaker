//
//  Bacground.swift
//  CVMaker
//
//  Created by Андрей on 05.05.2022.
//

import UIKit

class Bacground: UIView {
    
    static let share = Bacground()
    
    func setBackground(view: UIView) {
        let gradientBackground = CAGradientLayer()
        
        view.layer.addSublayer(gradientBackground)
        gradientBackground.frame = view.bounds
        gradientBackground.colors = [
            UIColor(red: 169/255, green: 110/255, blue: 255/255, alpha: 1).cgColor,
            UIColor(red: 100/255, green: 152/255, blue: 232/255, alpha: 1).cgColor
        ]
        gradientBackground.locations = [0, 1]
        gradientBackground.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientBackground.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradientBackground.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: -0.98, b: -1, c: 2.41, d: -2.34, tx: -0.21, ty: 2.17))
        gradientBackground.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        gradientBackground.position = view.center
    }


}
