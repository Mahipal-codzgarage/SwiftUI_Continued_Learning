//
//  GeometryReaderBootcamp.swift
//  Swiftui_Continued_Learning
//
//  Created by Mahipal on 31/01/23.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {

        // demo 1
        //        GeometryReader { proxy in
        //            HStack(spacing: 0) {
        //                Rectangle()
        //                    .fill(Color.red)
        //                    .frame(width: proxy.size.width * 0.66)
        //
        //                Rectangle()
        //                    .fill(Color.blue)
        //            }
        //        }
        //        .ignoresSafeArea()

        // demo 2
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { item in
                    GeometryReader { proxy in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(Angle(degrees: getPercentage(geo: proxy)),
                                              axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 200)
                    .padding()
                }
            }
        }
    }

    func getPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return Double(1 - (currentX / maxDistance))
    }
}

struct GeometryReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderBootcamp()
    }
}
