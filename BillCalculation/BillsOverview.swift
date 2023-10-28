//
//  BillsOverview.swift
//  BillCalculation
//
//  Created by Omid Shojaeian Zanjani on 28/10/23.
//

import SwiftUI

struct BillsOverview: View {
    @State var bills:[Bill] = [
        Bill(type: .electricity, price: 100.0, startDate: "2023-01-01", endDate: "2023-03-01"),
        Bill(type: .gas, price: 140.0, startDate: "2023-01-01", endDate: "2023-03-01"),
        Bill(type: .watter, price: 20.0, startDate: "2023-01-01", endDate: "2023-03-01"),
    ]
    var body: some View {
        NavigationView{
            List($bills, id: \.self){ $item in
                NavigationLink(destination: OverView(bill:$item)){
                    BilRow(bill: $item)
                }
            }
        }
    }
}

struct BilRow:View {
    @Binding var bill:Bill
    var body: some View {
        VStack(alignment:.leading){
            Text(bill.type.rawValue)
                .bold()
            Rectangle()
                .fill(Color.gray)
                .frame(width: 60 ,height: 0.5)
            HStack{
                VStack{
                    HStack{
                        Text("Start: ")
                        Text(dToS(bill.startDate) ?? "nil")
                            .foregroundStyle(.green)
                    }
                    HStack{
                        Text("End: ")
                        Text(dToS(bill.endDate) ?? "nil")
                            .foregroundStyle(.red)
                    }
                }
                // Learning Tip: learn how to format String
                HStack {
                    Text("price")
                    Text("\(String(format: "%.2f", bill.price))")
                }
                .padding()
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
#Preview {
    BillsOverview()
}

enum BiilType:String{
    case watter = "water"
    case gas = "gas"
    case electricity = "electricity"
}
struct Bill:Hashable {
    let id:UUID = UUID()
    var type:BiilType
    var price:Float32
    var startDate:Date?
    var endDate:Date?
    
    init(type: BiilType, price: Float32, startDate: String, endDate: String) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        self.type = type
        self.price = price
        self.startDate = dateFormatter.date(from: startDate)
        self.endDate = dateFormatter.date(from: endDate)
    }
}
