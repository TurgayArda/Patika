//
//  SearchListMovieBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchListMovieBuilder {
    static func make() -> SearchListMovieVC {
        let view = SearchListMovieVC()
        let viewModel = SearchListMovieViewModel(service: SearchListService())
        view.searchListViewModel = viewModel
        return view
    }
}
