//
//  LevelOneController.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/22/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class LevelOneController: BaseController {
    
    private final let userNumberLock: Int = 5000
    
    private var numberOfUsersRef: DatabaseReference!
    
    //typealias LevelOneNavigation =
    
    // Dependencies
    //private let navigator: PlayNavigation!
    private var levelOneView: LevelOneView!
    
    // DI Init
    init(levelOneView: LevelOneView){
        self.levelOneView = levelOneView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfUsersRef = Database.database().reference().child("total_players")
        observeTotalPlayers()
        
        configureView()
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
    
    private func configureView(){
        view.addSubview(levelOneView)
        levelOneView.fillSuperview()
        
        levelOneView.configureLevelLabel(levelTitle: "One")
    }
    
    private func observeTotalPlayers(){
        numberOfUsersRef.observe(DataEventType.value, with: { [weak self] (snapshot) in
            let totalUsers = snapshot.value as? Int ?? -1
            self?.levelOneView.updateNumberOfPlayers(numberOfPlayers: totalUsers)
        })
    }
}
