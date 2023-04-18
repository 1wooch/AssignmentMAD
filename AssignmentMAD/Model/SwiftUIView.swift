//
//  SwiftUIView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import Foundation
/// # ``getFile()``
///  Open Json file that name is equal to 'let filename' using file manager and return the file url
///
/// need to have filename and value for filemanager
/// and using both data get an URL for Json file.
/// and return the url value.
/// For now I have set filename.
/// but it could be changed into input filename.
///
func getFile()->URL?{
    let filename="checkList2.json" //json file name
    let fm = FileManager.default // set default file manager
    guard let url=fm.urls(for: .documentDirectory, in:  FileManager.SearchPathDomainMask.userDomainMask).first else{
        return nil // search file exist or not
    }
    return url.appendingPathComponent(filename)
}
/// # **checkList**
/// First  Array for check list.
///
/// ## Brief Description
///
/// There is array has included in checkListDetailitem which is for detail of task and explain it later.
/// This Aray include listName(Task) & checkListDetail (detail of task)
/**
- Content of Array
    - listName
        - Type:  String
        -  Usage:  listName is string type and only use for display name of the list that display on front-page list and detailview navigation title.
    - checkListDetail
        - Type:   Array of checkListDetailitem
        - Usage:
           - 1:  StringIt includes all of the checklist task name and check value.
           - 2: CheckListDetail: This will be used for subContent, subContentDetailView.
           - 3:  All of value and type  will be explained in next ``checkListDetail``
 */
///
///
struct checkList:Hashable,Codable{// for the content view
    var listName:String ///list title
    var checkListDetail:[checkListDetailitem]/// content view data example [["milk",boolean]
    
} // contenVIew


/// # **checkListDetailitem**
/// Second  Array in check list array.
///
/// ## Brief Description
///
/// There is array has included in name of the task and boolean value for display tick or untick.
/// This Aray include taskName(name) & check(tick or untick)
/**
- Content of Array
    - name
        - Type:  String
        -  Usage:  use to display name of the task and will display on subcontent list and subContentdetail page.
 
    - check
        - Type:   boolean
        - Usage: To display tick and untick the checkmark by user click interaction.
 */
struct checkListDetailitem:Hashable,Codable{// subContent view = checkListDetail
    var id=UUID()
    var name:String //name of task
    var check:Bool // tick or not tick
}


/// # **DataModel**
///
/// ## Brief Description
///
/// This part will present basic DataModel for list data.
///
///### **init( )**
///## Brief Description
///
/// This part will run 
///
/**
        1. lists
            - Type: array include ``checkList`` data
            - Usage:
                - This can be called by datamodel.lists
                - This will have all of the lists of task.
                -  Can list the item by using display data in detail view.
         2. Title
            - Type: string only include the name
            - Usage: Display name of the title on contentview navigation title.
         3.`` load()``
            - Type: function
            - Usage: Load the data from JSON file
 */

///
///
struct DataModel:Codable{ //for the main data model
    var lists:[checkList] // putchecklist format in datamodel.lists
    var title:String // title
    init(){ // initial value
        lists=[] //set empty list
        title="" // set empty title
        load() // load the data from json file
    }
    /// # **DataModel.load()**
    ///
    /// ## Brief Description
    /// Load the data from JSON
    
    /**
         - Type: mutating function
         - Element:
                        - url
                            - Type: Guard  let
                            - Usage : get a location of file
                        - data (let)
                            - Type: let
                            - Usage: try to get a data from url
                        - datamodel
                            - Type: let
                            - Usage: use data which is JSON decode the JSON so, program can use data.
         - Procedure:
                1.  Get the location of JSON in url
                2.  get a data using url
                3. decode the data and put that data in datamodel
                4. get the list title and lists and put that in value
    */
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
    
    /// # **DataModel.save()**
    ///
    /// ## Brief Description
    /// Save the data in JSON
    /**
         - Type: mutating function
         - Element:
                        - url
                            - Type: Guard  let
                            - Usage : get a location of file
                        - data (let)
                            - Type: let
                            - Usage: try to get a data from url
         - Procedure:
                1.  Get the location of JSON in url
                2. Encode the data into JSON format .
                3. using url write down the data(JSON) in file.
     */
    func save(){ // model.save() function
        guard let url=getFile(), // get file and write down.
              let data=try? JSONEncoder().encode(self)
        else{
            return
        }
        try? data.write(to: url)
    }
   
}

// initial value when the json file is empty one

/// this is for the initial value if there is no data in JSON file. 
var testTitle="Checklist"
var testList=[
    checkList(listName: "first check list", checkListDetail: [checkListDetailitem(name: "chocolate", check: false),
         checkListDetailitem(name: "milk", check: true)
                                                             ])
]



