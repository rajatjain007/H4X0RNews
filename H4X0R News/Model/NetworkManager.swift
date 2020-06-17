//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Rajat Jain on 27/03/20.
//  Copyright © 2020 Rajat Jain. All rights reserved.
//


import Foundation

class NetworkManager : ObservableObject {
   @Published var posts = [Post]()
    
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let tast = session.dataTask(with: url){(data,response,error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                
                                self.posts = results.hits
                            }

                        }
                        catch{
                            print(error)
                        }
                    }
                    
                    
                }
                
            }
            tast.resume()
        }
    }
}
