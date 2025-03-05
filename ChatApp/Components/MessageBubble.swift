//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 04/03/2025.
//


import SwiftUI

struct MessageBubble: View {
    var message: Message
    
    var body: some View {
        VStack {
            HStack {
                if message.received {
                    // Received message (Align left)
                    bubbleView()
                        .frame(maxWidth: 250, alignment: .leading)
                    Spacer()
                } else {
                    // Sent message (Align right)
                    Spacer()
                    bubbleView()
                        .frame(maxWidth: 250, alignment: .trailing)
                }
            }
            .padding(.horizontal)
            
            Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                .font(.caption)
                .opacity(0.7)
                .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
                .padding(message.received ? .leading : .trailing, 28)
        }
        
    }
    
    @ViewBuilder
    private func bubbleView() -> some View {
        Text(message.text)
            .padding(12)
            .background(message.received ? Color.gray.opacity(0.2) : Color.blue)
            .foregroundColor(message.received ? .black : .white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.3), lineWidth: message.received ? 1 : 0)
            )
    }
}

#Preview {
    MessageBubble(message: Message(id: "12883723", text: "This is a messaage.it can be a very good message.", received: true, timestamp: Date()))
}
