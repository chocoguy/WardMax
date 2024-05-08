//
//  FormTabView.swift
//  WardMax
//
//  Created by Edgar Zarco on 4/7/24.
//

import SwiftUI

struct FormTabView: View {
    
    @Binding var selection: Form?
    
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(Form.allCases) {form in
                form.destination
                    .tag(form as Form?)
                    .tabItem{ form.label }
            }
        }
    }
}
