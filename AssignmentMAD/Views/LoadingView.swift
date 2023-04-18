//
//  LoadingView.swift
//  AssignmentMAD
//
//  Created by 최원우 on 11/4/2023.
//

import SwiftUI

struct LoadingView: View {
    @State var isActive:Bool=false
    @Binding var model:DataModel // get datamodel

    var body: some View {
        ZStack{
            if self.isActive{
                MileStone1View(model:$model)
            }else{
                Color.black.ignoresSafeArea()

                //Rectangle()//.background(Color.purple)
                Image("cats").resizable().scaledToFit()//.background(Color.purple)//.frame(width: 300,height: 300)
            }
        }//.background(Color.black)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline:.now()+1.5){
                withAnimation{
                    self.isActive=true
                }
            }
        }
    }
}

