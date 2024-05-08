//
//  FormView.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct FormView: View {
    
    @State private var selection: Form? = .home
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        FormTabView(selection: $selection)
    }
}

#Preview {
    FormView()
}
