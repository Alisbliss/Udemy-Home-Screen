//
//  UIHomeModel.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import Foundation

struct HomeUIModel: Hashable, Sendable {
    
    let sectionModels: [SectionModel]
    
    struct SectionModel: Hashable, Sendable {
        let section: Section
        let body:  [Item]
    }
    
    nonisolated enum Section: Hashable {
        case mainBanner(id: String)
        case textHeader(id: String)
        case courseSwimLine(id: String)
        case udemyBusinessBanner(id: String)
        case categories(id: String)
        case faturedCourse(id: String)
    }
    
    nonisolated enum Item: Hashable {
        case mainBanner(id: String, imageLink: String, title: String, caption: String)
        case course(id: String, imageLink: String, title: String, author: String, rating: Double, reviewCount: Int, price: Decimal, tag: String)
        case textHeader(id: String, text: String, highlightedText: String?)
        case udemyBusinessBanner(id: String, link: String)
        case categoriesScroller(id: String, titles: [String])
        case featuredCourse(id: String, imageLink: String, title: String, author: String, rating: Double, reviewCount: Int, price: Decimal)
    }
    
}

extension HomeUIModel.Section: @unchecked Sendable {}
extension HomeUIModel.Item: @unchecked Sendable {}
