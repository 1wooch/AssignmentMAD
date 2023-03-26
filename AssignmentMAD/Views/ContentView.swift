//
//  ContentView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI
/*
struct ContentView: View {
    @State var GroceryList=[["Milk",""],["Sugar",""],["Bread",""],["Cheese",""]]
    
    var body:some View{
        
        //VStack(alignment: .leading){
        NavigationView{
            List{
                    ForEach($GroceryList,id:\.self){
                        $grocery in
                        NavigationLink(destination: ListDetailView(item:grocery)){
                            ExtractedView(item: $grocery)
                        }
                    }
            }.navigationTitle("Grocery Detail")
            Spacer()
        }.padding()
    }
}
*/

struct MileStone1View:View{
    @State var grocery : [GroceryList]
    
    //change this into struct struct GroeceryList {var name:String, var check:Bool }
    
    var body:some View{
        NavigationStack{
            List{
                //Text("Grocery").font(.title2)

                ForEach($grocery){
                    $groceryitem in ExtractedView(item: $groceryitem)
                    
                }
            }.navigationTitle("Grocery")
        }
        
        
    }
}
//
//struct MileStone1ModelView:View{
//    @State var GroceryList:[GroceryList]
//    var body:some View{
//        NavigationStack{
//            List{
//                ForEach($gro) { list in
//                    /*@START_MENU_TOKEN@*/Text(list.name)/*@END_MENU_TOKEN@*/
//                }
//            }
//        }
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MileStone1View(grocery:groceryInfo)
    }
}
