//
//  ListViewController.swift
//  STUCATO
//
//  Created by 오연서 on 12/4/23.
//

import UIKit
import SnapKit

class ListViewController: UIViewController {
    
    //검색
    lazy var searchController: UISearchController = {
        
        let searchController = UISearchController(searchResultsController: nil)
        let attributedPlaceholder = NSAttributedString(
                string: "스터디카페 이름/지역을 검색하세요",
                attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
            )
        
        // set placeholder
        searchController.searchBar.searchTextField.attributedPlaceholder = attributedPlaceholder
        searchController.hidesNavigationBarDuringPresentation = false // searchController가 검색하는 동안 네비게이션에 가려지지 않도록
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText") // searchBar cancel button text change (cancel을 취소로 텍스트 변경)
        
        // 검색 바 내부/테두리
        searchController.searchBar.barTintColor = .clear
        searchController.searchBar.backgroundColor = .white // Set background color
        searchController.searchBar.layer.borderWidth = 1
        searchController.searchBar.layer.cornerRadius = 25
        searchController.searchBar.layer.borderColor = UIColor.white.cgColor
        searchController.searchBar.searchBarStyle = .minimal
        
        searchController.searchBar.layer.shadowColor = UIColor.lightGray.cgColor
        searchController.searchBar.layer.shadowOpacity = 0.5
        searchController.searchBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        searchController.searchBar.layer.shadowRadius = 6
        
        if let searchField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            searchField.background = UIImage()
            searchField.backgroundColor = .lightText //뭔짓을 해도 회색에서 흰색으로 안 바뀜. .blue로 하면 파란색으로 바뀌는데ㅠ
            searchField.layer.masksToBounds = true
            searchField.layer.shadowOpacity = 0.0 // Remove shadow
        }
        
        let searchTextField = searchController.searchBar.searchTextField
        searchTextField.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass"))
        searchTextField.leftView?.tintColor = .black // Customize the icon color
        return searchController
    }()

   //거리순 버튼
    lazy var sortButton: UIButton = {
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
            button.tintColor = .black
            button.setTitle("거리순", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setTitleColor(.black, for: .normal)
            button.semanticContentAttribute = .forceLeftToRight
            button.contentHorizontalAlignment = .leading
            return button
    }()
    
    //선
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemGray6
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        return view
    }()
    
    //스터디카페 목록
    lazy var collectionview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            
        return view
        }()
    
    func collectionviewSet(){
            self.collectionview.dataSource = self
            self.collectionview.delegate = self
            self.collectionview.register(CollectionViewCell.self, forCellWithReuseIdentifier: "IDF")
            self.collectionview.backgroundColor = .white
    }
    
    func addView() {
        [searchController.searchBar, sortButton, separatorView, collectionview].forEach{view in self.view.addSubview(view)}
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.searchController = searchController
        addView()
        collectionviewSet()
        
        searchController.searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(40)
            make.width.equalToSuperview().inset(32)
            make.centerX.equalTo(self.view)
        }
        
        sortButton.snp.makeConstraints { make in
            make.top.equalTo(searchController.searchBar.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(sortButton.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(0)
            make.height.equalTo(1)
        }
        
        collectionview.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 20)
            make.center.equalToSuperview()
            make.top.equalToSuperview().offset(210)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    // cell 개수 지정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        50
    }
    
    // cell 등록 및 관련 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IDF", for: indexPath) as! CollectionViewCell
        cell.layer.cornerRadius =  10
        cell.backgroundColor = .white
        return cell
        
    }
    
    //cell 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionview.frame.width - 10
        let height: CGFloat = 390
        return CGSize(width: width, height: height)
        }
}
