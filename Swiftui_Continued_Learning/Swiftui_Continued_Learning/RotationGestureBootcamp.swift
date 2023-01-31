//
//  RotationGestureBootcamp.swift
//  Swiftui_Continued_Learning
//
//  Created by Mahipal on 31/01/23.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    
    @State var setAngel: Angle = Angle(degrees: 0)
    @State var lastAngel: Angle = Angle(degrees: 0)

    var body: some View {
        VStack {
            Text("Demo")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(50)
                .background(Color.blue.cornerRadius(10))
                .rotationEffect(setAngel + lastAngel)
                .gesture(
                    RotationGesture()
                        .onChanged({ newAngel in
                            print("change new Angel \(newAngel)")
                            setAngel = newAngel
                        })
                        .onEnded({ newAngel in
                            print("end new Angel \(newAngel)")
                            lastAngel += setAngel
                            setAngel = Angle(degrees: 0)
                            //                            withAnimation(.spring()) {
                            //                                setAngel = Angle(degrees: 0)
                            //                            }
                        })
                )
        }
    }
}

struct RotationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureBootcamp()
    }
}
