//
//  DetailView.swift
//  HelloWorld
//
//  Created by Jonathan Rogivue on 2020-06-30.
//  Copyright © 2020 JRO. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var name: String
    var bigTitle: Bool
    
    var body: some View {
        Group {
            if bigTitle {
                Text(name).navigationBarTitle(Text("BIG TITLE"), displayMode: .large)
            } else {
                Text(name).navigationBarTitle(Text("INLINE TITLE"), displayMode: .inline)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name: "My details", bigTitle: true)
    }
}
