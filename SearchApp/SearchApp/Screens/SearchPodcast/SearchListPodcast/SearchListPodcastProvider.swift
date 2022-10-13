//
//  SearchListPodcastProvider.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import UIKit

class  ProductListProvider: NSObject {
    var delegate:  SearchListPodcastProviderDelegate?
    var searchItem: [SearchList] = []
}

extension ProductListProvider: SearchListPodcastProviderProtocol {
    func loadProductList(item: [SearchList]) {
        self.searchItem = item
    }
}

extension ProductListProvider: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchListPodcastCollectionViewCell.Identifier.path.rawValue, for: indexPath) as? SearchListPodcastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.saveModel(item: searchItem[indexPath.row])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let colums: CGFloat = 2
        let with = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 30
        let width = (with - 30) / colums
        let height = width * 1.20
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let routerData = searchItem[indexPath.row]
        delegate?.selected(at: routerData)
        
    }
}
