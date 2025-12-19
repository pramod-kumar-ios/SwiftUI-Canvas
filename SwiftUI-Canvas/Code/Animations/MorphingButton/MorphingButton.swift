//
//  MorphingButton.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

/// A reusable button that transforms (morphs) between idle, loading, success, and failure states.
/// Follows SOLID by separating state logic from visual representation.
struct MorphingButton: View {
    
    enum State {
        case idle
        case loading
        case success
        case failure
    }
    
    // MARK: - API
    let config: MorphingButtonConfig
    @Binding var state: State
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            // S: Single Responsibility - Button only triggers action if idle
            if state == .idle {
                triggerHaptic(.light)
                action()
            }
        }) {
            ZStack {
                // The "Morphing" Background
                Capsule()
                    .fill(backgroundColor)
                // The width morphs based on the state
                    .frame(width: state == .idle ? config.width : config.collapsedWidth)
                    .frame(height: config.height)
                
                // Content Switcher with Transitions
                Group {
                    switch state {
                    case .idle:
                        Text(config.title ?? "")
                            .font(config.titleFont)
                            .foregroundColor(config.foregroundColor)
                            .transition(.scale.combined(with: .opacity))
                        
                    case .loading:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: config.progressTintColor))
                            .transition(.scale)
                        
                    case .success:
                        config.successIcon
                            .font(config.successFont)
                            .foregroundColor(config.foregroundColor)
                            .onAppear { triggerHaptic(.success) }
                        
                    case .failure:
                        config.failureIcon
                            .font(config.failureFont)
                            .foregroundColor(config.foregroundColor)
                            .onAppear { triggerHaptic(.error) }
                    }
                }
            }
        }
        .disabled(state != .idle)
        // Shake Animation: Applied only during failure
        .modifier(ShakeEffect(animatableData: state == .failure ? 1 : 0))
        .animation(.spring(response: config.response, dampingFraction: config.springDamping), value: state)
    }
    
    // MARK: - O: Open/Closed Principle
    // Logic for colors is encapsulated and easily extendable
    private var backgroundColor: Color {
        switch state {
        case .idle:        return config.idleColor
        case .loading:     return config.loadingColor
        case .success:     return config.successColor
        case .failure:     return config.failureColor
        }
    }
    
    // MARK: - Haptics
    private func triggerHaptic(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    private func triggerHaptic(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
