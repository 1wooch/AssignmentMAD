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
    let testImage=Image(systemName: "checkmark")
    @State var test_value:Array=[]
    //@Binding var sublistInfo:checkListDetailitem
    var body: some View {
        
        VStack{
            //Text("\(listInfo.listName)")//title
            //Text("\(listInfo.checkListDetail[0].name)") //first value
            //Text("\(listInfo.checkListDetail[1].name)") // second value
            EditView(item: $listInfo.listName, model: $model)
            List{
                ForEach($listInfo.checkListDetail, id:\.self){
                    item in subContentExtractedView(subContentList: item, model: $model,dummyCheck:item.check.wrappedValue)
                }.onDelete{
                    idx in listInfo.checkListDetail.remove(atOffsets: idx)
                    model.save()
                }.onMove{
                    idx,i in listInfo.checkListDetail.move(fromOffsets: idx, toOffset: i)
                    model.save()
                }
            }.navigationTitle(listInfo.listName)
                .navigationBarItems(leading: EditButton(), trailing: Button("+"){
                    listInfo.checkListDetail.append(checkListDetailitem(name: "new\(listInfo.checkListDetail.count)", check: false))
                    model.save()} )
        }
    }
}


