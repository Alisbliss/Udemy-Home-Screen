//
//  PlaceHolderImageView.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import SwiftUI

struct PlaceHolderImageView: View {
    var body: some View {
        Rectangle()
            .foregroundStyle(.gray)
            .opacity(0.9)
            
    }
}

#Preview {
    PlaceHolderImageView()
}
