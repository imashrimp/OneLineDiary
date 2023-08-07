//
//  DiaryTableViewCell.swift
//  OneLineDiary
//
//  Created by 권현석 on 2023/07/31.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var contentLabel: UILabel!

    static let identifiler = "DiaryTableViewCell"
    

    func configureCellContent() {
        
        backView.backgroundColor = .systemOrange
        contentLabel.numberOfLines = 0
        contentLabel.backgroundColor = .clear
        contentLabel.textColor = .white
    }
}
