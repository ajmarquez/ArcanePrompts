import SwiftUI

struct CardArtworkView: View {
    enum PresentationMode {
        case contained
        case immersive
    }

    let assetName: String
    var presentationMode: PresentationMode = .contained

    #if os(iOS)
    private let immersiveZoomScale: CGFloat = 1.08
    #endif

    var body: some View {
        switch presentationMode {
        case .immersive:
            GeometryReader { proxy in
                ZStack {
                    Color.black

                    Image(assetName)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                        #if os(iOS)
                        .scaleEffect(immersiveZoomScale)
                        #endif
                }
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
            }

        case .contained:
            Image(assetName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 22, style: .continuous)
                        .stroke(AppTheme.parchment.opacity(0.35), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.35), radius: 30, y: 16)
        }
    }
}
