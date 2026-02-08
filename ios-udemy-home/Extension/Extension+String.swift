//
//  Extension+String.swift
//  ios-udemy-home
//
//  Created by Алеся Афанасенкова on 24.01.2026.
//

import Foundation

extension String {
    var withBrackets: String {
        String(format: "(%@)", self)
    }
}
