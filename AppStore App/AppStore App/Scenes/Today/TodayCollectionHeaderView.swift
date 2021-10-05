//
//  TodayCollectionHeaderView.swift
//  AppStore App
//
//  Created by 김선웅 on 2021/10/05.
//

import SnapKit
import UIKit

final class TodayCollectionHeaderView: UICollectionReusableView {
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .gray
        label.text = "10월 5일 화요일"
        
        return label
    }()
    
    private var todayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.text = "투데이"
        
        return label
    }()
    
    func setup() {
        setupSubViews()
    }
}

extension TodayCollectionHeaderView {
    
    func setupSubViews(){
        [
            dateLabel, todayLabel
        ].forEach { addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
        }
        
        todayLabel.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
            $0.leading.equalTo(dateLabel)
        }

    }
}
