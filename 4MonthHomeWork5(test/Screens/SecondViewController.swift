//
//  SecondViewController.swift
//  4MonthHomeWork5(test
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var Contacts: [Contact] = []
    private let cellID = "cell"

    
    private lazy var myNotLbl: UILabel = MakerView.sharedLB.makeLbl(text: "Notification",
                                                                    textSize: 24,
                                                                    ofSize: .bold)
    
    private lazy var mySetting: UIImageView = {
        let Img = UIImageView()
        Img.image = UIImage(named: "Setting")
        Img.translatesAutoresizingMaskIntoConstraints = false
        return Img
    }()
    
    private lazy var myStacklBl: UIStackView = {
        let msl = UIStackView()
        msl.axis = .vertical
        msl.spacing = 1
        msl.alignment = .center
        msl.translatesAutoresizingMaskIntoConstraints = false
        return msl
    }()
    
    private lazy var myGeneralBt: UIButton = MakerView().makeBTN(title: "General",
                                                                 for: .normal,
                                                                 colorBT: .red)
    
    private lazy var myTenchLb: UILabel = MakerView.sharedLB.makeLbl(text: "______________________",
                                                                     textColor: .red,
                                                                     textSize: 14,
                                                                     ofSize: .bold)
    
    private lazy var myStackblack: UIStackView = {
        let msl = UIStackView()
        msl.axis = .vertical
        msl.spacing = 1
        msl.alignment = .center
        msl.translatesAutoresizingMaskIntoConstraints = false
        return msl
    }()
    
    private lazy var mySystembt: UIButton = MakerView().makeBTN(title: "System",
                                                                 for: .normal,
                                                                 colorBT: .black)
    
    private lazy var myTenchLbBack: UILabel = MakerView.sharedLB.makeLbl(text: "_____________________________",
                                                                     textColor: .black,
                                                                     textSize: 10,
                                                                     ofSize: .bold)
      
    private let myTableView: UITableView = {
    let tableView = UITableView()
          tableView.translatesAutoresizingMaskIntoConstraints = false
          return tableView
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        upperPardScreen()
        setupTableView()
        setupData()
    }
    
    private func upperPardScreen() {
        view.addSubview(myNotLbl)
        view.addSubview(mySetting)
        view.addSubview(myStacklBl)
        myStacklBl.addArrangedSubview(myGeneralBt)
        myStacklBl.addArrangedSubview(myTenchLb)
        view.addSubview(myStackblack)
        myStackblack.addArrangedSubview(mySystembt)
        myStackblack.addArrangedSubview(myTenchLbBack)
                
        NSLayoutConstraint.activate([
            myNotLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            myNotLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            myNotLbl.heightAnchor.constraint(equalToConstant: 34),
            myNotLbl.widthAnchor.constraint(equalToConstant: 294)
        ])
        
        NSLayoutConstraint.activate([
            mySetting.topAnchor.constraint(equalTo: view.topAnchor, constant: 62),
            mySetting.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mySetting.heightAnchor.constraint(equalToConstant: 25),
            mySetting.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            myStacklBl.topAnchor.constraint(equalTo: myNotLbl.bottomAnchor, constant: 20),
            myStacklBl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myStacklBl.heightAnchor.constraint(equalToConstant: 35),
            myStacklBl.widthAnchor.constraint(equalToConstant: 182)
        ])
        
        NSLayoutConstraint.activate([
            myStackblack.topAnchor.constraint(equalTo: mySetting.bottomAnchor, constant: 26),
            myStackblack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myStackblack.heightAnchor.constraint(equalToConstant: 35),
            myStackblack.widthAnchor.constraint(equalToConstant: 182)
        ])
        mySystembt.addTarget(self, action: #selector(thirdTapped), for: .touchUpInside)
    }
    
    private func setupTableView() {
        view.addSubview(myTableView)
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: myStackblack.bottomAnchor, constant: 24),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
    }
    
    private func setupData() {
        Contacts = [
            Contact(image: "Name0", text: "Jane Cooper has published a new recipe!", secondText: "Today | 09:24 AM", secondImage: "Image0", image3: "third"),
      Contact(image: "Name1", text: "Rochel has commented on your recipe", secondText: "1 day ago | 14:43 PM", secondImage: "Image1", image3: "third"),
      Contact(image: "Name2", text: "Brad Wigington liked your comment", secondText: "1 day ago | 09:29 AM", secondImage: "Image2", image3: "third"),
      Contact(image: "Name3", text: "Tyra Ballentine has published a new recipe!", secondText: "2 days ago | 10:29 AM", secondImage: "Image3", image3: "third"),
      Contact(image: "Name4", text: "Marci Winkles has published a new recipe!", secondText: "3 days ago | 16:52 PM", secondImage: "Image4", image3: "third"),
      Contact(image: "Name5", text: "Aileen has commented on your recipe", secondText: "4 days ago | 14:27 PM", secondImage: "Image5", image3: "third"),
      Contact(image: "Name6", text: "George has commented on your recipe", secondText: "5 days ago | 09:20 AM", secondImage: "Image6", image3: "third")
      ]
        myTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < Contacts.count else {
            return UITableViewCell()
        }

        let contact = Contacts[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.configure(with: contact)
        return cell
    }
    
    @objc func thirdTapped(_ sender: UIButton) {
        let vc = ThirdViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
