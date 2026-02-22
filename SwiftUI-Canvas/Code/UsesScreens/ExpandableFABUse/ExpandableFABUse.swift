//
//  ExpandableFABUse.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 22/02/26.
//

import SwiftUI

struct ExpandableFABUse: View {
    // MARK: - State
    let title: String
    
    let myOptions = [
        FABOption(title: "Share Document", icon: "square.and.arrow.up", color: .purple) {
            print("Sharing...")
        },
        FABOption(title: "Save Document", icon: "bookmark.fill", color: .orange) {
            print("Saving...")
        },
        FABOption(title: "Like Document", icon: "heart.fill", color: .red) {
            print("Liking...")
        },
        FABOption(title: "Send Document", icon: "paperplane.fill", color: .green) {
            print("Sending...")
        }
    ]
    
    var body: some View {
        ZStack {
            // Your main content goes here
            Color(UIColor.systemGray6).ignoresSafeArea()
            
            // FAB Positioned at bottom right
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ExpandableFAB(options: myOptions)
                }
            }
        }
    }
}

// MARK: - Preview
struct ExpandableFABUse_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableFABUse(title: "Title")
    }
}
