//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func movieButtonClicked(_ sender: UIButton) {
        
        // 화면전환: 1. 스토리보드 파일 2. 스토리보드 내에 뷰컨트롤러 3. 화면 전환
        // 영화버튼 클릭 > BucketlistTableViewController Present
        // 1.
        let storyboard = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let viewController = storyboard.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        // 3. present 방식으로 띄움 (modal = 팝업)
        viewController.placeHolder = "영화를 입력해주세요."
        self.present(viewController, animated: true)
    }
    
    @IBAction func dramaButtonClicked(_ sender: UIButton) {
        
        // 1.
        let storyboard = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let viewController = storyboard.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        // 2.5. full screen으로 띄우기!
        viewController.modalPresentationStyle = .fullScreen
        
        viewController.placeHolder = "드라마를 입력해주세요."
        
        // 3. present 방식으로 띄움 (modal = 팝업)
        self.present(viewController, animated: true)
    }
    
    @IBAction func bookButtonClicked(_ sender: UIButton) {
        // 1.
        let storyboard = UIStoryboard(name: "Trend", bundle: nil)
        // 2.
        let viewController = storyboard.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as! BucketlistTableViewController
        
        // 2.5 :네비게이션
        let nav = UINavigationController(rootViewController: viewController)
        
        
        // 2.5. full screen으로 띄우기!
        nav.modalPresentationStyle = .fullScreen
        // 3. present 방식으로 띄움 (modal = 팝업)
        self.present(nav, animated: true)
    }
    
    
}
