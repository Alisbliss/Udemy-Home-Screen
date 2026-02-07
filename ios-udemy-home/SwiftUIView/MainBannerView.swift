//
//  MineBannerView.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import SwiftUI

struct MainBannerView: View {
    let ImageLink: String
    let title: String
    let caption: String
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: ImageLink)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .clipped()
            } placeholder: {
                PlaceHolderImageView()
                .frame(width: 160)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 24, weight: .bold, design: .serif))
                Text(caption)
                    .font(.system(size: 12))
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    MainBannerView(
        ImageLink: "https://images.unsplash.com/photo-1605379399642-870262d3d051?q=80&w=2106&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        title: "Learning that fits",
        caption: "Skills for your present and future")
}
