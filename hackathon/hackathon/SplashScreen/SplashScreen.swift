//
//  SplashScreen.swift
//  hackathon
//
//  Created by vano Kvakhadze on 05.07.24.
//


import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.4
    
    var body: some View {
        if isActive {
            ContentView()
        }else {
            
            VStack{
                VStack{
                    Image(.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 215, height: 215)
                        .cornerRadius(25)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.3)){
                        self.size = 1.3
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    self.isActive = true
                    
                }
            }
        }
    }
}

#Preview {
    SplashScreen()
}


#Preview {
    SplashScreen()
}
