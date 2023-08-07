//
//  TimelineViewController.swift
//  OneLineDiary
//
//  Created by 권현석 on 2023/08/02.
//

import UIKit
/*
 1. 프로토콜(ex.부하직원): UICollectionViewDelegate, UICollectionViewDataSource
 2. 컬렉션뷰와 부하직원을 연결 : delegate = self (타입으로써 프로토콜 사용)
 3. 컬렉션뷰 아울렛
 
 */

class TimelineViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet var todayCollectionView: UICollectionView!
    
    @IBOutlet var bestCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todayCollectionView.delegate = self
        todayCollectionView.dataSource = self
        
        bestCollectionView.delegate = self
        bestCollectionView.dataSource = self
        
        let nib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        todayCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        bestCollectionView.register(nib, forCellWithReuseIdentifier: "SearchCollectionViewCell")

        configureCollectionViewLayout()
        configureBestCollectionViewLayout()
    }
    
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 180)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        todayCollectionView.collectionViewLayout = layout
        bestCollectionView.collectionViewLayout = layout
    }
    
    func configureBestCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 180)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        todayCollectionView.collectionViewLayout = layout
        bestCollectionView.collectionViewLayout = layout
        bestCollectionView.isPagingEnabled = true
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return collectionView == todayCollectionView ? 3 : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as! SearchCollectionViewCell
        
        if collectionView == todayCollectionView {
            cell.searchLabel.text = "Today: \(indexPath.item)"
            cell.backgroundColor = .yellow
        } else {
            cell.searchLabel.text = "Best: \(indexPath.item)"
            cell.backgroundColor = [.gray, .yellow, .red ].randomElement()
        }
        return cell
    }
}
