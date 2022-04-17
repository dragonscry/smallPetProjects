//
//  PickerBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 17.04.2022.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "1"
    
    var fruits = ["Banana","Apple", "Peach", "Watermelon", "Grapes" ]
    
    @State var fruit = "Apple"
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor : UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    var body: some View {
        //        VStack {
        //
        //            HStack {
        //                Text("Age: ")
        //                Text(selection)
        //            }
        //
        //            Picker(selection: $selection,
        //                   content: {
        //                ForEach(18..<100) { age in
        //                    Text("\(age)").tag("\(age)")
        //                        .foregroundColor(.orange)
        //                }
        //            },      label: {Text("Picker")})
        //            .pickerStyle(WheelPickerStyle())
        //            .background(Color.green.opacity(0.3))
        //            .cornerRadius(30)
        //        }
//
//        VStack {
//            HStack {
//                Text("Fruit: ")
//                Picker(selection: $fruit, content: {
//                    ForEach(fruits, id: \.self){ fruit in
//                        HStack {
//                            Text(fruit)
//                            Image(systemName: "heart.fill")
//                        }
//                    }
//                }, label: {
//                    Text("Filter")
//                })
//            }
//            .font(.headline)
//            .foregroundColor(.white)
//            .padding()
//            .padding(.horizontal)
//            .background(Color.green)
//            .cornerRadius(10)
//            .shadow(color: Color.green.opacity(0.3), radius: 10, x: 0, y: 10)
//        }
        
        Picker(selection: $fruit, content: {
            ForEach(fruits.indices){ fruit in
                Text(fruits[fruit])
                    .tag(fruits[fruit])
            }
        }, label: {Text("Fruit")})
        .pickerStyle(SegmentedPickerStyle())
        
    }
}

struct PickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcamp()
    }
}
