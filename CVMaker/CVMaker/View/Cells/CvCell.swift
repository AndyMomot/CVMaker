//
//  CvCell.swift
//  CVMaker
//
//  Created by Андрей on 28.05.2022.
//

import UIKit

class CvCell: UITableViewCell {
    
    @IBOutlet weak var cvLable: UILabel!
    @IBOutlet weak var cvImage: UIImageView!
    @IBOutlet weak var backView: UIView!
    
    func updateViews(resume: Resumes) {
        //cvLable.text = resume.title
        cvImage.image = UIImage(named: resume.imageName)
    }
}
