//
//  MenuItem.swift
//  SwiftUIAnimations
//
//  Created by Oleksandr Isaiev on 13.08.2024.
//

import RiveRuntime
import SwiftUI

struct MenuItem: Identifiable {
    let id = UUID()
    let text: String
    let icon: RiveViewModel
    let menu: SelectedMenu
}

extension MenuItem {
    static var menuItems: [MenuItem] = [
        MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons", stateMachineName: "HOME_interactivity", artboardName: "HOME"), menu: .home),
        MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons", stateMachineName: "SEARCH_Interactivity", artboardName: "SEARCH"), menu: .search),
        MenuItem(text: "Favorites", icon: RiveViewModel(fileName: "icons", stateMachineName: "STAR_Interactivity", artboardName: "LIKE/STAR"), menu: .favourites),
        MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons", stateMachineName: "CHAT_Interactivity", artboardName: "CHAT"), menu: .help)
    ]

    static var menuItems2: [MenuItem] = [
        MenuItem(text: "History", icon: RiveViewModel(fileName: "icons", stateMachineName: "TIMER_Interactivity", artboardName: "TIMER"), menu: .history),
        MenuItem(text: "Notification", icon: RiveViewModel(fileName: "icons", stateMachineName: "BELL_Interactivity", artboardName: "BELL"), menu: .notification)
    ]

    static var menuItems3: [MenuItem] = [
        MenuItem(text: "Dark Mode", icon: RiveViewModel(fileName: "icons", stateMachineName: "SETTINGS_Interactivity", artboardName: "SETTINGS"), menu: .darkMode)
    ]
}
