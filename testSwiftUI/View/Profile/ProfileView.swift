//
//  ProfileView.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            Spacer(minLength: 15)
            HeaderView(title: "Mon Profil", forChatroom: false)
                .padding(.bottom, 20)
                

                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                Text("Kevin Mazure")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Voir mon profil public")
                    .foregroundColor(.gray)
                
                
            // Menu Section
            List {
                ProfileMenuItem(iconName: "person.circle", text: "Mon identité")
                ProfileMenuItem(iconName: "globe", text: "Langue(s)")
                ProfileMenuItem(iconName: "envelope", text: "Moyens de contact")
                ProfileMenuItem(iconName: "briefcase", text: "Identité Professionnelle")
                ProfileMenuItem(iconName: "key", text: "Changer de mot de passe")
                ProfileMenuItem(iconName: "questionmark.circle", text: "Aide")
                ProfileMenuItem(iconName: "power", text: "Déconnexion")
            }
            .listStyle(InsetGroupedListStyle())
            .padding(.horizontal,-20)
        }.padding(.horizontal,20)
    }
    
}

struct ProfileMenuItem: View {
    var iconName: String
    var text: String

    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.gray)
            Text(text)
                .foregroundColor(.primary)
                .padding(.horizontal,20)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

