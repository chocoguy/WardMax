//
//  Stores.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct Stores: View {
    var body: some View {
        Text("Stores page")
        NavigationLink{
            Text("asd")
        } label: {
            Label("dsa", systemImage: "folder")
        }
        
        List{
            CardItem()
            CardItem()
            CardItem()
            CardItem()
        }
    }
}

#Preview {
    Stores()
}
