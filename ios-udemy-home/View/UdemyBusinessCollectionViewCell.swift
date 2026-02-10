//
//  UdemyBusinessCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import SnapKit
import SwiftUI

final class UdemyBusinessCollectionViewCell: UICollectionViewCell {
    
    private var hostingController: UIHostingController<UdemyBusinessView>!
    
    var onTap: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        let udemyBissinessView = UdemyBusinessView()
        hostingController = UIHostingController(rootView: udemyBissinessView)
        addSubview(hostingController.view)
        hostingController.view.clipsToBounds = true
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        hostingController.rootView.onTap = { [weak self] in
            self?.onTap?()
        }
    }
}
