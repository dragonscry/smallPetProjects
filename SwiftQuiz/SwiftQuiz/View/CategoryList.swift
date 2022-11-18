//
//  CategoryList.swift
//  SwiftQuiz
//
//  Created by Denys on 18.11.2022.
//

import SwiftUI

struct CategoryList: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories, id: \.self){ category in
                    Text(category)
                }
            }
            .navigationTitle("Words")
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}

let categories = ["All", "Animals", "Fruits"]
