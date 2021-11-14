//
//  Skill.swift
//  PokeDex
//
//  Created by 戴育宸 on 2021/10/27.
//

import Foundation


class Skill
{
    var skid : String!
    var skname : String!
    var skimageName : String!
    var sktype : String!
    var skexp : String!
    var skpow : Int!
    var skacc : Int!
    var skpp : Int!
    

    
    public init(skillid:String, skillname:String, skillimageName:String, skilltype:String,
        skillexp:String,
        skillpow:Int,
        skillacc:Int,
        skillpp:Int
    )
    {
        self.skid = skillid
        self.skname = skillname
        self.skimageName = skillimageName
        self.sktype = skilltype
        self.skexp = skillexp
        self.skpow = skillpow
        self.skacc = skillacc
        self.skpp = skillpp
        
        
    }
}
