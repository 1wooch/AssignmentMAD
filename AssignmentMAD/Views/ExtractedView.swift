//
//  ExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import Foundation
import SwiftUI

struct ExtractedView:View{
    @Binding var grocery:[String]

    var body:some View{
        HStack{
            Text(grocery[0])
            Spacer()
            Image(systemName: grocery[1])//systemName: "checkmark")
        }.onTapGesture {
            if(grocery[1]=="checkmark"){
                grocery[1]==""
            }else{
                grocery[1]="checkmark"
            }
        }
    }
}
