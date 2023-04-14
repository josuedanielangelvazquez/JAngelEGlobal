//
//  Autentication.swift
//  JAngelEGlobal
//
//  Created by MacBookMBA6 on 13/04/23.
//

import Foundation

struct gettoken : Codable{
    var user : String
    var password : String
}
struct getokenvalue : Codable{
    var correct: Bool
    var Token_user : String?
}

struct Uservalue : Codable{
    var val_User : Bool
}
