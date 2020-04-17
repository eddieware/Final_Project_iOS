//
//  Model.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 17/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import Foundation
import SwiftUI

struct Todo: Codable, Identifiable {
    
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
  // 1.
    
  @Published var todos = [Todo]() //Encierras el modelo en una variable @Published properti wraper usada en classes para compartir el valor de la variable
     
    init() {
        let url = URL(string: "https://covid19gto.alexfranco.dev/api/books/")! //forzar valor
        
        // 2.
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                if let todoData = data {
                    // 3.
                    let decodedData = try JSONDecoder().decode([Todo].self, from: todoData)
                     //print(decodedData)
                    DispatchQueue.main.async {
                        self.todos = decodedData
                        print("Parse Succeded")
                        //Si hay un error en el parseo revisar URL y modelo particularmente el tipo de datos y la estructura del JSON
                    }
                } else {
                    print("No data")
                }
            } catch {
                print("Error in parse")
            }
        }.resume()
    }
}
