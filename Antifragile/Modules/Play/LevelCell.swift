//
//  LevelCell.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

class LevelCell: UICollectionViewCell{
    
    var levelLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
        initConstraints()
    }
    
    func initViews(){
        levelLabel = UILabel()
        
        [levelLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    func initConstraints(){
        roundCornersToRadius(12)
        borderColor = StyleKit.Colors.primaryBlue
        borderWidth = 2.0
            
        levelLabel.anchorCenter(to: contentView)
        levelLabel.textColor = .white
        levelLabel.font = StyleKit.Font.primaryFont(size: 32, type: .thin)
    }
    
    func configureView(levelNumber: String){
        levelLabel.text = levelNumber
    }
}
