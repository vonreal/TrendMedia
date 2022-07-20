//
//  SearchMovieTableViewCell.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/20.
//

import UIKit

class SearchMovieTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    func configureCell(data: Movie) {
        titleLabel.text = data.movieTitle
        titleLabel.font = .boldSystemFont(ofSize: 15)
        releaseLabel.text = data.movieRelease
        overviewLabel.text = data.movieOverview
        overviewLabel.numberOfLines = 0
    }
}
