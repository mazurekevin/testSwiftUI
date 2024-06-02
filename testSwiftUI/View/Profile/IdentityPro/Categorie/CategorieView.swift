//
//  CategorieView.swift
//  testSwiftUI
//
//  Created by teamdoc on 02/06/2024.
//

import Foundation
import SwiftUI

struct CategorieView: View {
    var title: String
    var items: [String]
    @Binding var selectedItem: String
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            Text("Sélectionnez \(title)")
                .font(.headline)
                .padding()
            
            List {
                ForEach(items, id: \.self) { item in
                    Button(action: {
                        selectedItem = item
                        isPresented = false
                    }) {
                        Text(item)
                    }
                }
            }
        }
    }
}
