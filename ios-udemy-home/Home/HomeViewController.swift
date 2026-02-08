//
//  ViewController.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private let collectionView = HomeCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        let uiModel = HomeUIModel(sectionModels: [
            .init(section: .mainBanner(id: "123"), body: [
                .mainBanner(
                    id: "123",
                    imageLink: "https://images.unsplash.com/photo-1605379399642-870262d3d051?q=80&w=2106&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    title: "Learning that fits",
                    caption: "Skills for your present and future")
            ]),
            .init(section: .textHeader(id: "2321"), body: [
                .textHeader(
                    id: "232",
                    text: "Newest couerses in Mobile Development",
                    highlightedText: "Mobile Development")
            ])
        ])
        collectionView.setupUIModel(uiModel: uiModel)
    }

    private func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

