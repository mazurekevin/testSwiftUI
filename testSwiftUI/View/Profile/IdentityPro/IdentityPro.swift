//
//  IdentityPro.swift
//  testSwiftUI
//
//  Created by teamdoc on 01/06/2024.
//

import Foundation

import SwiftUI

struct IdentityProView: View {
    @State private var profession: String = "Médecin"
    @State private var rpps: String = "1234567"
    @State private var speciality: String = "Radiologie"
    @State private var placeJob: String = "Hôpital"
    @State private var postalCode: String = "95320"
    @State private var city: String = "Paris"
    @State private var country: String = "France"
    @State private var showProfessionPicker: Bool = false
    @State private var showSpecialityPicker: Bool = false
    @State private var showPlaceJobPicker: Bool = false
    
    let professions = ["Chiropracteur", "Médecin", "Infirmier", "Pharmacien", "Dentiste"]
    let specialities = ["Radiologie", "Cardiologie", "Neurologie"]
    let placeJobs = ["Hôpital", "Clinique", "Urgence", "Pharmacie"]
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            headerView()
            
            VStack(alignment: .leading, spacing: 10) {
                pickerSection(title: "Profession", selectedItem: $profession, showPicker: $showProfessionPicker, items: professions)
                
                labeledTextField(label: "RPPS", text: $rpps)
                
                pickerSection(title: "Spécialité", selectedItem: $speciality, showPicker: $showSpecialityPicker, items: specialities)
                
                pickerSection(title: "Lieu d'exercice", selectedItem: $placeJob, showPicker: $showPlaceJobPicker, items: placeJobs)
                
                labeledTextField(label: "Code postal", text: $postalCode)
                
                labeledTextField(label: "Ville", text: $city)
                
                labeledTextField(label: "Pays", text: $country)
            }
            .padding()
            Spacer()
        }
    }
    
    private func headerView() -> some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
            Spacer()
            Text("Identité Professionnelle")
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
    }
    
    private func pickerSection(title: String, selectedItem: Binding<String>, showPicker: Binding<Bool>, items: [String]) -> some View {
        VStack(alignment: .leading) {
            Text("\(title): ")
                .font(.headline)
                .padding(.top, 5)
            
            HStack {
                Text(selectedItem.wrappedValue)
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(.horizontal, 5)
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
                    .padding(.horizontal, 5)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                showPicker.wrappedValue.toggle()
            }
            .padding(.vertical, 10)
            .background(Color.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .sheet(isPresented: showPicker) {
                CategorieView(title: title.lowercased(), items: items, selectedItem: selectedItem, isPresented: showPicker)
            }
        }
    }
    
    private func labeledTextField(label: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text("\(label): ")
                .font(.headline)
            TextField(label, text: text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
    }
}

struct IdentityProView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityProView()
    }
}
