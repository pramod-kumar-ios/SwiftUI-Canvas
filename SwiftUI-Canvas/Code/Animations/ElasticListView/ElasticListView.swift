//
//  ElasticListView.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 20/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct ElasticListView<Data: RandomAccessCollection, Content: View>: View where Data.Element: ElasticItem {
    let data: Data
    let axis: Axis.Set
    let baseSize: CGFloat
    let elasticStrength: CGFloat
    let spacing: CGFloat = 10
    let content: (Data.Element, Bool) -> Content

    var body: some View {
        ScrollView(axis, showsIndicators: false) {
            let layout = axis == .vertical
                ? AnyLayout(VStackLayout(alignment: .leading, spacing: spacing))
                : AnyLayout(HStackLayout(alignment: .top, spacing: spacing))
            
            layout {
                ForEach(Array(data.enumerated()), id: \.element.id) { index, item in
                    if index == 0 {
                        renderElasticHeader(item)
                    } else {
                        content(item, false)
                    }
                }
            }
        }
        .coordinateSpace(name: "scroll")
    }

    @ViewBuilder
    private func renderElasticHeader(_ item: Data.Element) -> some View {
        GeometryReader { geo in
            let frame = geo.frame(in: .named("scroll"))
            let scrollOffset = axis == .vertical ? frame.minY : frame.minX
            let stretch = scrollOffset > 0 ? 1 + (scrollOffset / elasticStrength) : 1
            
            content(item, true)
                // IMPORTANT: Use maxWidth/maxHeight to fill the available space
                .frame(
                    width: axis == .vertical ? geo.size.width : geo.size.width * stretch,
                    height: axis == .vertical ? geo.size.height * stretch : geo.size.height
                )
                .clipped() // Prevents content from bleeding out during stretch
                .offset(
                    x: axis == .horizontal && scrollOffset > 0 ? -scrollOffset : 0,
                    y: axis == .vertical && scrollOffset > 0 ? -scrollOffset : 0
                )
        }
        .frame(
            width: axis == .vertical ? nil : baseSize,
            height: axis == .vertical ? baseSize : nil
        )
        // This ensures the GeometryReader expands to fill the VStack width
        .frame(maxWidth: axis == .vertical ? .infinity : nil)
    }
}
