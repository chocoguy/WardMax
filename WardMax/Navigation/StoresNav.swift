//
//  StoresNav.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct StoresNav: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                Stores()
            }.navigationTitle("Stores")
                .background(Color("AccentColor"))
        }
    }
}

#Preview {
    StoresNav()
}
