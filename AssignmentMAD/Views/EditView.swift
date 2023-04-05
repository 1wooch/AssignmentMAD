//
//  EditView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct EditView: View {
    @Binding var item: String //title
    @Binding var model:DataModel
    @State var displayItem:String=""
    //@Binding var dataStorage:checkList
    
    //@State var listInfoList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)])
    var conditionReset:Bool=true
    
    @Environment(\.editMode) var editmode
    
    var body: some View {
        VStack{
            if(editmode?.wrappedValue == .active){
                HStack{
                    
                    
                    
                    TextField("Input",text: $displayItem)
                    Button("Cancel"){
                        displayItem=item
                    }
                    
                    
                }.onAppear{
                    displayItem=item
                    //dataStorage=model
                   // print("onappear")
                }.onDisappear{
                    item=displayItem
                    //print("disappear")

                    model.save()
                }
            }
        }
    }
}



struct EditView2: View {
    @Binding var InputTitle: String //title
    @Binding var model:DataModel
    @State var displayItem:String=""
    @Binding var dataStorage:checkList
    
    //@State var listInfoList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)])
    @State var conditionReset:Bool=true
    @State var originalList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)])
    @Environment(\.editMode) var editmode
    
    var body: some View {
            VStack{
                if(editmode?.wrappedValue == .active){
                    VStack{
                        HStack{
                            TextField("Input",text: $displayItem)
                            Button("Cancel"){
                                displayItem=InputTitle
                            }
                        }
                        if (conditionReset){
                            Button("Reset"){
                                for i in 0..<(dataStorage.checkListDetail.count){
                                    dataStorage.checkListDetail[i].check=false
                                }
                                conditionReset=false

                            }
                        }else{
                            Button("Undo Reset"){
                                dataStorage=originalList
                                conditionReset=true
                            }
                        }
                        
                    }.onAppear{
                        displayItem=InputTitle
                        originalList=dataStorage//store start data
                        // print("onappear")
                    }.onDisappear{
                        InputTitle=displayItem
                        //print("disappear")
                        
                        model.save()
                    }
                    
                    
                   
                    
                }
            }
        }
    }
    

