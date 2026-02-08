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
                    text: "Newest cources in Mobile Development",
                    highlightedText: "Mobile Development")
            ]),
            .init(section: .courseSwimLine(id: "234"), body: [
                .course(
                    id: "12395",
                    imageLink: "https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGNvZGluZ3xlbnwwfHwwfHx8MA%3D%3D",
                    title: "iOS & Swift: Server Driven UI Compositional Layout & SwiftUI",
                    author: "Kelvin Fok",
                    rating: 4.5,
                    reviewCount: 4569,
                    price: 19.99,
                    tag: "bestsellar"),
                .course(
                    id: "12348",
                    imageLink: "https://plus.unsplash.com/premium_photo-1661877737564-3dfd7282efcb?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29kaW5nfGVufDB8fDB8fHww",
                    title: "iOS & Swift: Swift UI Mastery",
                    author: "Kelvin Fok",
                    rating: 5.0,
                    reviewCount: 69,
                    price: 19.99,
                    tag: "bestsellar"),
                .course(
                    id: "12345",
                    imageLink: "https://images.unsplash.com/photo-1534972195531-d756b9bfa9f2?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGNvZGluZ3xlbnwwfHwwfHx8MA%3D%3D",
                    title: "iOS & Swift: Auto Layout",
                    author: "Kelvin Fok",
                    rating: 4.7,
                    reviewCount: 459,
                    price: 19.99,
                    tag: "bestsellar")
            ]),
            .init(section: .textHeader(id: "656756"), body: [
                .textHeader(id: "244556", text: "Categories", highlightedText: nil)
            ]),
            .init(section: .categories(id: "4567977"), body: [
                .categoriesScroller(id: "6565", titles: Category.allCases.map({ $0.rawValue.camelCaseToEnglish.useShortAndFormat.capitalized
                }))
            ]),
            .init(section: .textHeader(id: "2328761"), body: [
                .textHeader(
                    id: "232766",
                    text: "Because you viewed \"How to land yourself a role\"",
                    highlightedText: "How to land yourself a role")
            ]),
            .init(section: .courseSwimLine(id: "276634"), body: [
                .course(
                    id: "12384695",
                    imageLink: "https://media.istockphoto.com/id/2233679888/photo/young-programmer-analyzing-code-on-laptop-and-large-screen-in-modern-office.webp?a=1&b=1&s=612x612&w=0&k=20&c=nsCFTjtILnzpSZFkHrUUt8cFPoczZW9XgXCPsS3ifiQ=",
                    title: "iOS & Swift: Server Driven UI Compositional Layout & SwiftUI",
                    author: "Kelvin Fok",
                    rating: 4.5,
                    reviewCount: 4569,
                    price: 19.99,
                    tag: "bestsellar"),
                .course(
                    id: "1236788",
                    imageLink: "https://media.istockphoto.com/id/1530973530/photo/software-development-concept.webp?a=1&b=1&s=612x612&w=0&k=20&c=NXxmootfVkI2C_JS5-5p06qMD_ngxJnH8BfLxnoQKP8=",
                    title: "iOS & Swift: Swift UI Mastery",
                    author: "Kelvin Fok",
                    rating: 5.0,
                    reviewCount: 69,
                    price: 19.99,
                    tag: "bestsellar"),
                .course(
                    id: "12348905",
                    imageLink: "https://media.istockphoto.com/id/2219298648/photo/code-of-conduct-as-central-puzzle-piece.webp?a=1&b=1&s=612x612&w=0&k=20&c=ARKzV2SfHLXUH1GI78WbHiJsbgwGhL-D6--B9GiEnX0=",
                    title: "iOS & Swift: Auto Layout",
                    author: "Kelvin Fok",
                    rating: 4.7,
                    reviewCount: 459,
                    price: 19.99,
                    tag: "bestsellar"),
                .course(
                    id: "12384695",
                    imageLink: "https://media.istockphoto.com/id/2222660797/photo/global-data-flow.webp?a=1&b=1&s=612x612&w=0&k=20&c=MC5B4KJI9SlfpE1SlcmYzNIB530O56HfhlaNeYuvhzo=",
                    title: "iOS & Swift: Server Driven UI Compositional Layout & SwiftUI",
                    author: "Kelvin Fok",
                    rating: 4.5,
                    reviewCount: 4569,
                    price: 19.99,
                    tag: "bestsellar"),
                .course(
                    id: "1236788",
                    imageLink: "https://images.unsplash.com/photo-1628258334105-2a0b3d6efee1?w=1200&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGNvZGluZ3xlbnwwfHwwfHx8MA%3D%3D",
                    title: "iOS & Swift: Swift UI Mastery",
                    author: "Kelvin Fok",
                    rating: 5.0,
                    reviewCount: 69,
                    price: 19.99,
                    tag: "bestsellar")
            ])
            
        ])
        collectionView.setDataSource(uiModel: uiModel)
    }

    private func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

