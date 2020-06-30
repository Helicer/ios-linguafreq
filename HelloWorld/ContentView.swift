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
    @State var isAlertPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetailView(name: "Some detail", bigTitle: isCool)) {
                    Text("Go to Detail view")
                }
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
                Text("Is alert presented: \(isAlertPresented ? "Yes" : "No")")
                Button(action: {
                    self.isAlertPresented = true
                    funPrint("My debug info")
                    
                }) {
                    Text("Click to show alert")
                    
                }
                
            }
            .navigationBarTitle(Text("Better Title"), displayMode: .inline)
            
        }.alert(isPresented: $isAlertPresented) {
            Alert(title: Text("Alert me"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func funPrint(_ string: String, filePath: String = #file) {
    #if DEBUG
    print("\(filePath): \(string)")
    #endif
}
