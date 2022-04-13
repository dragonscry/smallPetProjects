//
//  AlertBootcamp.swift
//  BootcampCourse
//
//  Created by Denys on 13.04.2022.
//

import SwiftUI

struct AlertBootcamp: View {
    
    @State var showAlert = false
    @State var alertType: MyAlerts? = nil
    //  @State var alertTitle: String = ""
    //  @State var alertMessage = ""
    
    @State var backgroundColor = Color.yellow
    
    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            
            backgroundColor.ignoresSafeArea()
            
            VStack {
                Button("Clich here") {
                    alertType = .error
                    //                    alertTitle = "ERROR VIDEO"
                    //                    alertMessage = "Video not upload"
                    showAlert.toggle()
                }
                
                Button("Clich here Too") {
                    alertType = .success
                    //                    alertTitle = "Success!!!"
                    //                    alertMessage = "Your video in free"
                    showAlert.toggle()
                }
                
            }
            .alert(isPresented: $showAlert) {
                // Alert(title: Text("Error"))
                getAlert()
            }
        }
    }
    
    func getAlert() -> Alert {
        
        switch alertType {
        case .error:
            return Alert(title: Text("ERROR!!!"))
        case .success:
            return Alert(title: Text("SUCCESS!!!"), message: nil, dismissButton: .default(Text("OK"), action: {backgroundColor = .green}))
        default:
            return Alert(title: Text("OK"))
            }
            
            
            //        return Alert(title: Text("Title"), message: Text("Here description"), primaryButton: //.destructive(Text("Delete")),
            //            .destructive(Text("Delete"), action: {
            //                self.backgroundColor = .red
            //            }),
            //              secondaryButton: .cancel())
            //
            //        return Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .destructive(Text("OK")))
        }
    }
    
    struct AlertBootcamp_Previews: PreviewProvider {
        static var previews: some View {
            AlertBootcamp()
        }
    }
