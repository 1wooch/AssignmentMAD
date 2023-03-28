//
//  ListDetailView.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import Foundation
import SwiftUI

struct ListDetailView: View{
    @State var item:[String]
    var body: some View{
        VStack{
            Text(item[0])
            Image(systemName:item[1])
        }.navigationTitle("Detail about Grocery")
    }
}
