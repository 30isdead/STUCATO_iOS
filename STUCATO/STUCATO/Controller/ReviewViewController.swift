//
//  ReviewViewController.swift
//  STUCATO
//
//  Created by Seyoung on 12/3/23.
//

import UIKit
import SnapKit

class ReviewViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    
    lazy var reviewCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reviewCollectionView.delegate = self
        self.reviewCollectionView.dataSource = self
        self.reviewCollectionView.register(ReviewCollectionViewCell.self, forCellWithReuseIdentifier: ReviewCollectionViewCell.identifier)
        
        view.backgroundColor = .white
        view.addSubview(reviewCollectionView)
        
        let width = UIScreen.main.bounds.width
        
        reviewCollectionView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(80)
            make.leading.bottom.equalToSuperview()
            make.width.equalTo(width)
        }
    }
}

extension ReviewViewController: UICollectionViewDataSource {
    
    //셀 개수 정의
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //셀 정의
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCollectionViewCell.identifier, for: indexPath) as?
                ReviewCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .white
        return cell
    }
}

extension ReviewViewController: UICollectionViewDelegateFlowLayout {
    //셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width , height: 160)
    }
}
