//
//  InfoViewController.swift
//  STUCATO
//
//  Created by Seyoung on 12/2/23.
//

// 구현해야할거 : content 크기 따라 scroll 가능하게, reserve button disabled, bookmark button selected,
// homeviewController의 autolayout 할때 InfoViewController의 tabbar 위치 받아옥

import UIKit
import SnapKit

class InfoViewController: UIViewController, UIScrollViewDelegate{
    
    //MARK: - Properties
    let verticalScrollView = UIScrollView()
    let horizontalScrollView = UIScrollView()
    let verticalContentView = UIView()
    let horizontalContentView = UIView()
    let images = ["image1", "image1", "image1"]
    let containerView = UIView()
    
    //bottom View
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
        
        return view
    }()

    //bottomView - 북마크 버튼
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
    
    //bottomView - 북마크 숫자
    lazy var bookMarkLabel: UILabel = {
        let view = UILabel()
        view.text = "32"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    //bottomView - 예약하기 버튼
    lazy var reserveButton: UIButton = {
        let view = UIButton()
        view.setTitle("예약하기", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 16)
        view.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentHorizontalAlignment = .center
        
        return view
    }()
    
    //상단 백버튼
    lazy var backButton: UIButton = {
        let view = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: imageConfig)
        
        view.setImage(image, for: .normal)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //스터디 카페 이름 정의
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
    
    //별점 이미지
    lazy var starImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "star")
        view.sizeToFit()
        
        return view
    }()
    
    //별점 숫자
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

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        goToChildView()
        configureUI()
        horizontalScrollWithImageView()
    }
}

//MARK: - InfoView Setting
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
        view.addSubview(bottomView)
        
        bottomView.addSubview(bookMarkButton)
        bottomView.addSubview(reserveButton)
        bottomView.addSubview(bookMarkLabel)
        
        verticalScrollView.addSubview(verticalContentView)
        verticalContentView.addSubview(horizontalScrollView)
        verticalContentView.addSubview(titleLabel)
        verticalContentView.addSubview(starImage)
        verticalContentView.addSubview(starLabel)
        verticalContentView.addSubview(backButton)
        verticalContentView.addSubview(containerView)
        
        horizontalScrollView.addSubview(horizontalContentView)
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
        
        bookMarkButton.snp.makeConstraints{ make in
            make.leading.equalTo(bottomView.snp.leading).offset(24)
            make.top.equalTo(bottomView.snp.top).offset(16)
        }
        
        bookMarkLabel.snp.makeConstraints{ make in
            make.centerX.equalTo(bookMarkButton.snp.centerX)
            make.top.equalTo(bookMarkButton.snp.bottom).offset(2)
            }
        
        reserveButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(60)  // 수정된 부분
            make.trailing.equalToSuperview().offset(-15)  // 수정된 부분
            make.top.equalToSuperview().offset(12)  // 수정된 부분
            make.height.equalTo(48)
        }
        
        verticalScrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        let height = UIScreen.main.bounds.height
        
        verticalContentView.snp.makeConstraints { make in
            make.edges.equalTo(verticalScrollView.contentLayoutGuide)
            make.width.equalTo(verticalScrollView.frameLayoutGuide)
            make.height.equalTo(height * 2)
        }
        
        let guide = self.view.safeAreaLayoutGuide
        
        horizontalScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(-112)
            make.height.equalTo(guide).multipliedBy(0.5)
        }
        
        let width = UIScreen.main.bounds.width
        
        horizontalContentView.snp.makeConstraints { make in
            make.edges.equalTo(horizontalScrollView.contentLayoutGuide)
            make.height.equalTo(horizontalScrollView.frameLayoutGuide)
            make.width.equalTo(width * CGFloat(images.count))
        }
        
        backButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(20)
        }
    
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalContentView.snp.bottom).offset(28)
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
        
        containerView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalTo(view)
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

//MARK: - addChild
extension InfoViewController {
    
    func goToChildView() {
        // .init()은 코드로 직접 초기화하는 커스텀 함수
        let childVC = TabViewController()
        // frame 설정
        childVC.view.frame = self.view.bounds
        
        self.addChild(childVC)
        // 단순한 addSubView는 부모-자식 관계 성립 안함
        self.containerView.addSubview(childVC.view)
        // code 로 작업하면 didMove 직접 호출해 줘야, childVC 에 있을 didMove override 함수가 동작할 수 있음
        childVC.didMove(toParent: self)
    }
    
}
