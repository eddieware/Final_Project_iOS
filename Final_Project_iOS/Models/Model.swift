//
//  Model.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 17/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct PopularBooks: Codable {
    var bookResults : [Book]
}

struct Book: Codable, Identifiable {
    
    public var id: Int
    public var title: String
    public var authors: String
    public var description: String
    public var image: String
    public var year: Int
    
}


//CODEAABLE E IDENTIFIABLE IS A PROTOCOL

//The struct conforms to the Codable protocol to be able to decode the model from the JSON File and the struct conforms to the Identifiable protocol, which allows the items to be listed in a List.
class FetchToDo: ObservableObject {
 @Environment(\.managedObjectContext) var managedObjectContext
    
  @Published var todos = [Book]() //Encierras el modelo en una variable @Published properti wraper usada en classes para compartir el valor de la variable
     
    func loadTodo() {
        let url = URL(string: "https://covid19gto.alexfranco.dev/api/books/")! //forzar valor
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Book].self, from: todoData)
                    //print(decodedData) //contiene el arreglo de todo el json
                    DispatchQueue.main.async {
                        self.todos = decodedData
                        
                        /*
                       for booksData in decodedData{
                        let objBook = FavoritesTable(context: self.managedObjectContext)
                        objBook.id = Int32(booksData.id)
                        objBook.title = booksData.authors
                        objBook.descript = booksData.description
                        objBook.image = booksData.image
                        objBook.year = Int16(booksData.year)
                        
                        }
                        try? self.managedObjectContext.save()*/
 
                       
                        
                        print("GET Parse success")
                        // Si da error in parse revisar tipo de dato y estructura del Json
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error in GET parse")
            }
        }.resume()
    }
}



