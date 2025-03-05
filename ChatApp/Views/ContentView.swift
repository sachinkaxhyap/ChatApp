//
//  ContentView.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    var msgArr = ["Hi", "Hello", "How are you? Are you fine"]
    
    var body: some View {
        VStack {
            TitleRow()
            Divider()
            
            ScrollView {
                    ForEach(msgArr, id: \.self) { msg in
                        MessageBubble(message: Message(id: "1234", text: msg, received: true, timestamp: Date()))
                    }
            }
            MessageField()
        }
    }
}

#Preview {
    ContentView()
}
