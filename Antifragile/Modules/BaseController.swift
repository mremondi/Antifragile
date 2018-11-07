//
//  BaseLevel.swift
//  FiftyOne
//
//  Created by Michael Remondi on 9/23/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class BaseController: UIViewController {
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        observeLevel()
    }

    // listens to the app_state field in firebase. If there is a change in level and it is greater than
    // the locally saved level, we update the local level and present an alert letting users
    // jump to the new level
    func observeLevel(){
        let levelRef = ref.child("app_state")
        let observer = levelRef.observe(DataEventType.value, with: { [weak self] (snapshot) in
            let levelNumber = snapshot.value as? Int ?? -1
            let defaults = UserDefaults.standard
            let localLevel = defaults.integer(forKey: "currentGameStateLevel")
            if localLevel < levelNumber {
                defaults.set(levelNumber, forKey: "currentGameStateLevel")
                self?.presentNewLevelUnlockedAlert(levelNumber: levelNumber)
            }
        })
    }
    
    func presentNewLevelUnlockedAlert(levelNumber: Int){
        let title = "Level " + String(levelNumber + 1) + " Unlocked!"
        let message = "Would you like to jump to the new level?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            // TODO: access navigator???
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        present(alert, animated: false, completion: nil)
    }
}
