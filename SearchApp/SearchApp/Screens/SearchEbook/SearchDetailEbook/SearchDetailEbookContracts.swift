//
//  SearchDetailEbookContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchDetailEbookViewModelProtocol {
    var view: SearchDetailEbookViewControllerProtocol? { get }
    func loadDetail()
    func getName() -> String
    func getPrice() -> String
    func getDescription() -> String
}

enum SearchDetailEbookViewModelOutPut {
    case selectSearchEbookItem(SearchList)
    case title(String)
}

//MARK: ViewController

protocol SearchDetailEbookViewControllerProtocol {
    func handleOutPut(_ output: SearchDetailEbookViewModelOutPut)
}
