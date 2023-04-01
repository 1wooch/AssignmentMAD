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
    @State var dummyCheck:Bool=false
    @State var dummyName:String=""
    var testImage=Image(systemName: "checkmark")
    
    var body: some View {
        HStack{
            NavigationLink(destination: subConDetailView(tname:$dummyName , model: $model)){
                Text(dummyName)
                Spacer()
                if(dummyCheck){
                    testImage
                }
            }
            .onTapGesture{
                //subContentList.check.toggle()
                dummyCheck.toggle()
                model.save()
            }.onAppear{
                dummyName=subContentList.name
                dummyCheck=subContentList.check
            }.onDisappear{
                subContentList.name=dummyName
                subContentList.check=dummyCheck
                model.save()
            }
        }

    }
}

struct subConDetailView:View{
    @Binding var tname:String
    @Binding var model:DataModel
    @State var tnameE:String=""
    var body: some View{
        HStack{
            Text("\(tnameE)")
            EditView(item: $tnameE, model: $model)
        }.navigationBarItems(trailing: EditButton()).onAppear{
            tnameE=tname
        }.onDisappear{
            tname=tnameE
        }.padding()
       
    }
}
