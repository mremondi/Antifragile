//
//  BaseLevelView.swift
//  FiftyOne
//
//  Created by Michael Remondi on 9/23/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class BaseLevelView: UIView{    
    // Views
    private var levelTitleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        initViews()
        initConstraints()
        initStyles()
    }
    
    private func initViews(){
        levelTitleLabel = UILabel()
        
        [levelTitleLabel].forEach{
            addSubview($0)
        }
    }
    
    private func initConstraints(){
        levelTitleLabel.anchorCenterX(to: self)
        levelTitleLabel.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 64.0, left: 0, bottom: 0, right: 0))
    }
    
    private func initStyles(){
        self.backgroundColor = StyleKit.Colors.backgroundGrey
        levelTitleLabel.font = StyleKit.Font.primaryFont(size: 64, type: .light)
        levelTitleLabel.textColor = .white
    }
    
    func configureLevelLabel(levelTitle: String){
        levelTitleLabel.text = levelTitle
    }
}
