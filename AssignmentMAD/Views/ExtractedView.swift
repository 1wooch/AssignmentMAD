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
    @Binding var item:[String]
    let testImage=Image(systemName: "checkmark")
    let testImage2=UIImage(systemName: "checkmark")
    
    var body:some View{
        //let testImage2=UIImage(systemName: "checkmark")

        HStack{
            Text(item[0])
            Spacer()
            if (item[1]=="y"){
                Image(systemName: "checkmark")
                }
            }.onTapGesture {
                if(item[1]=="y"){
                    item[1]="n"
                }else{
                    item[1]="y"
                }
            }
            
        }
            
    }


