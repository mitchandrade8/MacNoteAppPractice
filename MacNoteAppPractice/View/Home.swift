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
    
    /// Model Context
    @Environment(\.modelContext) private var context
    
    /// View Properties
    @State private var addCategory: Bool = false
    @State private var categoryTitle: String = ""
    @State private var requestedCategory: NoteCategory?
    @State private var deleteRequest: Bool = false
    @State private var renameRequest: Bool = false
    
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
                    ForEach(categories) { category in
                        Text(category.categoryTitle)
                            .tag(category.categoryTitle)
                            .foregroundStyle(selectedTag == category.categoryTitle ? Color.primary : .gray)
                            /// Some Basic Editing Options
                            .contextMenu {
                                Button("Rename") {
                                    /// Placing the Already Having title in the TextField
                                    categoryTitle = category.categoryTitle
                                    requestedCategory = category
                                    renameRequest = true
                                }
                                
                                Button("Delete") {
                                    requestedCategory = category
                                    deleteRequest = true
                                }
                            }
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
        /// Adding Category Alert
        .alert("Add Category", isPresented: $addCategory) {
            TextField("Work", text: $categoryTitle)
            
            Button("Cancel", role: .cancel) {
                categoryTitle = ""
            }
            
            Button("Add") {
                /// Adding New Category to Swift Data
                let category = NoteCategory(categoryTitle: categoryTitle)
                context.insert(category)
                categoryTitle = ""
                
            }
            
        }
        /// Rename Alert
        .alert("Rename Category", isPresented: $renameRequest) {
            TextField("Work", text: $categoryTitle)
            
            Button("Cancel", role: .cancel) {
                categoryTitle = ""
                requestedCategory = nil
            }
            
            Button("Rename") {
                /// Adding New Cateogry to Swift Data
                if let requestedCategory {
                    requestedCategory.categoryTitle = categoryTitle
                    categoryTitle = ""
                    self.requestedCategory = nil
                }
            }
        }
        /// Delete Alert
        .alert("Delete Cateogry", isPresented: $deleteRequest) {
            Button("Cancel", role: .cancel) {
                categoryTitle = ""
                requestedCategory = nil
            }
            
            Button("Rename") {
                /// Adding New Cateogry to Swift Data
                if let requestedCategory {
                    requestedCategory.categoryTitle = categoryTitle
                    categoryTitle = ""
                    self.requestedCategory = nil
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
