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
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today in our fun and games!"
        textView.font = .boldSystemFont(ofSize: 20)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        
        setupLayout()
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bearImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            bearImageView.widthAnchor.constraint(equalToConstant: 200),
            bearImageView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionTextView.topAnchor.constraint(equalTo: bearImageView.bottomAnchor, constant: 100),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
