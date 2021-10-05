//
//  Feature.swift
//  AppStore App
//
//  Created by 김선웅 on 2021/10/05.
//

import Foundation

struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
