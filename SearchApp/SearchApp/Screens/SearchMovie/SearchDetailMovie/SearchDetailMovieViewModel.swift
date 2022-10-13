//
//  SearchDetailMovieViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailMovieViewModel {
    var view: SearchDetailMovieViewControllerProtocol?
    var searchObject: SearchList?
    init(view: SearchDetailMovieViewControllerProtocol, searchObject: SearchList) {
        self.searchObject = searchObject
        self.view = view
    }
}

extension SearchDetailMovieViewModel: SearchDetailMovieViewModelProtocol {
    func loadDetail() {
        guard let searchObjectTwo = searchObject else { return }
        view?.handleOutPut(.selectSearchMovieItem(searchObjectTwo))
        view?.handleOutPut(.title(searchObject?.trackName ?? ""))
    }
}

extension SearchDetailMovieViewModel {
    func getName() -> String {
        guard let name = searchObject?.trackName else {
            return "unknown"
        }
        
        return "Name: " + name
    }
    
    func getPrice() -> String {
        guard let price = searchObject?.trackPrice else {
            return "unknown"
        }
        
        return "Price: " + "\(price)"
    }
    
    func getDescription() -> String {
        guard let description = searchObject?.longDescription else {
            return searchObject?.shortDescription ?? "unknown"
        }
        
        return description
    }
}
