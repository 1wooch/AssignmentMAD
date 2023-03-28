//
//  ContentView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI

struct MileStone1View:View{
    @State var goceryModel : [GroceryList]

    var body:some View{
        NavigationStack{
            List{
                //Text("Grocery").font(.title2)

                ForEach($goceryModel){
                    $groceryitem in ExtractedView(item: $groceryitem)
                    
                }
            }.navigationTitle("Grocery")
        }
        
        
    }
}

