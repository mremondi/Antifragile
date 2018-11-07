//
//  LevelsView.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

fileprivate let levelCollectionViewCellReuseIdentifier = "LevelCollectionCell"

protocol PlayViewDelegate {
    func selected(level: Int)
}

class PlayView: UIView{
    var delegate: PlayViewDelegate?
    
    var levels: [String] = ["1", "2"]
    
    // Views
    private var titleLabel: UILabel!
    private var levelsCollectionView: UICollectionView!
    
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
        titleLabel = UILabel()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 150, height: 150)
        levelsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        levelsCollectionView.delegate = self
        levelsCollectionView.dataSource = self
        levelsCollectionView.register(LevelCell.self, forCellWithReuseIdentifier: levelCollectionViewCellReuseIdentifier)
        
        [titleLabel, levelsCollectionView].forEach{
            addSubview($0)
        }
    }
    
    private func initConstraints(){
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 64, left: 16, bottom: 0, right: 0))
        
        levelsCollectionView.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 16.0, left: 16.0, bottom: 0, right: 16.0))
    }
    
    private func initStyles(){
        backgroundColor = StyleKit.Colors.backgroundGrey
        
        titleLabel.font = StyleKit.Font.primaryFont(size: 64, type: .light)
        titleLabel.textColor = .white
        titleLabel.text = "Levels"
        
        levelsCollectionView.backgroundColor = StyleKit.Colors.backgroundGrey
    }
    
    public func configureLevels(){
        self.levelsCollectionView.reloadData()
    }
    
    private func didSelect(level: Int){
        delegate?.selected(level: level)
    }
}


extension PlayView: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levels.count
    }
}

extension PlayView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let levelName = levels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: levelCollectionViewCellReuseIdentifier,
                                                      for: indexPath as IndexPath) as! LevelCell
        cell.configureView(levelNumber: levelName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.didSelect(level: indexPath.row)
    }
}
