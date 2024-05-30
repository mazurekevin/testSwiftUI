//
//  FavoriteListView.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import SwiftUI

struct FavoriteListView: View {
    @State private var selectedSegment = 0
    private let segments = ["Articles", "Vidéos", "Discussions", "Auteurs"]
        
    var body: some View {
        VStack(spacing: 25.0) {
            
            HeaderView(title: "Mes favoris", forChatroom: false)
                .padding(.horizontal)
                
                // Segmented Picker
            Picker("Choisir une catégorie", selection: $selectedSegment) {
                    ForEach(0..<segments.count) { index in
                        Text(self.segments[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
                
                // Contenu en fonction du segment sélectionné
            switch selectedSegment {
            case 0:
                    // Afficher les articles
                Text("Articles View")
            case 1:
                    // Afficher les vidéos
                Text("Vidéos View")
            case 2:
                    // Afficher les discussions
                Text("Discussions View")
            case 3:
                    // Afficher les auteurs
                Text("Auteurs View")
            default:
                Text("Sélection non valide")
            }
            Spacer()
        }
        .padding(.top, 20.0)
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
    }
}
