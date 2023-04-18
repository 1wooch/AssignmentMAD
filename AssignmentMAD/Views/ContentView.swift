//
//  ContentView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI

struct MileStone1View:View{
    @Binding var model:DataModel // get datamodel
    var body:some View{
        NavigationView{
            VStack{
                EditView(item:$model.title , model : $model) // lead to normal edit view (only for title)
                List{
                    ForEach($model.lists,id:\.self){ // all the data in model.list display and make it lead to subContentView link
                        $data in NavigationLink(destination: subContentView(model: $model, listInfo: $data, listName: $data.listName)){
                            Text(data.listName)}
                    }.onDelete{ // for delete/Users/wwc/Desktop/AssignmentMAD/AssignmentMAD/AssignmentMAD.doccarchive
                        idx in model.lists.remove(atOffsets: idx)
                        model.save()
                    }.onMove{ // for change order
                        idx,i in model.lists.move(fromOffsets: idx, toOffset: i)
                        model.save()
                    }
                }.navigationTitle(model.title) // top title
                    //.toolbar(Button( Image:"trash"){
                      //  print("")
                    //})
                    .navigationBarItems(leading: EditButton(), trailing: Button("+"){
                        model.lists.append(checkList(listName: "new\($model.lists.count)", checkListDetail: [checkListDetailitem(name: "new", check: true)]))
                        model.save()} ) // for top menu 
            }
        }
    }
}

