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
    @State var listInfoList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)])
    @State var listNameC:String=""
    //@Binding var sublistInfo:checkListDetailitem
    var body: some View {
        
        VStack{
            EditView(item: $listNameC, model: $model)
            List{
                ForEach($listInfoList.checkListDetail, id:\.self){
                    item in subContentExtractedView(subContentList: item, model: $model,dummyCheck:item.check.wrappedValue)
                }.onDelete{
                    idx in listInfoList.checkListDetail.remove(atOffsets: idx)
                    model.save()
                }.onMove{
                    idx,i in listInfoList.checkListDetail.move(fromOffsets: idx, toOffset: i)
                    model.save()
                }
            }.navigationTitle($listNameC)
                .navigationBarItems(leading: EditButton(), trailing: Button("+"){
                    listInfoList.checkListDetail.append(checkListDetailitem(name: "new\(listInfo.checkListDetail.count)", check: false))
                    model.save()})
                .onAppear{
                    listInfoList=listInfo
                    listNameC=listInfo.listName
                }.onDisappear{
                    listInfo=listInfoList
                    listInfo.listName=listNameC

                    model.save()
                }
        }
    }
}


