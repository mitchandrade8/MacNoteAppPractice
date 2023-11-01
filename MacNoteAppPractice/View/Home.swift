//
//  Home.swift
//  MacNoteAppPractice
//
//  Created by Mitch Andrade on 10/31/23.
//

import SwiftUI
import SwiftData

struct Home: View {
    /// List Selection (Going to use this as a Tab to filter the selected category notes)
    @State private var selectedTag: String? = "All Notes"
    
    /// Querying All Categories
    @Query(animation: .snappy) private var categories: [NoteCategory]
    
    /// View Properties
    @State private var addCategory: Bool = false
    @State private var categoryTitle: String = ""
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedTag) {
                Text("All Notes")
                    .tag("All Notes")
                    .foregroundStyle(selectedTag == "All Notes" ? Color.primary : .gray)
                
                Text("Favorites")
                    .tag("Favorites")
                    .foregroundStyle(selectedTag == "Favorites" ? Color.primary : .gray)
                
                /// User Created Categories
                Section {
                    ForEach(categories) {
                        Text($0.categoryTitle)
                            .tag($0.categoryTitle)
                            .foregroundStyle(selectedTag == $0.categoryTitle ? Color.primary : .gray)
                    }
                } header: {
                    HStack(spacing: 10) {
                        Text("Categories")
                        
                        Button("", systemImage: "plus") {
                            addCategory.toggle()
                        }
                        .buttonStyle(.plain)
                    }
                }
                
            }
        } detail: {
            
        }
        .navigationTitle(selectedTag ?? "Notes")
        .alert("Add Category", isPresented: $addCategory) {
            TextField("Record Video", text: $categoryTitle)
            
            Button("Cancel", role: .cancel) {
                categoryTitle = ""
            }
            
            Button("Add") {
                /// Adding New Category
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
