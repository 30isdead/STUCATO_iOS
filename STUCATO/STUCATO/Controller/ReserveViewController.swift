//
//  ReserveViewController.swift
//  STUCATO
//
//  Created by Seyoung on 12/3/23.
//

import UIKit
import SnapKit

class ReserveViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    
    lazy var reserveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.reserveCollectionView.delegate = self
        self.reserveCollectionView.dataSource = self
        self.reserveCollectionView.register(ReserveCollectionViewCell.self, forCellWithReuseIdentifier: ReserveCollectionViewCell.identifier)
        
        view.backgroundColor = .white
        view.addSubview(reserveCollectionView)
        
        let width = UIScreen.main.bounds.width
        
        reserveCollectionView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(80)
            make.leading.bottom.equalToSuperview()
            make.width.equalTo(width)
        }
    }
}

extension ReserveViewController: UICollectionViewDataSource {
    
    //셀 개수 정의
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    //셀 정의
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReserveCollectionViewCell.identifier, for: indexPath) as?
                ReserveCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .white
        return cell
    }
}

extension ReserveViewController: UICollectionViewDelegateFlowLayout {
    //셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: width , height: 130)
    }
}
