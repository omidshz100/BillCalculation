//
//  TenantOverview.swift
//  BillCalculation
//
//  Created by Omid Shojaeian Zanjani on 28/10/23.
//

import SwiftUI

struct TenantsOverview: View {
    @State var tenants:[Tenant] = [
        Tenant(name: "Omid Shojaeian", startLivingDate: "2023-01-11", endLivingDate: "2023-07-31"),
        Tenant(name: "Francesco Mellis", startLivingDate: "2022-09-01", endLivingDate: "2024-02-28"),
        Tenant(name: "Francesco 3 ", startLivingDate: "2023-02-16", endLivingDate: "2023-04-20"),
    ]
    // Experience : How to describe value as Binding to use inside closure
    var body: some View {
        List($tenants,  id: \.self){ $tenant in
            TenantRow(tenant: $tenant)
        }
    }
}

#Preview {
    TenantsOverview()
}


struct TenantRow:View {
    @Binding var tenant:Tenant
    var body: some View {
        VStack(alignment:.leading){
            HStack{
                Text(tenant.name)
                    .bold()
                Spacer()
            }
            Rectangle()
                .fill(Color.gray)
                .frame(width: 85,height: 0.5)
            HStack{
                Text("Start Date:")
                Text((dToS(tenant.startLivingDate) ?? "nil" ))
                    .foregroundStyle(Color.green)
                Spacer()
            }
            HStack{
                Text("End Date:")
                Text((dToS(tenant.endLivingDate) ?? "nil" ))
                    .foregroundStyle(Color.red)
                Spacer()
            }
            
            Rectangle()
                .fill(Color.gray)
                .frame(height: 0.5)
        }.listRowSeparator(.hidden)
    }
    
    func dToS(_ date:Date? )->String?{
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let _ = date else {
            return nil
        }
        let date =  dateFormatter.string(from: date!)
        print(date)
        return date
    }
}
struct Tenant: Hashable {
    let id: UUID = UUID()
    var name:String
    var startLivingDate:Date?
    var endLivingDate:Date?
    var nationality:String
    
    // Nationality must be the end date from contract
    init(name: String, startLivingDate: String, endLivingDate: String, nationality: String = "not explained") {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.name = name
        self.startLivingDate = dateFormatter.date(from: startLivingDate)
        self.endLivingDate = dateFormatter.date(from: endLivingDate)
        self.nationality = nationality
    }
    
    
}
