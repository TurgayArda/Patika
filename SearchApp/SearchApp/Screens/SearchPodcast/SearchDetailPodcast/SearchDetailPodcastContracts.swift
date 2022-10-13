//
//  SearchDetailPodcastContracts.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

//MARK: - ViewModel

protocol SearchDetailPodcastViewModelProtocol {
    var view: SearchDetailPodcastViewControllerProtocol? { get }
    func loadDetail()
    func getName() -> String
    func getPrice() -> String
    func getDescription() -> String
}

enum SearchDetailPodcastViewModelOutPut {
    case selectSearchPodcastItem(SearchList)
    case title(String)
}

//MARK: ViewController

protocol SearchDetailPodcastViewControllerProtocol {
    func handleOutPut(_ output: SearchDetailPodcastViewModelOutPut)
}
