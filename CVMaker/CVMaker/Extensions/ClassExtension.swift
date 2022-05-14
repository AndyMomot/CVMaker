//
//  ClassExtension.swift
//  CVMaker
//
//  Created by Андрей on 12.05.2022.
//

import Foundation
extension NSObject {
    class var identifier: String {
        return String(describing: self)
    }
}
