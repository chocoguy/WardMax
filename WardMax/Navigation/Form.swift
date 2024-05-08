//
//  Form.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/6/24.
//

import Foundation
import SwiftUI

enum Form: Codable, Hashable, Identifiable, CaseIterable {
    case home
    case search
    case stores
    case spendCats
    case cards
    
    var id: Form {self}
}

extension Form {
    @ViewBuilder
    var label: some View {
        switch self {
        case .home:
            Label("Home", systemImage: "house")
        case .search:
            Label("Search", systemImage: "magnifyingglass")
        case .stores:
            Label("Stores", systemImage: "cart")
        case .spendCats:
            Label("Categories", systemImage: "basket")
        case .cards:
            Label("Cards", systemImage: "creditcard")
        }
    
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .home:
            HomeNav()
        case .search:
            SearchNav()
        case .stores:
            StoresNav()
        case .spendCats:
            CatsNav()
        case .cards:
            CardsNav()
        }
    }
    
}
