//
//  SettingTableViewController.swift
//  OneLineDiary
//
//  Created by 권현석 on 2023/08/01.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others
    
    var mainOptions: String {
        get {
            switch self {
            case .total:
                return "전체 설정"
            case .personal:
                return "개인 설정"
            case .others:
                return "기타"
            }
        }
    }
    
    var subOptions: [String] {
        switch self {
        case.total: return ["공지사항", "실험실", "버정 정보"]
        case .personal: return ["공지사항", "알림", "채팅", "멀티프로필"]
        case .others: return  ["고객센터/도움말"]
        }
    }
}


class SettingTableViewController: UITableViewController {

    let first = ["공지사항", "실험실", "버정 정보"]
    let second = ["공지사항", "알림", "채팅", "멀티프로필"]
    let third = ["고객센터/도움말"]
    
    let list = [
        ["공지사항", "실험실", "버정 정보"],
        ["공지사항", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptions.allCases[section].subOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].subOptions[indexPath.row]
        cell.textLabel?.textColor = .black
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return SettingOptions.allCases[section].mainOptions
    }

}
