//
//  HomeUIModelHelper.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import Foundation

struct HomeUIModelHelper {
    static func makeUIModel(response: APIResponse) -> HomeUIModel {
        typealias SectionModel = HomeUIModel.SectionModel
        var sectionModels = [SectionModel]()
        for layout in response.layouts {
            switch layout {
            case let .mainBanner(id, mainBanner):
                let sectionModel = SectionModel(section: .mainBanner(id: id), body: [
                    .mainBanner(id: mainBanner.id, imageLink: mainBanner.imageLink, title: mainBanner.title, caption: mainBanner.caption)
                ])
                sectionModels.append(sectionModel)
            case let .textHeader(id, textHeader):
                let sectionModel = SectionModel(section: .textHeader(id: id), body: [
                    .textHeader(id: textHeader.id, text: textHeader.text, highlightedText: textHeader.highlightedText)
                ])
                sectionModels.append(sectionModel)
            case let .courseSwimlane(id, courses):
                let items: [HomeUIModel.Item] = courses.map { cource in
                    return .course(id: cource.id, imageLink: cource.imageLink, title: cource.title, author: cource.author, rating: cource.rating, reviewCount: cource.reviewCount, price: cource.price, tag: cource.tag)
                }
                let sectionModel = SectionModel(section: .courseSwimLine(id: id), body: items)
                sectionModels.append(sectionModel)
            case let .categories(id, categories):
                let sectionModel = SectionModel(section: .categories(id: id), body: [
                    .categoriesScroller(id: categories.id, titles: categories.titles)
                ])
                sectionModels.append(sectionModel)
            case let .featuredCourse(id, course):
                let sectionModel = SectionModel(section: .faturedCourse(id: id), body: [
                    .featuredCourse(id: course.id, imageLink: course.imageLink, title: course.title, author: course.author, rating: course.rating, reviewCount: course.reviewCount, price: course.price)])
                sectionModels.append(sectionModel)
                print(sectionModel)
            case let .udemyBusinessBanner(id, udemyBusinessBanner):
                let sectionModel = SectionModel(section: .udemyBusinessBanner(id: id), body: [
                    .udemyBusinessBanner(id: udemyBusinessBanner.id, link: udemyBusinessBanner.link)
                ])
                sectionModels.append(sectionModel)
            case .unknown(let type):
                print(">>>>> unknown type found \(type)")
            }
        }
        return HomeUIModel(sectionModels: sectionModels)
    }
}
