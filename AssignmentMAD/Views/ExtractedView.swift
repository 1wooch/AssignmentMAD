//
//  ExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import Foundation
import SwiftUI

struct ExtractedView:View{
    @Binding var task:[String]
    var body:some View{
        HStack{
            Text(task[0])
            Spacer()
            Image(systemName: task[2])//systemName: "checkmark")
        }.onTapGesture {
            if(task[2]=="checkmark"){
                task[2]==""
            }else{
                task[2]="checkmark"
            }
        }
    }
}
