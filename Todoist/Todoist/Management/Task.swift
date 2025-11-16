//
//  Task.swift
//  Todoist
//
//  Created by Iolanda D'Avino on 09/11/25.
//

import SwiftUI
import Foundation

enum TaskPriority: String, CaseIterable, Identifiable {
    case high
    case medium
    case low
    
    var id: String { self.rawValue }
    

    var name: String {
        switch self {
        case .low: "priority 3"
        case .medium: "priority 2"
        case .high: "priority 1"
        }
    }
   
    var color: Color {
        switch self {
        case .high: .red
        case .medium: .yellow
        case .low: .green
        }
    }
}


struct Task: Identifiable {
    var id = UUID()
    var compito: String
    var isCompleted: Bool = false
    var priority: TaskPriority?
}
