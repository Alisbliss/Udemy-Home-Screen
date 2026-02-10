//
//  ViewController.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import UIKit
import SnapKit
import Combine
import SafariServices
import Alamofire

class HomeViewController: UIViewController {

    private let apiClient = APIClient()
    private let collectionView = HomeCollectionView()
    private var cancellable = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        observe()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLayout()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    private func observe() {
        collectionView.eventPublisher.sink { [weak self] event in
            switch event {
            case let .itemTapped(item):
                self?.handleItemTapped(item: item)
            }
        }.store(in: &cancellable)
    }
    
    private func handleItemTapped(item: HomeUIModel.Item) {
        switch item {
        case .mainBanner:
            break
        case let .course(_, _, title, _, _, _, _, _):
            print(">>>>>> Cource tapped")
            showCourseDetailViewController(title: title)
        case .textHeader:
            break
        case let .udemyBusinessBanner(_, link):
            showSafaryWebView(link: link)
        case .categoriesScroller(id: _, titles: let titles):
            guard let title = titles.first else { return }
            print(">>>>>> Caregory tapped \(title)")
        case let .featuredCourse(_, _, title, _, _, _, _):
            showCourseDetailViewController(title: title)
        }
    }
    
    private func setupView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func showCourseDetailViewController(title: String) {
        let viewController = CourseDetailViewController()
        viewController.setText(title: title)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showSafaryWebView(link: String) {
        guard let url = URL(string: link) else { return }
        let safaryViewController = SFSafariViewController(url: url)
        navigationController?.present(safaryViewController, animated: true)
    }
    
    private func fetchLayout() {
        apiClient.fetchLayout()
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    print("Error: \(error)")
                    let apiResponse: APIResponse? = FileManager.modelFromJSON(fileName: "Payload")
                    self?.updateUI(with: apiResponse)
                }
            } receiveValue: { [weak self] apiResponse in
                self?.updateUI(with: apiResponse)
            }
            .store(in: &cancellable)
    }
    
    private func updateUI(with response: APIResponse?) {
        guard let response = response else { return }
        let uiModel = HomeUIModelHelper.makeUIModel(response: response)
        self.collectionView.setDataSource(uiModel: uiModel)
    }
}
