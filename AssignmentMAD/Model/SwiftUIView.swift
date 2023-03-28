//
//  SwiftUIView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import Foundation

struct checkList:Hashable,Codable{
    var listName:String
    var checkListDetail:[[checkListDetailitem]]//
}

struct checkListDetailitem:Hashable,Codable{
    var name:String
    var check:Bool
}

struct DataModel:Codable{
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
    }
    func save(){
        guard let url=getFile(),
              let data=try? JSONEncoder().encode(self)
        else{
            return
        }
        try? data.write(to: url)
    }
}

var testTitle="Checklist"
var testList=[
    checkList(listName: "first check list", checkListDetail:[[]] )
]



func getFile()->URL?{
    let filename="checkList.json"
    let fm = FileManager.default
    guard let url=fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else{
        return nil
    }
    return url.appendingPathComponent(filename)
}


