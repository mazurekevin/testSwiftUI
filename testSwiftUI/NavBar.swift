//
//  NavBar.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import SwiftUI
struct NavBar: View{
    var body: some View{
        TabView{
            ArticleListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Accueil")
                }
            ChatroomsListView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Discussions")
                }
            FavoriteListView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Favoris")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profil")
                }
        }
    }
}


struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
