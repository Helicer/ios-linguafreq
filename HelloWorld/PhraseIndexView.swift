//
//  PhraseIndexView.swift
//  HelloWorld
//
//  Created by Jonathan Rogivue on 2020-07-02.
//  Copyright © 2020 JRO. All rights reserved.
//

import SwiftUI

struct PhraseIndexView: View {
    
    

    var body: some View {
        ScrollView {
            VStack {
                ForEach(lessons, id: \.id) { lesson in
                    Text(lesson.foreignPhrase)
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
