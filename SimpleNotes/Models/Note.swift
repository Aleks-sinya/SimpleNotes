//
//  Note.swift
//  SimpleNotes
//
//  Created by Алексей Синяговский on 02.04.2022.
//

struct Note {
    var title = ""
    var description: String?
    
    static func returnExampleNotes() -> [Note] {
        [Note(title: "Моя заметка", description: "Описание заметки")]
    }
}
