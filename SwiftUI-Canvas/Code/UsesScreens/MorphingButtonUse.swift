//
//  MorphingButtonUse.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct MorphingButtonUse: View {
    // MARK: - State
    let title: String
    @State private var buttonState: MorphingButton.State = .idle
    @State private var shouldSucceedNext = true // Toggle logic for the demo
    
    var body: some View {
        ZStack {
            // Soft background to make the button pop
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Animation Demo")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    .tracking(2)
                
                // MARK: - The Morphing Button
                MorphingButton(
                    config: MorphingButtonConfig(),
                    state: $buttonState,
                    action: runDemoSequence
                )
                .padding(.horizontal, 40)
                
                Text(shouldSucceedNext ? "Next: Success State" : "Next: Failure State")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Demo Logic
    private func runDemoSequence() {
        // 1. Start Loading
        withAnimation { buttonState = .loading }
        
        // 2. Wait for 1.5 seconds to simulate a process
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                // 3. Alternate between Success and Failure
                buttonState = shouldSucceedNext ? .success : .failure
            }
            
            // 4. Toggle the result for the next click
            shouldSucceedNext.toggle()
            
            // 5. Reset to idle after seeing the result
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    buttonState = .idle
                }
            }
        }
    }
}

// MARK: - Preview
struct MorphingButtonUse_Previews: PreviewProvider {
    static var previews: some View {
        MorphingButtonUse(title: "Title")
    }
}
