//
//  BrandingView.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct BrandingView: View {
    var body: some View {
        HStack {
            Spacer()
            Text("@pramod-kumar-ios")
                .font(.headline).fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding()
    }
}
