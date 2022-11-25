//
//  GuideSecondViewController.swift
//  KorailTalk
//
//  Created by 정채은 on 2022/11/18.
//

import UIKit
import SnapKit
import SwiftyColor
import Then

class GuideSecondViewController: UIViewController {
    
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
        label.text = "이용 가능 열차"
        label.font = .systemFont(ofSize: 20, weight: .bold)
//        label.font = .Pretendard-Bold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let imageView : UIImageView = {
        let aImageView = UIImageView()
        aImageView.backgroundColor = .clear
        aImageView.image = UIImage(named: "Group 34032")
        aImageView.translatesAutoresizingMaskIntoConstraints = false
        return aImageView
    }()
    
    private let ktxLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
//        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        label.text = "KTX"
        return label
    }()
    
    private let ktxinfo1Label : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
//        label.font = .Pretendard-Medium
        label.textColor = 0x555555.color
        label.text = "KTX의 좌석 2회 (1일 1회, 총 2회)"
        return label
    }()
    
    private let ktxinfo2Label : UILabel = {
        let label = UILabel()
//        label.font = .Pretendard-Medium
        label.font = .systemFont(ofSize: 14)
        label.textColor = 0x555555.color
        label.text = "KTX의 입석(자유석) 이용 불가"
        return label
    }()
    
    private let regularLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
//        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        label.text = "일반열차"
        return label
    }()
    
    private let regularinfo1Label : UILabel = {
        let label = UILabel()
//        label.font = .Pretendard-Medium
        label.font = .systemFont(ofSize: 14)
        label.textColor = 0x555555.color
        label.text = "ITX-청춘, ITX-새마을, 새마을,\n무궁화, 누리호, 통근열차의 좌석 (1일 2회)"
        label.numberOfLines = 2
        return label
    }()
    
    private let regularinfo2Label : UILabel = {
        let label = UILabel()
//        label.font = .Pretendard-Medium
        label.font = .systemFont(ofSize: 14)
        label.textColor = 0x555555.color
        label.text = "일반열차 입석(자유석)"
        return label
    }()
    
    private let pageLabel : UILabel = {
        let label = UILabel()
        label.text = "2/5"
        label.font = .systemFont(ofSize: 18, weight: .semibold)
//        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    lazy var rightButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_right"), for: .normal)
        button.addTarget(self, action: #selector(touchupNextButton), for: .touchUpInside)
        return button
    }()
    
    lazy var leftButton : UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_left"), for: .normal)
        button.addTarget(self, action: #selector(touchupBackButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        self.setNavigationBar()
    }
    private func setNavigationBar() {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 199, height: 29))
        

        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = .systemFont(ofSize: 24, weight: .semibold)
        topTitle.textColor = .white
        topTitle.text = "내일로 두번째 이야기"

        let backBarButtonItem = UIBarButtonItem(
//            image: UIImage(named:"button_back"),
            title: "",
            style: .plain,
            target: self,
            action:  #selector(backTapped))
            backBarButtonItem.tintColor = .white
            self.navigationItem.backBarButtonItem = backBarButtonItem


        containerView.addSubview(topTitle)

        self.navigationItem.titleView = containerView
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor =  0x0B4199.color
        self.navigationController?.navigationBar.barTintColor = .systemCyan
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor =  0x0B4199.color
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        
        self.navigationController?.navigationBar.isTranslucent = false
        
    

    }
    @objc func backTapped(sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: false)
    }

    
    private func pushToThirdVC() {
        let thirdVC = GuideThirdViewController()
        self.navigationController?.pushViewController(thirdVC, animated: false)
    }

    @objc
    private func touchupNextButton(){
        pushToThirdVC()
    }

    @objc
    private func touchupBackButton(){
        self.navigationController?.popViewController(animated: false)
    }

}

extension GuideSecondViewController {
    private func layout() {
        let components: [Any] = [guideLabel, titleLabel,
     imageView, ktxLabel, ktxinfo1Label, ktxinfo2Label, regularLabel, regularinfo1Label, regularinfo2Label, pageLabel, rightButton, leftButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
        
        guideLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(48)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(37)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.guideLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.guideLabel.snp.leading)
        }
        imageView.snp.makeConstraints{ make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(46)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(48)
            make.height.equalTo(174)
            make.width.equalTo(284)
        }
        ktxLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.imageView.snp.bottom).offset(48)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(47)
        }
        ktxinfo1Label.snp.makeConstraints{ make in
            make.top.equalTo(self.ktxLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(47)
        }
        ktxinfo2Label.snp.makeConstraints{ make in
            make.top.equalTo(self.ktxinfo1Label.snp.bottom).offset(4)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(47)
        }
        regularLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.ktxinfo2Label.snp.bottom).offset(22)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(47)
        }
        regularinfo1Label.snp.makeConstraints{ make in
            make.top.equalTo(self.regularLabel.snp.bottom).offset(4)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(47)
        }
        regularinfo2Label.snp.makeConstraints{ make in
            make.top.equalTo(self.regularinfo1Label.snp.bottom).offset(4)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(47)
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
