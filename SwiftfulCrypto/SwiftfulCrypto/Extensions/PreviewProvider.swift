//
//  PreviewProvider.swift
//  SwiftfulCrypto
//
//  Created by Denys on 07.08.2022.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() {}
    
    let coin = CoinModel(id: "bicoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579", currentPrice: 61408, marketCap: 1141731099010, marketCapRank: 1, fullyDilutedValuation: 1285385611303, totalVolume: 67190952980, high24H: 61712, low24H: 56220, priceChange24H: 3952.64, priceChangePercentage24H: 6.87944, marketCapChange24H: 72110681879, marketCapChangePercentage24H: 6.74141, circulatingSupply: 18653043, totalSupply: 21000000, maxSupply: 21000000, ath: 61712, athChangePercentage: -0.97589, athDate: "2021-03-13T20:49:26.606Z", atl: 67.81, atlChangePercentage: 90020.24075, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2021-03-13T23:18:10.268Z", sparklineIn7D: SparklineIn7D(price: [23733.417287005916,23668.67652653213,23858.138349751338,23822.836507103373,23603.763247155497,23288.61718933002,23344.85586704442,23441.0804160777,23421.057391253977,23445.52374480926,23366.128355758876,23398.65584430152,23358.10753009553,23239.690445517183,23338.997305915254,23339.97597455211,23362.7508245893,23029.078440021807,23270.295705683406,23176.73357658733,23105.494960500542,23467.475084576523,23334.1557335138,23200.553474645974,22944.24607430787,22916.219054614387,22965.342848277465,23000.87953630366,23024.727978517763,23188.23385659723,23304.1571928234,23202.19659145586,23030.548084427675,22910.21172636582,22872.24479855461,22865.664954491924,22901.21719287984,22941.69366831134,22929.004063541244,22863.418535111665,22754.248681980403,22846.03244034653,22961.911906856592,22773.1548001195,22772.754566320524,23034.40445232363,23010.00392655651,23412.928605120822,23188.72466579322,23106.894196639056,23058.788925401288,23001.32394626324,23073.917545949414,23115.382085589026,23052.946432738398,22778.669544609886,22810.598754003724,22818.006390093644,22851.29370993277,22872.394253258004,22970.347607715456,23071.255492072465,23041.911704666516,23247.835065103893,23406.847516862126,23420.539563171056,23385.63635414085,23347.694879236282,23371.344890013825,23293.66621786727,23365.62773939191,23448.830276568286,23478.45318170668,23561.825256339675,23514.886101809436,23353.15526502444,23329.23241864078,23026.02287402876,22860.42098438317,23021.363403137442,23165.07299862601,23154.057166073842,23103.059748132782,23131.857855052407,23146.821787804925,22941.33425740183,22966.697985477986,22840.295982877997,22872.47809481704,22891.689214319722,22925.591058156344,22939.92827909115,22998.007950207473,22918.987264249394,22889.943487417593,22759.624086553336,22666.122824147693,22626.14436355951,22526.435183639795,22569.498122092893,22555.159978032265,22639.315927631513,22670.805467242913,22670.754974103194,22792.56894034112,23101.629653708267,23189.72937256446,23162.64545857599,23244.716623299006,23270.178940177517,23213.183442976253,23136.194708847743,23145.397604891536,23236.66447917,23426.863032781774,23041.140476247227,23061.426167940153,23225.346907374642,23042.103136243677,23006.724847657093,22958.232947473756,22834.97170925916,22914.175494713192,22975.426717494902,23152.80401737373,23240.700574791303,23225.036201942938,23289.635614459137,23248.370622776587,23276.748783798543,23203.53378919455,23227.182484320372,23204.679549688728,23186.37353251177,23224.30083975727,23170.585831566834,23205.743133485837,23199.620151590272,23177.198029948682,23197.719672630807,23211.868632619335,23220.887956958457,23209.576812276,23212.477809256714,23163.585786848744,23175.78180257873,23209.43804276598,23184.24808221292,23191.557167588115,23199.689947122362,22984.57953144855,22949.64785813393,22935.020076158922,23011.76561145652,23011.36572437755,23010.770904452937,22991.978854808985,23024.131977473124,23025.750361380524,22951.155016019173,22986.094715647123,23006.043975365625,23022.118456853925,23106.979695904538,23166.50831509818,23136.147414083767,23077.282158421873,23114.836129805888]), priceChangePercentage24HInCurrency: 3952.64, currentHoldings: 1.5)
    
}
