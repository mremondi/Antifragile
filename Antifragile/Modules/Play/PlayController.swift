//
//  LevelsController.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class PlayController: BaseController {
    
    typealias PlayNavigation = PlayNavigator
    
    // Dependencies
    private let navigator: PlayNavigation!
    private var playView: PlayView!
    
    // DI Init
    init(navigator: PlayNavigation, playView: PlayView){
        self.navigator = navigator
        self.playView = playView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playView.delegate = self
        view.addSubview(playView)
        playView.fillSuperview()
        
        playView.configureLevels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension PlayController: PlayViewDelegate{
    func selected(level: Int){
        navigator.to(level: level)
    }
}
