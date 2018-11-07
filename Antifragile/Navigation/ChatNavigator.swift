//
//  ChatNavigator.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/22/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class ChatNavigator: Navigator{
    
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

extension ChatNavigator  {
    func toBaseController() {
        let chatController = factory.makeChatController(navigator: self)
        navigationController?.pushViewController(chatController, animated: true)
    }
}
