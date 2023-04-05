//
//  SwiftUIView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import Foundation

func getFile()->URL?{
    let filename="checkList2.json" //json file name
    let fm = FileManager.default // set default file manager
    guard let url=fm.urls(for: .documentDirectory, in:  FileManager.SearchPathDomainMask.userDomainMask).first else{
        return nil // search file exist or not
    }
    return url.appendingPathComponent(filename)
}


struct checkList:Hashable,Codable{// for the content view
    var listName:String //list title
    var checkListDetail:[checkListDetailitem]//content view data example [["milk",boolean],[""]
} // contenVIew


struct checkListDetailitem:Hashable,Codable{// subContent view = checkListDetail
    var name:String //name of task
    var check:Bool // tick or not tick
}

struct DataModel:Codable{ //for the main data model
    var lists:[checkList] // putchecklist format in datamodel.lists
    var title:String // title
    init(){ // initial value
        lists=[] //set empty list
        title="" // set empty title
        load() // load the data from json file
    }
    mutating func load(){
        guard let url=getFile(),
              let data = try? Data(contentsOf: url),
              let datamodel=try? JSONDecoder().decode(DataModel.self, from: data)else{ // try and catch
            self.lists=testList // get data and set title from json file
            self.title=testTitle // set title from json file
            return
        }
        self.lists=datamodel.lists // and set data as datamodel value
        self.title=datamodel.title // also for title
    }
    func save(){ // model.save() function
        guard let url=getFile(), // get file and write down.
              let data=try? JSONEncoder().encode(self)
        else{
            return
        }
        try? data.write(to: url)
    }
    mutating func reset(){ // not using
        for i in lists.indices{
            for j in lists[i].checkListDetail.indices{
                lists[i].checkListDetail[j].check=false
            }
        }
    }
}
// initial value when the json file is empty one
var testTitle="Checklist"
var testList=[
    checkList(listName: "first check list", checkListDetail: [checkListDetailitem(name: "chocolate", check: false),
         checkListDetailitem(name: "milk", check: true)
                                                             ])
]



