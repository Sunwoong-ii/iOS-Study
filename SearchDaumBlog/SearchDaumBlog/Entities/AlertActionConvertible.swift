//
//  AlertActionConvertible.swift
//  SearchDaumBlog
//
//  Created by 김선웅 on 2021/11/15.
//

import Foundation
import UIKit

protocol AlertActionConvertible {
    var title: String { get }
    var style: UIAlertAction.Style { get }
}
