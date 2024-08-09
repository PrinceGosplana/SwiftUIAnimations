//
//  TabItem.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 09.08.2024.
//

import RiveRuntime
import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var icon: RiveViewModel
}

extension TabItem {
    static let tabItems = [
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT")),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH")),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER")),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL")),
        TabItem(icon: RiveViewModel(fileName: "icons", stateMachineName: "USER_Interactivity", artboardName: "USER"))
    ]
}
