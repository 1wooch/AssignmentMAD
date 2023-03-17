//
//  ContentView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI

struct ContentView: View {
    @State var GroceryList=[["Milk",""],["Sugar",""],["Bread",""],["Cheese",""]]
    var body: some View {
       NavigationView(
        List{
            ForEach($GroceryList,id:\.self){
                $grocery in NavigationLink(destination:ListDetailView(item:$grocery))
            }
        }.navigationTitle("Grocery")
        Spacer()
       ).padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
