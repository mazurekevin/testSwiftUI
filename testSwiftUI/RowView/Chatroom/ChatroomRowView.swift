//
//  ChatroomRowView.swift
//  testSwiftUI
//
//  Created by teamdoc on 30/05/2024.
//

import Foundation
import SwiftUI
struct ChatroomRowView: View {
    var chatroom: Chatroom
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(chatroom.title)
                    .font(.headline)
                Text(chatroom.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            VStack{
                Spacer()
                Text(chatroom.lastMessageDate)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            
        }
        .padding(.vertical, 8)
    }
}
