//
//  HomeCollectionView.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import UIKit

final class HomeCollectionView: UICollectionView {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .red
    }
    
}
