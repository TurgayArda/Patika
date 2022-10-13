//
//  SearchListMusicBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchListMusicBuilder {
    static func make() -> SearchListMusicVC {
        let view = SearchListMusicVC()
        let viewModel = SearchListMusicViewModel(service: SearchListService())
        view.searchListViewModel = viewModel
        return view
    }
}
