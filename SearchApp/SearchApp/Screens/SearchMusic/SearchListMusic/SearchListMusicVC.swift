//
//  SearchListMusicVC.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import UIKit

class SearchListMusicVC: UIViewController {
    
    //MARK: - Views
    
    private var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "search Music"
        search.searchBar.showsCancelButton = true
        return search
    }()
    
    private lazy var searchListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGray6
        collectionView.register(
            SearchListMusicCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchListMusicCollectionViewCell.Identifier.path.rawValue
        )
        return collectionView
    }()
    
    //MARK: - Properties
    
    private var searchItem: [SearchList] = []
    private var searchCollectionProvider = MusicListProvider()
    
    var searchListViewModel: SearchListMusicViewModelProtocol?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDelegate()
    }
    
    //MARK: - Private Func
    
    private func initDelegate() {
        navigationItem.searchController = searchBar
        searchBar.searchBar.delegate = self
        searchListViewModel?.delegate = self
        searchCollectionProvider.delegate = self
        searchListCollectionView.delegate = searchCollectionProvider
        searchListCollectionView.dataSource = searchCollectionProvider
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        view.addSubview(searchListCollectionView)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        makeCollection()
        
        configureNavitaionBar()
    }
    
    private func configureNavitaionBar() {
        let rightButton = UIBarButtonItem(title: "Favorite", style: .plain , target: self, action: #selector(favorite(_:)))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func favorite(_ navigationItem: UIBarButtonItem) {
        let favoriteViewController =  FavoriteListBuilder.make()
        self.present(favoriteViewController, animated: true)
    }
    
    private func refreshCollection() {
        DispatchQueue.main.async {
            self.searchListCollectionView.reloadData()
        }
    }
    
}

extension SearchListMusicVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        searchListViewModel?.loadSearchMusic(term: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchListViewModel?.loadSearchMusic(term: "")
    }
}

extension SearchListMusicVC: SearchListMusicViewModelDelegate {
    func handleOutPut(_ output: SearchListMusicViewModelOutPut) {
        switch output {
        case .showSearchListMusic(let searchData):
            self.searchItem = searchData
            searchCollectionProvider.loadMusicList(item: searchData)
            refreshCollection()
        case .showError(let error):
            print(error)
        }
    }
}

extension SearchListMusicVC: SearchListMusicProviderDelegate {
    func selected(at select: SearchList) {
        let viewController = SearchDetailMusicBuilder.make(searchObject: select)
        self.show(viewController, sender: nil)
    }
}

extension SearchListMusicVC {
    private func makeCollection() {
        NSLayoutConstraint.activate([
            searchListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchListCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            searchListCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            searchListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}
