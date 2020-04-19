//
//  ContentView.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 17/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import SwiftUI
import AVKit


struct ContentView: View {
    let font1 = Font.system(size: 25).bold()
    
    @ObservedObject var fetch = FetchToDo()
    
    var body: some View {
       
        VStack {
            NavigationView{
                // 2.
                // fetch ObservedObject . todos @Published var todos
             
                
                
                List(fetch.todos) { todo in
                    VStack(alignment: .leading) {
                        ImageView(withURL: todo.image,width: 375, height: 200, type: 1)
                    
                       //Text(todo.id.description)
                        HStack{
                            
                            Text(todo.title).bold().font(.system(.title))
                            Spacer()
                            Button(action: {
                                
                            print("favorite  button pressed!!!!!!!!")
                                
                            }) {Image(systemName: "heart.fill").font(self.font1)}
                        }
                        
                        
                        //accedemos a la propiedad title del modelo
                        Text("Autor: "+todo.authors).font(.system(.headline))
                        Text("Reseña: "+todo.description)
                        //Image(todo.image)
                        Text(todo.year.description)
                        .font(.system(size: 22))
                            .foregroundColor(Color.gray) //description es usada como un to string porque es un INT
                        
                
                        
                        
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

//Posiblemente borrar


