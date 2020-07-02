//
//  PhraseIndexView.swift
//  HelloWorld
//
//  Created by Jonathan Rogivue on 2020-07-02.
//  Copyright © 2020 JRO. All rights reserved.
//

import SwiftUI

struct PhraseIndexView: View {
    let items = (1..<100).map { "\($0) item" }
    
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
