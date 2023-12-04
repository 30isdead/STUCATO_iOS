//
//  HomeViewController.swift
//  STUCATO
//
//  Created by Seyoung on 12/3/23.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    let verticalScrollView = UIScrollView()
    let verticalContentView = UIView()
    let locationView = UIView()
    let callView = UIView()
    let timeView = UIView()
    let globeView = UIView()
    let wifiView = UIView()
    
    lazy var locationImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "location")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var locationLabel: UILabel = {
        let view = UILabel()
        view.text = "서울 광진구 구의강변로 11 자양한양아파트(5~6동사이) 상가동 205호, 207호 \n강변역 4번 출구에서 743m"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var callImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "call")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var callLabel: UILabel = {
        let view = UILabel()
        view.text = "0507-1331-1924"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var timeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "time")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var timeLabel: UILabel = {
        let view = UILabel()
        view.text = "24시간 영업 연중무휴"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var globeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "globe")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var globeLabel: UILabel = {
        let view = UILabel()
        view.text = "https://blog.naver.com/sowol_gangbyeon"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    lazy var wifiImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "wifi")
        view.sizeToFit()
        
        return view
    }()
    
    lazy var wifiLabel: UILabel = {
        let view = UILabel()
        view.text = "주차, 무선 인터넷, 남녀 화장실 구분"
        view.font = UIFont(name: "NotoSansKR-Regular", size: 12)
        view.numberOfLines = 0
        view.textColor = UIColor(red: 0.43, green: 0.43, blue: 0.43, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        
        return view
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureHomeUI()
        


        // Do any additional setup after loading the view.
    }
}

extension HomeViewController {
    
    func configureHomeUI() {
        setHomeLayout()
    }
    
    func setHomeLayout() {

        view.addSubview(locationView)
        view.addSubview(callView)
        view.addSubview(timeView)
        view.addSubview(globeView)
        view.addSubview(wifiView)
    
        locationView.addSubview(locationImage)
        locationView.addSubview(locationLabel)
        
        callView.addSubview(callImage)
        callView.addSubview(callLabel)
        
        timeView.addSubview(timeImage)
        timeView.addSubview(timeLabel)
        
        globeView.addSubview(globeImage)
        globeView.addSubview(globeLabel)
        
        wifiView.addSubview(wifiImage)
        wifiView.addSubview(wifiLabel)
        
        //locationView Autolayout
        locationView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(36)
        }
        
        locationImage.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
        }
        
        locationLabel.snp.makeConstraints{ make in
            make.leading.equalTo(locationImage.snp.trailing).offset(16)
            make.width.equalTo(280)
        }
        
        //callView Autolayout
        callView.snp.makeConstraints{ make in
            make.top.equalTo(locationLabel.snp.bottom).offset(16)
            make.leading.equalTo(locationView)
        }
        
        callImage.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
        }
        
        callLabel.snp.makeConstraints{ make in
            make.leading.equalTo(callImage.snp.trailing).offset(16)
            make.width.equalTo(280)
        }
        
        //timeView Autolayout
        timeView.snp.makeConstraints{ make in
            make.top.equalTo(callLabel.snp.bottom).offset(16)
            make.leading.equalTo(callView)
        }
        
        timeImage.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints{ make in
            make.leading.equalTo(callImage.snp.trailing).offset(16)
            make.width.equalTo(280)
        }
        
        //globeView Autolayout
        globeView.snp.makeConstraints{ make in
            make.top.equalTo(timeLabel.snp.bottom).offset(16)
            make.leading.equalTo(callView)
        }
        
        globeImage.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
        }
        
        globeLabel.snp.makeConstraints{ make in
            make.leading.equalTo(callImage.snp.trailing).offset(16)
            make.width.equalTo(280)
        }
        
        //wifiView Autolayout
        wifiView.snp.makeConstraints{ make in
            make.top.equalTo(globeLabel.snp.bottom).offset(16)
            make.leading.equalTo(callView)
        }
        
        wifiImage.snp.makeConstraints{ make in
            make.top.leading.equalToSuperview()
        }
        
        wifiLabel.snp.makeConstraints{ make in
            make.leading.equalTo(callImage.snp.trailing).offset(16)
            make.width.equalTo(280)
        }


    }
}
