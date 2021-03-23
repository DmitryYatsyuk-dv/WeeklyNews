//
//  ShadowImageView.swift
//  WeeklyNews
//
//  Created by Lucky on 22.03.2021.
//

import UIKit

final class ShadowImageView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        return iv
    }()
    
    private lazy var baseView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 5, height: 5)
        v.layer.shadowOpacity = 0.7
        v.layer.shadowRadius = 10.0
        return v
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(baseView)
        baseView.addSubview(imageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        [baseView, imageView].forEach { (view) in
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
                view.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
                view.topAnchor.constraint(equalTo: topAnchor,constant: 16),
                view.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
            ])
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        baseView.layer.shadowPath = UIBezierPath(roundedRect: baseView.bounds, cornerRadius: 10).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }
}
