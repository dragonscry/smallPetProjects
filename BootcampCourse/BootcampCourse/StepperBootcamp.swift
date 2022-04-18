//
//  StepperBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 18.04.2022.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    
    @State var widhtIncrement : CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper : \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widhtIncrement, height: 100, alignment: .center)
            
            Stepper("Stepper 2") {
                //increment
                
                incrementWidth(amount: 30)
                
            } onDecrement: {
                //decrement
                
                incrementWidth(amount: -10)
            }

        }
    }
    
    func incrementWidth(amount: CGFloat) {
        withAnimation{
            widhtIncrement += amount
        }

    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}
