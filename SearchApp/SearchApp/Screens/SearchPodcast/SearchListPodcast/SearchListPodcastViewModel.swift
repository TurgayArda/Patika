//
//  SearchListPodcast.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import Foundation

class SearchListPodcastViewModel: SearchListPodcastViewModelProtocol {
    var delegate: SearchListPodcastViewModelDelegate?
    var service: SearchListServiceProtocol?
    var searchListMedia = "podcast"
    
    init(service: SearchListServiceProtocol) {
        self.service = service
    }
}

extension SearchListPodcastViewModel {
    func loadSearchPodcast(term: String) {
        guard let url = URL(string: NetworkConstant.SearchListNetwork.searchListPath(term: term, media: searchListMedia)) else { return }
        service?.fetchAllData(url: url, onSuccess: { [delegate] search in
            delegate?.handleOutPut(.showSearchListPodcast(search))
        }, onError: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
