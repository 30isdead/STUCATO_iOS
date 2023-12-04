//
//  TabManViewController.swift
//  STUCATO
//
//  Created by Seyoung on 12/4/23.
//

import UIKit
import SnapKit
import Pageboy
import Tabman

class TabViewController: TabmanViewController {
    
    lazy var viewControllers: [UIViewController] = []
    let bar = TMBar.ButtonBar()
    let tabView = UIView()
    
    let firstVC = HomeViewController()
    let secondVC = ReserveViewController()
    let thirdVC = ReviewViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tabManConfigureUI()
    }
}

//MARK: - InfoView Setting
extension TabViewController {
    
    func tabManConfigureUI() {
        setLayout()
        setTabMan()
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
        
        let width = UIScreen.main.bounds.width
        
        bar.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
            make.width.equalTo(width)
            }
        
    }
    
    
    func setLayout() {
        
        view.addSubview(tabView)
        
        tabView.snp.makeConstraints{ make in
            make.edges.equalTo(view)
        }
    }
}

//MARK: - TabManSetting
extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
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
