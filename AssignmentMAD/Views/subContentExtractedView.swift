//
//  subContentExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

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
 //this part is kind of need to be deleted  made it too complicate?
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
