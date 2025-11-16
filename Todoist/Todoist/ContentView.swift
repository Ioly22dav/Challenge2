//
//  ContentView.swift
//  Todoist
//
//  Created by Iolanda D'Avino on 09/11/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            InboxView()
                .tabItem {
                    Label("Inbox", systemImage: "tray.fill")
                }
            
            CalendarView()
                .tabItem {
                    Label("Today", systemImage: "calendar")
                }
                    
            UpcomingView()
                .tabItem {
                    Label("Upcoming", systemImage: "calendar.badge.clock")
                }
            
            BrowseView()
                .tabItem {
                        Label("Browse", systemImage: "line.3.horizontal")}
                }
        
        
    }
}

#Preview {
    ContentView()
}
