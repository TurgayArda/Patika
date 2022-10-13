//
//  SearchListEbookViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation


class SearchListEbookViewModel: SearchListEbookViewModelProtocol {
    var delegate: SearchListEbookViewModelDelegate?
    var service: SearchListServiceProtocol?
    var searchListMedia = "ebook"
    
    init(service: SearchListServiceProtocol) {
        self.service = service
    }
}

extension SearchListEbookViewModel {
    func loadSearchEbook(term: String) {
        guard let url = URL(string: NetworkConstant.SearchListNetwork.searchListPath(term: term, media: searchListMedia)) else { return }
        service?.fetchAllData(url: url, onSuccess: { [delegate] search in
            delegate?.handleOutPut(.showSearchListEbook(search))
        }, onError: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
