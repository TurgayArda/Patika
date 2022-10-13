//
//  SearchDetailMusicBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailMusicBuilder {
    static func make(searchObject: SearchList) -> SearchDetailMusicVC {
        let view = SearchDetailMusicVC()
        let viewModel = SearchDetailMusicViewModel(view: view, searchObject: searchObject)
        view.searchDetailViewModel = viewModel
        return view
    }
}
