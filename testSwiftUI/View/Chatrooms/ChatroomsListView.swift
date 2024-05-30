//
//  ChatroomsListView.swift
//  testSwiftUI
//
//  Created by teamdoc on 30/05/2024.
//

import Foundation
import SwiftUI
struct ChatroomsListView: View {
    // Exemple de données pour les chatrooms
    let chatrooms = [
        Chatroom(avatar: "avatar1", title: "Discussion 1", lastMessage: "Dernier message 1", lastMessageDate: "12:00"),
        Chatroom(avatar: "avatar2", title: "Discussion 2", lastMessage: "Dernier message 2", lastMessageDate: "12:30"),
        Chatroom(avatar: "avatar3", title: "Discussion 3", lastMessage: "Dernier message 3", lastMessageDate: "13:00")
    ]
    
    var body: some View {
        VStack {
            Spacer(minLength: 15)
            HeaderView(title: "Mes discussions", forChatroom: true)
            // Liste des chatrooms
            List(chatrooms) { chatroom in
                ChatroomRowView(chatroom: chatroom)
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct ChatroomsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatroomsListView()
    }
}



