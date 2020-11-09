//
//  DetailView.swift
//  Hatchy
//
//  Created by Mete Alp Kizilcay on 8.11.2020.
//

import SwiftUI

struct DetailView: View {
    var user: User
    @ObservedObject var users = Users()
    
    var body: some View {
        GeometryReader { g in
            ScrollView(.vertical){
                VStack{
                    Section{
                        Image(systemName: "person.fill")
                            .frame(width: 100, height: 100, alignment: .center)
                            .clipShape(Circle())
                            .border(user.isActive ? Color.green : Color.red)
                    }
                    Section{
                        Text(user.name)
                        Text(user.email)
                        Text(String(user.age))
                    }
                    
                    Section{
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(user.tags, id: \.self){ tag in
                                    Text(tag)
                                        .foregroundColor(Color.white)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 5)
                                        .background(
                                            Capsule()
                                                .fill(Color.purple)
                                        )
                                        .padding(.vertical, 10)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    
                    Section{
                        Text(user.address)
                        Text(user.company ?? "Unknown company")
                        Text(user.about)
                    }
                    
                    Section {
                        ForEach(user.friends){
                            friend in
                            NavigationLink(destination: DetailView(user: users.findUser(byId: friend.id)!)){
                                VStack {
                                        HStack{
                                            Text(friend.name)
                                                .foregroundColor(.black)
                                                .padding(10)
                                        }
                                    .frame(width: g.size.width, height: 30, alignment: .leading)
                                    
                                    Divider()
                                        .frame(width: g.size.width, height: 1)
                                            .padding(.horizontal, 30)
                                        .background(Color.red)
                                }
                                
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var users = Users()
//    static var users: Users
    
    static var previews: some View {
        DetailView(user: users.allUsers.first!)
    }
}
