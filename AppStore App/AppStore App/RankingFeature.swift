//
//  RankingFeature.swift
//  AppStore App
//
//  Created by 김선웅 on 2021/10/05.
//

import Foundation

struct RankingFeature: Decodable {
    let title: String
    let description: String
    let isInPurchaseApp: Bool
}
