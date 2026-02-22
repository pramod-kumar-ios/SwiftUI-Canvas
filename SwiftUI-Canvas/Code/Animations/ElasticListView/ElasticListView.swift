//
//  ElasticListView.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 20/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

//struct ElasticListView<Data: RandomAccessCollection, Content: View>: View where Data.Element: ElasticItem {
//    let data: Data
//    let axis: Axis.Set
//    let elasticStrength: CGFloat
//    let content: (Data.Element, Bool) -> Content // Bool indicates if it's the first item
//
//    init(
//        data: Data,
//        axis: Axis.Set = .vertical,
//        elasticStrength: CGFloat = 300,
//        @ViewBuilder content: @escaping (Data.Element, Bool) -> Content
//    ) {
//        self.data = data
//        self.axis = axis
//        self.elasticStrength = elasticStrength
//        self.content = content
//    }
//
//    var body: some View {
//        ScrollView(axis, showsIndicators: false) {
//            let layout = axis == .vertical
//                ? AnyLayout(VStackLayout(spacing: 16))
//                : AnyLayout(HStackLayout(spacing: 16))
//            
//            layout {
//                ForEach(Array(data.enumerated()), id: \.element.id) { index, item in
//                    if index == 0 {
//                        renderElasticItem(item)
//                    } else {
//                        content(item, false)
//                    }
//                }
//            }
//            .padding()
//        }
//    }
//
//    @ViewBuilder
//    private func renderElasticItem(_ item: Data.Element) -> some View {
//        GeometryReader { geo in
//            let scrollOffset = axis == .vertical ? geo.frame(in: .global).minY : geo.frame(in: .global).minX
//            
//            // Calculate scale: only scale when pulling (offset > 0)
//            let stretch = scrollOffset > 0 ? 1 + (scrollOffset / elasticStrength) : 1
//            
//            content(item, true)
//                .scaleEffect(stretch, anchor: axis == .vertical ? .top : .leading)
//                .offset(
//                    x: axis == .horizontal && scrollOffset > 0 ? -scrollOffset : 0,
//                    y: axis == .vertical && scrollOffset > 0 ? -scrollOffset : 0
//                )
//        }
//        // Set a base size for the GeometryReader container
//        .frame(
//            width: axis == .vertical ? nil : 250,
//            height: axis == .vertical ? 200 : nil
//        )
//    }
//}

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
