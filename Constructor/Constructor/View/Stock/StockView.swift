//
//  StockView.swift
//  Constructor
//
//  Created by Denys on 27.09.2022.
//

import SwiftUI

struct StockView: View {
    
    @EnvironmentObject var superVM: SuperViewModel
    
    var body: some View {
        List {
            ForEach(superVM.items) { item in
                HStack {
                    Text(item.name ?? "")
                    Spacer()
                    Text(item.storageCount.asString2Decimal())
                }
            }
        }
    }
}
//
//struct StockView_Previews: PreviewProvider {
//    static var previews: some View {
//        StockView()
//    }
//}
