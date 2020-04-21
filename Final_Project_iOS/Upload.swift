//
//  Upload.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 18/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//
import SwiftUI
import Network
import AVKit

struct Upload: View {

    @State private var posting: Book?
    @State private var postTitle = ""
    @State private var postAuthors = ""
    @State private var postDescription = ""
    @State private var postImage = ""
    @State private var postYear = ""
    
   
    
var body: some View {
   
   
    NavigationView{
         
        List{
          
        
            TextField("book title: ", text: $postTitle)
            TextField("book Author: ", text: $postAuthors)
            TextField("book Description: ", text: $postDescription)
            TextField("book url: ", text: $postImage)
            TextField("Book year", text: $postYear)
                                   .keyboardType(.numberPad)
                           
            
            
           Button(action: {
                       self.superUpload()//activar la funcion para cargar
            print("Add pressed!!!!!!!")
            
            
                   }) {Text("Clickme")}
            
        }.navigationBarTitle("Upload Book") //Fin List
         
        
       
        
        }//Fin Navigation View
    
    }// FIN BODY //View
         func superUpload(){
             let endPointUrl: String = "https://covid19gto.alexfranco.dev/api/books/"
             //la siguiente parte es para agregar el http
             guard let newUrl = URL(string: endPointUrl) else {
                 print("Something Was Wrong")
                 return
             }
             
             var newRequest = URLRequest(url: newUrl)
             newRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
             newRequest.httpMethod = "POST"
             let newJSON : [String:Any] = [
                 "title":"\(self.postTitle)",
                "authors":"\(self.postAuthors)",
                "description":"\(self.postDescription)",
                 "image":"\(self.postImage)",
                 "year":"\(self.postYear)"]
             newRequest.httpBody = newJSON.percentEncoded()

             let newSession = URLSession.shared
             newSession.dataTask(with: newRequest){ (data1,response1,error1) in
                 do{
                     let postResponse = try JSONDecoder().decode(Book.self, from: data1!)
                     
                     DispatchQueue.main.async
                         {
                             self.posting = postResponse
                         }
                     
                 }catch{
                         print("Error in New parse in POST Method")
                         return
                       }
         }.resume()
            }//Fin Func
        }// Fin Upload View

        struct PostModelResponse : Codable{
            var code : Int
            var message : String
        }
