//
//  ScrollviewReaderBootcamp.swift
//  Swiftui_Continued_Learning
//
//  Created by Mahipal on 31/01/23.
//

import SwiftUI

struct ScrollviewReaderBootcamp: View {

    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""

    var body: some View {
        VStack {

            TextField("Enter index no...", text: $textFieldText)
                .frame(height: 55)
                .border(.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)

            Button("Scroll") {
                    if let getIndex = Int(textFieldText) {
                        scrollToIndex = getIndex
                }
            }

            // go to specif index in for each using scroll view
//            ScrollView {
//                ScrollViewReader { proxy in
//                    ForEach(0..<50) { item in
//                        Text("Index no: \(item)")
//                            .font(.headline)
//                            .frame(height: 200)
//                            .frame(maxWidth: .infinity)
//                            .background(Color.cyan)
//                            .cornerRadius(10)
//                            .shadow(radius: 10)
//                            .padding()
//                            .id(item)
//                    }
//                    .onChange(of: scrollToIndex) { newValue in
//                        withAnimation(.spring()) {
//                            proxy.scrollTo(newValue, anchor: .top)
//                        }
//                    }
//                }
//            }

            // go to specif index in list view
            ScrollViewReader { proxy in
                List {
                    ForEach(0..<50) { item in
                        Text("Index no: \(item)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.cyan)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(item)
                    }
                    .onChange(of: scrollToIndex) { newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                }
                .listStyle(.plain)
            }
        }
    }
}

struct ScrollviewReaderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollviewReaderBootcamp()
    }
}
