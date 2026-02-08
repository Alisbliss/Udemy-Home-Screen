//
//  TextHeaderCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import UIKit
import SnapKit

final class TextHeaderCollectionViewCell: UICollectionViewCell {
    
    private let label = AttributedTappableLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, highlightedText: String?) {
            label.setAttributedText(
                text: text,
                highlightedText: highlightedText,
                color: .systemIndigo,
                font: .systemFont(ofSize: 18, weight: .bold))
        }
    
    private func layout() {
        addSubview(label)
        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        label.onTap = {
            print(">>>> tapped")
        }
    }
}
