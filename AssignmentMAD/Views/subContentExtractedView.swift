//
//  subContentExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct subContentExtractedView: View {
    @State var itemName:String
    @State var itemCheck:Bool
    
    let testImage=Image(systemName: "checkmark")

    var body: some View {
        HStack{
            Text(itemName)
            Spacer()
            
            //first_check=item.check
            
            if(itemCheck){
                testImage
            }
        }.onTapGesture{
            if(itemCheck){
                itemCheck=false
            }else{
                itemCheck=true
            }
        }

    }
}
