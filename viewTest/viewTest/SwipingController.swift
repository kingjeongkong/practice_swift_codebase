//
//  SwipingController.swift
//  viewTest
//
//  Created by 왕정빈 on 2023/03/19.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var numOfPage = 0
    
    let pages = [
        Page(imageName: "paw-prints", headerText: "Join us today in our fun and games!", bodyText: "1"),
        Page(imageName: "heart", headerText: "Subscribe and get coupons on our daily events", bodyText: "2"),
        Page(imageName: "leaf", headerText: "VIP members special service", bodyText: "3"),
        Page(imageName: "paw-prints", headerText: "Join us today in our fun and games!", bodyText: "1"),
        Page(imageName: "heart", headerText: "Subscribe and get coupons on our daily events", bodyText: "2"),
        Page(imageName: "leaf", headerText: "VIP members special service", bodyText: "3")
    ]
    
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handlePrevious() {
        if numOfPage > 0 {
            numOfPage -= 1
            let indexPath = IndexPath(item: numOfPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = numOfPage
        }
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.setTitleColor(pinkColor, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handleNext() {
        if numOfPage < pages.count - 1 {
            numOfPage += 1
            let indexPath = IndexPath(item: numOfPage, section: 0)
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = numOfPage
        }
    }
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .red
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { _ in
            self.collectionViewLayout.invalidateLayout()
            
            let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        } completion: { _ in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellID")
        
        collectionView.isPagingEnabled = true
        
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        pageControl.setContentHuggingPriority(.fittingSizeLevel, for: .horizontal)
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as? PageCell else { return UICollectionViewCell() }
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
