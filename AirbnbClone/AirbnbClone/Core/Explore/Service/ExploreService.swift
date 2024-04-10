//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 10.04.2024.
//

import Foundation

actor ExploreService {

    func fetchListings() async throws -> [Listing] {
        DeveloperPreview.shared.listings
    }
}
