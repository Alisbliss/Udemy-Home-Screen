//
//  MainBannerCollectionViewCell.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import SwiftUI
import SnapKit

final class MainBannerCollectionViewCell: UICollectionViewCell {
    
    private var hostingController: UIHostingController<MainBannerView>!
    
    func cofigure(
        imageLink: String,
        title: String,
        caption: String
    ) {
        guard hostingController == nil else { return }
        let mainBannerView = MainBannerView(
            ImageLink: imageLink,
            title: title,
            caption: caption)
        hostingController = UIHostingController(rootView: mainBannerView)
        guard let hostingController = hostingController else { return }
        addSubview(hostingController.view)
        hostingController.view.clipsToBounds = true
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
