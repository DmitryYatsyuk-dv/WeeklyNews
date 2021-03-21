//
//  ViewController.swift
//  WeeklyNews
//
//  Created by Lucky on 19.03.2021.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        ///Test API
//        NetworkManager.shared.getNews { (news) in
//            guard let news = news else { return }
//            print(news[0].title)
//        }
    }
}

