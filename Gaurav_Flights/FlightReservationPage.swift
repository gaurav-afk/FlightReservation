//
//  FlightReservation.swift
//  Gaurav_Flights
//
//  Created by Gaurav Rawat on 2024-02-13.
//

import SwiftUI

struct FlightReservation: View {
    @State var selectedArrivalAirport = Flight.MAD
    @State var customerName = ""
    @State var passportNumber = ""
    @State var departureDate = Date()
    @State var reservation: Reservation? = nil
    
    @Binding var reservationList: [Reservation] 
   
    
    var body: some View {
        VStack{
            
            HStack {
                Text("Flights Leaving ATL")
                    .font(.title)
                .fontWeight(.semibold)
                
                Image(systemName: "airplane.departure")
                    .font(.largeTitle)
                    .foregroundStyle(.cyan)
            }
            
            
            
            VStack(alignment: .leading) {
                
                HStack{
                    Text("Select an arrival Flight")
                        .font(.title3)
                    Spacer()
                    Picker("Flight", selection: self.$selectedArrivalAirport.animation()) {
                        ForEach(Flight.allCases, id: \.self) { Flight in
                            Label(Flight.rawValue, systemImage: "")
                        }
                    }
                }
                .padding(.bottom, 10)
                
                
                
                VStack(alignment: .leading) {
                    Text("Flight: \(selectedArrivalAirport.flightNumber)")
                    Text("Operated By: \(selectedArrivalAirport.carrier)")
                    Text("Price: $\(selectedArrivalAirport.price)")
                }
                .padding(10)
                .background(.black.opacity(0.25))
                .clipShape(.rect(cornerRadius: 8))
                
                
                
                Text("Reserve the Flight")
                    .font(.title)
                    .padding(.bottom, 15)
                
                Text("Customer name")
                TextField("Enter your name", text: $customerName)
                
                Text("Passport number")
                TextField("Enter your passport name", text: $passportNumber)
                    .padding(.bottom)
                
                DatePicker(selection: self.$departureDate, displayedComponents: [.date]){
                    Text("Departure date")
                        .fontWeight(.semibold)
                }
                
            }
            .padding()
            
            Spacer()
            
            Button{
                
                reservation = Reservation(name: customerName, passportNumber: passportNumber, travelDate: departureDate, departing: "ATL", arriving: selectedArrivalAirport.rawValue, flightNumber: selectedArrivalAirport.flightNumber, operatedBy: selectedArrivalAirport.carrier)
                
                guard reservation != nil else{ return }
                
                reservationList.append(reservation!)
                
                print(reservation?.name)
                print(reservation?.passportNumber)
                print(reservation?.travelDate)
                print(reservationList.count)
                
                
            }label: {
                Text("Make Reservation")
                    .fontWeight(.semibold)
                    .font(.title3)
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
            
            Spacer()
        }
    }
}

#Preview {
    FlightReservation(
        reservation: nil,
        reservationList: .constant([Reservation(id: UUID(), name: "", passportNumber: "", travelDate: Date(), departing: "", arriving: "", flightNumber: "", operatedBy: "")]))
}
