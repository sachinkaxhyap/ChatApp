//
//  TitleRow.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 02/03/2025.
//

import SwiftUI

struct TitleRow: View {
    
    @State private var profilePicture: String = "ProfileImage"
    @State private var name : String = "Sachin Kaxhyap"
    @State var imageUrl: URL? = URL(string: "https://i.pravatar.cc/300")
    
    var body: some View {
        HStack {
            AsyncImage(url: imageUrl) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 50))
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                }
            }
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    TitleRow()
}
