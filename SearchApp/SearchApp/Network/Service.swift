//
//  Service.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import Foundation

protocol SearchListServiceProtocol {
    func fetchAllData(url: URL,
                      onSuccess: @escaping ([SearchList]) -> Void,
                      onError: @escaping (String) -> Void
    )
}

class SearchListService: SearchListServiceProtocol {
    func fetchAllData(url: URL,
                      onSuccess: @escaping ([SearchList]) -> Void,
                      onError: @escaping (String) -> Void
    ) {
        
        URLSession.shared.dataTask(with: url) { (data,respone,error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                let searchData = try JSONDecoder().decode(SearchListResult.self, from: data!)
                guard let searchDataTwo = searchData.results else { return }
                onSuccess(searchDataTwo)
            } catch {
                onError(error.localizedDescription)
            }
        }.resume()
    }
}
