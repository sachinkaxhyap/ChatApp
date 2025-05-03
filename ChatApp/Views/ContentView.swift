//
//  ContentView.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 02/03/2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Tab("Chats", systemImage: "message.fill") {
                CustomTextBox()
            }
            
            Tab("Jukebox", systemImage: "music.note.list") {
                JukeboxView()
            }
            
            Tab("AI Chat", systemImage: "brain.head.profile") {
                AIChat()
            }
            
            Tab("Profile", systemImage: "person.fill") {
                ProfileView()
            }
        }
    }
}

#Preview {
    ContentView()
}
