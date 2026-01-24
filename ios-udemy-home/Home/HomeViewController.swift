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
    }

    private func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

