//
//  subContentExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI
/// # **subContentExtractedView**
///
/// ## Brief Description
/// Display  ``subContentExtractedView``
/**
    - Type: View
    - Element:
        - model:
                - Type: ``DataModel``
                - Usage : get a title of main title from ``MileStone1View``
        - testImage:
                - Type: Image
                - Usage : Image for checkmark ("tick")
        - subContentList:
                - Type: ``checkListDetailitem``
                - Usage: get a list from ``MileStone1View``.
 
 
     - Procedure:
            1. Display ``checkListDetailitem`` value name and boolean as image.
 */
struct subContentExtractedView: View {

    @Binding var subContentList:checkListDetailitem
    @Binding var model:DataModel
    //@State var dummyCheck:Bool=false
    //@State var dummyName:String=""
    var testImage=Image(systemName: "checkmark") //for tick image
    
    var body: some View {
        HStack{
            NavigationLink(destination: subConDetailView(tname:$subContentList.name , model: $model)){ //link to subcondetail display
                Text(subContentList.name)
                Spacer()
                if(subContentList.check){
                    testImage
                }
            }
            .onTapGesture{ //whenever user click the title -> could be change into array itself
                subContentList.check.toggle()
                //model.save()
            }.onDisappear{
                model.save()
            }
        }

    }
}
/// # **subContentExtractedView**
///
/// ## Brief Description
/// Display  ``subConDetailView``
/**
    - Type: View
    - Element:
        - model:
                - Type: ``DataModel``
                - Usage : get a title of main title from ``MileStone1View``
        - tname:
                - Type: String
                - Usage : get task name from ``subContentExtractedView``
        - tnameE:
                - Type: String
                - Usage: get ``tname`` value in ``tnameE`` as @State value
 
 
     - Procedure:
            1. Display ``tnameE`` value name
            2. Once the Editmode is active the textbox will be shown
            3. User can change the ``tnameE`` by entering value in textbox.
 */

struct subConDetailView:View{
    @Binding var tname:String
    @Binding var model:DataModel
    @State var tnameE:String=""
    var body: some View{
        HStack{
            Text("\(tnameE)") // display name
            EditView(item: $tnameE, model: $model) // for the edit mode
        }.navigationBarItems(trailing: EditButton()).onAppear{
            tnameE=tname
        }.onDisappear{
            tname=tnameE
        }.padding()
       
    }
}
