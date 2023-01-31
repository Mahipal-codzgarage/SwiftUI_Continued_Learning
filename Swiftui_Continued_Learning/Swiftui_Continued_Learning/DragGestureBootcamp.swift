//
//  DragGestureBootcamp.swift
//  Swiftui_Continued_Learning
//
//  Created by Mahipal on 31/01/23.
//

import SwiftUI

struct DragGestureBootcamp: View {

    @State var setOffset: CGSize = .zero

    var body: some View {
        ZStack {
            // Demo 1
//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: 100, height: 100)
//                .offset(setOffset)
//                .gesture(
//                    DragGesture()
//                        .onChanged({ newValue in
//                            withAnimation {
//                                setOffset = newValue.translation
//                            }
//                        })
//                        .onEnded({ newValue in
//                            withAnimation {
//                                setOffset = .zero
//                            }
//                        })
//                )

            VStack {
                Text("offset \(setOffset.width)")
                Spacer()
            }

            // Demo 2
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(setOffset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged({ newValue in
                            withAnimation {
                                setOffset = newValue.translation
                            }
                        })
                        .onEnded({ newValue in
                            withAnimation {
                                setOffset = .zero
                            }
                        })
                )
        }
    }

    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        print("max value \(max)")

        let currentAmount = abs(setOffset.width)
        print("current amount \(currentAmount)")

        let percentage = currentAmount / max
        print("percentage \(percentage)")

        return 1.0 - min(percentage, 0.5) * 0.5
    }

    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        print("max value \(max)")

        let currentAmount = setOffset.width
        print("current amount \(currentAmount)")

        let percentage = currentAmount / max
        print("percentage \(percentage)")

        let percentageAsDouble = Double(percentage)

        let maxAngel: Double = 10

        return percentageAsDouble * maxAngel
    }

}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
