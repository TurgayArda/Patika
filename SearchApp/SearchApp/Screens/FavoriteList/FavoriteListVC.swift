//
//  FavoriteListVC.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import UIKit

class FavoriteListVC: UIViewController {

    //MARK: - Views
    
    private lazy var favoriteListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray6
        collectionView.register(
            FavoriteListCollectionViewCell.self,
            forCellWithReuseIdentifier: FavoriteListCollectionViewCell.Identifier.path.rawValue
        )
        return collectionView
    }()
    
    //MARK: - Properties
    
   
    private var searchItem: [Favorites] = []
    private var favoriteCollectionProvider = FavoriteListProvider()
  
    
    var favoriteListViewModel: FavoriteListViewModelProtocol?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initDelegate()
        favoriteListViewModel?.loadFavorite()
    }
    
    //MARK: - Private Func
    
    private func initDelegate() {
        favoriteListViewModel?.delegate = self
        favoriteCollectionProvider.delegate = self
        favoriteListCollectionView.delegate = favoriteCollectionProvider
        favoriteListCollectionView.dataSource = favoriteCollectionProvider

        configure()
    }

    private func configure() {
        view.backgroundColor = .white
        view.addSubview(favoriteListCollectionView)

        configureConstraints()
    }

    private func configureConstraints() {
        makeCollection()
    }
    
    private func refreshCollection() {
        DispatchQueue.main.async {
            self.favoriteListCollectionView.reloadData()
        }
    }
}

extension FavoriteListVC: FavoriteListViewModelDelegate {
    func handleOutPut(_ output: FavoriteListViewModelOutPut) {
        switch output {
        case .showFavoriteList(let favoriteData):
            self.searchItem = favoriteData
            favoriteCollectionProvider.loadFavoriteList(item: favoriteData)
            refreshCollection()
        case .showError(let error):
            print(error)
        }
    }
}

extension FavoriteListVC: FavoriteListProviderDelegate {
    func selected(at select: Favorites) {
        print(select)
    }
}

extension FavoriteListVC {
    private func makeCollection() {
        NSLayoutConstraint.activate([
            favoriteListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            favoriteListCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            favoriteListCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            favoriteListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
                    ])
    }
}

