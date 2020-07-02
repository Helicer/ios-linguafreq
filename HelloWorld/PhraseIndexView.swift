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
        List {
            ForEach(lessons, id: \.id) { lesson in
                Text(lesson.foreignPhrase)
            }
        }
    }
}

struct PhraseIndexView_Previews: PreviewProvider {
    static var previews: some View {
        PhraseIndexView()
    }
}

// Named parameter
func printMyName(name: String) {
    print(name)
}

// Implicit parameter
func printMyNameAgain(_ name: String) {
    print(name)
}

// Renamaed parameter
func printMyNameAThirdTime(paramName name: String) {
    print(name)
}

enum Fan {
    case small
    case medium
    case large
}

func fan(_ fan: Fan) {
    
}

func main() {
    printMyName(name: "Joe")
    printMyNameAgain("Joe")
    printMyNameAThirdTime(paramName: "Joe")
    
    fan(Fan.small)
    fan(.medium)
}
