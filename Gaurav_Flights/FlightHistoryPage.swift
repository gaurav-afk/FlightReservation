//
//  FlightHistory.swift
//  Gaurav_Flights
//
//  Created by Gaurav Rawat on 2024-02-13.
//

import SwiftUI

struct FlightHistory: View {
    @Binding var reservationList: [Reservation]
    
    var body: some View {
        
        Text("Reservation History")
            .font(.title)
            .fontWeight(.semibold)
        
        NavigationLink{
            
            ReservationDetailPage()
            
        } label: {
            List(reservationList){ reservation in
                
                HStack {
                    Text(reservation.name)
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Text("Booking id:")
                        Text(reservation.id.uuidString.prefix(5))
                    }
                }
            }
        }
      
        
       
            
    }
}

#Preview {
    FlightHistory(reservationList: .constant([
        Reservation(name: "John Doe", passportNumber: "AB123456", travelDate: Date(), departing: "ATL", arriving: "MAD", flightNumber: "123", operatedBy: "Some Airline"),
        Reservation(name: "Jane Smith", passportNumber: "CD987654", travelDate: Date(), departing: "MAD", arriving: "ATL", flightNumber: "456", operatedBy: "Another Airline")
    ]))
}
