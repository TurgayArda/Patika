//
//  SearchListMusicContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchListMusicViewModelProtocol {
    var delegate: SearchListMusicViewModelDelegate? { get set }
    func loadSearchMusic(term: String)
}

enum SearchListMusicViewModelOutPut {
    case showSearchListMusic([SearchList])
    case showError(String)
}

protocol SearchListMusicViewModelDelegate {
    func handleOutPut(_ output: SearchListMusicViewModelOutPut)
}

//MARK: - Provider

protocol SearchListMusicProviderProtocol {
    var delegate: SearchListMusicProviderDelegate? { get set }
    func loadMusicList(item: [SearchList])
}

protocol SearchListMusicProviderDelegate {
    func selected(at select: SearchList)
}
