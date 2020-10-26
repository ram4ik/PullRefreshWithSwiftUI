//
//  RefreshScrollView.swift
//  PullRefreshWithSwiftUI
//
//  Created by ramil on 26.10.2020.
//

import UIKit
import SwiftUI

struct RefreshScrollView: UIViewRepresentable {
    var width: CGFloat
    var height: CGFloat
    
    let manager = DataManager(dataModel: [
        DataModel(itemTitle: "Note #1"),
        DataModel(itemTitle: "Note #2"),
        DataModel(itemTitle: "Note #3")
    ])
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefreshControll(sender:)), for: .valueChanged)
        let refreshVC = UIHostingController(rootView: PullToRefresh(manager: manager))
        refreshVC.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        scrollView.addSubview(refreshVC.view)
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, manager: manager)
    }
    
    class Coordinator: NSObject {
        var refreshScrollView: RefreshScrollView
        var manager: DataManager
        
        init(_ refreshScrollView: RefreshScrollView, manager: DataManager) {
            self.refreshScrollView = refreshScrollView
            self.manager = manager
        }
        
        @objc func handleRefreshControll(sender: UIRefreshControl) {
            sender.endRefreshing()
            manager.addItem()
        }
    }
}
