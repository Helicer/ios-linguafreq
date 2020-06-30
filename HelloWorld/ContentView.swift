//
//  ContentView.swift
//  HelloWorld
//
//  Created by Jonathan Rogivue on 2020-06-30.
//  Copyright © 2020 JRO. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isCool: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, Bob!")
                    .font(.title)
                    .foregroundColor(.blue)
                    .background(Color.black)
                    .padding()
                Text("Hello, Bob!")
                    .font(.title)
                    .foregroundColor(.blue)
                    .background(Color.black)
                    .padding()
                Toggle(isOn: $isCool) {
                    Text("Cool Toggle")
                    
                }
                Text("Are we cool? \(isCool ? "Yes" : "No")")
                
            }.navigationBarTitle(Text("Better Title"), displayMode: .inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
