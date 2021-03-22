//
//  HeaderView.swift
//  WeeklyNews
//
//  Created by Lucky on 21.03.2021.
//

import UIKit

final class HeaderView: UIView {
    //MARK: - Properties
    private var fontSize: CGFloat
    
    private lazy var headerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "News"
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        return label
    }()
    
    private lazy var headerCircleImage: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        iv.image = UIImage(systemName: "largecircle.fill.circle", withConfiguration: config)
        return iv
    }()
    
    private lazy var plusImage: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        iv.image = UIImage(systemName: "plus", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
        
    private lazy var headerStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [headerCircleImage,headerLabel,plusImage])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        return sv
    }()
    
    private lazy var subheadlineLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(fontSize)
        label.text = "Top Headlines"
        label.textColor = .gray
        return label
    }()
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    func setupView() {
        addSubview(headerStackView)
        addSubview(subheadlineLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // News header
        NSLayoutConstraint.activate([
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        // Subheadline
        NSLayoutConstraint.activate([
            subheadlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subheadlineLabel.topAnchor.constraint(equalTo: headerStackView.bottomAnchor,constant: 8),
            subheadlineLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    

}
