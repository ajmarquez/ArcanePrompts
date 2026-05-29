import SwiftUI

@main
struct ArcanePromptsIOSApp: App {
    var body: some Scene {
        WindowGroup {
            TarotPromptView(interactionStyle: .shake)
        }
    }
}

