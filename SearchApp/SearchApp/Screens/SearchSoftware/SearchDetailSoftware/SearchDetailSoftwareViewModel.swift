//
//  SearchDetailSoftwareViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailSoftwareViewModel {
    var view: SearchDetailSoftwareViewControllerProtocol?
    var searchObject: SearchList?
    init(view: SearchDetailSoftwareViewControllerProtocol, searchObject: SearchList) {
        self.searchObject = searchObject
        self.view = view
    }
}

extension SearchDetailSoftwareViewModel: SearchDetailSoftwareViewModelProtocol {
    func loadDetail() {
        guard let searchObjectTwo = searchObject else { return }
        view?.handleOutPut(.selectSearchSoftwareItem(searchObjectTwo))
        view?.handleOutPut(.title(searchObject?.trackName ?? ""))
    }
}

extension SearchDetailSoftwareViewModel {
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
            return searchObject?.shortDescription ?? searchObject?.resultDescription ??  "unknown"
        }
        
        return description
    }
}
