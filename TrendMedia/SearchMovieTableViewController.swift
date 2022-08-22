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

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetButtonClicked))
    }
        
    @objc func resetButtonClicked(){
        
        // iOS13 이상 SceneDelegate 쓸 때 동작하는 코드
        // 앱이 처음 시작하는 것 처럼 화면을 되돌리는 것
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let storyBoard = UIStoryboard(name: "Trend", bundle: nil)
        let viewCon = storyBoard.instantiateViewController(withIdentifier: "exViewController") as! exViewController
        
        sceneDelegate?.window?.rootViewController = viewCon
        sceneDelegate?.window?.makeKeyAndVisible()
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewController") as! RecommandCollectionViewController
        
        // [값전달] 2: vc가 가지고 있는 프로퍼티에 데이터 추가
        vc.movieData = movieList.movie[indexPath.row]
        vc.movieTitle = movieList.movie[indexPath.row].movieTitle
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
