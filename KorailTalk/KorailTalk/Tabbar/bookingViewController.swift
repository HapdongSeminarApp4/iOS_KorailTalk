//
//  bookingViewController.swift
//  KorailTalk
//
//  Created by 김다운 on 2022/11/19.
//

import UIKit
import SnapKit
import SwiftyColor

struct bookingModel {
    let icon: String
    let information: String
    let contents: String
}

struct LocationModel {
    let departure : String
    let arrive : String
    let seoul : String
    let busan : String
    let change : String
    let to : String
}

struct shuttleModel {
    let onewayLabel: String
    let shuttleLabel: String
    let onewayicon: String
    let shuttleicon: String
    
}

struct storyModel {
    let icon: String
    let contents: String
}

final class bookingViewController: UIViewController {
    
    private lazy var bookingTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black.withAlphaComponent(0.1)
        
        return tableView
    }()
    
    
    /*private lazy var bookingButton = UIButton().then {
     $0.setTitle("예매하기", for: .normal)
     $0.setTitleColor(.blue, for: .normal)
     $0.backgroundColor = 0xD0DFEC.color
     
     }*/
    
    
    var bookingList: [bookingModel] = [
        bookingModel(icon: "schedule", information: "사용기간", contents: "2022년 11월 5일 (토), 7일 사용"),
        bookingModel(icon: "user", information: "승객 연령 및 좌석수", contents: "어른 1명"),
        bookingModel(icon: "bank_transfer", information: "결제 수단", contents: "신한카드")
    ]
    
    var storyList: [storyModel] = [
        storyModel(icon: "down", contents: "내일로 두번째 이야기")
        
    ]
    
    
    var shuttleList: [shuttleModel] = [
        shuttleModel(onewayLabel: "편도", shuttleLabel: "왕복", onewayicon: "ticket_go", shuttleicon: "ticket_return")
    ]
    
    var locationList: [LocationModel] = [
        LocationModel(departure: "출발", arrive: "도착", seoul: "서울", busan: "부산", change: "ticket_return", to: "ticket_go" )
    ]
    
    private lazy var bookingButton: UIButton = {
        let button = UIButton()
        button.setTitle("예매하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = 0xD0DFEC.color
        return button
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "승차권 예매"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
        
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
        bookingTableView.delegate = self
        bookingTableView.dataSource = self
    }
    
    
    
}

extension bookingViewController {
    
    private func layout() {
        
        
        view.backgroundColor = .white
        view.addSubview(bookingTableView)
        
        let components: [Any] = [bookingTableView, bookingButton, titleLabel]
        components.forEach {
            view.addSubview($0 as! UIView)
            
        }
        
        bookingTableView.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-250)
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide) }
            
        bookingButton.snp.makeConstraints {
           
            $0.height.equalTo(57)
            $0.width.equalToSuperview()
            
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-25)
            
            
        }
        
 
       titleLabel.snp.makeConstraints {
           
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(-30)
            $0.leading.equalToSuperview().offset(140)
           
            
            
        }
        
        
    }
    
    private func register() {
        bookingTableView.register(bookingTableViewCell.self,
                                  forCellReuseIdentifier: bookingTableViewCell.identifier)
        bookingTableView.register(storyTableViewCell.self,
                                  forCellReuseIdentifier: storyTableViewCell.identifier)
        bookingTableView.register(shuttleTableViewCell.self,
                                  forCellReuseIdentifier: shuttleTableViewCell.identifier)
        bookingTableView.register(locationTableViewCell.self,
                                  forCellReuseIdentifier: locationTableViewCell.identifier)
        
    }

    
    
}

extension bookingViewController: UITableViewDelegate { }

extension bookingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookingList.count + locationList.count + shuttleList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: storyTableViewCell.identifier, for: indexPath) as?
                storyTableViewCell else { return UITableViewCell() }
           
           return cell
            
        }  else if indexPath.row == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: locationTableViewCell.identifier, for: indexPath) as? locationTableViewCell else { return UITableViewCell() }
            
            
            cell.dataBind(model: locationList[0])
            return cell
            
        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: shuttleTableViewCell.identifier, for: indexPath) as? shuttleTableViewCell else { return UITableViewCell() }
            
            
            cell.dataBind(model: shuttleList[0])
            return cell
        }
        
          else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: bookingTableViewCell.identifier, for: indexPath) as? bookingTableViewCell else { return UITableViewCell() }
            
            
            cell.dataBind(model: bookingList[indexPath.row-3])
            return cell
            
        }
        
   
        
    }
    
}
