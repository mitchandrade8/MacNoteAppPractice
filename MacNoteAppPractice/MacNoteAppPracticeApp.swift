//
//  MacNoteAppPracticeApp.swift
//  MacNoteAppPractice
//
//  Created by Mitch Andrade on 10/31/23.
//

import SwiftUI

@main
struct MacNoteAppPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                /// Setting Min Frame
                .frame(minWidth: 320, minHeight: 400)
        }
        .windowResizability(.contentSize)
        /// Adding Data Model to the App
        .modelContainer(for: [Note.self, NoteCategory.self])
    }
}
