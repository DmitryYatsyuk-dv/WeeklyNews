//
//  ViewController.swift
//  WeeklyNews
//
//  Created by Lucky on 19.03.2021.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel = NewsListViewModel()
    
    private lazy var headerView: HeaderView = {
        let v = HeaderView(fontSize: 32)
        return v
    }()
    
    private lazy var tableView: UITableView = {
        let tV = UITableView()
        tV.translatesAutoresizingMaskIntoConstraints = false
        tV.tableFooterView = UIView()
        tV.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        tV.delegate = self
        tV.dataSource = self
        
        return tV
    }()

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchNews()
        
        ///Test API
//        NetworkManager.shared.getNews { (news) in
//            guard let news = news else { return }
//            print(news[0].title)
//        }
    }
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Header
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
        
        // tableView
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 8),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func fetchNews() {
        viewModel.getNews { (_) in
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsViewModel = news
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else {
            return
        }
        
        // WebView
        let config = SFSafariViewController.Configuration()
        let safariViewController = SFSafariViewController(url: url, configuration: config)
        safariViewController.modalPresentationStyle = .formSheet
        present(safariViewController, animated: true, completion: nil)
    }
}

