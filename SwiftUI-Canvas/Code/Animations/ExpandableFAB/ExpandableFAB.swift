//
//  ExpandableFAB.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 22/02/26.
//

import SwiftUI

struct ExpandableFAB: View {
    @State private var isExpanded = false
    let options: [FABOption]
    
    private let mainSize: CGFloat = 60
    private let subSize: CGFloat = 48
    private let spacing: CGFloat = 70
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            // MARK: - Options
            ForEach(options.indices, id: \.self) { index in
                FABOptionRow(option: options[index], size: subSize)
                    .offset(y: isExpanded ? -CGFloat(index + 1) * spacing : 0)
                    .opacity(isExpanded ? 1 : 0)
                    .scaleEffect(isExpanded ? 1 : 0.5, anchor: .trailing) // 👈 Important
                    .zIndex(Double(options.count - index)) // Ensures top items don't overlap weirdly
                    .animation(
                        .spring(response: 0.4, dampingFraction: 0.75)
                        .delay(isExpanded ? Double(index) * 0.05 : 0),
                        value: isExpanded
                    )
            }
            
            // MARK: - Main Button
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    isExpanded.toggle()
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: mainSize, height: mainSize)
                        .shadow(radius: 4, y: 4)
                    
                    Image(systemName: "plus")
                        .font(.system(size: 26, weight: .semibold))
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(isExpanded ? 45 : 0))
                }
            }
        }
        .padding(.trailing, 20)
        .padding(.bottom, 20)
    }
}
