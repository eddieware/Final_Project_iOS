//
//  ContentView.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 17/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var networking = NetworkManager()
    @ObservedObject var fetch = FetchToDo()
    
    var body: some View {
       
        VStack {
            NavigationView{
                // 2.
                // fetch ObservedObject . todos @Published var todos
                List(fetch.todos) { todo in
                    VStack(alignment: .leading) {
                        // 3.
                       Text(todo.id.description)
                        //Text(todo.userId.description)
                       Text(todo.title) //accedemos a la propiedad title del modelo
                       Text(todo.authors)
                        Text(todo.description)
                       //Image("apple")
                       Text(todo.year.description)
                            
                                
                        
                            .font(.system(size: 11))
                            .foregroundColor(Color.gray) //description es usada como un to string porque es un INT
                        
                        Text("Press the button")
                        
                           Button(action: {
                           print("pressed!!!!!!!!")
                           
                           }) {Text("Clickme")}
                        
                        
                    }
                }.navigationBarTitle("Books App")
            }
        }//Fin VStack
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
