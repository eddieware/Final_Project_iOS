//
//  Favorites.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 18/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import Foundation
import SwiftUI

struct Favorites: View {
    private var fetchedobj = FetchToDo()
//@State private var listFavorites = [Results]()
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: FavoritesTable.entity(),
        sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]
    
    ) var booksDB : FetchedResults<FavoritesTable>

var body: some View {
    NavigationView{
        List(fetchedobj.todos){_ in
    
            Text("Something Favorite Here")
            
            
        }
            
        .navigationBarTitle("Favorite Books")
        }
    }
}
