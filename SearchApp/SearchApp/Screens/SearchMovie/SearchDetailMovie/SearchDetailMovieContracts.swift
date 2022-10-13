//
//  SearchDetailMovieContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchDetailMovieViewModelProtocol {
    var view: SearchDetailMovieViewControllerProtocol? { get }
    func loadDetail()
    func getName() -> String
    func getPrice() -> String
    func getDescription() -> String
}

enum SearchDetailMovieViewModelOutPut {
    case selectSearchMovieItem(SearchList)
    case title(String)
}

//MARK: ViewController

protocol SearchDetailMovieViewControllerProtocol {
    func handleOutPut(_ output: SearchDetailMovieViewModelOutPut)
}
