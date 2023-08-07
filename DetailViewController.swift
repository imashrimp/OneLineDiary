//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by 권현석 on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {

    // Pass Data 1. 데이터를 받을 공간(프로퍼티) 생성
    var contents: String = "빈 공간"
    @IBOutlet var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        title = "DetailViewController"
        setBackgroundColor()
        
        //Pass Data 3. 전달 받은 값을 뷰에 표현
        print(contents)
        contentsLabel.text = contents
        contentsLabel.numberOfLines = 0
    }

    
    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        
        //push - pop (nav)
        navigationController?.popViewController(animated: true)
    }
    
    
}
