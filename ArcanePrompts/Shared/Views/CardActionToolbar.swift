import SwiftUI

struct CardActionToolbar: View {
    let hasSelectedCard: Bool
    let onSettings: () -> Void
    let onInfo: () -> Void

    var body: some View {
        VStack(spacing: 2) {
            actionButton(systemName: "gearshape.fill", label: "Settings", action: onSettings)
            Divider()
                .overlay(AppTheme.sheetMuted.opacity(0.16))
                .padding(.horizontal, 4)
            actionButton(systemName: "info.circle.fill", label: "Info", action: onInfo, isEnabled: hasSelectedCard)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(.ultraThinMaterial.opacity(0.96))
                .overlay(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
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
                .font(.system(size: 19, weight: .semibold))
                .foregroundStyle(isEnabled ? AppTheme.midnight : AppTheme.midnight.opacity(0.35))
                .frame(width: 30, height: 30)
                .padding(.vertical, 10)
                .padding(.horizontal, 8)
        }
        .buttonStyle(.plain)
        .disabled(!isEnabled)
        .accessibilityLabel(label)
    }
}
