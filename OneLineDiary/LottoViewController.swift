//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by 권현석 on 2023/08/03.
//

import UIKit
import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var list: [Int] = Array(1...1079).reversed() //Array(repeating: 100, count: 10)
    
    @IBOutlet var bonusNumberLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var numberTexxtField: UITextField!
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest(number: 1079)
        
        numberTexxtField.inputView = pickerView
        numberTexxtField.tintColor = .clear
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func callRequest(number: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                let date = json["drwNoDate"].stringValue
                let drwtNo1 = json["drwtNo1"].intValue
                let drwtNo2 = json["drwtNo2"].intValue
                let drwtNo3 = json["drwtNo3"].intValue
                let drwtNo4 = json["drwtNo4"].intValue
                let drwtNo5 = json["drwtNo5"].intValue
                let drwtNo6 = json["drwtNo6"].intValue
                let bonusNum = json["bnusNo"].intValue
                
                
                print(date, bonusNum)
                self.dateLabel.text = date
                self.bonusNumberLabel.text = "\(drwtNo1)번, \(drwtNo2)번, \(drwtNo3)번, \(drwtNo4)번, \(drwtNo5)번, \(drwtNo6)번, \(bonusNum)번"
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("select \(row)")
        
        numberTexxtField.text = "\(list[row])"
        
        let series = list.count - row
        
        callRequest(number: series)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(list[row])"
        
    }
}
