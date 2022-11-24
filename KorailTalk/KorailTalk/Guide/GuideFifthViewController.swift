//
//  GuideFifthViewController.swift
//  KorailTalk
//
//  Created by 정채은 on 2022/11/18.
//


import UIKit
import SnapKit
import SwiftyColor
import Then

class GuideFifthViewController: UIViewController {
    
    private let guideLabel: UILabel = {
        let label = UILabel()
        label.text = "동의 안내"
        label.font = .systemFont(ofSize: 16, weight: .semibold)
//        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "이용 횟수 제한"
        label.font = .systemFont(ofSize: 20, weight: .bold)
//        label.font = .Pretendard-Bold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let imageView : UIImageView = {
        let aImageView = UIImageView()
        aImageView.backgroundColor = .clear
        aImageView.image = UIImage(named: "Money investment")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    private let infoLabel : UILabel = {
        let label = UILabel()
//        label.font = .Pretendard-SemiBold
        label.font = .systemFont(ofSize: 18)
        label.textColor = 0x555555.color
        label.text = "내국인만 구매 가능하며,\n권종별 연중 최대 4회까지만 이용이 가능합니다."
        let attributtedString = NSMutableAttributedString(string: label.text!)
        let font1 = UIFont.systemFont(ofSize: 18, weight: .bold)
        attributtedString.addAttribute(NSAttributedString.Key.font, value:font1, range: (label.text! as NSString).range(of:"권종별 연중 최대 4회까지만 이용이 가능"))
        attributtedString.addAttribute(NSAttributedString.Key.foregroundColor, value: 0x0B4199.color, range: (label.text! as NSString).range(of:"권종별 연중 최대 4회까지만 이용이 가능"))
        
        label.attributedText = attributtedString
        
        label.textAlignment = .center
        label.numberOfLines = 5
        
        return label
    }()
    
    private let moreinfoLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = 0x555555.color
        label.text = "위 주의사항에 동의하십니까?"
        label.textAlignment = .center
        return label
    }()
    
    private let rightButton : UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = 0xFFC9C9.color
        button.setTitle("비동의", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(0x555555.color, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let leftButton : UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = 0xD0DFEC.color
        button.setTitle("동의", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        button.setTitleColor(0x555555.color, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
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

extension GuideFifthViewController {
    private func layout() {
        let components: [Any] = [guideLabel, titleLabel,
     imageView, infoLabel, moreinfoLabel, rightButton, leftButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        guideLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(156)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(37)
        }
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.guideLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.guideLabel.snp.leading)
        }
        imageView.snp.makeConstraints{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(91)
            make.centerX.equalToSuperview()
            make.width.equalTo(253)
            make.height.equalTo(220)
        }
        infoLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.imageView.snp.bottom).offset(64)
            make.centerX.equalToSuperview()
        }
        moreinfoLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(self.rightButton.snp.top).offset(-47)
            make.centerX.equalToSuperview()
        }
        rightButton.snp.makeConstraints{ make in
            make.leading.equalTo(self.view.safeAreaLayoutGuide).inset(36)
            make.bottom.equalTo(self.view.safeAreaInsets).inset(49)
            make.width.equalTo(150)
            make.height.equalTo(58)
        }
        leftButton.snp.makeConstraints{ make in
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(34)
            make.bottom.equalTo(self.view.safeAreaInsets).inset(49)
            make.width.equalTo(150)
            make.height.equalTo(58)
        }
    }
}

