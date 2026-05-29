#if os(iOS)
import SwiftUI
import UIKit

private final class ShakeDetectingViewController: UIViewController {
    var onShake: (() -> Void)?

    override var canBecomeFirstResponder: Bool { true }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        becomeFirstResponder()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)

        guard motion == .motionShake else { return }
        onShake?()
    }
}

private struct ShakeReader: UIViewControllerRepresentable {
    let onShake: () -> Void

    func makeUIViewController(context: Context) -> ShakeDetectingViewController {
        let controller = ShakeDetectingViewController()
        controller.onShake = onShake
        controller.view.isUserInteractionEnabled = false
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: ShakeDetectingViewController, context: Context) {
        uiViewController.onShake = onShake
    }
}

extension View {
    func onDeviceShake(perform action: @escaping () -> Void) -> some View {
        background(ShakeReader(onShake: action))
    }
}
#endif

