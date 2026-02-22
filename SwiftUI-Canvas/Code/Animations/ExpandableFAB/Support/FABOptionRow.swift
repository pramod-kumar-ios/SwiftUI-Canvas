//
//  FABOptionRow.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 22/02/26.
//

import SwiftUI

struct FABOptionRow: View {
    let option: FABOption
    let size: CGFloat
    
    var body: some View {
        HStack(spacing: 16) {
            
            if let title = option.title {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 3)
            }
            
            Button(action: option.action) {
                ZStack {
                    Circle()
                        .fill(option.color)
                        .frame(width: size, height: size)
                    
                    if let icon = option.icon {
                        Image(systemName: icon)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .shadow(radius: 3, y: 2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
