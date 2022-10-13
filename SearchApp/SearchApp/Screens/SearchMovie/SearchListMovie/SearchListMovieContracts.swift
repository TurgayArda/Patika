//
//  SearchListMovieContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchListMovieViewModelProtocol {
    var delegate: SearchListMovieViewModelDelegate? { get set }
    func loadSearchMovie(term: String)
}

enum SearchListMovieViewModelOutPut {
    case showSearchListMovie([SearchList])
    case showError(String)
}

protocol SearchListMovieViewModelDelegate {
    func handleOutPut(_ output: SearchListMovieViewModelOutPut)
}

//MARK: - Provider

protocol SearchListMovieProviderProtocol {
    var delegate: SearchListMovieProviderDelegate? { get set }
    func loadMovieList(item: [SearchList])
}

protocol SearchListMovieProviderDelegate {
    func selected(at select: SearchList)
}
