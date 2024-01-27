//
//  ViewController.swift
//  4MonthHomeWork5(test
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var myBack: UIImageView = {
        let Img = UIImageView()
        Img.image = UIImage(named: "Back")
        Img.translatesAutoresizingMaskIntoConstraints = false
        return Img
    }()
    
    private lazy var myLabel: UILabel = MakerView.sharedLB.makeLbl(text: "Create New Password 🔐",
                                                                   textSize: 28,
                                                                   ofSize: .bold)
    
    private lazy var myLabel2: UILabel = MakerView.sharedLB.makeLbl(text: "Enter your new password. If you forget it, then you have to do forgot password.",
                                                                    textSize: 17,
                                                                    ofSize: .light)
    
    private lazy var myPasswordLbl: UILabel = MakerView.sharedLB.makeLbl(text: "Password",
                                                                         textSize: 13,
                                                                         ofSize: .bold)
    
    private let passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "enter a password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true //это типа скрыт код
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        tf.isUserInteractionEnabled = true
        rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 0
        tf.rightView = rightView
        tf.rightViewMode = .always
        tf.tag = 0
        tf.addTarget(self, action: #selector(enabledButton), for: .touchUpInside)
        return tf
    }()
    
    private lazy var myConfinmLbl: UILabel = MakerView.sharedLB.makeLbl(text: "Confirm Password",
                                                                        textSize: 13,
                                                                        ofSize: .bold)
    
    private let confirmTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "enter a password"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        let rightView = UIButton(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        rightView.setBackgroundImage(UIImage(systemName: "eye.slash"), for: .normal)
        tf.isUserInteractionEnabled = true
        rightView.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        rightView.tag = 1
        tf.rightView = rightView
        tf.rightViewMode = .always
        tf.tag = 1
        tf.addTarget(self, action: #selector(enabledButton), for: .editingChanged)
        return tf
    }()
    
    private lazy var myRemember: UILabel = MakerView.sharedLB.makeLbl(text: "Remember me",
                                                                      textSize: 15,
                                                                      ofSize: .medium)
    
    private lazy var mycontinue: UIButton = MakerView.shared.makeBTN(title: "Continue",
                                                                     colorBT: .white,
                                                                     backgroundColorBT: .darkGray,
                                                                     layerCornerBT: 16)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        upperPartScreen()
        bottomOfScreen()
    }
    
    private func upperPartScreen() {
        view.addSubview(myBack)
        view.addSubview(myLabel)
        view.addSubview(myLabel2)
        view.addSubview(myPasswordLbl)
        view.addSubview(passwordTF)
        view.addSubview(myConfinmLbl)
        
        NSLayoutConstraint.activate([
            myBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            myBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myBack.heightAnchor.constraint(equalToConstant: 20),
            myBack.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            myLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            myLabel.heightAnchor.constraint(equalToConstant: 51),
            myLabel.widthAnchor.constraint(equalToConstant: 700)
        ])
        
        NSLayoutConstraint.activate([
            myLabel2.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 5),
            myLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            myLabel2.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            myPasswordLbl.topAnchor.constraint(equalTo: myLabel2.bottomAnchor, constant: 13),
            myPasswordLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myPasswordLbl.heightAnchor.constraint(equalToConstant: 22),
        ])
        
        NSLayoutConstraint.activate([
            passwordTF.topAnchor.constraint(equalTo: myPasswordLbl.bottomAnchor, constant: 5),
            passwordTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            myConfinmLbl.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 10),
            myConfinmLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            myConfinmLbl.heightAnchor.constraint(equalToConstant: 22)
        ])
    }
    
    private func bottomOfScreen() {
        view.addSubview(confirmTF)
        view.addSubview(myRemember)
        view.addSubview(mycontinue)
        
        NSLayoutConstraint.activate([
            confirmTF.topAnchor.constraint(equalTo: myConfinmLbl.bottomAnchor, constant: 5),
            confirmTF.leadingAnchor.constraint(equalTo: passwordTF.leadingAnchor),
            confirmTF.trailingAnchor.constraint(equalTo: passwordTF.trailingAnchor),
            confirmTF.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            myRemember.topAnchor.constraint(equalTo: confirmTF.bottomAnchor, constant: 10),
            myRemember.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            myRemember.heightAnchor.constraint(equalToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            mycontinue.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            mycontinue.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mycontinue.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mycontinue.heightAnchor.constraint(equalToConstant: 45)
        ])
        mycontinue.addTarget(self, action: #selector(performSegueIfEnabled), for: .touchUpInside)

    }
    
    
    @objc func hideText(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            passwordTF.isSecureTextEntry = !passwordTF.isSecureTextEntry
        case 1:
            confirmTF.isSecureTextEntry = !confirmTF.isSecureTextEntry
        default:
            break
        }
        
    }
    
    @objc func enabledButton(_ sender: UITextField) {
        guard let name = passwordTF.text, let confirm = confirmTF.text else { return }
        
        if name.count >= 4 && confirm.count >= 4, name == confirm {
            mycontinue.isEnabled = true
            mycontinue.backgroundColor = .red
        } else {
            mycontinue.isEnabled = false
            mycontinue.backgroundColor = .darkGray
        }
    }

    @objc func performSegueIfEnabled() {
        if mycontinue.isEnabled {
            let vc = SecondViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    


}

