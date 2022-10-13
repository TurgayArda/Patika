//
//  SearchDetailEbookBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailEbookBuilder {
    static func make(searchObject: SearchList) -> SearchDetailEbookVC {
        let view = SearchDetailEbookVC()
        let viewModel = SearchDetailEbookViewModel(view: view, searchObject: searchObject)
        view.searchDetailViewModel = viewModel
        return view
    }
}
