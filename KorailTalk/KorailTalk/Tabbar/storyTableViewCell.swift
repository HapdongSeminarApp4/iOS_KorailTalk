//
//  storyTableViewCell.swift
//  KorailTalk
//
//  Created by 김다운 on 2022/11/25.
//

import UIKit
import SwiftyColor
import Then

class storyTableViewCell: UITableViewCell {
    
    
    static let identifier = "storyTableViewCell"
    
    private let openButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "down"), for: .normal)
    }
    
    
    private let storyLabel = UILabel().then {
        $0.textColor = 0x6F6F6F.color
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.text = "내일로 두번째 이야기"
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseindentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseindentifier)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}

    
extension storyTableViewCell {
        
    private func layout() {
        backgroundColor = .clear
            
        [openButton, storyLabel].forEach {
        contentView.addSubview($0)
    }
            
        openButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
            $0.height.width.equalTo(24)
                
    }
            
        storyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalTo(24)
                
    }
            
            
}
        
        
    }
    
    

