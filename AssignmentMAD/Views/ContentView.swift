//
//  ContentView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI
/// # **MileStone1View**
///
/// ## Brief Description
/// Display Mainview
/**
     - Type: View
     - Element:
                    - model:DataModel (``DataModel``)
                        - Type: @Binding var
                        - Usage : get a datamodel from model side.
     - Procedure:
            1. Get the data model from model.
            2. Display data in view by using DB
            3. Using list with ``forEach`` display all of the item.
            4. By using ``navigationLink`` link each data to ``subContentView``
            5. ``.onDelete`` is for the delete of each section of data (by dragging or in edit mode)
            6. ``.onMove`` is for the move the data into other cell by dragging.
            7. ``.navigationTitle`` is for display main title on view.
            8. ``.navigationbar`` is for display the navbar icon or data. In  ``.navigationbar`` put 2 icon one for convert environment into edit mode and the other for '+' button to
            8.1
                - '+' button :  once the button clicked by the user the new task list will be generated with
                        "new \(length of list)" as name of the task  with empty array for task detail .
                - 'Edit' button: if user click 'edit' button it will lead to  ``EditView`` and change the envrionement to edit mode.
            
 */struct MileStone1View:View{
    @Binding var model:DataModel /// get datamodel
    var body:some View{
        /// ``NavigationView`` is to ``navigationLink`` and it will help user to link to ``subContentView`` with clicked value include name and list.
        NavigationView{
            VStack{
                /// will lead to EditView and send title and datamodel (model) to ``editview``
                EditView(item:$model.title , model : $model) /// lead to normal edit view (only for title)
                List{
                    ForEach($model.lists,id:\.self){ /// all the data in model.list display and make it lead to subContentView link
                        ///``destination`` will be link to ``subContentView``
                        $data in NavigationLink(destination: subContentView(model: $model, listInfo: $data, listName: $data.listName)){
                            Text(data.listName)}
                        ///``onDelete``  get the each model's idx that clicked by user and delete that in ``model.lists`` and save the change ``model.save()``
                        
                    }.onDelete{ // for delete/Users/wwc/Desktop/AssignmentMAD/AssignmentMAD/AssignmentMAD.doccarchive
                        idx in model.lists.remove(atOffsets: idx)
                        model.save()
                    }
                    /// ``.onMove`` will change the order of the list item by dragging the item into place user wants. this will only happen during editmode
                    .onMove{ // for change order
                        /// ``idx`` is for content in list ``i`` is for location (order) in list and move that the data to where user drag.
                        idx,i in model.lists.move(fromOffsets: idx, toOffset: i)
                        /// After the user move element the changed data will be saved by ``model.save()``
                        model.save()
                    }
                    
                }.navigationTitle(model.title) /// For  top title
                ///# **navigationBarItems**
                ////// ## Brief Description
                ///This part is for the nav bar on the top of the view.
                ///
                /**
                                        - Button'+' : will add new data in list with "new \(``model.lists.count``)" with empty ``checkListDetailitem`` array
                 */
                    .navigationBarItems(leading: EditButton(), trailing: Button("+"){
                        model.lists.append(checkList(listName: "new\($model.lists.count)", checkListDetail: [checkListDetailitem(name: "new", check: true)]))
                        model.save()} ) // for top menu 
            }
        }
    }
}

