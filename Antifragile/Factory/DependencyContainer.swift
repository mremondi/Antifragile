//
//  DependencyContainer.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
class DependencyContainer {
    //private lazy var userManager = UserManager()
}

extension DependencyContainer: ViewControllerFactory{
    func makeHomeViewController(navigator: Navigator) -> HomeController {
        return HomeController(navigator: navigator as! HomeController.HomeNavigation, homeView: HomeView())
    }
    
    func makePlayController(navigator: Navigator) -> PlayController {
        return PlayController(navigator: navigator as! PlayController.PlayNavigation, playView: PlayView())
    }
    
    func makeChatController(navigator: Navigator) -> ChatController {
        return ChatController(navigator: navigator as! ChatController.ChatNavigation, chatView: ChatView())
    }
    
    func makeHintController(navigator: Navigator) -> HintController {
        return HintController(navigator: navigator as! HintController.HintNavigation, hintView: HintView())
    }
    
    func makeAboutController(navigator: Navigator) -> AboutController {
        return AboutController(navigator: navigator as! AboutController.AboutNavigation, aboutView: AboutView())
    }
    
    func makeLevelOneController() -> LevelOneController {
        return LevelOneController(levelOneView: LevelOneView())
    }
    
    func makeLevelTwoController() -> LevelTwoController {
        return LevelTwoController(levelTwoView: LevelTwoView())
    }
    
}
