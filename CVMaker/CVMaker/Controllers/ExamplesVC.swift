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

extension ExamplesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 507
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.cellForRow(at: indexPath)
//
//        if let index = selectedIndexPaths.firstIndex(of: indexPath) { //deselect it if the row is selected
//                tableView.deselectRow(at: indexPath, animated: true)
//                cell?.backgroundColor = .clear
//                selectedIndexPaths.remove(at: index)
//            }
//            else{ //select it if the row is deselected
//                cell?.backgroundColor = .yellow
//                selectedIndexPaths.append(indexPath)
//            }
        
        if let cell = tableView.cellForRow(at: indexPath){
           
            let goToDetailsVC = DetailsVC()

            switch indexPath {
            case [0, 0]:

                UIView.animate(withDuration: 0.3) {
                    cell.backgroundColor = .blue
                    cell.backgroundColor = .clear
                }

                goToDetailsVC.testView.backgroundColor = .red
                goToDetailsVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(goToDetailsVC, animated: true)
                if isSelected == true {
                    self.present(goToDetailsVC, animated: true, completion: nil)
                }
                isSelected = true

            case [0, 1]:

                UIView.animate(withDuration: 0.3) {
                    cell.backgroundColor = .blue
                    cell.backgroundColor = .clear
                }

                goToDetailsVC.testView.backgroundColor = .white
                goToDetailsVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(goToDetailsVC, animated: true)
                if isSelectedSecond == true {
                    self.present(goToDetailsVC, animated: true, completion: nil)
                }
                isSelectedSecond = true

            case [0, 2]:

                UIView.animate(withDuration: 0.3) {
                    cell.backgroundColor = .blue
                    cell.backgroundColor = .clear
                }

                goToDetailsVC.testView.backgroundColor = .blue
                goToDetailsVC.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(goToDetailsVC, animated: true)
                if isSelectedThird == true {
                    self.present(goToDetailsVC, animated: true, completion: nil)
                }
                isSelectedThird = true
            default:
               return
            }
        }
    }
}

extension ExamplesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Resources.share.getImage().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CvCell {
            
            let widthForBackView = tableView.frame.size.width - 80
            let frameForBackView = CGRect(x: 20, y: 0, width: widthForBackView, height: widthForBackView * 1.04)
            
            let resume = Resources.share.getImage()[indexPath.row]
            cell.updateViews(resume: resume)
            cell.backView.frame = frameForBackView
            cell.backView.backgroundColor = UIColor.clear
           

            return cell
        } else {
            return CvCell()
        }
    }
}
