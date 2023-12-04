//
//  ReserveCollectionViewCell.swift
//  STUCATO
//
//  Created by Seyoung on 12/4/23.
//

import UIKit
import SnapKit

class ReserveCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "reserveViewCell"
    
    lazy var cafeNameLabel: UILabel = {
        let view = UILabel()
        view.text = "15인실 세미나실"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        view.numberOfLines = 0
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var cafePriceLabel: UILabel = {
        let view = UILabel()
        view.text = "15000원"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var cafeInfoLabel: UILabel = {
        let view = UILabel()
        view.text = "[최소 2시간 이상 및 시간단위 예약 필수]"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var cafeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "cafeImage")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setReseveLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setReseveLayout()
    }
    
    
}


extension ReserveCollectionViewCell {
    func setReseveLayout() {
        addSubview(cafeNameLabel)
        addSubview(cafePriceLabel)
        addSubview(cafeInfoLabel)
        addSubview(cafeImage)
        addSubview(lineView)
        
        cafeNameLabel.snp.makeConstraints{ make in
            make.top.equalTo(self).offset(16)
            make.leading.equalTo(self).offset(30)
            make.width.equalTo(200)
        }
        
        cafePriceLabel.snp.makeConstraints{ make in
            make.top.equalTo(cafeNameLabel.snp.bottom).offset(8)
            make.leading.width.equalTo(cafeNameLabel)
        }
        
        cafeInfoLabel.snp.makeConstraints{ make in
            make.top.equalTo(cafePriceLabel.snp.bottom).offset(8)
            make.leading.width.equalTo(cafeNameLabel)
        }
        
        cafeImage.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
            make.height.width.equalTo(96)
        }
        
        lineView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.centerX.equalTo(cafePriceLabel.snp.centerX)
            make.height.equalTo(1)
            make.leading.equalTo(cafeNameLabel.snp.leading)
            make.trailing.equalTo(cafeImage.snp.trailing)
            
        }
    }
}
