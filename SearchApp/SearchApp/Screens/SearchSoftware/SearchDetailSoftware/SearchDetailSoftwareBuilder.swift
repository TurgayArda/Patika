//
//  SearchDetailSoftwareBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class SearchDetailSoftwareBuilder {
    static func make(searchObject: SearchList) -> SearchDetailSoftwareVC {
        let view = SearchDetailSoftwareVC()
        let viewModel = SearchDetailSoftwareViewModel(view: view, searchObject: searchObject)
        view.searchDetailViewModel = viewModel 
        return view
    }
}
