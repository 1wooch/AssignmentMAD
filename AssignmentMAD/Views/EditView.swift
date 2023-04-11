//
//  EditView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct EditView: View {
    @Binding var item: String //get title
    @Binding var model:DataModel
    @State var displayItem:String="" // for display title in edit mode
    //@Binding var dataStorage:checkList
    
    //@State var listInfoList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)])
    //var conditionReset:Bool=true
    
    @Environment(\.editMode) var editmode //edit mode?
    
    var body: some View {
        VStack{
            if(editmode?.wrappedValue == .active){
                HStack{
                    Image("cats").resizable().scaledToFit().frame(width: 40.0,height: 40.0)
                    TextField("Input",text: $displayItem) //generate text field
                    Button("Cancel"){ // cancel (reset) button
                        displayItem=item
                    }
                }.onAppear{ // when user access to edit view
                    displayItem=item // copy the value into @State value
                    //dataStorage=model
                   // print("onappear")
                }.onDisappear{ //when user exit the edit view
                    item=displayItem
                    //print("disappear")

                    model.save()
                }
            }
        }
    }
}



struct EditView2: View {
    @Binding var InputTitle: String //get title
    @Binding var model:DataModel // get datamodel
    @State var displayItem:String=""
    @Binding var dataStorage:checkList // get data about list
    
 
    @State var conditionReset:Bool=true // for change reset and undoreset
    @State var originalList:checkList=checkList(listName: "", checkListDetail: [checkListDetailitem(name: "", check: false)]) // add dummy list
    @Environment(\.editMode) var editmode
    
    var body: some View {
            VStack{
                if(editmode?.wrappedValue == .active){ // if editmode is true
                    VStack{
                        HStack{
                            TextField("Input",text: $displayItem)
                            Button("Cancel"){
                                displayItem=InputTitle
                            }
                        }
                        if (conditionReset){ //for the first reset
                            Button("Reset"){
                                for i in 0..<(dataStorage.checkListDetail.count){
                                    dataStorage.checkListDetail[i].check=false // make every check into false to remove check tick
                                }
                                conditionReset=false // make button cancel into Undo Reset button
                            }
                        }else{
                            Button("Undo Reset"){
                                dataStorage=originalList //change the display list into original list
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
    

