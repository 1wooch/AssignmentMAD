//
//  EditView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 28/3/2023.
//

import SwiftUI

struct EditView: View {
    @Binding var model:DataModel
    @Binding var item:String //title
    @State var displayItem:String=""
    @Environment(\.editMode) var editmode
    
    var body: some View {
        VStack{
            if(editmode?.wrappedValue == .active){
                HStack{
                    TextField("Enter New Title",text: $displayItem)
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
