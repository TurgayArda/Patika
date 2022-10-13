//
//  SearchDetailSoftwareContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchDetailSoftwareViewModelProtocol {
    var view: SearchDetailSoftwareViewControllerProtocol? { get }
    func loadDetail()
    func getName() -> String
    func getPrice() -> String
    func getDescription() -> String
}

enum SearchDetailSoftwareViewModelOutPut {
    case selectSearchSoftwareItem(SearchList)
    case title(String)
}

//MARK: ViewController

protocol SearchDetailSoftwareViewControllerProtocol {
    func handleOutPut(_ output: SearchDetailSoftwareViewModelOutPut)
}
