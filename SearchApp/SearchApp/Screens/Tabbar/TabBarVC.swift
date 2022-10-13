//
//  TabBarVC.swift
//  SearchApp
//
//  Created by Arda Sisli on 6.10.2022.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = .lightGray
        navigationItem.hidesBackButton = true
        
        
        let VC1 = UINavigationController(rootViewController: SearchListPodcastBuilder.make())
        let VC2 = UINavigationController(rootViewController: SearchListMovieBuilder.make())
        let VC3 = UINavigationController(rootViewController: SearchListMusicBuilder.make())
        let VC4 = UINavigationController(rootViewController: SearchListSoftwareBuilder.make())
        let VC5 = UINavigationController(rootViewController: SearchListEbookBuilder.make())
        
        self.setViewControllers([VC1, VC2, VC3, VC4, VC5], animated: true)
        guard let item = self.tabBar.items else { return }
        
        item[0].title = "Podcast"
        item[1].title = "Movie"
        item[2].title = "Music"
        item[3].title = "Software"
        item[4].title = "Ebook"
    }
}
