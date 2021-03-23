//
//  NewsViewModel.swift
//  WeeklyNews
//
//  Created by Lucky on 21.03.2021.
//

import Foundation

struct NewsViewModel {
    let news: News
    
    var author: String {
        return news.author ?? "Unknown"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var description: String {
        return news.discription ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://p.kindpng.com/picc/s/451-4517593_weekly-news-hd-png-download.png"
    }
}
