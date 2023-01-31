//
//  LongpressGestureBootcamp.swift
//  Swiftui_Continued_Learning
//
//  Created by Mahipal on 31/01/23.
//

import SwiftUI

struct LongpressGestureBootcamp: View {

    @State var isComplete: Bool = false

    var body: some View {
        VStack {
            Text(isComplete ? "Completed" : "Not completed")
                .padding()
                .padding(.horizontal)
                .background(isComplete ? Color.green : Color.gray)
                .cornerRadius(10)
                .onLongPressGesture(minimumDuration: 2) {
                    //isComplete.toggle()
                }

            Rectangle()
                .fill(Color.blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)

            HStack {
                Text("Click Here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            isComplete.toggle()
                        }
                    }

                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {

                    }
            }
        }
    }
}

struct LongpressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongpressGestureBootcamp()
    }
}
