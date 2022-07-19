//
//  case2SettingTableViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/18.
//

import UIKit

class case2SettingTableViewController: UITableViewController {

    let sectionInfos = ["전체 설정", "개인 설정", "기타"]
    let cellInfos = [["공지사항", "실험실", "버전정보"],
                     ["개인/보안", "알림", "채팅", "멀티프로필"],
                     ["고객센터/도움말"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - [CODE] Section
    // 0. 섹션의 갯수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionInfos.count
    }
    
    // 0-1. 섹션의 헤더
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionInfos[section]
    }
    
    // MARK: - [CODE] Cell
    // 1. 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInfos[section].count
    }
    
    // 2. 셀의 디자인과 데이터
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = cellInfos[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 13)
        
        return cell
    }
}
