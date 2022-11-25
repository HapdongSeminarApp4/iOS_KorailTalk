//
//  CheckViewController.swift
//  KorailTalk
//
//  Created by 정채은 on 2022/11/25.
//

import UIKit
import SwiftyColor

class CheckViewController: UIViewController {
    
    // SegmentControl 담을 뷰
    private lazy var containerView: UIView = {
        let container = UIView()
        container.backgroundColor = .white
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        
        
        segment.selectedSegmentTintColor = .clear
        
        // 배경 색 제거
        segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        // Segment 구분 라인 제거
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        
        segment.insertSegment(withTitle: "승차권", at: 0, animated: true)
        segment.insertSegment(withTitle: "정기권•패스", at: 1, animated: true)
        
        
        
        segment.selectedSegmentIndex = 0
        
        // 선택 되어 있지 않을때 폰트 및 폰트컬러
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: 0x929292.color,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium)
        ], for: .normal)
        
        // 선택 되었을때 폰트 및 폰트컬러
        segment.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: 0x0B4199.color,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ], for: .selected)
        
        segment.addTarget(self, action: #selector(changeUnderLinePosition), for: .valueChanged)
        
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    private lazy var underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = 0x0B4199.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 움직일 underLineView의 leadingAnchor 따로 작성
    private lazy var leadingDistance: NSLayoutConstraint = {
        return underLineView.leadingAnchor.constraint(equalTo: segmentControl.leadingAnchor)
    }()
    
    
    
    let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = 0xEFEFEF.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
      let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = 0xEFEFEF.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    var shouldHideFirstView: Bool? {
        didSet {
          guard let shouldHideFirstView = self.shouldHideFirstView else { return }
          self.firstView.isHidden = shouldHideFirstView
          self.secondView.isHidden = !self.firstView.isHidden
        }
      }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = 0xEFEFEF.color
        configure()
    }
    
    func configure() {
        view.addSubview(containerView)
        containerView.addSubview(segmentControl)
        containerView.addSubview(underLineView)
        
        self.view.addSubview(self.firstView)
        self.view.addSubview(self.secondView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 55),
            
            segmentControl.topAnchor.constraint(equalTo: containerView.topAnchor),
            segmentControl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            segmentControl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            segmentControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
    
            underLineView.bottomAnchor.constraint(equalTo: segmentControl.bottomAnchor),
            underLineView.heightAnchor.constraint(equalToConstant: 5),
            leadingDistance,
            underLineView.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments))
        ])
        NSLayoutConstraint.activate([
              self.firstView.leftAnchor.constraint(equalTo: self.segmentControl.leftAnchor),
              self.firstView.rightAnchor.constraint(equalTo: self.segmentControl.rightAnchor),
              self.firstView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
              self.firstView.topAnchor.constraint(equalTo: self.segmentControl.bottomAnchor, constant: 16),
            ])
            NSLayoutConstraint.activate([
              self.secondView.leftAnchor.constraint(equalTo: self.firstView.leftAnchor),
              self.secondView.rightAnchor.constraint(equalTo: self.firstView.rightAnchor),
              self.secondView.bottomAnchor.constraint(equalTo: self.firstView.bottomAnchor),
              self.secondView.topAnchor.constraint(equalTo: self.firstView.topAnchor),
            ])
            
            self.segmentControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
            
            self.segmentControl.selectedSegmentIndex = 0
            self.didChangeValue(segment: self.segmentControl)
    }
    
    @objc private func didChangeValue(segment: UISegmentedControl) {
      self.shouldHideFirstView = segment.selectedSegmentIndex != 0
    }
    
    @objc private func changeUnderLinePosition() {
        let segmentIndex = CGFloat(segmentControl.selectedSegmentIndex)
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.leadingDistance.constant = leadingDistance
            self?.view.layoutIfNeeded()
        })
    }
    
}
