//
//  DetailView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI
/// # **subContentView**
///
/// ## Brief Description
/// Display  ``subContentView``
/**
    - Type: View
    - Element:
        - listNameC:
                - Type: String
                - Usage: get a title from ``MileStone1View`` element
        - model:
                - Type: ``DataModel``
                - Usage : get a title of main title from ``MileStone1View``
        - newTask:
                - Type: string
                - Usage : basic value for new element in list
        - listInfoList:
                - Type: ``checkList``
                - Usage : get a ``listInfo`` value into @State ``listInfo`` and use it for edit or change the value.

        - testImage:
                - Type: Image
                - Usage : Image for checkmark ("tick")
        - listName:
                - Type: String
                - Usage: get a name of list  from ``MileStone1View`` element

        - listInfo:
                - Type: ``checkList``
                - Usage: get a list from ``MileStone1View``.
 
 
     - Procedure:
            1. if the user open this view the @Binding value (name, data list) will be in @State.
            2. list the ``listInfoList`` using foreach loop.
            3. '+' button will make new instance in list
            4. when the page disappear all of the @State value will be put into @Binding and save model.
 
 */

struct subContentView: View {
    
    @Binding var model:DataModel
    @Binding var listInfo:checkList
    @Binding var listName:String
    
    let testImage=Image(systemName: "checkmark")
    /// Put Binding listinfo value in State to control value in list in this view
    @State var listInfoList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)])
    ///put binding title so I can edit it
    @State var listNameC:String=""
    @State var newTask:String=""
    
    
    var body: some View {
      
        VStack{
            ///for the undo re undo should use new edit view
            EditView2(InputTitle: $listNameC, model: $model,dataStorage: $listInfoList)
            VStack{
                List{
                    ForEach($listInfoList.checkListDetail, id:\.self){
                        ///link to subcontentdetail view/
                        item in subContentExtractedView(subContentList: item, model: $model)
                    }///for delete
                    .onDelete{
                        
                        idx in listInfoList.checkListDetail.remove(atOffsets: idx)
                        model.save()
                    }///for change order
                    .onMove{
                        idx,i in listInfoList.checkListDetail.move(fromOffsets: idx, toOffset: i)
                        model.save()
                    }
                    HStack{
                        Button("+"){
                            listInfoList.checkListDetail.append(checkListDetailitem(name:"\(newTask)",check: false))
                            newTask=""
                            model.save()
                        }
                        TextField("new task", text: $newTask)
                    }
                }}

        }///title
        .navigationTitle($listNameC)
        ///using h stack to display more than one button on navigationBarItem but delete another button/
            .navigationBarItems(leading: EditButton(), trailing: HStack{
            ///for new value in list/
            Button("+"){
                listInfoList.checkListDetail.append(checkListDetailitem(name: "new\(listInfoList.checkListDetail.count)", check: false))
                model.save()}
               })
            ///when view is opened copy @Binding value into @State var apply for name and list/
            .onAppear{
                listInfoList=listInfo
                /// originalList=listInfo
                listNameC=listInfo.listName
               
            }.onDisappear{
                listInfo=listInfoList
                ///convert @binding value from @State value  apply for name and list
                listInfo.listName=listNameC
                
                model.save()
            }
        
    }
}


