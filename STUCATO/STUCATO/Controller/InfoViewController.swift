//
//  InfoViewController.swift
//  STUCATO
//
//  Created by Seyoung on 12/2/23.
//

// InfoViewController.swift
import UIKit
import SnapKit

class InfoViewController: UIViewController, UIScrollViewDelegate {
    
    let verticalScrollView = UIScrollView()
    let horizontalScrollView = UIScrollView()
    
    let verticalContentView = UIView()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "소월스터디카페앤룸 강변점"
        view.font = UIFont(name: "NotoSansKR-Medium", size: 22)
        view.numberOfLines = 0
        view.textColor = .black
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
    
    let horizontalContentView = UIView()
    let images = ["image1", "image1", "image1"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureUI()
        horizontalScrollWithImageView()
    }
}

extension InfoViewController {
    func configureUI() {
        setLayout()
        setVerticalScrollView()
        setHorizontalScrollView()
    }
    
    func setVerticalScrollView() {
        verticalScrollView.showsVerticalScrollIndicator = true
        verticalScrollView.delegate = self
    }
    
    func setHorizontalScrollView() {
        horizontalScrollView.isPagingEnabled = true
        horizontalScrollView.showsHorizontalScrollIndicator = false
        horizontalScrollView.delegate = self
    }
    
    func setLayout() {
        view.addSubview(verticalScrollView)
        
        verticalScrollView.addSubview(verticalContentView)
        verticalContentView.addSubview(horizontalScrollView)
        verticalContentView.addSubview(titleLabel)
        verticalContentView.addSubview(starImage)
        verticalContentView.addSubview(starLabel)
        
        horizontalScrollView.addSubview(horizontalContentView)
        
        verticalScrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        horizontalScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(-60)
            make.height.equalToSuperview().multipliedBy(0.5)
            make.width.equalToSuperview()
        }
        
        verticalContentView.snp.makeConstraints { make in
            make.edges.equalTo(verticalScrollView.contentLayoutGuide)
            make.width.equalTo(verticalScrollView.frameLayoutGuide)
            make.height.equalToSuperview()
        }
        
        let width = UIScreen.main.bounds.width
        horizontalContentView.snp.makeConstraints { make in
            make.edges.equalTo(horizontalScrollView.contentLayoutGuide)
            make.height.equalTo(horizontalScrollView.frameLayoutGuide)
            make.width.equalTo(width * CGFloat(images.count))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalScrollView.snp.bottom).offset(8)
            make.leading.equalTo(28)
        }
        
        starImage.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(24)
            make.centerY.equalTo(titleLabel)
        }
        
        starLabel.snp.makeConstraints { make in
            make.leading.equalTo(starImage.snp.trailing).offset(8)
            make.centerY.equalTo(titleLabel)
        }
    }
    
    func horizontalScrollWithImageView() {
        for (index, imageName) in images.enumerated() {
            let imageView = UIImageView()
            let positionX = self.view.frame.width * CGFloat(index)

            imageView.frame = CGRect(x: positionX, y: -190, width: self.view.bounds.width, height: self.view.bounds.height)
            imageView.image = UIImage(named: imageName)
            imageView.contentMode = .scaleAspectFit

            //scrollWithImageView를 contentView의 하위 계층 imageView로 설정.
            self.horizontalContentView.addSubview(imageView)
        }
    }
}
