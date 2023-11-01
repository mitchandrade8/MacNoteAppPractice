//
//  Home.swift
//  MacNoteAppPractice
//
//  Created by Mitch Andrade on 10/31/23.
//

import SwiftUI

struct Home: View {
    /// List Selection (Going to use this as a Tab to filter the selected category notes)
    @State private var selectedTag: String?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedTag) {
                Text("All Notes")
                    .tag("All Notes")
                
                Text("Favorites")
                    .tag("Favorites")
            }
        } detail: {
            
        }
        .navigationTitle(selectedTag ?? "Notes")
    }
}

#Preview {
    ContentView()
}
