//
//  SearchDetailEbookViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailEbookViewModel {
    var view: SearchDetailEbookViewControllerProtocol?
    var searchObject: SearchList?
    init(view: SearchDetailEbookViewControllerProtocol, searchObject: SearchList) {
        self.searchObject = searchObject
        self.view = view
    }
}

extension SearchDetailEbookViewModel: SearchDetailEbookViewModelProtocol {
    func loadDetail() {
        guard let searchObjectTwo = searchObject else { return }
        view?.handleOutPut(.selectSearchEbookItem(searchObjectTwo))
        view?.handleOutPut(.title(searchObject?.trackName ?? ""))
    }
}

extension SearchDetailEbookViewModel {
    func getName() -> String {
        guard let name = searchObject?.trackName else {
            return "unknown"
        }
        
        return "Name: " + name
    }
    
    func getPrice() -> String {
        guard let price = searchObject?.formattedPrice else {
            return "unknown"
        }
        
        return "Price: " + "\(price)"
    }
    
    func getDescription() -> String {
        guard let description = searchObject?.longDescription else {
            return searchObject?.shortDescription ?? searchObject?.resultDescription ??  "unknown"
        }
        
        return description
    }
}
