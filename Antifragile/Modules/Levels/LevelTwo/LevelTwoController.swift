//
//  LevelTwoController.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/23/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class LevelTwoController: BaseController {
    
    //typealias LevelOneNavigation =
    
    // Dependencies
    //private let navigator: PlayNavigation!
    private var levelTwoView: LevelTwoView!
    
    // DI Init
    init(levelTwoView: LevelTwoView){
        self.levelTwoView = levelTwoView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //levelsView.delegate = self
        view.addSubview(levelTwoView)
        levelTwoView.fillSuperview()
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

