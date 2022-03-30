//
//  PaddingAndSpacerBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 28.03.2022.
//

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
        //        VStack (alignment: .leading) {
        //            Text("Hello, World!")
        //                .font(.largeTitle)
        //                .fontWeight(.semibold)
        //                .padding(.bottom, 20)
        //
        //            Text("Description of what will we do on screen, it is multiple kine we make.")
        //        }
        //
        //        .padding()
        //        .padding(.vertical, 20)
        //        .background(
        //            Color.white
        //                .cornerRadius(10)
        //                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10))
        //        .padding(.horizontal, 10)
        
        //        HStack(spacing: 0){
        //
        //            Spacer(minLength: 0) //mean spacer can be 0 width
        //                .frame(height: 10)
        //                .background(Color.orange)
        //
        //            Rectangle()
        //                .frame(width: 50, height: 50)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(Color.orange)
        //
        //
        //            Rectangle()
        //                .fill(Color.red)
        //                .frame(width: 50, height: 50)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(Color.orange)
        //
        //            Rectangle()
        //                .fill(Color.green)
        //                .frame(width: 50, height: 50)
        //
        //            Spacer()
        //                .frame(height: 10)
        //                .background(Color.orange)
        //        }
        //.padding(.horizontal, 200)
        
        //.padding([.leading, .top], 50)
        //            .frame(maxWidth: .infinity, alignment: .leading)
        //            .background(Color.blue)
        //            .padding(.leading, 20)
        
        VStack {
            HStack{
                Image(systemName: "xmark")
                
                Spacer()
                
                Image(systemName: "gear")
            }
            .font(.title)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct PaddingAndSpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingAndSpacerBootcamp()
    }
}
