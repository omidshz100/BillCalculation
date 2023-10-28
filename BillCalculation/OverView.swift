//
//  OverView.swift
//  BillCalculation
//
//  Created by Omid Shojaeian Zanjani on 28/10/23.
//

import SwiftUI

struct OverView: View {
    @Binding var bill:Bill
    
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    OverView(bill: .constant(Bill(type: .electricity, price: 100.0, startDate: "2023-01-30", endDate: "2023-02-28")))
}
