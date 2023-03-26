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
    @Binding var item:GroceryList
    //@Binding var item:[String]
    let testImage=Image(systemName: "checkmark")

    var body:some View{
        HStack{
            Text(item.name)
            Spacer()
            if(item.check){
                testImage
            }
            }.onTapGesture{
                if(item.check){
                    item.check=false
                }else{
                    item.check=true
                }
            }

//        HStack{
//            Text(item[0])
//            Spacer()
//            if (item[1]=="y"){
//                testImage
//
//                }
//            }.onTapGesture {
//                if(item[1]=="y"){
//                    item[1]="n"
//                }else{
//                    item[1]="y"
//                }
//            }
            
        }
            
    }

