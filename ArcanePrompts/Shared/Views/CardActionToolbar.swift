import SwiftUI

struct CardActionToolbar: View {
    let hasSelectedCard: Bool
    let onSettings: () -> Void
    let onInfo: () -> Void

    var body: some View {
        VStack(spacing: 14) {
            actionButton(systemName: "gearshape.fill", label: "Settings", action: onSettings)
            actionButton(systemName: "info.circle.fill", label: "Info", action: onInfo, isEnabled: hasSelectedCard)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
        .background(
            Capsule(style: .continuous)
                .fill(.ultraThinMaterial.opacity(0.96))
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(AppTheme.parchment.opacity(0.16), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.18), radius: 22, y: 8)
        )
        .accessibilityElement(children: .contain)
    }

    private func actionButton(
        systemName: String,
        label: String,
        action: @escaping () -> Void,
        isEnabled: Bool = true
    ) -> some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 22, weight: .semibold))
                .foregroundStyle(isEnabled ? AppTheme.midnight : AppTheme.midnight.opacity(0.35))
                .frame(width: 54, height: 54)
                .background(
                    Circle()
                        .fill(AppTheme.parchment.opacity(isEnabled ? 0.92 : 0.42))
                )
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
        .accessibilityLabel(label)
    }
}
