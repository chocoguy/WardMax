//
//  CardsNav.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct CardsNav: View {
    var body: some View {
        NavigationStack{
                Cards()
        }.navigationTitle("Your cards")
    }
}

#Preview {
    CardsNav()
}
