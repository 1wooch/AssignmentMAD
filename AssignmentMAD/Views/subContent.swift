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
    @State var originalList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)])
    @State var conditionReset:Bool=true
    @State var testname:String=""
    @State var countValue:Int=0
    var body: some View {
      
        VStack{
            EditView2(InputTitle: $listNameC, model: $model,dataStorage: $listInfoList)
            List{
                ForEach($listInfoList.checkListDetail, id:\.self){
                    item in subContentExtractedView(subContentList: item, model: $model)
                }.onDelete{
                    idx in listInfoList.checkListDetail.remove(atOffsets: idx)
                    model.save()
                }.onMove{
                    idx,i in listInfoList.checkListDetail.move(fromOffsets: idx, toOffset: i)
                    model.save()
                }
            }.navigationTitle($listNameC)
                .navigationBarItems(leading: EditButton(), trailing: HStack{
//                    if (conditionReset){
//                    Button("Reset"){
//                        countValue=listInfoList.checkListDetail.count
//
//                        for i in 0..<(listInfoList.checkListDetail.count){
//                            testname=listInfo.checkListDetail[i].name
//                            //print("testname  \(testname)")working
//                            //listInfoList.checkListDetail.removeFirst()
//                            listInfoList.checkListDetail.append(checkListDetailitem(name: testname, check: false))
//                            //listInfoList.checkListDetail[i].check=false
//                        }
//                        for j in 0..<countValue{
//                            listInfoList.checkListDetail.removeFirst()
//                        }
//                       // model.save()
//                        conditionReset=false
//                        print("test2")
//                    }
//                }else {
//                    Button("Undo Reset"){
//                        listInfoList=originalList
//                        conditionReset=true
//                    }
//                }
                Button("+"){
                    listInfoList.checkListDetail.append(checkListDetailitem(name: "new\(listInfoList.checkListDetail.count)", check: false))
                    model.save()}
                   })
            
                .onAppear{
                    listInfoList=listInfo
                    listNameC=listInfo.listName
                    originalList=listInfo
                }.onDisappear{
                    listInfo=listInfoList
                    listInfo.listName=listNameC

                    model.save()
                }
        }
    }
}


