//
//  FlightModel.swift
//  Gaurav_Flights
//
//  Created by Gaurav Rawat on 2024-02-13.
//

import Foundation

enum Airport : String, CaseIterable{
    
    case MAD
    case AUS
    case HKG
    
    
    var flightDistance: String {
        switch self{
        case .MAD: "6943.70"
        case .AUS: "1514.00"
        case .HKG: "12538.51"
        }
    }
    
    var flightNumber: String {
        switch self{
        case .MAD: "AM3116"
        case .AUS: "WS6463"
        case .HKG: "KL662"
        }
    }
    
    var carrier: String {
        switch self{
        case .MAD: "Aeromexico"
        case .AUS: "Westjet"
        case .HKG: "KLM"
        }
    }
    
    var price: String{
        switch self{
        case .MAD: String(format: "%0.2f", 100.00+(Double(self.flightDistance)! * 0.12))
        case .AUS: String(format: "%0.2f", 100.00+(Double(self.flightDistance)! * 0.12))
        case .HKG: String(format: "%0.2f", 100.00+(Double(self.flightDistance)! * 0.12))
        }
    }
}
