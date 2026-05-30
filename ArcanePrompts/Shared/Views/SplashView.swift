import SwiftUI

struct SplashView: View {
    @AppStorage("cardBackDesign") private var cardBackDesignRawValue = CardBackDesign.defaultDesign.rawValue

    private var cardBackDesign: CardBackDesign {
        CardBackDesign(rawValue: cardBackDesignRawValue) ?? .defaultDesign
    }

    var body: some View {
        ZStack {
            CardArtworkView(assetName: cardBackDesign.assetName, presentationMode: .immersive)
                .ignoresSafeArea()

            LinearGradient(
                colors: [.black.opacity(0.15), .black.opacity(0.65)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Arcane Prompts")
                    .font(.system(size: 42, weight: .semibold, design: .serif))
                    .foregroundStyle(AppTheme.parchment)

                Text("Shake to draw your next writing prompt.")
                    .font(.headline)
                    .foregroundStyle(AppTheme.gold)
            }
            .padding(32)
        }
    }
}
