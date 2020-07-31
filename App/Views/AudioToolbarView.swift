import SwiftUI

struct AudioToolbarView: View {
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "play.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
            Spacer()
        }
        .padding()
        .background(Color.gray)

    }
}

struct AudioToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        AudioToolbarView()
    }
}

