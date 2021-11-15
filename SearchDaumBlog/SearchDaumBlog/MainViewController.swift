//
//  MainViewController.swift
//  SearchDaumBlog
//
//  Created by 김선웅 on 2021/11/15.
//

import RxSwift
import RxCocoa
import UIKit

final class MainViewController: UIViewController {
    let disposBag = DisposeBag()
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        bind()
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func bind() {
        
    }
    
    private func attribute() {
        title = "다음 블로그 검색"
        view.backgroundColor = .white
        
    }
    
    private func layout() {
        
    }
}
