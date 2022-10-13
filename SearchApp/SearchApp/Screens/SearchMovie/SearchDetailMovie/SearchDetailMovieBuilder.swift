//
//  SearchDetailMovieBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailMovieBuilder {
    static func make(searchObject: SearchList) -> SearchDetailMovieVC {
        let view = SearchDetailMovieVC()
        let viewModel = SearchDetailMovieViewModel(view: view, searchObject: searchObject)
        view.searchDetailViewModel = viewModel
        return view
    }
}
