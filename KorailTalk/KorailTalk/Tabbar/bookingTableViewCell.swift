//
//  TableViewCell.swift
//  KorailTalk
//
//  Created by 김다운 on 2022/11/19.
//

import UIKit
import SwiftyColor
import Then

final class bookingTableViewCell: UITableViewCell {
    
    static let identifier = "bookingTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseindentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseindentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
 
   
    private let iconImageView = UIImageView()
    private let informationLabel = UILabel().then {
        $0.textColor = 0x6F6F6F.color
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private let contentsLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
}

extension bookingTableViewCell {
    
    private func layout() {
        backgroundColor = .clear
        
        [iconImageView, informationLabel, contentsLabel].forEach {
            contentView.addSubview($0)
        }
        
       
        
        informationLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView.snp.trailing).offset(14)
            
    
            
        }
        
        contentsLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-19)
            
        }
        
        iconImageView.snp.makeConstraints {
            $0.height.width.equalTo(24)
            $0.leading.equalToSuperview().offset(21)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(informationLabel.snp.leading).offset(-14)
        }
        
  
        
    }
        func dataBind(model: bookingModel) {
            informationLabel.text = model.information
            contentsLabel.text = model.contents
            iconImageView.image = UIImage(named: model.icon)
        }
}
