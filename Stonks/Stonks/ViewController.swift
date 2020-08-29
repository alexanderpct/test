//
//  ViewController.swift
//  Stonks
//
//  Created by Alexander on 30.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var companyName: UILabel!
    
    @IBOutlet weak var currentPrice: UILabel!
    @IBOutlet weak var changePrice: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let networkService = NetworkService()
        networkService.fetchStonks(symbol: "AAPL") { [weak self] (stock) in
            
            DispatchQueue.main.async {
                self?.companyName.text = stock.companyName
                self?.currentPrice.text = "\(stock.latestPrice)"
                self?.changePrice.text = "\(stock.change)"
                self?.changePrice.textColor = stock.change > 0 ? .green : .red
            }
        
        }
        
        networkService.fetchImage { [weak self] (data) in
            DispatchQueue.main.async {
                self?.imageView.image = UIImage(data: data)
            }
        }
    }


}

