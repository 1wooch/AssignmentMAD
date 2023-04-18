//
//  AssignmentMADApp.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI

@main
struct AssignmentMADApp: App {
    @State var model:DataModel=DataModel()
    var body: some Scene {
        WindowGroup {
            //ContentView()
           // MileStone1View(model:$model)
            LoadingView(model: $model)
        }
    }
}
