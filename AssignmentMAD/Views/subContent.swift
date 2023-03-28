//
//  DetailView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct subContentView: View {
    
    @Binding var model:DataModel
    @Binding var listInfo:checkListDetailitem
    //@Binding var sublistInfo:checkListDetailitem
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach($listInfo , id: \.self){
                        $item in NavigationLink(destination: subDetailView(model: $model, detailItem: $item)){
                            Text("\(item.name)")
                        }
                    }.onDelete{
                        idx in listInfo.checkListDetail.remove(atOffsets:idx)
                        model.save()
                    }.onMove
                    {
                        idx,i in listInfo.checkListDetail.move(fromOffsets: idx, toOffset: i)
                        model.save()
                    }
                }
            }
        }
    }
}


