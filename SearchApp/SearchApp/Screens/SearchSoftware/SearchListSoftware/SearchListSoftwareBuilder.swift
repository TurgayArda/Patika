//
//  SearchListSoftwareBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchListSoftwareBuilder {
    static func make() -> SearchListSoftwareVC {
        let view = SearchListSoftwareVC()
        let viewModel = SearchListSoftwareViewModel(service: SearchListService())
        view.searchListViewModel = viewModel
        return view
    }
}
