//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "339DCEC2-3E1C-433C-8FEF-39456E2B789E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchCoin(with currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    var delegate: CoinManagerDelegate?
    
    func performRequest(with urlString: String ) {
        //1. Create a URL
        if let url = URL(string: urlString) {
            
            //2. Create URL Session
            let session = URLSession(configuration: .default)
            
            //3. Give the Session Task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:err:))
            
            //4. Start the task
            task.resume()
        }
    }
    
    
    func handle(data: Data?, response: URLResponse?, err: Error?) {
        if err != nil {
            delegate?.didFailWithError(error: err!)
            return
        }
        
        if let safeData = data {
            if let dataAsString = parseJSON(safeData){
                delegate?.didUpdateCoin(self, coin: dataAsString)
            }
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            
            let currentPrice = decodedData.rate
            let currency = decodedData.asset_id_quote
            
            let coin = CoinModel(rate: currentPrice, asset_id_quote: currency)
            return coin
        } catch {
            print(error)
            return nil
        }
    }
    
}

