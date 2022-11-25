//
//  shuttleTableViewCell.swift
//  KorailTalk
//
//  Created by 김다운 on 2022/11/25.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

class shuttleTableViewCell: UITableViewCell {
    
    static let identifier = "shuttleTableViewCell"
    
    /*override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseindentifier: String?) {
     super.init(style: style, reuseIdentifier: reuseindentifier)
     layout()
     }
     
     required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     
     }*/
    
  
    private let onewayiconImageView = UIImageView()
    
    private let onewaycontentsLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    
    private let shuttleiconImageView = UIImageView()
    
    private let shuttlecontentsLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    extension shuttleTableViewCell {
        
        private func layout() {
            backgroundColor = .clear
            
            [onewayiconImageView, onewaycontentsLabel,shuttleiconImageView, shuttlecontentsLabel].forEach {
                contentView.addSubview($0)
            }
            
            
            
            onewaycontentsLabel.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(100)
                $0.centerY.equalToSuperview()
               
                
            }
            
         
            
            shuttlecontentsLabel.snp.makeConstraints {
                $0.trailing.equalToSuperview().offset(-67)
                $0.centerY.equalToSuperview()
                
            }
            
            onewayiconImageView.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.leading.equalToSuperview().offset(68)
            }
            
            shuttleiconImageView.snp.makeConstraints {
                $0.centerY.equalToSuperview()
                $0.trailing.equalToSuperview().offset(-108)
            }
            
    }
            
            func dataBind(model: shuttleModel) {
                onewaycontentsLabel.text = model.onewayLabel
                shuttlecontentsLabel.text = model.shuttleLabel
                onewayiconImageView.image = UIImage(named: model.onewayicon)
                shuttleiconImageView.image = UIImage(named: model.shuttleicon)
            
            }
            
         
            
        }
    



