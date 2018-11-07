//
//  LevelOneView.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/22/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

protocol LevelOneViewDelegate{
    
}

class LevelOneView: BaseLevelView{
    var delegate: LevelOneViewDelegate?
    
    // Views
    private var numberOfPlayersLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        initViews()
        initConstraints()
        initStyles()
    }
    
    private func initViews(){
        numberOfPlayersLabel = UILabel()
        
        [numberOfPlayersLabel].forEach{
            addSubview($0)
        }
    }
    
    private func initConstraints(){
        numberOfPlayersLabel.anchorCenter(to: self)
    }
    
    private func initStyles(){
        self.backgroundColor = StyleKit.Colors.backgroundGrey
        numberOfPlayersLabel.font = StyleKit.Font.primaryFont(size: 96, type: .light)
        numberOfPlayersLabel.textColor = StyleKit.Colors.pastelRed
    }
    
    public func updateNumberOfPlayers(numberOfPlayers: Int){
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        let numberOfPlayersString = numberFormatter.string(from: NSNumber(value: numberOfPlayers))
        
        if (numberOfPlayers > 9999999){
            numberOfPlayersLabel.font = StyleKit.Font.primaryFont(size: 64, type: .light)
        }
        numberOfPlayersLabel.text = numberOfPlayersString
    }
}
