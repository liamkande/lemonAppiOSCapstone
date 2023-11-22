//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Sailesh Rajanala on 11/17/23.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
        let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
        let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
        
        VStack (spacing: 25) {
            
            Image("Logo")
            
            Text("Personal Information")
                .padding(20)
                .font(.title2)
                .fontWeight(.bold)
            
            Image("JhinProfile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 150, maxHeight: 150, alignment: .center)
                .clipShape(Circle())
            
            VStack {
                Text("First Name")
                    .fontWeight(.bold)
            
                Text(firstName)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color(white: 0.9))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
            }
            
            VStack {
                Text("Last Name")
                    .fontWeight(.bold)
                
                Text(lastName)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color(white: 0.9))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
            }
            
            VStack {
                Text("Email")
                    .fontWeight(.bold)
                
                Text(email)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color(white: 0.9))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 25, height: 25)))
            }
            
            Button("Logout") {
                UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .background(Color(red: 0.7, green: 1, blue: 0.3))
            .foregroundColor(.black)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
            
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
