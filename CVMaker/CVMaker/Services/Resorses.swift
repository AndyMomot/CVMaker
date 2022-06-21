//
//  Resorses.swift
//  CVMaker
//
//  Created by Андрей on 28.05.2022.
//

import Foundation
import UIKit

struct Resources {
    
    static let share = Resources()
    
    private let resumes = [
        Resumes(title: "first", imageName: "cv"),
        Resumes(title: "second", imageName: "cv"),
        Resumes(title: "third", imageName: "cv")
    
    ]
    
    func getImage() -> [Resumes]{
        return resumes
    }
    
}
