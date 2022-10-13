//
//  FavoriteListViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

class FavoriteListViewModel: FavoriteListViewModelProtocol {
    var delegate: FavoriteListViewModelDelegate?
    private var favoriteList: [Favorites] = []
    private let context = appDelegate.persistentContainer.viewContext
    
}

extension FavoriteListViewModel {
    func loadFavorite() {
        do {
            favoriteList = try context.fetch(Favorites.fetchRequest())
            delegate?.handleOutPut(.showFavoriteList(favoriteList))
        } catch {
            delegate?.handleOutPut(.showError(error.localizedDescription))
        }
    }
}
