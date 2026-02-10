//
//  APIClient.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 10.02.2026.
//

import Foundation
import Combine
import Alamofire

struct APIClient {
    private let urlString = "https://mocki.io/v1/dcbfb0e8-1ddb-4606-bb67-393617e26fc7"
    
    func fetchLayout() -> AnyPublisher<APIResponse, Error> {
            return AF.request(urlString)
                .validate()
                .publishData()
                .tryMap { response -> Data in
                    if let error = response.error { throw error }
                    return response.data ?? Data()
                }
                .decode(type: APIResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
    }
}
