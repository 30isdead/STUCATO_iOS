//
//  InfoViewController.swift
//  STUCATO
//
//  Created by Seyoung on 12/2/23.
//

import UIKit
import SnapKit
import Pageboy
import Tabman

class InfoViewController: TabmanViewController {
    
    private var viewControllers: [UIViewController] = []
    
    public let bar = TMBar.ButtonBar()
    
    let tabView = UIView()
    let firstVC = HomeViewController()
    let secondVC = ReserveViewController()
    let thirdVC = ReviewViewController()
    
    let verticalScrollView = UIScrollView()
    let horizontalScrollView = UIScrollView()
    
    let verticalContentView = UIView()
    let horizontalContentView = UIView()
    let images = ["image1", "image1", "image1"]
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1).cgColor
        
        return view
    }()

    
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
    
    
   
    lazy var backButton: UIButton = {
        let view = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let image = UIImage(systemName: "chevron.backward", withConfiguration: imageConfig)
        
        view.setImage(image, for: .normal)
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
        setTabMan()
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
    
    func setTabMan() {
        viewControllers.append(firstVC)
        viewControllers.append(secondVC)
        viewControllers.append(thirdVC)
        
        self.dataSource = self
        self.isScrollEnabled = false
                
        //탭바 레이아웃 설정
        bar.layout.transitionStyle = .none
        //        .fit : indicator가 버튼크기로 설정됨
        bar.layout.interButtonSpacing = view.bounds.width / 8
        bar.layout.contentMode = .fit
        bar.layout.interButtonSpacing = 20 // 버튼 사이 간격 (화면 보면서 필요시 조절)

                
        //배경색
        bar.backgroundView.style = .clear
        bar.backgroundColor = .white
                
        //간격설정
        bar.layout.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 10)
                
        //버튼 글씨 커스텀
        bar.buttons.customize{
            (button)
            in
            button.tintColor = .gray
            button.selectedTintColor = .black
            button.font = UIFont(name: "NotoSansKR-Regular", size: 14)!
        }
        //indicator
        bar.indicator.weight = .custom(value: 1)
        bar.indicator.overscrollBehavior = .bounce
        bar.indicator.tintColor = .black
        
        addBar(bar, dataSource: self, at:.top)
        
        
        tabView.addSubview(bar)
        
        bar.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
            make.width.equalToSuperview()
        }

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
        verticalContentView.addSubview(tabView)
        verticalContentView.addSubview(backButton)
        
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
        
        horizontalScrollView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(-60)
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
        let height = UIScreen.main.bounds.height
        
        verticalContentView.snp.makeConstraints { make in
            make.edges.equalTo(verticalScrollView.contentLayoutGuide)
            make.width.equalTo(verticalScrollView.frameLayoutGuide)
            make.height.equalTo(height)
        }
        
        let width = UIScreen.main.bounds.width
        
        horizontalContentView.snp.makeConstraints { make in
            make.edges.equalTo(horizontalScrollView.contentLayoutGuide)
            make.height.equalTo(horizontalScrollView)
            make.width.equalTo(width * CGFloat(images.count))
        }
        
        backButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(52)
            make.leading.equalToSuperview().offset(20)
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
        
        tabView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(horizontalScrollView.snp.width)
            
            
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

//MARK: - TabManSetting
extension InfoViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "홈")
        case 1:
            return TMBarItem(title: "예약")
        case 2:
            return TMBarItem(title: "리뷰")
        default:
            let title = "Page \(index)"
           return TMBarItem(title: title)
        }
    }

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
