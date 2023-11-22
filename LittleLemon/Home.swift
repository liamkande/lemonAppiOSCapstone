//
//  Home.swift
//  LittleLemon
//
//  Created by Sailesh Rajanala on 11/17/23.
//

import SwiftUI

struct Home: View {    
    let persistentShared = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .tabItem { Label("Menu", systemImage: "list.dash") }
                .environment(\.managedObjectContext, persistentShared.container.viewContext)
            // Persistent Shared
            
            UserProfile()
                .tabItem { Label("UserProfile", systemImage: "square.and.pencil") }
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    Home()
}
