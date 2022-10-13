//
//  FavoriteListContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol FavoriteListViewModelProtocol {
    var delegate: FavoriteListViewModelDelegate? { get set }
    func loadFavorite()
}

enum FavoriteListViewModelOutPut {
    case showFavoriteList([Favorites])
    case showError(String)
}

protocol FavoriteListViewModelDelegate {
    func handleOutPut(_ output: FavoriteListViewModelOutPut)
}

//MARK: - Provider

protocol FavoriteListProviderProtocol {
    var delegate: FavoriteListProviderDelegate? { get set }
    func loadFavoriteList(item: [Favorites])
}

protocol FavoriteListProviderDelegate {
    func selected(at select: Favorites)
}
