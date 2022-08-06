//
//  MotionAnimationVIew.swift
//  Africa
//
//  Created by Zardasht on 8/2/22.
//

import SwiftUI

struct MotionAnimationVIew: View {
    //MARK: Properety
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimation: Bool = false
    //MARK: Functions
    func randomCordinate(max:CGFloat) -> CGFloat {
        return CGFloat.random(in: 0 ... max)
    }
    func randomeSize() -> CGFloat {
        return CGFloat.random(in: 10 ... 300)
    }
    
    func randomScale() -> CGFloat {
        return CGFloat.random(in: 0.1 ... 2.0)
    }
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.025 ... 1.0)
    }
    func randomDelay() -> Double {
        return Double.random(in: 0 ... 2)
    }
    
    //MARK: Body
    var body: some View {
        GeometryReader { geomery in
            ZStack {
                ForEach(0 ... randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomeSize(), height:randomeSize() , alignment: .center)
                        .scaleEffect(isAnimation ?  randomScale() : 1)
                        .position(x: randomCordinate(max: geomery.size.width), y: randomCordinate(max: geomery.size.height))
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        ,value: isAnimation
                        )
                        .onAppear {
                            isAnimation = true
                        }
                }//loop
             }//Zstack
            .drawingGroup()
          }//geometry
    }
}
//MARK: Preview
struct MotionAnimationVIew_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationVIew()
    }
}
