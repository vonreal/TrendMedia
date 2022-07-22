//
//  RecommandCollectionViewController.swift
//  TrendMedia
//
//  Created by 나지운 on 2022/07/20.
//

import UIKit
import Toast
import Kingfisher

/*
 TableView      -> CollectionView
 Row            -> Item
 heightForRowAt -> (테이블 뷰와 달리 너비와 높이가 필요함) FlowLayout (heightForItemAt이 없는 이유)
 */

class RecommandCollectionViewController: UICollectionViewController {

    let imageURL = "https://movie-phinf.pstatic.net/20220704_246/16569027452369rlGb_JPEG/movie_image.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 컬렉션뷰의 셀 크기, 셀 사이 간격 등 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 8
        let width = UIScreen.main.bounds.width - (spacing * 4)
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.3)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        collectionView.collectionViewLayout = layout
    }
    
    // 0. 셀 갯수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    // 1. 셀 데이터 및 디자인 변경
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // guard let 옵셔널 바인딩으로 타입캐스팅 에러 처리 구문
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommandCollectionViewCell", for: indexPath) as? RecommandCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.posterImageView.backgroundColor = .orange
        
        let url = URL(string: imageURL)
        cell.posterImageView.kf.setImage(with: url)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        view.makeToast("\(indexPath.item)번째 셀을 선택했습니다.", duration: 3, position: .center)
        self.navigationController?.popViewController(animated: true)
    }
}
