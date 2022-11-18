//
//  GuideFirstViewController.swift
//  KorailTalk
//
//  Created by 정채은 on 2022/11/14.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

class GuideFirstViewController: UIViewController {
    
    private let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "동의 안내"
        label.font = UIFont(name: "h1", size: 16)
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "타인 양도 불가"
        label.font = UIFont(name: "h2", size: 20)
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let imageView : UIImageView = {
        let aImageView = UIImageView()
        aImageView.backgroundColor = .clear
        aImageView.image = UIImage(named: "traveling back to home")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    private let infoLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont (name: "h1", size : 18)
        label.textColor = 0x0B4199.color
        label.text = "내일로 두번째 이야기 패스의 기명인만\n사용가능하며 타인 양도가 절대 불가합니다.\n(부정사용 시 최대 30배 부가운임 징수)"
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    private let pageLabel : UILabel = {
        let label = UILabel()
        label.text = "1/5"
        label.font = UIFont (name: "h1", size : 18)
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let rightButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_right"), for: .normal)
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

extension GuideFirstViewController {
    private func layout() {
        let components: [Any] = [guideLabel, titleLabel,
     imageView, infoLabel, pageLabel, rightButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        guideLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.titleLabel.snp.top).offset(-4)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(37)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.imageView.snp.top).offset(-120)
            make.leading.equalTo(self.guideLabel.snp.leading)
        }
        imageView.snp.makeConstraints{ make in
            make.bottom.equalTo(self.infoLabel.snp.top).offset(-108)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(45)
            make.height.equalTo(122)
            make.width.equalTo(287)
        }
        infoLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.pageLabel.snp.top).offset(-124)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(45)
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
    }
}
