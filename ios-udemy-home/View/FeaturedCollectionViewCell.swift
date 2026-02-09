//
//  FeaturedCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import SwiftUI
import SnapKit

final class FeaturedCollectionViewCell: UICollectionViewCell {
    
    private var hostingController: UIHostingController<FeatuerCostView>!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(
    imageLink: String,
    title: String,
    author: String,
    rating: Double,
    reviewCount: Int,
    price: Decimal)
    {
        guard hostingController == nil else { return }
        let featureView = FeatuerCostView(imageLink: imageLink, title: title, author: author, rating: rating, reviewCount: reviewCount, price: price)
        hostingController = UIHostingController(rootView: featureView)
        addSubview(hostingController.view)
        hostingController.view.clipsToBounds = true
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
