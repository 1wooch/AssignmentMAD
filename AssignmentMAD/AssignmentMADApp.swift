//
//  AssignmentMADApp.swift
//  AssignmentMAD
//
//  Created by Wonwoo Choi on 17/3/2023.
//

import SwiftUI
/// # **```AssignmentMADApp```**
///
/// ## Brief Description
/// if the program run this will be run first.
/**
    - Type: struct
        - Element:
            - DataModel
                - Type: @State var
                - Usage :get a dataModel from Model
                    
     - Procedure:
            1. Get data model from DataModel in ``SwiftUIView``
            2. load the ``LoadingView()`` and  send datamodel through loadingView to send to contentview.
 */
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
