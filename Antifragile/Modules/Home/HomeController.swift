//
//  ViewController.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/19/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HomeController: UIViewController {
    
    typealias HomeNavigation = MainAppNavigator
    
    // Dependencies
    private let navigator: HomeNavigation!
    private var homeView: HomeView!
    
    // DI Init
    init(navigator: HomeNavigation, homeView: HomeView){
        self.navigator = navigator
        self.homeView = homeView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.delegate = self
        view.addSubview(homeView)
        homeView.fillSuperview()
    }
}

extension HomeController: HomeViewDelegate{
    func playButtonClicked() {
        updateTotalNumberOfUsers()
        navigator.toMainApp()
    }
    
    private func updateTotalNumberOfUsers(){
        
        // is it the first time the app has been launched?
        let defaults = UserDefaults.standard
        
        let isAppAlreadyLaunchedOnce = defaults.bool(forKey: "isAppAlreadyLaunchedOnce")
        print(isAppAlreadyLaunchedOnce)
        if isAppAlreadyLaunchedOnce{
            // do nothing
        } else {
            let numberOfUsersRef = Database.database().reference().child("total_players")
            numberOfUsersRef.runTransactionBlock({ (currentData:MutableData) -> TransactionResult in
                if var totalPlayers = currentData.value as? Int {
                    totalPlayers += 1
                    currentData.value = totalPlayers
                    return TransactionResult.success(withValue: currentData)
                }
                return TransactionResult.success(withValue: currentData)
            })
        }
    }
}

