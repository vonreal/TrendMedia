//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {

    var birthdayFriends = ["홍길동", "아무개", "랏따"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 50 // default 44
        
    }
    
    // 섹션의 갯수 (옵션)
    // 셀 * 섹션 (섹션은 디폴트가 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "생일인 친구"
        } else if section == 1 {
            return "즐겨찾기"
        } else if section == 2 {
            return "친구 140명"
        }
        
        return "섹션의 헤더"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "섹션의 푸터"
    }
    
    // 1. 셀의 갯수(필수)
    // ex) 카톡 100명 > 셀 100개, 3000명 > 셀 3000개
    // keyword: numberofrows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        } else if section == 1 {
            return 2
        } else if section == 2 {
            return 10
        } else {
            return 0
        }
    }
    
    // 2. 셀의 디자인과 데이터(필수)
    // ex) 카톡 이름, 프로필 사진, 상태 메시지 등
    // keyword: cellfor
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // [재사용 메커니즘] - 시뮬레이터에서 스크롤을 진행하면 셀이 보일때 출력이 진행됨.
        print("cellformat", indexPath)
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell")!
            
            cell.textLabel?.text = "2번 인덱스 텍스트"
            cell.textLabel?.textColor = .systemBrown
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.detailTextLabel?.text = "디테일 레이블"
            
            // indexPath.row % 2 == 0 (짝수, 홀수)
            let imageName = indexPath.row % 2 == 0 ? "star.fill" : "star"
            cell.imageView?.image = UIImage(systemName: imageName)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            
            if indexPath.section == 0 {
                cell.textLabel?.text = birthdayFriends[indexPath.row]
                cell.textLabel?.textColor = .systemBlue
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            } else if indexPath.section == 1 {
                cell.textLabel?.text = "1번 인덱스 텍스트"
                cell.textLabel?.textColor = .systemPink
                cell.textLabel?.font = .italicSystemFont(ofSize: 25)
            }
            return cell
        }
    }

    // 셀의 높이(옵션, 빈도 높은) (feat. talbeView.rowHeight) 메서드가 우선적용된다.
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
