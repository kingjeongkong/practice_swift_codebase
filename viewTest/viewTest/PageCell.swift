//
//  PageCell.swift
//  viewTest
//
//  Created by 왕정빈 on 2023/03/24.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet{
//            print(page?.imageName)
            bearImageView.image = UIImage(named: page?.imageName ?? "")
            
            let attributedText = NSMutableAttributedString(string: page?.headerText ?? "",
                                                           attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(page?.bodyText ?? "")",
                                                     attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
                                                                  NSAttributedString.Key.foregroundColor : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText 
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "paw-prints"))
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor : UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    func setupLayout() {
        let topImageContainerView = UIView()
        //        topImageContainerView.backgroundColor = .blue
        addSubview(topImageContainerView)
        //        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.addSubview(bearImageView)
        
        addSubview(descriptionTextView)
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25),
            descriptionTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25 ),
            descriptionTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
