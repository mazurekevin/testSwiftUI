//
//  ContentView.swift
//  testSwiftUI
//
//  Created by teamdoc on 11/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var test = true
    var body: some View {
        VStack {
            Image("mediscoopLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 200.0)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                
            Text("Je suis le test")
                .font(.title)
            Spacer()
            Button(test ? "test":"test2"){
                test.toggle()
            }.buttonStyle(.borderedProminent)
                .tint(Color.red)
                .foregroundColor(Color.white)
                .padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

