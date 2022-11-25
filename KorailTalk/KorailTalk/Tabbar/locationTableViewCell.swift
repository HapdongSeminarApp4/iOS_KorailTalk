//
//  locationTableViewCell.swift
//  KorailTalk
//
//  Created by 김다운 on 2022/11/25.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

final class locationTableViewCell: UITableViewCell {
    
    static let identifier = "locationTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseindentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseindentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private let departureLabel = UILabel().then {
        $0.textColor = 0x6F6F6F.color
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    private let arriveLabel = UILabel().then {
        $0.textColor = 0x6F6F6F.color
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
   
    
    private let seoulLabel = UILabel().then {
        $0.textColor = 0x0B4199.color
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let busanLabel = UILabel().then {
        $0.textColor = 0x0B4199.color
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
    }
    
    private let iconContainerView = UIView()
    private let changeImageView = UIImageView()
    
    private let icon2ContainerView = UIView()
    private let toImageview = UIImageView()
}

extension locationTableViewCell {
    
    private func layout() {
        backgroundColor = .clear
        
        [departureLabel, arriveLabel, seoulLabel, busanLabel, changeImageView, toImageview].forEach {
            contentView.addSubview($0)
        }
        
        departureLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(84)
            $0.bottom.equalTo(self.seoulLabel.snp.top).offset(-21)
        }
        
        arriveLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-79)
            $0.bottom.equalTo(self.busanLabel.snp.top).offset(-21)
            
        }
        
        seoulLabel.snp.makeConstraints {
            
            $0.leading.equalToSuperview().offset(75)
            $0.bottom.equalToSuperview().offset(-30)
            
            
        }
        
        busanLabel.snp.makeConstraints {
            
            $0.trailing.equalToSuperview().offset(-70)
            $0.bottom.equalToSuperview().offset(-30)
            
        }
        
        
        changeImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(30)
            $0.height.equalTo(18)
            $0.width.equalTo(36)
        }
      
        toImageview.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(77)
            $0.height.equalTo(12)
            $0.width.equalTo(18)
        }
    
        
    }
        
    func dataBind(model: LocationModel) {
        departureLabel.text = model.departure
        arriveLabel.text = model.arrive
        seoulLabel.text = model.seoul
        busanLabel.text = model.busan
        changeImageView.image = UIImage(named: model.change)
        toImageview.image = UIImage(named: model.to)
    
    }
    
   
    
}
