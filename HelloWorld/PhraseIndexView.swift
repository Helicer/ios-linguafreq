//
//  PhraseIndexView.swift
//  HelloWorld
//
//  Created by Jonathan Rogivue on 2020-07-02.
//  Copyright © 2020 JRO. All rights reserved.
//

import SwiftUI

struct PhraseIndexView: View {
    var items = (1..<100).map { index in
        "\(index) item"
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }
            .frame(width: 200)
            .background(Color.blue)
        }
    }
}

struct PhraseIndexView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseIndexView()
    }
}

func foo() {
    let strings = ["One", "Two", "Three"]
    
    // More modern way
    strings.forEach { string in
        print(string)
    }
    
    // C-style way
    for string in strings {
        print(string)
    }
    
    // Example mapping to a constant (modern way of doing this)
    let mapFoo = strings.map { string in
        "awesome \(string)"
    }
    print(mapFoo)
   
    // Best version - shorthand parameter name
    let mapFoo2 = strings.map { "awesome \($0)" }
    print(mapFoo2)
    
    // Appending with foreach (not preferred)
    var forEachFoo = [String]()
    strings.forEach { string in
        forEachFoo.append("awesome \(string)")
    }
    
    let _ = strings.sorted { (lhs, rhs) -> Bool in
        lhs < rhs
    }
    let _ = strings.sorted { $0 < $1 }
}
