//
//  HomeCollectionView.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import SwiftUI
import Combine

final class HomeCollectionView: UICollectionView {
    
    enum Event {
        case itemTapped(HomeUIModel.Item)
    }
    
    private var diffableDataSource: UICollectionViewDiffableDataSource<HomeUIModel.Section, HomeUIModel.Item>!
    private var uiModel: HomeUIModel?
    private let eventSubject = PassthroughSubject<Event, Never>()
    
    var eventPublisher: AnyPublisher<Event, Never> {
        return eventSubject.eraseToAnyPublisher()
    }
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionViewLayout = makeCompositionalLatout()
        setup()
        setupDataSource()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDataSource(uiModel: HomeUIModel) {
        self.uiModel = uiModel
        self.applySnapshort()
    }
    private func setup() {
        backgroundColor = .white
        register(MainBannerCollectionViewCell.self, forCellWithReuseIdentifier: MainBannerCollectionViewCell.namedIdentifier)
        register(TextHeaderCollectionViewCell.self, forCellWithReuseIdentifier: TextHeaderCollectionViewCell.namedIdentifier)
        register(CourseCollectionViewCell.self,
                 forCellWithReuseIdentifier: CourseCollectionViewCell.namedIdentifier)
        register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.namedIdentifier)
        register(FeaturedCollectionViewCell.self, forCellWithReuseIdentifier: FeaturedCollectionViewCell.namedIdentifier)
        register(UdemyBusinessCollectionViewCell.self, forCellWithReuseIdentifier: UdemyBusinessCollectionViewCell.namedIdentifier)
    }
    
    private func setupDataSource() {
        diffableDataSource = UICollectionViewDiffableDataSource(collectionView: self, cellProvider: { collectionView, indexPath, item in
            switch item {
            case let .mainBanner(_, imageLink, title, caption):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainBannerCollectionViewCell.namedIdentifier, for: indexPath) as! MainBannerCollectionViewCell
                cell.cofigure(imageLink: imageLink, title: title, caption: caption)
                return cell
            case let .textHeader(_, text, highlightedText):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextHeaderCollectionViewCell.namedIdentifier, for: indexPath) as! TextHeaderCollectionViewCell
                cell.configure(text: text, highlightedText: highlightedText)
                cell.onTap = { [weak self] in
                    self?.eventSubject.send(.itemTapped(item))
                }
                return cell
            case let .course(_, imageLink, title, author, rating, reviewCount, price, tag):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionViewCell.namedIdentifier, for: indexPath) as! CourseCollectionViewCell
                cell.configure(imageLink: imageLink, title: title, author: author, rating: rating, reviewCount: reviewCount, price: price, tag: tag)
                cell.onTap = { [weak self] in
                    self?.eventSubject.send(.itemTapped(item))
                }
                return cell
            case let .categoriesScroller(id, titles):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.namedIdentifier, for: indexPath) as! CategoriesCollectionViewCell
                cell.configure(titles: titles)
                cell.onTap = { [weak self] title in
                    let selected = HomeUIModel.Item.categoriesScroller(id: id, titles: [title])
                    self?.eventSubject.send(.itemTapped(selected))
                }
                return cell
            case let .featuredCourse(_, imageLink, title, author, rating, reviewCount, price):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCollectionViewCell.namedIdentifier, for: indexPath) as! FeaturedCollectionViewCell
                cell.configure(imageLink: imageLink, title: title, author: author, rating: rating, reviewCount: reviewCount, price: price)
                cell.onTap = { [weak self] in
                    self?.eventSubject.send(.itemTapped(item))
                }
                return cell
            case .udemyBusinessBanner:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UdemyBusinessCollectionViewCell.namedIdentifier, for: indexPath) as! UdemyBusinessCollectionViewCell
                cell.onTap = { [weak self] in
                    self?.eventSubject.send(.itemTapped(item))
                }
                return cell
            }
        })
    }
    
    private func applySnapshort() {
        var snapshot = NSDiffableDataSourceSnapshot<HomeUIModel.Section, HomeUIModel.Item>()
        uiModel?.sectionModels.forEach { sectionModel in
            snapshot.appendSections([sectionModel.section])
            snapshot.appendItems(sectionModel.body, toSection: sectionModel.section)
        }
        diffableDataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func makeCompositionalLatout() -> UICollectionViewCompositionalLayout {
        
        let provider: UICollectionViewCompositionalLayoutSectionProvider = { [weak self] index, env in
            
            guard let sectionModel = self?.uiModel?.sectionModels[index] else { return nil }
            switch sectionModel.section {
            case .mainBanner:
                return self?.makeMainBannerSection()
            case .textHeader:
                guard case let .textHeader(_, text, _) = sectionModel.body.first else { return nil }
                return self?.makeHeaderSection(text: text)
            case .courseSwimLine:
                return self?.makeCourceSection()
            case .categories:
                return self?.makeCategorySection()
            case .faturedCourse:
                return self?.makeFeatureCourceSection()
            case .udemyBusinessBanner:
                return self?.makeUdemyBusinessSection()
            }
        }
        return UICollectionViewCompositionalLayout(sectionProvider: provider)
    }
    
    func makeUdemyBusinessSection() -> NSCollectionLayoutSection {
        let itemsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemsize)
        let layoutsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutsize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
    func makeFeatureCourceSection() -> NSCollectionLayoutSection {
        let itemsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemsize)
        let layoutsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(220))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutsize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        return section
    }
    
    private func makeCategorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutsize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        return section
        
    }
    
    private func makeCourceSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutsize = NSCollectionLayoutSize(widthDimension: .absolute(160), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutsize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20)
        // make sections scroll horizontally
        section.orthogonalScrollingBehavior = .continuous
        return section
        
    }
    
    private func makeHeaderSection(
        text: String
    )-> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(AttributedTappableLabel.heightForWidth(frame.size.width, text: text)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 8, trailing: 20)
        return section
    }
    private func makeMainBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let layoutsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(220))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutsize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        return section
    }
}
