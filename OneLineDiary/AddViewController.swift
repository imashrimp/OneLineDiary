//
//  ViewController.swift
//  OneLineDiary
//
//  Created by 권현석 on 2023/07/31.
//

import UIKit

enum TransitionType: String {
    case add = "추가 화면"
    case edit = " 수정화면"
}

//1. UITextViewDelegate
//2. contentcontentsTextView.delegate = self
//3. 필요한 메서드 호출해서 구현
class AddViewController: UIViewController, UITextViewDelegate {
    
    var type: TransitionType = .add
    var textContents: String?
    var placeholderText = "내용을 입력하세요."

    @IBOutlet var contentsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentsTextView.delegate = self
        
        title = type.rawValue
        
        contentsTextView.text = textContents
        
        switch type {
        case .add:
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
            navigationItem.leftBarButtonItem?.tintColor = .red
            
        case .edit:
         print("아이고")
        }
        
        setBackgroundColor()
        showContentsOnTextView()
    }

    @objc func closeButtonTapped() {
        //Present - Dismiss
        dismiss(animated: true)
    }
    
    func showContentsOnTextView() {
        guard let text = textContents else {
            contentsTextView.text = "내용을 입력하세요."
            return
        }
        contentsTextView.text = text
    }
    
    func textViewDidChange(_ textView: UITextView) {
        title = "\(textView.text.count)글자"
    }
    
    //편집이 시작될 때(커서가 시작될 때)
    //플레이스 홀더와 텍스트튜 글자가 같다면 clear, over
    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == placeholderText {
        if textView.textColor == .lightGray { //
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    //편집이 끝날 때(커서가 없어지는 순간)
    //사용자가 아무 글자도 안 썼으면 플레이스 홀더 글자 보이게 설정!
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
}

