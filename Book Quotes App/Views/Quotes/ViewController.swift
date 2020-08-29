//
//  ViewController.swift
//  Book Quotes App
//
//  Created by Michael Grant on 8/28/20.
//  Copyright © 2020 Michael Grant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    
    var viewModel = QuotesViewModel()
    var collectionViewWidth: CGFloat {
        return collectionView.frame.size.width
    }

    // MARK: - Outlets
    
    @IBOutlet var pageControler: UIPageControl!
    @IBOutlet var containerView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    // MARK: - Helpers
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        viewModel.createQuotes()
        setupPageControl()
    }
    
    // MARK: - Actions
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let nextRow = getCurrentIndex() + 1
        pageControler.currentPage = nextRow
        let nextIndexPath = IndexPath(row: nextRow, section: 0)
        collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
    }
    
    private func getCurrentIndex() -> Int {
        return Int(collectionView.contentOffset.x / collectionView.frame.width)
    }
    
    private func setupPageControl() {
        pageControler.numberOfPages = viewModel.quotes.count
    }
    
    private func showItem(at index: Int) {
        pageControler.currentPage = index
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.quotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let quote = viewModel.quotes[indexPath.row]
        cell.authorLabel.text = quote.author
        cell.quoteLabel.text = quote.quote
        cell.imageView.image = quote.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = getCurrentIndex()
        showItem(at: index)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let xValue = scrollView.contentOffset.x
        
        let index = getCurrentIndex()

        let fadeInAlpha = (xValue - collectionViewWidth * CGFloat(index)) / collectionViewWidth
        let fadeOutAlpha = CGFloat(1 - fadeInAlpha)
        let selectedItems = collectionView.indexPathsForVisibleItems
        for indexPath in selectedItems {
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell {
                cell.imageView.alpha = fadeOutAlpha
            }
    
            if let cell = collectionView.cellForItem(at: IndexPath(row: index + 1, section: 0)) as? CollectionViewCell {
                cell.imageView.alpha = fadeInAlpha
            }
        }
    }
}
