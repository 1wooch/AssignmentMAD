//
//  DataModel.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 21/3/2023.
//

import Foundation
//@State var GroceryList2=[["Milk","y"],["Sugar","n"],["Bread","y"],["Cheese","n"]]
struct GroceryList{
    var id = UUID()
    var name:String
    var check:Bool
}



var groceryInfo=[
    GroceryList(name: "Milk" , check: true),
    GroceryList(name: "Sugar",check: false),
    GroceryList(name: "Bread",check: true),
    GroceryList(name: "Cheese",check: false)
]

