//
//  SearchListPodcastBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import Foundation

final class SearchListPodcastBuilder {
    static func make() -> SearchListPodcastVC {
        let view = SearchListPodcastVC()
        let viewModel = SearchListPodcastViewModel(service: SearchListService())
        view.searchListViewModel = viewModel
        return view
    }
}
