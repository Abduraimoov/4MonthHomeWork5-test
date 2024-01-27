//
//  ThirdViewController.swift
//  4MonthHomeWork5(test
//
//  Created by Nurtilek on 1/27/24.
//

import UIKit

class ThirdViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
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
                                                                 colorBT: .black)
    
    private lazy var myTenchLb: UILabel = MakerView.sharedLB.makeLbl(text: "______________________",
                                                                     textColor: .black,
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
                                                                 colorBT: .red)
    
    private lazy var myTenchLbBack: UILabel = MakerView.sharedLB.makeLbl(text: "_____________________________",
                                                                     textColor: .red,
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
    }
    
    private func setupTableView() {
        view.addSubview(myTableView)
       // myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        myTableView.dataSource = self
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: myStackblack.bottomAnchor, constant: 24),
            myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])
        myGeneralBt.addTarget(self, action: #selector(secondTapped), for: .touchUpInside)
    }

    
    private func setupData() {
        Contacts = [
            Contact(image: "1", text: "Cristiano Ronaldo \n is the goat", secondText: "5 ballon dorss", secondImage: "", image3: "third"),
      Contact(image: "messi", text: "Leonel Messi \n is the goat", secondText: "8 ballon dor's", secondImage: "", image3: "third"),
      Contact(image: "Neymar", text: "Neymar jr \n is the perfect player", secondText: "0 ballon dor's", secondImage: "", image3: "third"),
      Contact(image: "ronaldinho", text: "Ronaldinho \n is the iconic player", secondText: "1 ballon dor's", secondImage: "", image3: "third"),
      Contact(image: "ikar", text: "Iker Casillas \n is the iconic goalceper", secondText: "0 ballon dor's", secondImage: "", image3: "third"),
      Contact(image: "mbappe", text: "Kilian Mbappe \n is the best player", secondText: "0 ballon dor's", secondImage: "", image3: "third"),
      Contact(image: "salah", text: "Mohammed Salah \n is the perfect player", secondText: "0 ballon dor's", secondImage: "", image3: "third")
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
    
    @objc func secondTapped(_ sender :UIButton) {
        
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
