//
//  MagnificationGestureBootcamp.swift
//  Swiftui_Continued_Learning
//
//  Created by Mahipal on 31/01/23.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {

    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0

    var body: some View {
        VStack(spacing: 10) {
//            Text("Hello, World!")
//                .font(.title)
//                .padding(40)
//                .background(Color.cyan.cornerRadius(10))
//                .scaleEffect(1 + currentAmount + lastAmount)
//                .gesture(
//                    MagnificationGesture()
//                        .onChanged{ value in
//                            currentAmount = value - 1
//                        }
//                        .onEnded{ value in
//                            lastAmount += currentAmount
//                            currentAmount = 0
//                        }	
//                )

            HStack {
                Circle()
                    .frame(width: 35, height: 35)
                Text("Demo Data")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)

            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            currentAmount = value - 1
                        })
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                currentAmount = 0
                            }
                        })
                )

            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)

            Text("this is demo caption")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal )

        }
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
