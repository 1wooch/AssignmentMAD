//
//  LoadingView.swift
//  AssignmentMAD
//
//  Created by 최원우 on 11/4/2023.
//

import SwiftUI
/// # **LoadingView**
///
/// ## Brief Description
/// Display  ``LoadingView``
/**
    - Type: View
    - Element:
        - model:
                - Type: ``DataModel``
                - Usage : get a title of main title from ``MileStone1View``
        - isActive:
                - Type: Bool
                - Usage : get task name from ``subContentExtractedView``

     - Procedure:
            1. Display cat image on view
            2. Once the ``MileStone1View`` load all of the data load that page.
 */

struct LoadingView: View {
    @State var isActive:Bool=false
    /// get datamodel/
    @Binding var model:DataModel

    var body: some View {
        ZStack{
            if self.isActive{
                MileStone1View(model:$model)
            }else{
                Color.black.ignoresSafeArea()

                Image("cats").resizable().scaledToFit()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline:.now()+1.5){
                withAnimation{
                    self.isActive=true
                }
            }
        }
    }
}

