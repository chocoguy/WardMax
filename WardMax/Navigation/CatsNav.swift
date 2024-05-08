//
//  CatsNav.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct CatsNav: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                Cats()
            }.navigationTitle("Categories")
                .background(Color("AccentColor"))
        }
    }
}

#Preview {
    CatsNav()
}
