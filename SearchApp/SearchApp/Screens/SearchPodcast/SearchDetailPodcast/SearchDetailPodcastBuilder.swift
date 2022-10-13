//
//  SearchDetailPodcastBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailPodcastBuilder {
    static func make(searchObject: SearchList) -> SearchDetailPodcastVC {
        let view = SearchDetailPodcastVC()
        let viewModel = SearchDetailPodcastViewModel(view: view, searchObject: searchObject)
        view.searchDetailViewModel = viewModel
        return view
    }
}
