//
//  Model.swift
//  YOURSSU_incubating#2
//
//  Created by 지희의 MAC on 2022/05/09.
//

import Foundation

struct Memo{
    var content : String
    var insertDate : Date
    init (content: String) {
        self.content=content
        insertDate=Date()
    }
}

class MemoList{
     
    //dummydate
    static var dummyMemoList=[
     Memo(content: "Lorem ipsum"),
     Memo(content: "Dolar Amet")
    ]
}
//싱글톤 패턴 
