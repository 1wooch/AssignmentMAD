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
    @State var dummyCheck:Bool
    var testImage=Image(systemName: "checkmark")
    
    var body: some View {
        HStack{
            NavigationLink(destination: subConDetailView(tname:$subContentList.name , model: $model)){
                Text(subContentList.name)
                Spacer()
                if(dummyCheck){
                    testImage
                }
            }
            .onTapGesture{
                
                subContentList.check.toggle()
                dummyCheck.toggle()
                model.save()
            }
            
            
            //print("sub=\(subContentList)")
            //print("dummy=\(dummyCheck)")

            
//            if(subContentList.check){
//                subContentList.check=false
//                print("cliecked1")
//                model.save()
//            }else{
//                subContentList.check=true
//                model.save()
//            }
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
            model.save()
        }.onDisappear{
            tname=tnameE
            model.save()
        }.padding()
       
    }
}
