//
//  HomeNav.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct HomeNav: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                Home()
            }.navigationTitle("WardMax")
                
        }
    }
}

#Preview {
    HomeNav()
}
