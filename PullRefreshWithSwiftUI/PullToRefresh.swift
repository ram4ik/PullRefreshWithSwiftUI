//
//  PullToRefresh.swift
//  PullRefreshWithSwiftUI
//
//  Created by ramil on 26.10.2020.
//

import SwiftUI

struct PullToRefresh: View {
    @ObservedObject var manager: DataManager
    
    var body: some View {
        List(manager.dataModel) { note in
            Text(note.itemTitle)
        }
    }
}

struct PullToRefresh_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefresh(manager: DataManager(dataModel: [DataModel(itemTitle: "My first note!")]))
    }
}
