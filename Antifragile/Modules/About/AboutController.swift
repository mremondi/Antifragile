//
//  AboutController.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class AboutController: BaseController {
    
    typealias AboutNavigation = Navigator
    
    // Dependencies
    private let navigator: AboutNavigation!
    private var aboutView: AboutView!
    
    // DI Init
    init(navigator: AboutNavigation, aboutView: AboutView){
        self.navigator = navigator
        self.aboutView = aboutView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //levelsView.delegate = self
        view.addSubview(aboutView)
        aboutView.fillSuperview()
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
