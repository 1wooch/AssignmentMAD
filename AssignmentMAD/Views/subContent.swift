//
//  DetailView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct subContentView: View {
    
    @Binding var model:DataModel
    @Binding var listInfo:checkList
    @Binding var listName:String
    
    let testImage=Image(systemName: "checkmark")
    @State var listInfoList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)]) // Put Binding listinfo value in State to control value in list in this view
    @State var listNameC:String="" //put binding title so I can edit it
   
    var body: some View {
      
        VStack{
            EditView2(InputTitle: $listNameC, model: $model,dataStorage: $listInfoList) //for the undo re undo should use new edit view
            List{
                ForEach($listInfoList.checkListDetail, id:\.self){
                    item in subContentExtractedView(subContentList: item, model: $model) //link to subcontentdetail view
                }.onDelete{
                    idx in listInfoList.checkListDetail.remove(atOffsets: idx) //for delete
                    model.save()
                }.onMove{ //for change order
                    idx,i in listInfoList.checkListDetail.move(fromOffsets: idx, toOffset: i)
                    model.save()
                }
            }.navigationTitle($listNameC) //title
                .navigationBarItems(leading: EditButton(), trailing: HStack{ //using h stack to display more than one button on navigationBarItem but delete another button

                Button("+"){ //for new value in list
                    listInfoList.checkListDetail.append(checkListDetailitem(name: "new\(listInfoList.checkListDetail.count)", check: false))
                    model.save()}
                   })
            
                .onAppear{ //when view is opened copy @Binding value into @State var apply for name and list
                    listInfoList=listInfo
                    listNameC=listInfo.listName
                   // originalList=listInfo
                }.onDisappear{
                    listInfo=listInfoList
                    listInfo.listName=listNameC
                    //convert @binding value from @State value  apply for name and list

                    model.save()
                }
        }
    }
}


