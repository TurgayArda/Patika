//
//  SearchListMusicViewModel.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

class SearchListMusicViewModel: SearchListMusicViewModelProtocol {
    var delegate: SearchListMusicViewModelDelegate?
    var service: SearchListServiceProtocol?
    var searchListMedia = "music"
    
    init(service: SearchListServiceProtocol) {
        self.service = service
    }
}

extension SearchListMusicViewModel {
    func loadSearchMusic(term: String) {
        guard let url = URL(string: NetworkConstant.SearchListNetwork.searchListPath(term: term, media: searchListMedia)) else { return }
        service?.fetchAllData(url: url, onSuccess: { [delegate] search in
            delegate?.handleOutPut(.showSearchListMusic(search))
        }, onError: { [delegate] error in
            delegate?.handleOutPut(.showError(error))
        })
    }
}
