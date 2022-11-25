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
        label.font = .systemFont(ofSize: 16, weight: .semibold)
//        label.font = .Pretendard-SemiBold
        label.textColor = 0x0B4199.color
        return label
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "타인 양도 불가"
        label.font = .systemFont(ofSize: 20, weight: .bold)
//        label.font = .Pretendard-Bold
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
        label.font = .systemFont(ofSize: 18)
//        label.font = .Pretendard-SemiBold
        label.textColor = 0x555555.color
        label.text = "내일로 두번째 이야기 패스의 기명인만\n사용가능하며 타인 양도가 절대 불가합니다."
        let attributtedString = NSMutableAttributedString(string: label.text!)
        let font1 = UIFont.systemFont(ofSize: 18, weight: .bold)
        attributtedString.addAttribute(NSAttributedString.Key.font, value:font1, range: (label.text! as NSString).range(of:"기명인"))
        attributtedString.addAttribute(NSAttributedString.Key.foregroundColor, value: 0x0B4199.color, range: (label.text! as NSString).range(of:"기명인"))
        
        attributtedString.addAttribute(NSAttributedString.Key.font, value:font1, range: (label.text! as NSString).range(of:"타인 양도가 절대 불가"))
        attributtedString.addAttribute(NSAttributedString.Key.foregroundColor, value: 0x0B4199.color, range: (label.text! as NSString).range(of:"타인 양도가 절대 불가"))
        label.attributedText = attributtedString
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let moreinfoLabel :UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = 0x8B8B8B.color
        label.text = "(부정사용 시 최대 30배 부가운임 징수)"
        label.textAlignment = .center
        return label
    }()
    
    private let pageLabel : UILabel = {
        let label = UILabel()
        label.text = "1/5"
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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        layout()
        self.setNavigationBar()
//        self.navigationController?.isNavigationBarHidden = false
//        addNaviBar()
        
    }
    
    override func viewWillAppear(_ animated : Bool) {
        super.viewWillAppear(animated)
            self.navigationController?.navigationBar.barStyle = .black
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
        self.navigationController?.navigationBar.backgroundColor = .systemCyan
        self.navigationController?.navigationBar.barTintColor = 0x0B4199.color
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
    
//    private func addNaviBar() {
//
//            // safe area
//            var statusBarHeight: CGFloat = 0
//            statusBarHeight = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
//
//            // navigationBar
//            let naviBar = UINavigationBar(frame: .init(x: 0, y: statusBarHeight, width: view.frame.width, height: statusBarHeight))
//            naviBar.isTranslucent = false
//            naviBar.backgroundColor = .systemBlue
//            naviBar.barTintColor = .systemBlue
//
//            let naviItem = UINavigationItem(title: "내일로 두번째 이야기")
//            naviItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(backTapped))
//            naviBar.items = [naviItem]
//
//            view.addSubview(naviBar)
//        }
    

    
    
    private func pushToSecondVC() {
        let secondVC = GuideSecondViewController()
        self.navigationController?.pushViewController(secondVC, animated: false)
    }

    @objc
    private func touchupNextButton(){
        pushToSecondVC()
    }
    
}





extension GuideFirstViewController {
    private func layout() {
        let components: [Any] = [guideLabel, titleLabel,
     imageView, infoLabel, moreinfoLabel, pageLabel, rightButton]
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
            make.top.equalTo(self.titleLabel.snp.bottom).offset(120)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(45)
            make.height.equalTo(122)
            make.width.equalTo(287)
        }
        infoLabel.snp.makeConstraints{ make in
            make.top.equalTo(self.imageView.snp.bottom).offset(108)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(45)
        }
        moreinfoLabel.snp.makeConstraints{make in
            make.top.equalTo(self.infoLabel.snp.bottom).offset(8)
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
    }
}


