//
//  SearchListSoftwareViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

class SearchListSoftwareViewModel: SearchListSoftwareViewModelProtocol {
    var delegate: SearchListSoftwareViewModelDelegate?
    var service: SearchListServiceProtocol?
    var searchListMedia = "software"
    
    init(service: SearchListServiceProtocol) {
        self.service = service
    }
}

extension SearchListSoftwareViewModel {
    func loadSearchSoftware(term: String) {
        guard let url = URL(string: NetworkConstant.SearchListNetwork.searchListPath(term: term, media: searchListMedia)) else { return }
        service?.fetchAllData(url: url, onSuccess: { [delegate] search in
            delegate?.handleOutPut(.showSearchListSoftware(search))
        }, onError: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
