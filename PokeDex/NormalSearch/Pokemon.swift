//
//  Pokemon.swift
//  PokeDex
//
//  Created by 侯彥廷 on 2021/10/24.
//

import Foundation

class Pokemon
{
    var id : String!
    var name : String!
    var imageName : String!
    var type : String!
    var exp : String!

    
    public init(id:String, name:String, imageName:String, type:String,
        exp:String)
    {
        self.id = id
        self.name = name
        self.imageName = imageName
        self.type = type
        self.exp = exp
        
    }
}

