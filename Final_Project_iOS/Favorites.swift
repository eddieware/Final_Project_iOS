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
  //  private var fetchedobj = FetchToDo()
    @State private var listFavorites = [Book]()
  
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: FavoritesTable.entity(),
        sortDescriptors: [NSSortDescriptor(key: "id", ascending: true)]
    
    ) var booksDB : FetchedResults<FavoritesTable>

var body: some View {
    NavigationView{
        List(listFavorites){Book in
    
            VStack{
                ImageView(withURL: Book.image,width: 375, height: 200, type: 1)
                Text(Book.title)
                Text(Book.authors)
                Text(Book.description)
                Text(Book.year.description)
            }
            
            
        }.onAppear(perform:loadFavorites)

        .navigationBarTitle("Favorite Books")
        }
    }
    
    func loadFavorites(){
        for booksData in self.booksDB{
            let objBook = Book(id: Int(booksData.id), title: booksData.title ?? "", authors: booksData.authors ?? "", description: booksData.description, image: booksData.image ?? "", year: Int(booksData.year))
            
            self.listFavorites.append(objBook)
        
        }
        
    }
    
}
