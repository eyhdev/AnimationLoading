//
//  ContentView.swift
//  AnimationLoading
//
//  Created by eyh.mac on 4.08.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var moveRightLeft = false
    let screenFrame = Color(.systemBackground)
    
    var body: some View {
        ZStack{
            screenFrame
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                ZStack{
                    Capsule()
                        .frame(width: 128, height: 6, alignment: .center)
                        .foregroundColor(Color(.systemGray4))
                    Capsule()
                        .clipShape(Rectangle().offset(x: moveRightLeft ? 80 : -80))
                        .frame(width: 100, height: 6, alignment: .leading)
                        .foregroundColor(Color(.systemBlue))
                        .offset(x: moveRightLeft ? 14 : -14)
                        .animation(Animation.easeInOut(duration: 0.5).delay(0.2).repeatForever(autoreverses: true))
                        .onAppear{
                            moveRightLeft.toggle()
                        }
                }
                Text("Loading...")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
