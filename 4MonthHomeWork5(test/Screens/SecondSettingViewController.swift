//
//  SecondSettingViewController.swift
//  4MonthHomeWork5(test
//
//  Created by Nurtilek on 2/29/24.
//

import UIKit

class SecondSettingViewController: UIViewController {
    
    private lazy var noteSearchBar: UISearchBar = {
        let view = UISearchBar()
        view.placeholder = "Search"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var trailingbutton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Recipes", for: .normal)
        bt.setTitleColor(.white, for: .normal)
        bt.backgroundColor = .red
        bt.layer.cornerRadius = 20
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
   
    private lazy var leadingButton: UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitle("Recipes", for: .normal)
        bt.setTitleColor(.red, for: .normal)
        bt.layer.cornerRadius = 20
        bt.layer.borderColor = UIColor.red.cgColor
        bt.layer.borderWidth = 1.5
        bt.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }()
    
    private lazy var centerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "settingView")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var topLabel: UILabel = MakerView.shared.makeLbl(text: "Not Found",
                                                                  textColor: .black,
                                                                  textSize: 22,
                                                                  ofSize: .bold)
    
    private lazy var bottomLabel: UILabel = MakerView.shared.makeLbl(text: "We're sorry, the keyword you were looking for could not be found. Please search with another keywords.",
                                                                     textColor: .black,
                                                                     textSize: 17,
                                                                     ofSize: .light,
                                                                     numberOfLines: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let backButtonImage = UIImage(systemName: "chevron.left")
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        setupNotebar()
        setupLeadingButton()
        setupTrailingButton()
        setupImage()
        setupTopLbl()
        setupBottomLbl()
    }
    
    private func setupNotebar() {
        view.addSubview(noteSearchBar)
        NSLayoutConstraint.activate([
            noteSearchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            noteSearchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noteSearchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noteSearchBar.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupLeadingButton() {
        view.addSubview(leadingButton)
        NSLayoutConstraint.activate([
            leadingButton.topAnchor.constraint(equalTo: noteSearchBar.bottomAnchor, constant: 20),
            leadingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            leadingButton.widthAnchor.constraint(equalToConstant: 170),
            leadingButton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    private func setupTrailingButton() {
        view.addSubview(trailingbutton)
        NSLayoutConstraint.activate([
            trailingbutton.topAnchor.constraint(equalTo: noteSearchBar.bottomAnchor, constant: 20),
            trailingbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            trailingbutton.widthAnchor.constraint(equalToConstant: 170),
            trailingbutton.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    private func setupImage() {
        view.addSubview(centerImage)
        NSLayoutConstraint.activate([
            centerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerImage.heightAnchor.constraint(equalToConstant: 218),
            centerImage.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupTopLbl() {
        view.addSubview(topLabel)
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: centerImage.bottomAnchor, constant: 60),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    private func setupBottomLbl() {
        view.addSubview(bottomLabel)
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 12),
            bottomLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            bottomLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func backButtonTapped() {
        for controller in navigationController?.viewControllers ?? [] {
            if let SecondViewController = controller as? SecondViewController {
                navigationController?.popToViewController(SecondViewController, animated: true)
                break
            }
        }
    }
    
    @objc func ButtonTapped(_ sender: UIButton) {
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

