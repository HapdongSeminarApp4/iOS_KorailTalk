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

class GuideFirstViewController: UINavigationController {
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
