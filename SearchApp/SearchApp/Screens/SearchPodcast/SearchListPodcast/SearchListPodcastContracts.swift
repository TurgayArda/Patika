//
//  SearchListPodcastContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchListPodcastViewModelProtocol {
    var delegate: SearchListPodcastViewModelDelegate? { get set }
    func loadSearchPodcast(term: String)
}

enum SearchListPodcastViewModelOutPut {
    case showSearchListPodcast([SearchList])
    case showError(String)
}

protocol SearchListPodcastViewModelDelegate {
    func handleOutPut(_ output: SearchListPodcastViewModelOutPut)
}

//MARK: - Provider

protocol SearchListPodcastProviderProtocol {
    var delegate: SearchListPodcastProviderDelegate? { get set }
    func loadProductList(item: [SearchList])
}

protocol SearchListPodcastProviderDelegate {
    func selected(at select: SearchList)
}

