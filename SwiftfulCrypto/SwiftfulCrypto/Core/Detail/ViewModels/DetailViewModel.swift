//
//  DetailViewModel.swift
//  SwiftfulCrypto
//
//  Created by Denys on 11.09.2022.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
            .sink { (returnedCoinDetails) in
                print("RECIEVE DATA")
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
