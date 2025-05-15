//
//  ContentView.swift
//  iap-demo
//
//  Created by Jed Patterson on 07/05/2025.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            StandardWebView()
                .tabItem {
                    Label("Standard", systemImage: "globe")
                }
                .tag(0)
            
            AppleOneToOneView()
                .tabItem {
                    Label("Apple Pay", systemImage: "apple.logo")
                }
                .tag(1)
        }
    }
}

#Preview {
    ContentView()
}
