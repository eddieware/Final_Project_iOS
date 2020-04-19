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

    @State private var posting: PostModelResponse?
    var items: Book
   
    
var body: some View {
   
   
    NavigationView{
        List{
            Text("Something To Upload here")
        }.navigationBarTitle("Upload Book") //Fin List
        
        Button(action: {
        
        print("pressed!!!!!!!!")
        }) {Text("Clickme")}
        
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
        newRequest.httpMethod = "POST"
        
        /*Model Reference
         
         public var id: Int
         public var title: String
         public var authors: String
         public var description: String
         public var image: String
         public var year: Int
         
         */
        let newJSON : [String:Any] = ["id": 14, "title":"Eduardo Book","authors":"Eduardo Mejia","description":"Book About Me","image":"Some_Image","year":"2020"]
        let JSONobject : Data
        
        do{
            JSONobject = try JSONSerialization.data(withJSONObject: newJSON, options: [])
            newRequest.httpBody = JSONobject
            newRequest.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        }catch{
            print("the JSON Can not be created Error")
            return
        }
        
        let newSession = URLSession.shared
        newSession.dataTask(with: newRequest){ (data1,response1,error1) in
            do{
                let postResponse = try JSONDecoder().decode(PostModelResponse.self, from: data1!)
                
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
