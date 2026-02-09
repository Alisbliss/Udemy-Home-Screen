//
//  Extension+FileManager.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 09.02.2026.
//

import Foundation

extension FileManager {
    
    static func modelFromJSON<T: Decodable>(fileName: String) -> T? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            print("Path not found")
            return nil }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let string = String(data: data, encoding: .utf8)
            print(string)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Decoding Error: \(error)")
            return nil
        }
    }
}
