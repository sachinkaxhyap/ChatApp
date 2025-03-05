//
//  Message.swift
//  ChatApp
//
//  Created by Sachin Kaxhyap on 04/03/2025.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
