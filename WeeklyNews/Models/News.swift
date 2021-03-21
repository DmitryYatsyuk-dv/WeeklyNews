//
//  News.swift
//  WeeklyNews
//
//  Created by Lucky on 21.03.2021.
//

import Foundation

struct News: Decodable {
    let author: String?
    let title: String?
    let discription: String?
    let url: String?
    let urlToImage: String?
}

struct NewsEnvelop: Decodable {
    let status: String
    let totalResults: Int
    let articles: [News]
}
