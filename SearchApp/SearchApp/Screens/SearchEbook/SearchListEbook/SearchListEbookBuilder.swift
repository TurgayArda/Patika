//
//  SearchListEbookBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchListEbookBuilder {
    static func make() -> SearchListEbookVC {
        let view = SearchListEbookVC()
        let viewModel = SearchListEbookViewModel(service: SearchListService())
        view.searchListViewModel = viewModel
        return view
    }
}
