//
//  ElasticListViewUse.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 20/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct ElasticListViewUse: View {
    
    let title: String
    @StateObject private var viewModel = ElasticViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Horizontal Hero").font(.headline).padding(.leading)
                
                // Horizontal Usage
                ElasticListView(
                    data: viewModel.items,
                    axis: .horizontal,
                    baseSize: 150, // Width of the first card
                    elasticStrength: 250
                ) { item, isFirst in
                    renderCard(item: item, isHero: isFirst, axis: .horizontal)
                }
                .frame(height: 130)
                .padding(.all, 10)
                
                Divider().padding(.vertical)
                
                Text("Vertical Hero").font(.headline).padding(.leading)
                
                // Vertical Usage
                // For the Vertical section (we want it taller/prominent)
                ElasticListView(
                    data: viewModel.items,
                    axis: .vertical,
                    baseSize: 180, // Height of the first card
                    elasticStrength: 280
                ) { item, isFirst in
                    renderCard(item: item, isHero: isFirst, axis: .vertical)
                }
                .padding(.all, 10)
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func renderCard(item: DemoModel, isHero: Bool, axis: Axis.Set) -> some View {
        if isHero {
            // Hero Card (Elastic)
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .fill(item.color.gradient)
                
                VStack(spacing: 8) {
                    Image(systemName: "sparkles")
                        .font(.title)
                    Text(item.title).font(.headline)
                    Text("PULL TO STRETCH").font(.caption2).opacity(0.7)
                }
                .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
        } else {
            // Standard Cards (Fixed height fix)
            VStack(spacing: 12) {
                Circle()
                    .fill(item.color)
                    .frame(width: 40, height: 40)
                
                Text(item.title)
                    .font(.system(size: 14, weight: .medium))
                
                Spacer(minLength: 0) // Pushes content up but keeps frame tall
            }
            .padding()
            .frame(width: axis == .horizontal ? 150 : nil)
            .frame(maxWidth: axis == .vertical ? .infinity : nil)
            .frame(maxHeight: axis == .horizontal ? .infinity : nil)
            .background(Color(.systemGray6))
            .cornerRadius(20)
        }
    }
}
