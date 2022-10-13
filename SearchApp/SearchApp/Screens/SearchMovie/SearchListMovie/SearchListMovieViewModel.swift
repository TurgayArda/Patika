//
//  SearchListMovieViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

class SearchListMovieViewModel: SearchListMovieViewModelProtocol {
    var delegate: SearchListMovieViewModelDelegate?
    var service: SearchListServiceProtocol?
    var searchListMedia = "movie"
    
    init(service: SearchListServiceProtocol) {
        self.service = service
    }
}

extension SearchListMovieViewModel {
    func loadSearchMovie(term: String) {
        guard let url = URL(string: NetworkConstant.SearchListNetwork.searchListPath(term: term, media: searchListMedia)) else { return }
        service?.fetchAllData(url: url, onSuccess: { [delegate] search in
            delegate?.handleOutPut(.showSearchListMovie(search))
        }, onError: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
