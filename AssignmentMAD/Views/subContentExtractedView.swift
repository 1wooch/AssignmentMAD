//
//  subContentExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct subContentExtractedView: View {
    @Binding var itemName:String
    @Binding var itemCheck:Bool
    @Binding var model:DataModel
    //@State var dummyCheck:Bool
    
    let testImage=Image(systemName: "checkmark")
    let noImage=Image(systemName: " ")
//    init(itemCheck: Binding<Bool>) {
//        self._itemCheck=dummyCheck
//        self._itemCheck = itemCheck
//        }
    var body: some View {
     
        
        HStack{
            Text(itemName)
            Spacer()
            
            //first_check=item.check
            if(itemCheck){
                testImage
            }
        }
        //.onTapGesture{
            
            //self.dummyCheck.toggle()
            //model.save()
//            if(itemCheck){
//                itemCheck=false
//                print("cliecked1")
//                model.save()
//            }else{
//                print("clicked2")
//                itemCheck=true
//                model.save()
//            }
//        }

    }
}
