//
//  SearchListEbookVC.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import UIKit

class SearchListEbookVC: UIViewController {
    
    //MARK: - Views
    
    private var searchBar: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Search Ebook"
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
            SearchListEbookCollectionViewCell.self,
            forCellWithReuseIdentifier: SearchListEbookCollectionViewCell.Identifier.path.rawValue
        )
        return collectionView
    }()
    
    //MARK: - Properties
    
    private var searchItem: [SearchList] = []
    private var searchCollectionProvider = EbookListProvider()
    
    var searchListViewModel: SearchListEbookViewModelProtocol?
    
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

extension SearchListEbookVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        searchListViewModel?.loadSearchEbook(term: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchListViewModel?.loadSearchEbook(term: "")
    }
}

extension SearchListEbookVC: SearchListEbookViewModelDelegate {
    func handleOutPut(_ output: SearchListEbookViewModelOutPut) {
        switch output {
        case .showSearchListEbook(let searchData):
            self.searchItem = searchData
            searchCollectionProvider.loadEbookList(item: searchData)
            refreshCollection()
        case .showError(let error):
            print(error)
        }
    }
}

extension SearchListEbookVC: SearchListEbookProviderDelegate {
    func selected(at select: SearchList) {
        let viewController = SearchDetailEbookBuilder.make(searchObject: select)
        self.show(viewController, sender: nil)
    }
}

extension SearchListEbookVC {
    private func makeCollection() {
        NSLayoutConstraint.activate([
            searchListCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            searchListCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            searchListCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            searchListCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
}

