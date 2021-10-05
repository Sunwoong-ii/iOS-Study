//
//  AppDetailViewController.swift
//  AppStore App
//
//  Created by 김선웅 on 2021/10/05.
//

import UIKit
import SnapKit

final class AppDetailViewController: UIViewController {
    private let today: Today
    
    private lazy var appImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "물 마시기 운동"
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        
        label.text = "하루 2리터, 도전해보세요."
        
        return label
    }()
    
    private lazy var downloadButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.setTitle("받기", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .bold)
        
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .systemBlue
        button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
                
        return button
    }()

    init(today: Today) {
        self.today = today
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        view.backgroundColor = .systemBackground
        
        titleLabel.text = today.title
        subTitleLabel.text = today.subTitle
        
        if let imageURL = URL(string: today.imageURL) {
            appImageView.kf.setImage(with: imageURL)
        }
    }
}

extension AppDetailViewController {
    
    func setupLayout() {
        
        [
            appImageView,
            titleLabel,
            subTitleLabel,
            downloadButton,
            shareButton
        ].forEach { view.addSubview($0) }
        
        appImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(100)
            $0.width.equalTo(appImageView.snp.height)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(appImageView)
            $0.leading.equalTo(appImageView.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(titleLabel)
        }
        
        downloadButton.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(32)
            $0.bottom.equalTo(appImageView)
            $0.leading.equalTo(titleLabel)
        }
        
        shareButton.snp.makeConstraints {
            $0.width.equalTo(32)
            $0.height.equalTo(32)
            $0.trailing.equalTo(titleLabel)
            $0.bottom.equalTo(appImageView)
        }
    }
    
    @objc func didTapShareButton() {
        let activityItems: [Any] = [today.title]
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        present(activityViewController, animated: true)
    }
}
