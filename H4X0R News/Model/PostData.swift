//
//  PostData.swift
//  H4X0R News
//
//  Created by Rajat Jain on 27/03/20.
//  Copyright © 2020 Rajat Jain. All rights reserved.
//

import Foundation

struct Results : Decodable {
    let hits : [Post]
}

struct Post : Decodable,Identifiable {
    var id : String{
        return objectID
    }
    let points : Int
    let title : String
    let url : String?
    let objectID : String
    
}
