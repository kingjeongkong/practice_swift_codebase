//
//  ViewController.swift
//  viewTest
//
//  Created by 왕정빈 on 2023/03/09.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "paw-prints"))
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
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
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(pinkColor, for: .normal)
        
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .red
        pc.numberOfPages = 4
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
        
        setupBottomControls()
        
        setupLayout()
    }
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView  .heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func setupLayout() {
        let topImageContainerView = UIView()
        //        topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
        //        topImageContainerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.addSubview(bearImageView)
        
        NSLayoutConstraint.activate([
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            //            bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            bearImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            //            bearImageView.widthAnchor.constraint(equalToConstant: 200),
            //            bearImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25 ),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
