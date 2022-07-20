//
//  SearchMovieTableViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/20.
//

import UIKit

class SearchMovieTableViewController: UITableViewController {

    var movieList = MovieInfo()
//    var movieList = ["셰이프 오브 워터", "판의 미로", "헬보이", "r", "q", "e", "e", "f", "d"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieTableViewCell", for: indexPath) as! SearchMovieTableViewCell
        
        cell.configureCell(data: movieList.movie[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // UIScreen.main.bounds = 디바이스 전체 높이
        // 몇 개의 셀을 보여줄 것인가
        return UIScreen.main.bounds.height / 8
    }
}
