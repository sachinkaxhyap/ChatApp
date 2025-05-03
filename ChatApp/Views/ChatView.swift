//
//  ChatView.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 05/03/2025.
//

import SwiftUI

struct CustomTextBox: View {
    
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        
        VStack {
            VStack {
                TitleRow()
                
                ScrollViewReader { proxy in
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
//                    .padding(.top, 10)
                    .background(Color(.systemBackground)) // Adapts to light/dark mode
                    .cornerRadius(30, corners: [.topLeft, .topRight]) // Custom cornerRadius modifier added in Extensions file
                    .onChange(of: messagesManager.lastMessageId) { oldValue, newValue in
                        // When the lastMessageId changes, scroll to the bottom of the conversation
                        withAnimation {
                            proxy.scrollTo(newValue, anchor: .bottom)
                        }
                    }
                }
            }
            .background(Color("Peach"))
            
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}


#Preview {
    CustomTextBox()
}
