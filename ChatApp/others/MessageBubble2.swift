//
//  MessageBubble.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 04/03/2025.
//

import SwiftUI

struct MessageBubble2: View {
    
    var message: Message
    
    var body: some View {
        
        VStack(alignment: message.received ? .leading : .trailing){
            VStack {
                Text(message.text)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .background(message.received ? Color.gray : Color.blue)
                    .cornerRadius(24)
                    .foregroundStyle(message.received ? Color.black : Color.white)
                
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            
            Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                .padding(message.received ? .leading : .trailing)
                .font(.caption)
                .opacity(0.7)
                
            
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(.horizontal)
        
        
    }
}

#Preview {
    MessageBubble2(message: Message(id: "12883723", text: "This is a messaage.", received: true, timestamp: Date()))
}
