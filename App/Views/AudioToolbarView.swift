import SwiftUI

struct AudioToolbarView: View {
    @ObservedObject var audioplayer: AudioPlayer


    var body: some View {
        HStack {
            Spacer()

            if audioplayer.isPlaying == false {
                Button(action: {
                    self.audioplayer.play()
                }) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
            } else {
                Button(action: {
                    self.audioplayer.pause()
                }) {
                    Image(systemName: "pause.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.gray)

    }
}

struct AudioToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        AudioToolbarView(audioplayer: AudioPlayer())
    }
}

