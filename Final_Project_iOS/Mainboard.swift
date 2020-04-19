//
//  Mainboard.swift
//  Final_Project_iOS
//
//  Created by EDUARDO MEJIA on 18/04/20.
//  Copyright © 2020 EDDIEWARE. All rights reserved.
//

import Foundation
import SwiftUI

struct Mainboard: View {
    
    let font = Font.system(size: 35).bold()
    var body: some View {
        TabView{
           
            ContentView().tabItem{
                Image(systemName: "book.circle").font(font)
                Text("Books").font(font)
            }
            
            Upload().tabItem{
                Image(systemName: "square.and.arrow.up").font(font)
                Text("Upload").font(font)
            }
            
            
            Favorites().tabItem{
                Image(systemName: "star.circle").font(font)
                Text("Favorites").font(font)
            }
            
           
        }//Fin tabView
    }
}

