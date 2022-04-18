//
//  DatePickerBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 18.04.2022.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selectedDate : Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            
            Text("Selected Date is:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            //       DatePicker("Select a Date", selection: $selectedDate)
            //       DatePicker("Select a Date", selection: $selectedDate, displayedComponents: [.date])
            DatePicker("Select a Date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .datePickerStyle(
                    CompactDatePickerStyle()
                    // GraphicalDatePickerStyle()
                    //WheelDatePickerStyle()
                )
        }
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}
