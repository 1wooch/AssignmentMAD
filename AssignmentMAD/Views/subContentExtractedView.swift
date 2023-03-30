//
//  subContentExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct subContentExtractedView: View {
//    @Binding var itemName:String
//    @Binding var itemCheck:Bool
    @Binding var subContentList:checkListDetailitem
    @Binding var model:DataModel
    @State var dummyCheck:Bool

    var testImage=Image(systemName: "checkmark")
 //   let noImage=Image(systemName: " ")
//    init(itemCheck:Bool,itemName:String,model:DataModel) {
//        //self.itemCheck = self.dummyCheck
//        //self._itemCheck = itemCheck
//         dummyCheck = itemCheck
//        self.itemName=itemName
//    }
    
    var body: some View {
     
        
        HStack{
           
            Text(subContentList.name)
            Spacer()
            
            //first_check=item.check
            if(dummyCheck){
                testImage
            }
        }
        .onTapGesture{
            
            subContentList.check.toggle()
            dummyCheck.toggle()
            print("sub=\(subContentList)")
            print("dummy=\(dummyCheck)")

            //print(subContentList.check)
            model.save()
            
//            if(itemCheck){
//                itemCheck=false
//                print("cliecked1")
//               // model.save()
//            }else{
//                print("clicked2")
//                itemCheck=true
//              //  model.save()
//            }
        }

    }
}
