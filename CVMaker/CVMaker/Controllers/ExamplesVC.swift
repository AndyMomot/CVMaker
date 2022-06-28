//
//  ExamplesVC.swift
//  CVMaker
//
//  Created by Андрей on 28.05.2022.
//

import UIKit

class ExamplesVC: UIViewController {
    
    var isSelected = false
    var isSelectedSecond = false
    var isSelectedThird = false
    
    var selectedIndexPaths = [IndexPath]()
    
    let resources = Resources()
    
    let backButton: UIButton = {
        let image = UIImage(named: "arrow-to-left")
        
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.backgroundColor = UIColor(red: 118/255, green: 100/255, blue: 232/255, alpha: 0.5)
        button.layer.cornerRadius = 10
        button.imageView?.contentMode = .scaleAspectFill
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToPreviousVC), for: .touchUpInside)
        return button
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        BackgroundColor.share.setBackground(view: view)
       
        view.addSubview(backButton)
        createTableView()
        createCell()
        setConstraints()
    }
    
    private func createTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func createCell() {
        tableView.register(UINib(nibName: "CvCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setConstraints() {
        [
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 42),
            backButton.heightAnchor.constraint(equalToConstant: 42)
        ].forEach({$0.isActive = true})
        
        
        [
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ].forEach({$0.isActive = true})
        
    }

    @objc func goToPreviousVC() {
        print("Back")
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}


// MARK: extension

extension ExamplesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height * 0.5
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        
        let goToDetailsVC = DetailsVC()
        let alertController = UIAlertController(title: "Стиль", message: "", preferredStyle: .alert)
        
        
        let acrion = UIAlertAction(title: "Так", style: .default) { (action) in
            self.present(goToDetailsVC, animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "Hi", style: .cancel) { (cancel) in
            UIView.animate(withDuration: 0.3) {
                cell.backgroundColor = .blue
                cell.backgroundColor = .clear
            }
        }
        
        alertController.addAction(acrion)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
        
        func animation() {
            UIView.animate(withDuration: 1) {
                cell.backgroundColor = .blue
                cell.backgroundColor = .clear
            }
        }
        
        switch indexPath {
            
        case [0, 0]:
            alertController.message = "Обрати стиль 'Перший'?"
           
            animation()
            goToDetailsVC.label.text = "Перший"
            goToDetailsVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(goToDetailsVC, animated: true)
            


        case [0, 1]:
            alertController.message = "Обрати стиль 'Другий'?"
            
            animation()
            goToDetailsVC.label.text = "Другий"
            goToDetailsVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(goToDetailsVC, animated: true)

        case [0, 2]:
            alertController.message = "Обрати стиль 'Третій'?"
            
            animation()
            goToDetailsVC.label.text = "Третій"
            goToDetailsVC.image.image = UIImage(named: "cv")
            goToDetailsVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(goToDetailsVC, animated: true)
        default:
           return
        }
    }
}

extension ExamplesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Resources.share.getImage().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CvCell {
            
            let resume = Resources.share.getImage()[indexPath.row]
            cell.updateViews(resume: resume)
            cell.backView.backgroundColor = UIColor.clear
            cell.cvImage.backgroundColor = .clear
            return cell
            
        } else {
            return CvCell()
        }
    }
}
