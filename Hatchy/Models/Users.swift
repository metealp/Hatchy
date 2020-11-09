//
//  Users.swift
//  Hatchy
//
//  Created by Mete Alp Kizilcay on 8.11.2020.
//

import Foundation

class Users: ObservableObject {
    @Published var allUsers = [User]()
     
    
    init(){
        let urlS = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let request = URLRequest(url: urlS)
        
        let session = URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let decodedUsers = try decoder.decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.allUsers = decodedUsers
                }
            } catch let error {
                print("error: \(error)")
            }
        }
        DispatchQueue.global().async {
            session.resume()
        }
    }
    
    func findUser(byId id: String) -> User? {
            if let user = allUsers.first(where: { $0.id == id }) {
                return user
            }
            
            return allUsers.first
    }
}
