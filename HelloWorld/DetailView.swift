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
                Text(name).navigationBarTitle(Text("Big Title (Cool = True)"), displayMode: .large)
            } else {
                Text(name).navigationBarTitle(Text("Inline Title (Cool = False)"), displayMode: .inline)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Only shown when in XCode Preview
        DetailView(name: "Detail view info (set for preview)", bigTitle: true)
    }
}
