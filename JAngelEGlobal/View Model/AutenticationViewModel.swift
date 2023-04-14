//
//  AutenticationViewModel.swift
//  JAngelEGlobal
//
//  Created by MacBookMBA6 on 13/04/23.
//

import Foundation

class AutenticationViewModel{
    func gettoken(user : gettoken, token : @escaping(getokenvalue?)->Void){
        let decoder = JSONDecoder()
        let baseurl = "https://fad40b06-384a-41b3-9237-a9953a4c9a51.mock.pstmn.io"
        let url = URL(string: baseurl)
        var urlrequest = URLRequest(url: url!)
        urlrequest.httpMethod = "POST"
        urlrequest.addValue("aplication/json", forHTTPHeaderField: "Content-Type")
        urlrequest.httpBody = try! JSONEncoder().encode(user)
        let urlsession = URLSession.shared
        urlsession.dataTask(with: urlrequest){ [self]data, error, response in
            if let safedata = data{
                let json = jsondecoer(data : data!)
                token(json)
            }
               
        } .resume()
        
    }
    func jsondecoer(data: Data)->getokenvalue?{
        var decodable = JSONDecoder()
        do{
            let request = try decodable.decode(getokenvalue.self, from: data)
            let gettoken = getokenvalue(correct: request.correct, Token_user: request.Token_user)
                return gettoken
        }
        catch let error{
            print(error.localizedDescription)
            return nil
        }
    }
}
