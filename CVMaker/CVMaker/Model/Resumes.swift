//
//  Resumes.swift
//  CVMaker
//
//  Created by Андрей on 28.05.2022.
//

import Foundation

struct Resumes {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
