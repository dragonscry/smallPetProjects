//
//  TimerBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 30.05.2022.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    //Current Time
    /*
     @State var currentDate = Date()
     var dateFormatter: DateFormatter {
     let formatter = DateFormatter()
     formatter.timeStyle = .medium
     //     formatter.dateStyle = .medium
     return formatter
     }
     */
    
    //Countdown
    /*
     @State var count: Int = 10
     @State var finishedText: String? = nil
     */
    
    //Count to date
    /*
     @State var timeRemaining: String = ""
     let futureDate: Date = Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()
     
     func updateTimeRemaining() {
     let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureDate)
     //       let hour = remaining.hour ?? 0
     let minute = remaining.minute ?? 0
     let second = remaining.second ?? 0
     timeRemaining = "\(minute) minutes, \(second) seconds"
     }
     */
    
    //Animation counter
    @State var count: Int = 1
    
    
    var body: some View {
        ZStack{
            RadialGradient(gradient: Gradient(colors: [Color(red: 0.2, green: 0.3, blue: 0.6), Color.blue]), center: .center, startRadius: 5, endRadius: 500).ignoresSafeArea()
            
            //            Text(timeRemaining)
            //                .font(.system(size: 100, weight: .semibold, design: .rounded))
            //                .foregroundColor(.white)
            //                .lineLimit(1)
            //                .minimumScaleFactor(0.1)
            //            HStack(spacing: 15) {
            //                Circle()
            //                    .offset(y: count == 1 ? -20: 0)
            //                Circle()
            //                    .offset(y: count == 2 ? -20: 0)
            //                Circle()
            //                    .offset(y: count == 3 ? -20: 0)
            //        }
            //        .frame(width: 150)
            //        .foregroundColor(.white)
            
            TabView(selection: $count) {
                Rectangle()
                    .foregroundColor(.red)
                    .tag(1)
                Rectangle()
                    .foregroundColor(.blue)
                    .tag(2)
                Rectangle()
                    .foregroundColor(.green)
                    .tag(3)
                Rectangle()
                    .foregroundColor(.orange)
                    .tag(4)
                Rectangle()
                    .foregroundColor(.pink)
                    .tag(5)
            }
            .frame(height: 200)
            .tabViewStyle(PageTabViewStyle())
        }
        .onReceive(timer) { _ in
            withAnimation() {
                count = count == 5 ? 1 : count + 1
                
//                if count == 3 {
//                    count = 0
//                } else {
//                    count += 1
//                }
                
            }
        }
        
    }
}

struct TimerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TimerBootcamp()
    }
}
