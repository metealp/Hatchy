//
//  UserCell.swift
//  Hatchy
//
//  Created by Mete Alp Kizilcay on 8.11.2020.
//

import SwiftUI

struct UserCell: View {
    var user: User
    
    var body: some View {
        HStack{
            Circle()
                .fill(user.isActive ? Color.green : Color.red)
                .frame(width: 15, height: 15)
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.black)
                Text(user.email)
                    .font(.caption)
                    .italic()
                    .foregroundColor(.black)
                    .opacity(0.6)
            }
        }
        
    }
}

struct UserCell_Previews: PreviewProvider {
    static var users = Users()
    
    static var previews: some View {
        UserCell(user: users.allUsers.first!)
    }
}
