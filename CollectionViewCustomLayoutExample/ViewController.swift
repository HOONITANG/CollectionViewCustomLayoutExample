//
//  ViewController.swift
//  CollectionViewCustomLayoutExample
//
//  Created by Taehoon Kim on 2022/03/02.
//

import UIKit

private let reuseIdentifier = "CollectionViewCell"

class ViewController: UICollectionViewController {
    // MARK: Properties
    var photos = Photo.allPhotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
//        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//
//        let itemWidth = (view.frame.width)
//         flowLayout.itemSize = CGSize(width: itemWidth, height: 100)
//        collectionView.collectionViewLayout = flowLayout
        let layout = CustomLayout()
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        collectionView?.contentInset = UIEdgeInsets(top: 23, left: 16, bottom: 10, right: 16)
        
    }
}

// MARK: UICollectionViewDataSource
extension ViewController {
    
    /// cell 데이터가 몇 개인가
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    /// 각 Cell에 필요한 데이터를 설정한다.
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        let title = photos[indexPath.row].title
        let height = photos[indexPath.row].imageHeight
        cell.title = "\(title)\n\(height)" 
        return cell
    }
    
}

// MARK: CustomLayoutDelegate
extension ViewController: CustomLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        // return photos[indexPath.item].image.size.height
        return CGFloat(photos[indexPath.item].imageHeight)
    }
 
}
