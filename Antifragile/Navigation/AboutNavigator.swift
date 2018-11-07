//
//  AboutNavigator.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/22/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class AboutNavigator: Navigator{
    
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
}

extension AboutNavigator  {
    func toBaseController() {
        let aboutController = factory.makeAboutController(navigator: self)
        navigationController?.pushViewController(aboutController, animated: true)
    }
}

