//
//  MakerView.swift
//  4MonthHomeWork5(test
//
//  Created by Nurtilek on 1/26/24.
//

import UIKit

class MakerView {
    
    static let sharedLB = MakerView()
    
    func makeLbl(text: String = "",
                   textColor: UIColor = .black,
                   textSize: CGFloat = 14, ofSize: UIFont.Weight = .light,
                 numberOfLines: Int = 0) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: textSize, weight: ofSize)
        label.numberOfLines = numberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    

    static let shared = MakerView()
    
    func makeBTN(title: String = "",
                 for state: UIControl.State = .normal,
                 colorBT: UIColor = .blue,
                 backgroundColorBT: UIColor? = nil,
                 layerCornerBT: CGFloat = 16) -> UIButton {
        let bt = UIButton(type: .system)
        bt.setTitle(title, for: state)
        bt.tintColor = colorBT
        bt.backgroundColor = backgroundColorBT
        bt.layer.cornerRadius = layerCornerBT
        bt.translatesAutoresizingMaskIntoConstraints = false
        return bt
    }
}

