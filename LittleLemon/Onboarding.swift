//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Sailesh Rajanala on 11/16/23.
//

import SwiftUI

let kFirstName = "kFirstName"
let kLastName = "kLastName"
let kEmail = "kEmail"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack (spacing: 25) {
                NavigationLink(destination: Home(), isActive: $isLoggedIn, label: {})

                Image("Logo")
                    .padding(20)
                                
                TextField("First Name", text: $firstName)
                    .padding(20)
                    .background(Color(white: 0.9))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
                    
                TextField("Last Name", text: $lastName)
                    .padding(20)
                    .background(Color(white: 0.9))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
                
                TextField("Email", text: $email)
                    .padding(20)
                    .background(Color(white: 0.9))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
                    .keyboardType(.emailAddress)
                
                Button("Register", action: {
                    if !(firstName.isEmpty || lastName.isEmpty || email.isEmpty) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        
                        isLoggedIn = true
                    }
                })
                .disabled((firstName.isEmpty || lastName.isEmpty || email.isEmpty))
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .background(Color(red: 0.7, green: 1, blue: 0.3))
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            }
            .padding(20)
            .onAppear() {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn))
                {
                    isLoggedIn = true
                }
            }
        }
        
    }
}

#Preview {
    Onboarding()
}
