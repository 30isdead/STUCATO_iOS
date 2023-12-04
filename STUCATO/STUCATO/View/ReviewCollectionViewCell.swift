//
//  ReviewCollectionViewCell.swift
//  STUCATO
//
//  Created by Seyoung on 12/4/23.
//

import UIKit
import SnapKit

class ReviewCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "reviewVeiwCell"
    
    lazy var userNameLabel: UILabel = {
        let view = UILabel()
        view.text = "A씨"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        view.numberOfLines = 0
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var userImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "userImage")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var userReviewLabel: UILabel = {
        let view = UILabel()
        view.text = "밖은 한적해서 사람이 많지 않은 줄 알았는데 생각보다 안에는 사람이 많았어요! 집 근처라 자주 이용하게 될 것 같습니다:)"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setReviewLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setReviewLayout()
    }
    
    
}


extension ReviewCollectionViewCell {
    func setReviewLayout() {
        addSubview(userNameLabel)
        addSubview(userImage)
        addSubview(userReviewLabel)
        addSubview(lineView)
        
        userImage.snp.makeConstraints{ make in
            make.top.equalTo(self).offset(16)
            make.leading.equalTo(self).offset(30)
            make.width.height.equalTo(36)
        }
        
        userNameLabel.snp.makeConstraints{ make in
            make.centerY.equalTo(userImage.snp.centerY)
            make.leading.equalTo(userImage.snp.trailing).offset(12)
        }
        
        userReviewLabel.snp.makeConstraints{ make in
            make.top.equalTo(userImage.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        
        lineView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(1)
            make.leading.trailing.equalTo(userReviewLabel)
            
        }
    }
}
