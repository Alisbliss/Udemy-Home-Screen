//
//  CategoriesCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import SwiftUI
import SnapKit

final class CategoriesCollectionViewCell: UICollectionViewCell {
    
    private var hostingController: UIHostingController<CategoriesView>!
    
    var onTap: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(titles: [String]) {
        guard hostingController == nil else { return }
        let categoryView = CategoriesView(titles: titles)
        hostingController = UIHostingController(rootView: categoryView)
        addSubview(hostingController.view)
        hostingController.view.clipsToBounds = true
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hostingController.rootView.onTap = { [weak self] title in
            self?.onTap?(title)
        }
    }
}
