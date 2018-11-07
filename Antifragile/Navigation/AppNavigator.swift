//
//  AppNavigator.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

final class AppNavigator: Navigator{
    
    private var window: UIWindow?
    
    typealias Factory = ViewControllerFactory
    fileprivate let factory: Factory
    
    init(window: UIWindow?, factory: Factory){
        self.window = window
        self.factory = factory
    }
    
    func run(){
        // include any routing here. E.g. if !loggedIn -> goToLoginFlow()
        goToHomeScreen()
    }
    
    private func goToHomeScreen(){
        // Any type of Navigator can go here. E.g. a TabBarNavigator with sub-navigators children for each tab
        let homeController = factory.makeHomeViewController(navigator: self)
        window?.rootViewController = homeController
        window?.makeKeyAndVisible()
    }
}

extension AppNavigator: MainAppNavigator{
    func toMainApp() {
        let tabBarNavigator = TabBarNavigator(factory: factory, dismiss: { [weak self] () in
            // dismissal logic here
            
        })
        window?.rootViewController = tabBarNavigator.rootViewController
        window?.makeKeyAndVisible()
    }
}
