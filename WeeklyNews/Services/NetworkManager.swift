//
//  NetworkManager.swift
//  WeeklyNews
//
//  Created by Lucky on 21.03.2021.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache <NSString, NSData>()
    
    static let shared = NetworkManager()
    private init() {}
    
    private let baseUrlString = "https://newsapi.org/v2/"
    private let USTopHeadline = "top-headlines?country=us"
        
    func getNews(completionHandler: @escaping ([News]?) -> Void) {
        let urlString = "\(baseUrlString)\(USTopHeadline)&apiKey=\(APIKey.key)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil, let data = data else {
                completionHandler(nil)
                return
            }
            
            let newsEnvelop = try? JSONDecoder().decode(NewsEnvelop.self, from: data)
            
            //MARK: - refactor
            newsEnvelop == nil
                ? completionHandler(nil)
                : completionHandler(newsEnvelop!.articles)
        }.resume() 
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        if let cachedImage = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cachedImage as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil, let data = data else {
                    completion(nil)
                    return
                }
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
}
