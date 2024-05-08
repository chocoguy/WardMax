//
//  SearchNav.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct SearchNav: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                Search()
            }.navigationTitle("Search")
        }
    }
}

#Preview {
    SearchNav()
}
