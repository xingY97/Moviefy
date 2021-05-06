//
//  TitleCell.swift
//  Moviefy
//
//  Created by X Y on 5/5/21.
//



import UIKit
import Kingfisher


class TitleCell: UICollectionViewCell {
    static var identifier: String = "TitleCell"
    @IBOutlet private var lblTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func set(title: String) {
        lblTitle.text = title
        
    }

}
