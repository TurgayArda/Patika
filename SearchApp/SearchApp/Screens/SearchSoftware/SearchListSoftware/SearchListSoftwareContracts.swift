//
//  SearchListSoftwareContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchListSoftwareViewModelProtocol {
    var delegate: SearchListSoftwareViewModelDelegate? { get set }
    func loadSearchSoftware(term: String)
}

enum SearchListSoftwareViewModelOutPut {
    case showSearchListSoftware([SearchList])
    case showError(String)
}

protocol SearchListSoftwareViewModelDelegate {
    func handleOutPut(_ output: SearchListSoftwareViewModelOutPut)
}

//MARK: - Provider

protocol SearchListSoftwareProviderProtocol {
    var delegate: SearchListSoftwareProviderDelegate? { get set }
    func loadSoftwareList(item: [SearchList])
}

protocol SearchListSoftwareProviderDelegate {
    func selected(at select: SearchList)
}
