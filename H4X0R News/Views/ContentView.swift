//
//  ContentView.swift
//  H4X0R News
//
//  Created by Rajat Jain on 27/03/20.
//  Copyright © 2020 Rajat Jain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   @ObservedObject var networkManager = NetworkManager()
    
    
    var body: some View {
        NavigationView {
            
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                       HStack {
                        Text(String(post.points)).padding(.horizontal)
                        Text(post.title).font(Font.custom("Times New Roman", size: 20))
                    }
                }
            
                
            }
                    .navigationBarTitle("H4X0R News")
          
        }
        .onAppear {
            self.networkManager.fetchData()
        } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




