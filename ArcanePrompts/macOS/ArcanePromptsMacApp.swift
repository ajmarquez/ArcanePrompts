import SwiftUI

@main
struct ArcanePromptsMacApp: App {
    var body: some Scene {
        WindowGroup {
            TarotPromptView(interactionStyle: .button)
                .frame(width: 360, height: 632)
        }
        .defaultSize(width: 360, height: 632)
        .windowResizability(.contentSize)
    }
}

