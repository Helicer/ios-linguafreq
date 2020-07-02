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
                NavigationLink(destination: DetailView(name: "Some detail (passed in from Home view)", bigTitle: isCool)) {
                    Text("Go to Detail view")
                }
                Text("Formatted text")
                    .font(.title)
                    .foregroundColor(.blue)
                    .background(Color.black)
                    .padding()
                Divider()
                Toggle(isOn: $isCool) {
                    Text("Cool Toggle")
                }
                Text("Are we cool? \(isCool ? "Yes" : "No")")
                Divider()
                Text("Is alert presented: \(isAlertPresented ? "Yes" : "No")")
                Button(action: {
                    self.isAlertPresented = true
                    funPrint("My debug info")
                    
                }) {
                    Text("Click to show alert")
                    
                }
                
            }
            .navigationBarTitle(Text("Home view"), displayMode: .inline)
            
        }.alert(isPresented: $isAlertPresented) {
            Alert(title: Text("This is an alert."))
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
