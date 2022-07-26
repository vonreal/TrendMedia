//
//  BucketlistTableViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/19.
//

import UIKit

struct Todo {
    var title: String
    var done: Bool
}

class BucketlistTableViewController: UITableViewController {
    
    var placeHolder: String?
    // 옵셔널 스트링 타입으로 선언하더라도 오류가 뜨지 않는 이유는?
    // placeholder 자체가 옵셔널이라면?
    // 하지만 String Interpolation이라면?
    
    static let identifier = "BucketlistTableViewController"

    @IBOutlet weak var userTextField: UITextField! {
        didSet {
            print("텍스트 필드 Didset")
            userTextField.textAlignment = .center
            userTextField.font = .boldSystemFont(ofSize: 22)
            userTextField.textColor = .systemRed
        }
    }
    
    var list = [Todo(title: "범죄도시", done: false), Todo(title: "rudnfdhkdrnr", done: false)] {
        didSet {
            tableView.reloadData()
            print("변경전: \(oldValue)")
            print("변경후: \(list)\n")
        }
    }
    
    deinit {
        print("나 나갔다아아앙앙")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.placeholder = "\(placeHolder ?? "영화")를 입력해보세요"
        // 코드로 네비게이션 타이틀, 엑스버튼 삽입하기
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        
        
        tableView.rowHeight = 80
        
        list.append(Todo(title: "마녀", done: false))
        list.append(Todo(title: "이세계삼촌", done: false))
    }
    
    @objc func closeButtonClicked() {
        self.dismiss(animated: true)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 타입 캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketListTableViewCell.identifier, for: indexPath) as! BucketListTableViewCell
        
        cell.bucketlistLabel.text = list[indexPath.row].title
        cell.bucketlistLabel.font = .boldSystemFont(ofSize: 18)
        cell.checkboxButton.tag = indexPath.row
        cell.checkboxButton.addTarget(self, action: #selector(checkboxButtonClicked), for: .touchUpInside)
        
        let value = list[indexPath.row].done ? "checkmark.square.fill" : "checkmark.square"
        cell.checkboxButton.setImage(UIImage(systemName: value), for: .normal)
        return cell
    }
    
    @objc func checkboxButtonClicked(_ sender: UIButton) {
        list[sender.tag].done = !list[sender.tag].done
        
//        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
   
//        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) else { return }
        list.append(Todo(title: sender.text!, done: false))
//        tableView.reloadData()
        
        // 중요!, 잘못 입력하면 앱이 꼬이게 된다!
//        tableView.reloadData()
        // tableView.numberOfRows(inSection: )
        // tableView.cellForRow(at: ) 등을 모두 불러야하는 것을 축약해주는 함수가 reloadData()
        
        // 특정 섹션만 리로드!!
//        tableView.reloadSections(IndexSet(, with: <#T##UITableView.RowAnimation#>)
        // 특정 셀만 리로드!!
//        tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .fade)
    }
    
    
    // true로 하면 셀의 편집이 가능해짐
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 우측 스와이프 디폴트 기능: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // 배열 삭제 후 테이블뷰 갱신
            list.remove(at: indexPath.row)
//            tableView.reloadData()
        }
    }
}
