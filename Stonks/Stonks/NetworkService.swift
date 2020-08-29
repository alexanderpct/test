//
//  NetworkService.swift
//  Stonks
//
//  Created by Alexander on 30.08.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation




class NetworkService {
    
    func fetchStonks(symbol: String, completion: @escaping (Stock) -> Void) {
        let urlString = "https://cloud.iexapis.com/stable/stock/\(symbol)/quote?token=pk_cc2367f4df2d44ae8e60a594f02154b9"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let objects = try JSONDecoder().decode(Stock.self, from: data)
                completion(objects)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchImage(completion: @escaping (Data) -> Void) {
        let imageLink = "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
        guard let url = URL(string: imageLink) else { return }
        do {
            let data = try Data(contentsOf: url)
            completion(data)
        } catch {
            return
        }
    }
    
}
