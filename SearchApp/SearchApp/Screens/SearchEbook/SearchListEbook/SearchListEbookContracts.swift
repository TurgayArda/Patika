//
//  SearchListEbookContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchListEbookViewModelProtocol {
    var delegate: SearchListEbookViewModelDelegate? { get set }
    func loadSearchEbook(term: String)
}

enum SearchListEbookViewModelOutPut {
    case showSearchListEbook([SearchList])
    case showError(String)
}

protocol SearchListEbookViewModelDelegate {
    func handleOutPut(_ output: SearchListEbookViewModelOutPut)
}

//MARK: - Provider

protocol SearchListEbookProviderProtocol {
    var delegate: SearchListEbookProviderDelegate? { get set }
    func loadEbookList(item: [SearchList])
}

protocol SearchListEbookProviderDelegate {
    func selected(at select: SearchList)
}
