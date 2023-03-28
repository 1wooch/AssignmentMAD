//
//  ContentView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI

struct MileStone1View:View{
    @Binding var model:DataModel

    var body:some View{
        NavigationView{
            VStack{
                EditView(item:$model.title,model:$model)
                List{
                    ForEach($model.lists,id:\.self){
                        $data in NavigationLink(destination: DetailView(item:$data,model:$model)){
                            Text("\(data.listname),\(data.checkListDetail.length)")
                        }
                    }.onDelete{
                        idx in model.lists.remove(atOffsets: idx)
                        model.save()
                    }.onMove{
                        idx,i in model.lists.move(fromOffsets: idx, toOffset: i)
                        model.save()
                    }
                }
            }.navigationTitle(model.title)
                .navigationBarItems(leading: EditButton(), trailing: Button("+"){
                    model.lists.append(checkList(listName: "new", checkListDetail: [[]]))
                })
        }
    }
}

