//
//  ContentView.swift
//  PullRefreshWithSwiftUI
//
//  Created by ramil on 26.10.2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                RefreshScrollView(width: geometry.size.width, height: geometry.size.height)
                    .navigationBarTitle("Pull to Refresh")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
