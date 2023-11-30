//
//  LoginViewController.swift
//  STUCATO
//
//  Created by Seyoung on 11/30/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // Stucato 로고
    lazy var logo: UILabel = {
        let view = UILabel()
        view.text = "STUCATO"
        view.font = UIFont(name: "Inter-Regular", size: 60)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.24, green: 0.39, blue: 0.13, alpha: 1.0)
        //constraints를 cumtom으로 설정
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        
        return view
    }()
    
    // Stucato 부제
    lazy var logoSmall: UILabel = {
        let view = UILabel()
        view.text = "STUDY CAFE TO YOU"
        view.font = UIFont(name: "Inter-Thin", size: 25)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        //constraints를 cumtom으로 설정
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        
        return view
    }()
    
    // 구글 로그인 버튼
    lazy var googleButton: UIButton = {
        let view = UIButton()
        view.setTitle("구글 계정으로 로그인하기", for: .normal)
        view.setTitleColor(UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0), for: .normal)
        view.titleLabel?.font = UIFont(name: "NotoSansKR-regular", size: 16)
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        view.layer.cornerRadius = 30
        if let googleIcon = UIImage(named: "logoGoogle") {
            view.setImage(googleIcon, for: .normal)
            //수정 필요!
            view.imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 10)
           }
        //constraints를 cumtom으로 설정
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(logo)
        self.view.addSubview(logoSmall)
        self.view.addSubview(googleButton)
        
        logo.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view).offset(226)
            make.centerX.equalTo(self.view)
        }
        
        logoSmall.snp.makeConstraints{ (make) in
            make.top.equalTo(logo.snp.bottom).offset(42)
            make.centerX.equalTo(self.view)
        }
        
        googleButton.snp.makeConstraints{ (make) in
            make.width.equalTo(345)
            make.height.equalTo(53)
            make.top.equalTo(logoSmall.snp.bottom).offset(216)
            make.centerX.equalTo(self.view)
        }
        
    }
    
}
