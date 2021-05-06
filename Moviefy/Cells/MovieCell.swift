//
//  MovieCell.swift
//  Moviefy
//
//  Created by X Y on 5/5/21.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    
    static var identifier: String = "MovieCell"
    
    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContents(movie: Movie) {
        topLabel.text = movie.title
        bottomLabel.text = movie.releaseDate
    }
    
    override func prepareForReuse() {
        //coverImg.kf.cancelDownloadTask()
        coverImg.image = nil
        topLabel.text = nil
        bottomLabel.text = nil
    }
}
