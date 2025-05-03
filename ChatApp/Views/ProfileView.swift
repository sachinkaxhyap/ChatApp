//
//  ProfileView.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 05/03/2025.
//

import SwiftUI

struct ProfileView: View {
    @State private var isShowingEditProfile = false
    @State private var showQRCode = false
    
    // Environment value for color scheme
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Profile Image Section
                    VStack(spacing: 20) {
                        Image("ProfileImage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                            .padding(.top, 30)
                            .padding(.bottom, 10)
                        
                        // Name
                        Text("Sachin Kaxhyap")
                            .font(.system(size: 22, weight: .semibold))
                        
                        // Phone number or status text
                        Text("+91 98765 43210")
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                            .padding(.bottom, 20)
                    }
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .dark ? Color.black : Color(UIColor.systemBackground))
                    
                    // Info sections
                    Group {
                        // About section
                        SectionContainer {
                            NavigationLink(destination: EditAboutView()) {
                                InfoRow(
                                    icon: "text.quote",
                                    title: "About",
                                    subtitle: "iOS Developer | SwiftUI Enthusiast 🚀",
                                    showDivider: true
                                )
                            }
                            
                            // Phone section
                            NavigationLink(destination: EditPhoneView()) {
                                InfoRow(
                                    icon: "phone.fill",
                                    title: "Phone",
                                    subtitle: "+91 98765 43210",
                                    showDivider: false
                                )
                            }
                        }
                        
                        // Media, links and docs section
                        SectionContainer {
                            NavigationLink(destination: MediaLinksDocsView()) {
                                InfoRow(
                                    icon: "photo.fill",
                                    title: "Media, links, and docs",
                                    subtitle: "",
                                    showDivider: false,
                                    showChevron: true
                                )
                            }
                        }
                        
                        // Settings section
                        SectionContainer {
                            Button(action: {
                                // Mute notifications action
                            }) {
                                InfoRow(
                                    icon: "bell.slash.fill",
                                    title: "Mute notifications",
                                    subtitle: "",
                                    showDivider: true,
                                    showToggle: true
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                // Custom tone action
                            }) {
                                InfoRow(
                                    icon: "music.note",
                                    title: "Custom tone",
                                    subtitle: "",
                                    showDivider: true,
                                    showChevron: true
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                showQRCode = true
                            }) {
                                InfoRow(
                                    icon: "qrcode",
                                    title: "QR code",
                                    subtitle: "",
                                    showDivider: false,
                                    showChevron: true
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        // Block and Report section
                        SectionContainer {
                            Button(action: {
                                // Block action
                            }) {
                                HStack {
                                    Text("Block")
                                        .foregroundColor(.red)
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Divider()
                            
                            Button(action: {
                                // Report action
                            }) {
                                HStack {
                                    Text("Report contact")
                                        .foregroundColor(.red)
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        
                        // Empty space at bottom
                        Color.clear.frame(height: 40)
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingEditProfile = true
                    }) {
                        Text("Edit")
                            .fontWeight(.medium)
                    }
                }
                
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//                        // Back action
//                    }) {
//                        Image(systemName: "chevron.left")
//                    }
//                }
            }
            .background(colorScheme == .dark ? Color(UIColor.systemGray6) : Color(UIColor.systemGroupedBackground))
            .sheet(isPresented: $isShowingEditProfile) {
                EditProfileView()
            }
            .sheet(isPresented: $showQRCode) {
                QRCodeView()
            }
        }
    }
}

// Supporting Views
struct SectionContainer<Content: View>: View {
    let content: Content
    @Environment(\.colorScheme) var colorScheme
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            content
        }
        .background(colorScheme == .dark ? Color.black : Color.white)
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.top, 16)
    }
}

struct InfoRow: View {
    let icon: String
    let title: String
    let subtitle: String
    var showDivider: Bool = true
    var showChevron: Bool = false
    var showToggle: Bool = false
    
    @State private var isToggled = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                // Icon
                ZStack {
                    Circle()
                        .fill(Color(UIColor.systemGreen).opacity(0.1))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(Color(UIColor.systemGreen))
                }
                
                // Content
                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(.system(size: 16))
                    
                    if !subtitle.isEmpty {
                        Text(subtitle)
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                
                // Toggle or Chevron
                if showToggle {
                    Toggle("", isOn: $isToggled)
                        .labelsHidden()
                } else if showChevron {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            
            if showDivider {
                Divider()
                    .padding(.leading, 68)
            }
        }
    }
}

struct EditProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = "Sachin Kaxhyap"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                // Profile Image
                VStack(spacing: 8) {
                    Image("ProfileImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray.opacity(0.2), lineWidth: 1))
                    
                    Text("Edit")
                        .font(.system(size: 15))
                        .foregroundColor(Color(UIColor.systemGreen))
                }
                .padding(.top, 30)
                
                // Name field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Name")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .padding(.leading, 4)
                    
                    TextField("Name", text: $name)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .fontWeight(.medium)
                    .foregroundColor(Color(UIColor.systemGreen))
                }
            }
        }
    }
}

struct EditAboutView: View {
    @State private var about = "iOS Developer | SwiftUI Enthusiast 🚀"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("About", text: $about)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
            
            Text("Your about will be visible to other contacts")
                .font(.footnote)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditPhoneView: View {
    var body: some View {
        List {
            HStack {
                Text("+91 98765 43210")
                Spacer()
                Text("Mobile")
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("Phone Number")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MediaLinksDocsView: View {
    var body: some View {
        List {
            Section(header: Text("Media")) {
                ForEach(1...5, id: \.self) { _ in
                    HStack {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 60, height: 60)
                        
                        VStack(alignment: .leading) {
                            Text("IMG_12345.jpg")
                            Text("23/03/2025")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 8)
                    }
                    .padding(.vertical, 4)
                }
            }
            
            Section(header: Text("Links")) {
                ForEach(1...3, id: \.self) { _ in
                    HStack {
                        Image(systemName: "link")
                            .frame(width: 40, height: 40)
                            .background(Color.blue.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                        
                        VStack(alignment: .leading) {
                            Text("github.com/sachinkaxhyap")
                            Text("18/03/2025")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 8)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("Media, Links, and Docs")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct QRCodeView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Sachin Kaxhyap")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                // QR Code placeholder
                Image(systemName: "qrcode")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                
                Text("Your personal QR code")
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding(.top, 50)
            .navigationTitle("QR Code")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Share QR code action
                    }) {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
