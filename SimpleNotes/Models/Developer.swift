//
//  Developer.swift
//  SimpleNotes
//
//  Created by Алексей Синяговский on 02.04.2022.
//

struct Developer {
    let nickName: String
    let realName: String
    
    static func getDeveloperList() -> [Developer] {
        [
            Developer(nickName: "Aleksandra2457", realName: "Александра"),
            Developer(nickName: "Aleks-sinya", realName: "Алексей"),
            Developer(nickName: "moraWoo", realName: "Ильдар"),
            Developer(nickName: "Selboy", realName: "Алмас"),
            Developer(nickName: "TheKEKO", realName: "Александр")
        ]
    }
}
