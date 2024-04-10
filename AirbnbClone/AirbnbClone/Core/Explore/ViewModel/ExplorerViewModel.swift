//
//  ExplorerViewModel.swift
//  AirbnbClone
//
//  Created by Oleksandr Isaiev on 10.04.2024.
//

import Foundation

final class ExplorerViewModel: ObservableObject {

    @Published var listings = [Listing]()
    private let service: ExploreService

    init(service: ExploreService) {
        self.service = service

        Task { await fetchListings() }
    }

    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
        } catch {
            print("DEBUG: Failed to fetch listings with error \(error.localizedDescription)")
        }
    }
}
