//
//  DataManager.swift
//  testSwiftUI
//
//  Created by teamdoc on 31/05/2024.
//

import Foundation

class DataManager: NSObject {

    static var instance = DataManager()

    /// Article
    var articles: [Article]
    var videos: [Article]
    
    /// favoris
    var favorisArticle: [Article]
    var favorisVideo: [Article]
    var favorisAuthors: [Author]
    
    /// filter
    //var filterArticle: [FilterArticle]
    
    
    
    override init() {
        articles    = []
        videos      = []
        favorisArticle = []
        favorisVideo = []
        favorisAuthors = []
        //filterArticle = []

        
        super.init()
    }

    func reset() {
        DataManager.instance = DataManager()
    }
    
    func resetArticle(){
        articles    = []
        videos      = []
    }

    /*func setAllIsFavoriteToFalse() {
        setAllIsFavoriteToFalse(in: filterArticle)
    }

    private func setAllIsFavoriteToFalse(in filterArticles: [FilterArticle]) {
        for var filterArticle in filterArticles {
            filterArticle.isFavorite = false
            if !filterArticle.subareas.isEmpty {
                setAllIsFavoriteToFalse(in: filterArticle.subareas)
            }
        }
    }
    
    func getFavorisAuthors(){
        let operation = AuthorOperations.custom(.getFavoriteAuthor(page: 1, itemsPerPage: 30, favoris: true))
        operation.performRequest { data in
            if let authorArray = data?.array {
                DataManager.instance.favorisAuthors = authorArray.map { Author(json: $0) }
            } else {
                print("Le JSON ne contient pas un tableau d'articles.")
            }
        } failure: { error in
            print(error)
        }
    }*/
    
}
