//
//  SearchDetailPodcastViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailPodcastViewModel {
    var view: SearchDetailPodcastViewControllerProtocol?
    var searchObject: SearchList?
    init(view: SearchDetailPodcastViewControllerProtocol, searchObject: SearchList) {
        self.searchObject = searchObject
        self.view = view
    }
}

extension SearchDetailPodcastViewModel: SearchDetailPodcastViewModelProtocol {
    func loadDetail() {
        guard let searchObjectTwo = searchObject else { return }
        view?.handleOutPut(.selectSearchPodcastItem(searchObjectTwo))
        view?.handleOutPut(.title(searchObject?.trackName ?? ""))
    }
}

extension SearchDetailPodcastViewModel {
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
