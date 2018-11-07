//
//  HomeView.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewDelegate{
    func playButtonClicked()
}

class HomeView: UIView{
    var delegate: HomeViewDelegate?
    
    // Views
    private var logoCircle: LogoView!
    private var logoLabel: UILabel!
    private var playButton: UIButton!
    
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
        logoCircle = LogoView()
        logoLabel = UILabel()
        playButton = UIButton()
        playButton.addTarget(self, action: #selector(HomeView.playButtonClicked), for: .touchUpInside)
        
        [logoCircle, logoLabel, playButton].forEach{
            addSubview($0)
        }
    }
    
    private func initConstraints(){
        logoCircle.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 150, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 200))
        logoCircle.anchorCenterX(to: self)
        
        logoLabel.anchorCenter(to: logoCircle)

        playButton.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 100, right: 0), size: .init(width: 240, height: 60))
        playButton.anchorCenterX(to: self)
    }
    
    private func initStyles(){
        self.backgroundColor = StyleKit.Colors.backgroundGrey
        
        logoCircle.borderColor = StyleKit.Colors.primaryPurple
        logoCircle.borderWidth = 2.0
        logoCircle.layer.cornerRadius = logoCircle.frame.size.width/2
        logoCircle.clipsToBounds = true
        
        logoLabel.font = StyleKit.Font.primaryFont(size: 64, type: .thin)
        logoLabel.textColor = .white
        logoLabel.text = "51"
        
        playButton.borderColor = StyleKit.Colors.primaryPurple
        playButton.borderWidth = 2.0
        playButton.setTitleColor(.white, for: .normal)
        playButton.titleLabel?.font = StyleKit.Font.primaryFont(size: 35, type: .thin)
        playButton.setTitle("Play", for: .normal)
        playButton.roundCornersToRadius(30)
    }
    
    @objc func playButtonClicked(){
        delegate?.playButtonClicked()
    }
}

fileprivate class LogoView: UIView{
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.cornerRadius = radius
    }
}
