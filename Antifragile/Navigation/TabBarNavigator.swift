//
//  TabBarNavigator.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class TabBarNavigator: NSObject, Navigator{
    typealias Factory = ViewControllerFactory
    fileprivate let factory: Factory
    
    var rootViewController: UIViewController{
        return tabController
    }
    let tabController: UITabBarController
    
    let levelNavigator: PlayNavigator
    let chatNavigator: ChatNavigator
    let hintNavigator: HintNavigator
    let aboutNavigator: AboutNavigator
    
    init(factory: Factory, dismiss: @escaping () -> Void) {
        self.factory = factory
        tabController = UITabBarController()
        //self.goToLogin = dismiss
        levelNavigator = PlayNavigator(factory: factory, dismiss: dismiss)
        chatNavigator = ChatNavigator(factory: factory, dismiss: dismiss)
        hintNavigator = HintNavigator(factory: factory, dismiss: dismiss)
        aboutNavigator = AboutNavigator(factory: factory, dismiss: dismiss)
        
        var controllers: [UIViewController] = []
        
        let levelsController = levelNavigator.rootViewController
        levelsController.tabBarItem = UITabBarItem(title: "Play", image: UIImage(named: "feed_icon_unselected")?.withRenderingMode(.alwaysOriginal) , selectedImage: UIImage(named: "feed_icon_selected")?.withRenderingMode(.alwaysOriginal))
        
        let chatController = chatNavigator.rootViewController
        chatController.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "feed_icon_unselected")?.withRenderingMode(.alwaysOriginal) , selectedImage: UIImage(named: "feed_icon_selected")?.withRenderingMode(.alwaysOriginal))
        
        let hintController = hintNavigator.rootViewController
        hintController.tabBarItem = UITabBarItem(title: "Hints", image: UIImage(named: "feed_icon_unselected")?.withRenderingMode(.alwaysOriginal) , selectedImage: UIImage(named: "feed_icon_selected")?.withRenderingMode(.alwaysOriginal))
        
        let aboutController = aboutNavigator.rootViewController
        aboutController.tabBarItem = UITabBarItem(title: "About", image: UIImage(named: "feed_icon_unselected")?.withRenderingMode(.alwaysOriginal) , selectedImage: UIImage(named: "feed_icon_selected")?.withRenderingMode(.alwaysOriginal))
        
        [levelsController, chatController, hintController, aboutController].forEach{
            controllers.append($0)
        }
    
        super.init()
        
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        tabController.tabBar.tintColor = StyleKit.Colors.primaryPurple
        tabController.tabBar.barTintColor = StyleKit.Colors.tabBarGrey
        tabController.selectedIndex = 0
        tabController.delegate = self
    }
}

extension TabBarNavigator: UITabBarControllerDelegate{
    
}
