//
//  HintNavigator.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/22/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class HintNavigator: Navigator{
    
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

extension HintNavigator  {
    func toBaseController() {
        let hintController = factory.makeHintController(navigator: self)
        navigationController?.pushViewController(hintController, animated: true)
    }
}

