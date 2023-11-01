//
//  Note.swift
//  MacNoteAppPractice
//
//  Created by Mitch Andrade on 10/31/23.
//

import SwiftUI
import SwiftData

@Model
class Note {
    var content: String
    var isFavorite: Bool = false
    var category: NoteCategory?
    
    init(content: String, category: NoteCategory? = nil) {
        self.content = content
        self.category = category
    }
}
