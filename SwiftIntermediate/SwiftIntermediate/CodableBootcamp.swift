//
//  CodableBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 24.05.2022.
//

import SwiftUI

// Codable = Decodable + Encodable

struct CustomerModel : Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//
//    init(id: String, name: String, point: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = point
//        self.isPremium = isPremium
//    }
//
//    init(from decoder: Decoder) throws {
//        let containter = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try containter.decode(String.self, forKey: .id)
//        self.name = try containter.decode(String.self, forKey: .name)
//        self.points = try containter.decode(Int.self, forKey: .points)
//        self.isPremium = try containter.decode(Bool.self, forKey: .isPremium)
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
    
    
}

class CodableViewModel : ObservableObject {
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONdata() else {return}
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String:Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool
//        {
//
//            let newCustomer = CustomerModel(id: id, name: name, point: points, isPremium: isPremium)
//            customer = newCustomer
//        }
        
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
//        do {
//        self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error decoding. \(error)")
//        }
    }
    
    func getJSONdata() -> Data? {
        
        let customer = CustomerModel(id: "7272", name: "Nick", points: 28, isPremium: false)
        
//        let dictionary: [String:Any] = [
//            "id" : "12345",
//            "name" : "Joe",
//            "points" : 5,
//            "isPremium" : true
//        ]
         
        //let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        let jsonData = try? JSONEncoder().encode(customer)
        return jsonData
    }
    
}

struct CodableBootcamp: View {
    
    @StateObject var vm = CodableViewModel()
    
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

struct CodableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodableBootcamp()
    }
}
