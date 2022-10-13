//
//  NetworkConstant.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import Foundation

final class NetworkConstant {
    enum SearchListNetwork: String {
        case base_url = "https://itunes.apple.com/search?"
        case term_url = "term="
        case media_url = "&media="
        
        static func searchListPath(term: String, media: String) -> String {
            return "\(base_url.rawValue)\(term_url.rawValue)\(term)\(media_url.rawValue)\(media)"
        }
    }
}
