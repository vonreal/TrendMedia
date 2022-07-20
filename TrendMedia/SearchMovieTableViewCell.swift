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
    
    func configureCell(data: String) {
        titleLabel.text = data
        titleLabel.font = .boldSystemFont(ofSize: 15)
        releaseLabel.text = "2009.12.17"
        overviewLabel.text = "지구 에너지 고갈 문제를 해결하기 위해 판도라 행성으로 향한 인류는 원주민 ‘나비족’과 대립하게 된다. 이 과정에서, 전직 해병대원 제이크 설리(샘 워싱턴)가 ‘아바타’ 프로그램을 통해 ‘나비족’의 중심부에 투입되는데…"
        overviewLabel.numberOfLines = 0
    }
}
