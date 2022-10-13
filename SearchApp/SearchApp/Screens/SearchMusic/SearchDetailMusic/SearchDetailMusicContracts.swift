//
//  SearchDetailMusicContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchDetailMusicViewModelProtocol {
    var view: SearchDetailMusicViewControllerProtocol? { get }
    func loadDetail()
    func getName() -> String
    func getPrice() -> String
    func getDescription() -> String
}

enum SearchDetailMusicViewModelOutPut {
    case selectSearchMusicItem(SearchList)
    case title(String)
}

//MARK: ViewController

protocol SearchDetailMusicViewControllerProtocol {
    func handleOutPut(_ output: SearchDetailMusicViewModelOutPut)
}
