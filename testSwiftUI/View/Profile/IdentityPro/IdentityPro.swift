//
//  IdentityPro.swift
//  testSwiftUI
//
//  Created by teamdoc on 01/06/2024.
//

import Foundation

import SwiftUI

struct IdentityProView: View {
    @State private var profession: String = "Medecin"
    @State private var rpps: String = "1234567"
    @State private var speciality: String = "radiologie"
    @State private var placeJob: String = "Hôpital"
    @State private var postalCode: String = "95320"
    @State private var city: String = "Paris"
    @State private var country: String = "France"
    @State private var showProfessionPicker: Bool = false
    @State private var showSpecialityPicker: Bool = false
    @State private var showPlaceJobPicker: Bool = false
        
    var professions = ["Chiropracteur", "Médecin", "Infirmier", "Pharmacien", "Dentiste"]
    var specalities = ["Radiologie", "Cardiologie", "Neurologie"]
    var placeJobs = ["Hopital", "Clinique", "Urgence", "Pharmacie"]
        
    
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

            VStack(alignment: .leading, spacing: 10) {
                
                VStack(alignment: .leading) {
                    Text("Profession: ")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    HStack {
                        Text(profession)
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
                        showProfessionPicker.toggle()
                    }
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .sheet(isPresented: $showProfessionPicker) {
                        VStack {
                            Text("Sélectionnez une profession")
                                .font(.headline)
                                .padding()
                            
                            List {
                                ForEach(professions, id: \.self) { profession in
                                    Button(action: {
                                        self.profession = profession
                                        showProfessionPicker = false
                                    }) {
                                        Text(profession)
                                    }
                                }
                            }
                        }
                    }
                }
                
                Text("RPPS: ")
                    .font(.headline)
                TextField("RPPS", text: $rpps)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                VStack(alignment: .leading) {
                    Text("Spécialité: ")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    HStack {
                        Text(speciality)
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
                        showSpecialityPicker.toggle()
                    }
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .sheet(isPresented: $showSpecialityPicker) {
                        VStack {
                            Text("Sélectionnez une spécialité")
                                .font(.headline)
                                .padding()
                            
                            List {
                                ForEach(specalities, id: \.self) { spe in
                                    Button(action: {
                                        self.speciality = spe
                                        showSpecialityPicker = false
                                    }) {
                                        Text(spe)
                                    }
                                }
                            }
                        }
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Lieu d'exercice: ")
                        .font(.headline)
                        .padding(.top, 5)
                    
                    HStack {
                        Text(placeJob)
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
                        showPlaceJobPicker.toggle()
                    }
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .sheet(isPresented: $showPlaceJobPicker) {
                        VStack {
                            Text("Sélectionnez un lieu")
                                .font(.headline)
                                .padding()
                            
                            List {
                                ForEach(placeJobs, id: \.self) { place in
                                    Button(action: {
                                        self.placeJob = place
                                        showPlaceJobPicker = false
                                    }) {
                                        Text(place)
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                Text("Code postal: ")
                    .font(.headline)
                TextField("postalCode", text: $postalCode)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Text("Ville: ")
                    .font(.headline)
                TextField("city", text: $city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                Text("Pays: ")
                    .font(.headline)
                TextField("Country", text: $country)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
            }
            .padding()
            Spacer()
        }
        
    }
}

struct IdentityProViewView_Previews: PreviewProvider {
    static var previews: some View {
        IdentityProView()
    }
}
