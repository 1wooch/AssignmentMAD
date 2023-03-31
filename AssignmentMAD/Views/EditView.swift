//
//  EditView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct EditView: View {
    @Binding var item: String //title
    @Binding var model:DataModel
    @State var displayItem:String=""
    @Environment(\.editMode) var editmode
    
    var body: some View {
        VStack{
            if(editmode?.wrappedValue == .active){
                HStack{
                    TextField("Input",text: $displayItem)
                    Button("Cancel"){
                        displayItem=item
                    }
                }.onAppear{
                    displayItem=item
                    print("onappear")
                }.onDisappear{
                    item=displayItem
                    print("disappear")

                    model.save()
                }
            }
        }
    }
}


