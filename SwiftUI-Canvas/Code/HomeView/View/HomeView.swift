//
//  HomeView.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    // MARK: - ViewModel
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.menuItems) { item in
                NavigationLink(destination: item.destination) {
                    HStack(spacing: 15) {
                        // Text Content
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.description)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("SwiftUI Canvas")
            .listStyle(InsetGroupedListStyle())
        }
        BrandingView()
    }
}

#Preview {
    HomeView()
}
