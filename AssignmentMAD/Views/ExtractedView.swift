//
//  ExtractedView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import Foundation
import SwiftUI
/*
struct ExtractedView:View{
    @Binding var item:[String]

    var body:some View{
        HStack{
            Text(item[0])
            Spacer()
            Image(systemName: item[1])//systemName: "checkmark")
        }.onTapGesture {
            if(item[1]=="checkmark"){
                item[1]==""
            }else{
                item[1]="checkmark"
            }
        }
    }
}
*/
struct ExtractedView:View{
    //var item:String
    @State var item:[String]
    var body:some View{
        HStack{
            Text(item[0])
            Spacer()
            //Text(item[1])
            
            Image(systemName: item[1]).onTapGesture {
                if(item[1]=="checkmark"){
                    item[1]="."
                }else{
                    item[1]="checkmark"
                }            }
            
        }
    }
}
