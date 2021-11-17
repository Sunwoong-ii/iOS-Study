//
//  SearchBlogAPI.swift
//  SearchDaumBlog
//
//  Created by 김선웅 on 2021/11/17.
//

import Foundation

struct SearchBlogAPI {
    static let scheme = "https"
    static let host = "dapi.kakao.com"
    static let path = "/v2/search/"
    
    func searchBlog(query: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = SearchBlogAPI.scheme
        components.host = SearchBlogAPI.host
        components.path = SearchBlogAPI.path + "blog"
        
        components.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        
        return components
    }
}
