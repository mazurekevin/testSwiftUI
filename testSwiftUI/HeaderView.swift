//
//  HeaderView.swift
//  testSwiftUI
//
//  Created by teamdoc on 29/05/2024.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    
    let title: String
    var forChatroom: Bool
        
    init(title: String, forChatroom: Bool) {
        self.title = title
        self.forChatroom = forChatroom
        
    }
    
    var body: some View {
        HStack(spacing: 10) {
            Text(self.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            if self.forChatroom == true{
                
                Button(action: {
                    // Action for Sujets
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.headline)
                }
                
            }else{
                Button(action: {
                    // Action for Sujets
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .font(.headline)
                }
                Button(action: {
                    // Action for Articles
                }) {
                    Image(systemName: "bell")
                        .foregroundColor(.black)
                        .font(.headline)
                }
                Button(action: {
                    // Action for Videos
                }) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.black)
                        .font(.headline)
                }
            }
            
            
        }
    }
}
