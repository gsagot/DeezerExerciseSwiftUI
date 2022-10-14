//
//  AnimationView.swift
//  DeezerExerciseSwiftUI
//
//  Created by Gilles Sagot on 14/10/2022.
//

import SwiftUI

struct AnimationView: View {
    
    @State var rotation = 1.0
    
    var body: some View {
        ZStack{
            Image("vinyle")
                .resizable()
                .scaledToFill()
            VStack{
                Text("deezer")
                Image(systemName: "speaker.wave.3")
                    .font(.largeTitle)
                Text("api test")
                
            }
            .onAppear(){
                rotation += 360
            }
            .foregroundColor(.pink)
            .font(.dzrTitle)
            .rotationEffect(Angle(degrees: rotation))
            .animation(
                .linear(duration: 3)
                .repeatForever(autoreverses: false),
                value: rotation
            )
            
            Circle()
                .fill(.black)
                .scaleEffect(0.03)
        }
        
    }
    
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
