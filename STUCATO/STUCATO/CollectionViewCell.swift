//
//  CollectionViewCell.swift
//  STUCATO
//
//  Created by 오연서 on 12/4/23.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    //MARK: - UI ProPerties

    //스터디카페 사진
    lazy var cafeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image1")
        //view.contentMode = .scaleAspectFit // 이미지가 뷰에 맞게 조절되도록
        view.clipsToBounds = true
        
        return view
    }()
    
    //북마크 버튼
    lazy var bookMarkButton: UIButton = {
        let view = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium)
        let image = UIImage(systemName: "bookmark", withConfiguration: imageConfig)
        let selectedImage = UIImage(systemName: "bookmark.fill", withConfiguration: imageConfig)
        
        view.setImage(image, for: .normal)
        view.setImage(selectedImage, for: .selected)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //스터디카페명
    lazy var titleLable: UILabel = {
        let view = UILabel()
        view.text = "이제마스터디카페 홍대점"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.numberOfLines = 0
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var timeInfoLable: UILabel = {
        let view = UILabel()
        view.text = "24시간영업"
        view.font = UIFont.boldSystemFont(ofSize: 18)
        view.numberOfLines = 0
        view.textColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var starImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var starLabel: UILabel = {
        let view = UILabel()
        view.text = "3.8"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 16)
        view.numberOfLines = 0
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()

    //MARK: - Define Method

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSet()
        viewConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Properties
    
    
    //MARK: - Set Ui
    //전체 view 관리
    func viewSet() {
        self.addSubview(cafeImage)
        self.addSubview(titleLable)
        self.addSubview(starImage)
        self.addSubview(starLabel)
        self.addSubview(timeInfoLable)
        self.addSubview(bookMarkButton)
    }
    
    //전체 오토레이아웃 관리
    func viewConstraint() {
        
        cafeImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalTo(self)
            make.width.equalTo(295)
            make.height.equalTo(295)
        }
        cafeImage.layer.cornerRadius = 20
        
        bookMarkButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(70)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        titleLable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(340)
            make.leading.equalToSuperview().offset(10)
        }
        
        timeInfoLable.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(360)
            make.leading.equalTo(titleLable)
        }
        
        starImage.snp.makeConstraints { make in
            make.centerY.equalTo(titleLable)
            make.leading.equalToSuperview().offset(250)
        }
        
        starLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLable)
            make.leading.equalToSuperview().offset(270)
        }
        
    }
}
