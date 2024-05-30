//
//  Chatroom.swift
//  testSwiftUI
//
//  Created by teamdoc on 30/05/2024.
//

import Foundation
import SwiftUI

struct Chatroom: Identifiable {
    let id = UUID()
    let avatar: String // Nom de l'image de l'avatar
    let title: String
    let lastMessage: String
    let lastMessageDate: String
}
