//
//  GuideThirdViewController.swift
//  KorailTalk
//
//  Created by 정채은 on 2022/11/18.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

class GuideThirdViewController: UIViewController {
    
    private let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "동의 안내"
        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "별도 범위 지정"
        label.font = .Pretendard-Bold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let imageView : UIImageView = {
        let aImageView = UIImageView()
        aImageView.backgroundColor = .clear
        aImageView.image = UIImage(named: "image 23")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    private let infoLabel : UILabel = {
        let label = UILabel()
        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        label.text = "일반 예매에서 남아있더라도\n내일로 패스로 이용할 수 있는 \n좌석 및 자유석은 별도 범위 적용을 받으므로\n원하는 요일이나 시간대의 열차 이용이\n불가할 수 있습니다."
        label.textAlignment = .center
        label.numberOfLines = 5
        return label
    }()
    
    private let pageLabel : UILabel = {
        let label = UILabel()
        label.text = "3/5"
        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let rightButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_right"), for: .normal)
        return button
    }()
    
    private let leftButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_left"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
//    private func setNavigationBar() {
//        navigationController?.navigationBar.barTintColor = 0x0B4199.color
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//
//    }
}

extension GuideThirdViewController {
    private func layout() {
        let components: [Any] = [guideLabel, titleLabel,
     imageView, infoLabel, pageLabel, rightButton, leftButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        guideLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.titleLabel.snp.top).offset(-4)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(37)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.imageView.snp.top).offset(-64)
            make.leading.equalTo(self.guideLabel.snp.leading)
        }
        imageView.snp.makeConstraints{ make in
            make.bottom.equalTo(self.infoLabel.snp.top).offset(-64)
            make.centerX.equalToSuperview()
            make.height.equalTo(222)
            make.width.equalTo(231)
        }
        infoLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.pageLabel.snp.top).offset(-80)
            make.centerX.equalToSuperview()
        }
        pageLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.view.safeAreaInsets).inset(68)
            make.centerX.equalToSuperview()
        }
        rightButton.snp.makeConstraints{ make in
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(32)
            make.height.width.equalTo(40)
            make.bottom.equalTo(self.view.safeAreaInsets).inset(59)
        }
        leftButton.snp.makeConstraints{ make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(34)
            make.height.width.equalTo(40)
            make.bottom.equalTo(self.view.safeAreaInsets).inset(59)
        }
    }
}
