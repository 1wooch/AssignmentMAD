//
//  EditView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI
/// # **EditView**
///
/// ## Brief Description
/// Display Edit view for ContentView
/**
    - Type: View
    - Element:
        - item:
                - Type: @Binding var
                - Usage: get a datamodel from model side.
        - model:
                - Type: string
                - Usage : get a title of main title from ``MileStone1View``
        - displayItem:
                - Type: string
                - Usage : get a ``item`` value in this
 
     - Procedure:
            1. Get the main title and model from mainview
            2. put main title (item) into ``displayItem`` and will make change with onlt ``displayItem``
            3. Once the user input text in ``TextField`` and click 'Done' Button it will apply for ``item``
            4. 'cancel'  will bringback orginal ``item`` value into ``displayItem``
            5. ``.onappear`` will happen when the view open and store ``item`` value in ``displayItem``
            6. ``.disappear`` will happen when the view closed and store ``displayItem`` value in ``item`` and ``model.save`` save the data
 */
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

/// # **EditView2**
///
/// ## Brief Description
/// Display Edit view for  ``subContentView``
/**
    - Type: View
    - Element:
        - InputTitle:
                - Type: String
                - Usage: get a title from ``subContentView`` element
        - model:
                - Type: string
                - Usage : get a title of main title from ``subContentView``
        - displayItem:
                - Type: string
                - Usage : store ``InputTitle`` as @State value
        - dataStorage:
                - Type: string
                - Usage : get a data information from ``subContentView``
        - conditionReset:
                - Type: Bool
                - Usage : to present 'reset' & 'undo reset' button. Every time user click the value will be switched
        - originalList:
                - Type: ``checkList``
                - Usage : get a ``dataStorage`` value into @State ``originalList`` and use it for edit or change the value.

 
     - Procedure:
            1. user can change the name of task by entering new name in textbox.
            2. by clicking 'reset' button, all of the tick will be gone.
            3. After user click the 'undo' button will be changed into 'undo reset' and original data will be display again.
 */

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
                }
                .onAppear{
                    displayItem=InputTitle
                    originalList=dataStorage//store start data
                    // print("onappear")
                }.onDisappear{
                    InputTitle=displayItem
                    //print("disappear")
                    
                    model.save()
                }.navigationBarItems(trailing: HStack{
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
                })
            }
        }
    }
    
}
