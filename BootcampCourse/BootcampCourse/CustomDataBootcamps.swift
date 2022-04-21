//
//  CustomDataBootcamps.swift
//  BootcampCourse
//
//  Created by Denys on 21.04.2022.
//

import SwiftUI

//struct UserModel: Hashable {
struct UserModel: Identifiable {
    
    let id: String = UUID().uuidString
    let displayName: String
    let userName: String
    let followerCount: Int
    let isVerified: Bool
}


struct CustomDataBootcamps: View {
    
    @State var users: [UserModel] = [
        //"Nick", "Emily", "Samantha", "Chris"
        UserModel(displayName: "Nick", userName: "nick123", followerCount: 100, isVerified: true),
        UserModel(displayName: "Emily", userName: "emily90", followerCount: 34, isVerified: false),
        UserModel(displayName: "Samantha", userName: "ninja", followerCount: 245, isVerified: false),
        UserModel(displayName: "Chris", userName: "chris228", followerCount: 234, isVerified: true)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    
 //               }
 //               ForEach(users, id: \.self){ user in
                    HStack (spacing: 15) {
                        Circle()
                            .frame(width: 35, height: 35)
                        VStack(alignment: .leading) {
                            Text(user.displayName)
                                .font(.headline)
                            Text("@\(user.userName)")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        
                        if user.isVerified {
                            
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        VStack {
                            Text("\(user.followerCount)")
                                .font(.headline)
                            Text("Followers")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            .navigationTitle("Users")
        }
    }
}

struct CustomDataBootcamps_Previews: PreviewProvider {
    static var previews: some View {
        CustomDataBootcamps()
    }
}
