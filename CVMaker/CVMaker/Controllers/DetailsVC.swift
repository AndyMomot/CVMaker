//
//  DetailsVC.swift
//  CVMaker
//
//  Created by Андрей on 21.06.2022.
//

import UIKit

class DetailsVC: UIViewController {
    

    var testView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        view.addSubview(testView)
        view.backgroundColor = .yellow
        
    }

}
