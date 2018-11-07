//
//  ViewControllerFactory.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation

protocol ViewControllerFactory {
    func makeHomeViewController(navigator: Navigator) -> HomeController
    
    // TOP LEVEL
    func makePlayController(navigator: Navigator) -> PlayController
    func makeChatController(navigator: Navigator) -> ChatController
    func makeHintController(navigator: Navigator) -> HintController
    func makeAboutController(navigator: Navigator) -> AboutController
    
    // LEVELS
    func makeLevelOneController() -> LevelOneController
    func makeLevelTwoController() -> LevelTwoController
}
