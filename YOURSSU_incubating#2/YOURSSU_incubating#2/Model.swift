//
//  Model.swift
//  YOURSSU_incubating#2
//
//  Created by 지희의 MAC on 2022/05/09.
//

import Foundation

struct Memo{
    var title : String
    var subTitle : String
    init (title: String, content: String) {
        self.title=title
        self.subTitle=content
    }
}

class MemoList{
    static let shared = MemoList()
    //dummydata
    var dummyMemoList : [Memo] = []
    private init () {}
<<<<<<< HEAD
}

=======
    
}
>>>>>>> incubating#2
//싱글톤 패턴 
