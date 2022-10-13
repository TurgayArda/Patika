//
//  FavoriteListBuilder.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import Foundation

final class  FavoriteListBuilder {
    static func make() ->  FavoriteListVC {
        let view = FavoriteListVC()
        let viewModel = FavoriteListViewModel()
        view.favoriteListViewModel = viewModel
        return view
    }
}
