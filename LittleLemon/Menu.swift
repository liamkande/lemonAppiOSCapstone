//
//  Menu.swift
//  LittleLemon
//
//  Created by Sailesh Rajanala on 11/17/23.
//

import SwiftUI

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var searchText = ""
    
    var body: some View {

        VStack (spacing: 20) {
            
            Image("Logo")
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Little Lemon")
                    .bold()
                    .font(.title)
                    .padding(15)
                
                Text("Chicago")
                    .bold()
                    .font(.title3)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 0)
                
                Text("""
                    We are a family owned Mediterranean restaurant,
                    focused on traditional recipes served with a modern twist.
                    """)
                .font(.subheadline)
                .padding(15)
            }
            .background(Color(white: 0.9))
            .padding(0)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List(dishes) { dish in
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 10) {
        
                            Text(dish.title ?? "")
                                .font(.headline)
                            
                            Text("$" + (dish.price ?? ""))
                                .fontWeight(.bold)
                            
                        }
                        
                        Spacer()
                        
                        AsyncImage(url: URL(string: dish.image!)) { img in
                            img
                                .image?.resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .frame(width: 70, height: 70, alignment: .trailing)
                        }
                    }
                }
            }
        }
        .onAppear() {
            getMenuData()
        }
    }
    
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        let datatask = URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                if let decodedMenu = try? jsonDecoder.decode(MenuList.self, from: data) {
                    for item in decodedMenu.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.price = item.price
                        dish.image = item.image
                    }
                    
                    try? viewContext.save()
                }

            }
        }
        datatask.resume()
        
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title",
                          ascending: true,
                          selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
}

#Preview {
    Onboarding()
}
