//
//  LevelNavigator.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class PlayNavigator: Navigator{
    
    fileprivate var navigationController: UINavigationController?
    
    public var rootViewController: UIViewController {
        return navigationController!
    }
    
    typealias Factory = ViewControllerFactory
    fileprivate let factory: Factory
    
    init(factory: Factory, dismiss: @escaping () -> Void){
        self.factory = factory
        self.navigationController = UINavigationController()
        toBaseController()
    }

    func toBaseController() {
        let playController = factory.makePlayController(navigator: self)
        navigationController?.pushViewController(playController, animated: true)
    }
    
    // methods for navigation to specific level controllers
    func to(level: Int) {
        switch(level){
        case 0:
            let levelOneController = factory.makeLevelOneController()
            navigationController?.pushViewController(levelOneController, animated: true)
        case 1:
            let levelTwoController = factory.makeLevelTwoController()
            navigationController?.pushViewController(levelTwoController, animated: true)
        default:
            break // TODO: is there a better way to handle this?
        }
    }
}
