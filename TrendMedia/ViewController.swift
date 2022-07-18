//
//  ViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    // 언제 아웃렛컬렉션을 사용하는 것이 좋을까?
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var date2Label: UILabel!
    
    @IBOutlet var dateLabelCollection: [UILabel]!

    @IBOutlet weak var yelloViewLeadingConstaint: NSLayoutConstraint!
    // 변수의 스코프
    let format = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 다음 코드가 함수 밖에서 안되는 이유: 클래스의 멤버는 프로퍼티와 메서드 뿐이라서.
        format.dateFormat = "yyyy/MM/dd"
        
        yelloViewLeadingConstaint.constant = 120
    }
    
    func configureLabelDesign() {
        // 1. OutletCollection
        for label in dateLabelCollection {
            label.font = .boldSystemFont(ofSize: 20)
            label.textColor = .brown
        }
        
        dateLabelCollection[0].text = "first text"
        dateLabelCollection[1].text = "second text"
        
        // 2. UILabel
        let labelArray = [dateLabel, date2Label]
        for label in labelArray {
            label?.font = .boldSystemFont(ofSize: 20)
            label?.textColor = .brown
        }
        
        dateLabel.text = "first text"
        date2Label.text = "second text"
        
        // UI의 공통적인 요소가 아닌, 데이터를 변경하거나 삽입할 경우에는 콜렉션보다는 개별적인 아웃렛으로 넘겨주는 것을 추천한다. 중간에 요소가 빠지거나 후에 가독성 측면에서 좋지 않기 때문이다.
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
    }
    
}

