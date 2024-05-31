//
//  IdentityView.swift
//  testSwiftUI
//
//  Created by teamdoc on 31/05/2024.
//

import Foundation
import SwiftUI

struct IdentityView: View {
    @State private var civility: String = "Mademoiselle"
    @State private var lastName: String = "Mazure"
    @State private var firstName: String = "Kevin"
    @State private var dayOfBirth: String = "23"
    @State private var monthOfBirth: String = "2"
    @State private var yearOfBirth: String = "2024"
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
                Spacer()
                Text("Mon identité")
                    .font(.headline)
                Spacer()
                Button(action: {
                    // Action pour enregistrer les changements
                }) {
                    Text("Enregistrer")
                        .foregroundColor(.black)
                }
            }
            .padding()

            VStack(alignment: .leading, spacing: 10) {
                Text("Civilité")
                    .font(.headline)
                TextField("Civilité", text: $civility)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Nom")
                            .font(.headline)
                        TextField("Nom", text: $lastName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack (alignment: .leading, spacing: 10){
                        Text("Prénom")
                            .font(.headline)
                        TextField("Prénom", text: $firstName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                
                Text("Date de naissance")
                    .font(.headline)
                
                HStack {
                    VStack (alignment: .leading, spacing: 10){
                        Text("Jour")
                        TextField("Jour", text: $dayOfBirth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Mois")
                        TextField("Mois", text: $monthOfBirth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Année")
                        TextField("Année", text: $yearOfBirth)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                    }
                }
            }
            .padding()
            Spacer()
        }
        
    }
}

/*struct IdentityView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityView()
    }
}*/
