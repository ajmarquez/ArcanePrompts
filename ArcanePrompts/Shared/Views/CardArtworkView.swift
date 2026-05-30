import SwiftUI

struct CardArtworkView: View {
    enum PresentationMode {
        case contained
        case immersive
    }

    let assetName: String
    var isReversed = false
    var presentationMode: PresentationMode = .contained

    var body: some View {
        switch presentationMode {
        case .immersive:
            GeometryReader { proxy in
                ZStack {
                    Color.black

                    Image(assetName)
                        .resizable()
                        .scaledToFit()
                        .rotationEffect(.degrees(isReversed ? 180 : 0))
                        .animation(nil, value: isReversed)
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
            }

        case .contained:
            Image(assetName)
                .resizable()
                .scaledToFit()
                .rotationEffect(.degrees(isReversed ? 180 : 0))
                .animation(nil, value: isReversed)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(AppTheme.parchment.opacity(0.35), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.35), radius: 30, y: 16)
        }
    }
}
