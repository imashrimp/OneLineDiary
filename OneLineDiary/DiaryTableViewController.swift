//
//  DiaryTableViewController.swift
//  OneLineDiary
//
//  Created by 권현석 on 2023/07/31.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var list: [String] = ["테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트", "테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2테스트2", "테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3테스트3"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //XIB로 테이블 뷰 셀 생성할 겨웅, 테이블뷰에 사용할 셀을 등록해주는 과정 필요함.
        //XIB 파일이 nib파일로 만들어지는 거임. bundle은 nil로 설정시 메인 주소가 할당됨(무슨 말이여?) => bundle을 nil로 설정 시 네비게이터 영역 파일의 위치를 나타내게 됨
        let nib = UINib(nibName: "DiaryTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DiaryTableViewCell")
        
        //Dynamic Height: 1.automaticDimension, 2.label numberOfLines, 3. AutoLayout(여백)
        tableView.rowHeight = UITableView.automaticDimension
        
        setBackgroundColor()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    @IBAction func searchBarTapped(_ sender: UIBarButtonItem) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func addViewButtonTapped(_ sender: UIBarButtonItem) {
        
        //1. 스토리보드 파일 찾기
//        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 스토리보드 파일 내 뷰컨 찾기
//        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        vc.type = .add
        
        //2-1(옵션) 네비게이션 컨트롤러가 있는 형태(타이틀)로 Present하고 싶은 경우,
        //nav를 사용하면, present와 화면 전환 방식도 nav로 수정해야함.
        let nav = UINavigationController(rootViewController: vc)
        
        //3. 화면 전환 방식 설정
//        vc.modalTransitionStyle = .coverVertical // 모달 애니메이션
        nav.modalPresentationStyle = .fullScreen // 모달 방식
        
        //4. 화면 띄우기
        present(nav, animated: true) //modal
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifiler) as? DiaryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = .clear
        cell.configureCellContent()
        cell.contentLabel.text = list[indexPath.row]
        
        return cell
    }
    
    //1.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //2.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        list.remove(at: indexPath.row)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //DetailViewController 생성하고 present 해보기
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        vc.type = .edit
        vc.textContents = list[indexPath.row]
        
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        
        //Pass Data 2. vc가 가지고 있는 프로퍼티에 데이터 추가
//        vc.contents = list[indexPath.row]
        
        //이너페이스 빌더에 네이게이션 컨트롤러가 임베드되어 있어야함 Push가 동작함.
        navigationController?.pushViewController(vc, animated: true)
    }
}
