//
//  DetailView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct subContentView: View {
    
    @Binding var model:DataModel
    @Binding var listInfo:checkList
    let testImage=Image(systemName: "checkmark")
    
    //@Binding var sublistInfo:checkListDetailitem
    var body: some View {
        VStack{
            //Text("\(listInfo.listName)")//title
            //Text("\(listInfo.checkListDetail[0].name)") //first value
            //Text("\(listInfo.checkListDetail[1].name)") // second value
            EditView(item: $listInfo.listName, model: $model)
            List{
                ForEach(listInfo.checkListDetail, id:\.self){
                    item in HStack{
                        Text(item.name)
                        Spacer()
                        if(item.check){
                            testImage
                        }
                    }
                }
            }

        }
    }
}


