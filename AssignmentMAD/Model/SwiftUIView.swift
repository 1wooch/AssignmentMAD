//
//  SwiftUIView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import Foundation

func getFile()->URL?{
    let filename="checkList2.json"
    let fm = FileManager.default
    guard let url=fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else{
        return nil
    }
    return url.appendingPathComponent(filename)
}


struct checkList:Hashable,Codable{//2
    var listName:String //grocery
    var checkListDetail:[checkListDetailitem]// [["milk",boolean],[""]
} // contenVIew


struct checkListDetailitem:Hashable,Codable{//3
    var name:String
    var check:Bool
}

struct DataModel:Codable{ //1
    var lists:[checkList]
    var title:String
    init(){
        lists=[]
        title=""
        load()
    }
    mutating func load(){
        guard let url=getFile(),
              let data = try? Data(contentsOf: url),
              let datamodel=try? JSONDecoder().decode(DataModel.self, from: data)else{
            self.lists=testList
            self.title=testTitle
            return
        }
        self.lists=datamodel.lists
        self.title=datamodel.title
    }
    func save(){
        guard let url=getFile(),
              let data=try? JSONEncoder().encode(self)
        else{
            return
        }
        try? data.write(to: url)
    }
    mutating func reset(){
        for i in lists.indices{
            for j in lists[i].checkListDetail.indices{
                lists[i].checkListDetail[j].check=false
            }
        }
    }
}

var testTitle="Checklist"
var testList=[
    checkList(listName: "first check list", checkListDetail: [checkListDetailitem(name: "chocolate", check: false),
         checkListDetailitem(name: "milk", check: true)
                                                             ])
]



