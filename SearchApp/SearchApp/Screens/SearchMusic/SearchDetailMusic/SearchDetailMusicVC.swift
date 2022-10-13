//
//  SearchDetailMusicVC.swift
//  SearchApp
//
//  Created by Arda Sisli on 7.10.2022.
//

import UIKit

class SearchDetailMusicVC: UIViewController {
    
    //MARK: Views
    
    private  var searchImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private  var searchName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private  var searchPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    private  var searchDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to Favorites", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = .white
        button.layer.cornerRadius = 16
        return button
    }()
    
    private  var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    //MARK: - Properties
    private let context = appDelegate.persistentContainer.viewContext
    private var musicDetail: SearchList?
    
    var searchDetailViewModel: SearchDetailMusicViewModelProtocol?
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        searchDetailViewModel?.loadDetail()
        favoriteButtonClicked()
    }
    
    //MARK: - Private Func
    
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(searchImage)
        stackView.addArrangedSubview(searchName)
        stackView.addArrangedSubview(searchPrice)
        stackView.addArrangedSubview(searchDescription)
        stackView.addArrangedSubview(favoriteButton)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
        ])
        
        NSLayoutConstraint.activate([
            searchImage.heightAnchor.constraint(equalToConstant: view.frame.height/1.7),
            searchImage.widthAnchor.constraint(equalToConstant: view.frame.width),
        ])
        
        NSLayoutConstraint.activate([
            favoriteButton.heightAnchor.constraint(equalToConstant: view.frame.size.height / 15),
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func propertyUI(searchObject: SearchList) {
        searchName.text = searchDetailViewModel?.getName()
        searchPrice.text = searchDetailViewModel?.getPrice()
        searchDescription.text = searchDetailViewModel?.getDescription()
        setImage(value: searchObject.artworkUrl100 ?? "")
    }
    
    private func setImage(value: String) {
        if let url = URL(string: value) {
            DispatchQueue.global().async {
                let data  = try? Data(contentsOf: url)
                
                DispatchQueue.main.async {
                    guard let dataTwo = data else { return }
                    self.searchImage.image = UIImage(data: dataTwo)
                }
            }
        }
    }
    
    private func favoriteButtonClicked() {
        favoriteButton.addTarget(self, action: #selector(favorite(_:)), for: .touchUpInside)
    }
    
    @objc func favorite(_ favoriteButton: UIButton) {
        let favorite =  Favorites(context: context)
        
        favorite.image = musicDetail?.artworkUrl100
        favorite.name = musicDetail?.trackName
        favorite.price = musicDetail?.trackPrice ?? 0.0
        
        appDelegate.saveContext()
    }
}

extension SearchDetailMusicVC: SearchDetailMusicViewControllerProtocol {
    func handleOutPut(_ output: SearchDetailMusicViewModelOutPut) {
        switch output {
        case .selectSearchMusicItem(let musicDetailData):
            self.musicDetail = musicDetailData
            propertyUI(searchObject: musicDetailData)
        case .title(let title):
            self.title =  title
        }
    }
}

