//
//  DataModel.swift
//  PullRefreshWithSwiftUI
//
//  Created by ramil on 26.10.2020.
//

import Foundation

struct DataModel: Identifiable {
    var id: UUID = UUID()
    var itemTitle: String
}

class DataManager: ObservableObject {
    @Published var dataModel: [DataModel]
    
    init(dataModel: [DataModel]) {
        self.dataModel = dataModel
    }
    
    func addItem() {
        dataModel.append(DataModel(itemTitle: "Nore #\(dataModel.count + 1)"))
    }
}
