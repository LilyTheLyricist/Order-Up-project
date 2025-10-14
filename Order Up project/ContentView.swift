//
//  ContentView.swift
//  Order Up project
//
//  Created by Jimenez, Carlos - Student on 9/22/25.
//

import SwiftUI

struct FoodItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var imageName: String
    var price: Double
    var numItems: Int = 0
    
}

extension FoodItem {
    var fmtPrice: String {
        String(format: "$%.2f", price)
        
    }
}


struct ContentView: View {
    
    @State var foodItems: [FoodItem] = [
        FoodItem(title: "Pizza Margherita", imageName: "pizza_margherita", price: 12.99),
        FoodItem(title: "Pepperoni Pizza", imageName: "pepperoni_pizza", price: 14.99),
        FoodItem(title: "Hawaiian Pizza", imageName: "hawaiian_pizza", price: 13.99),
        FoodItem(title: "Cheese Pizza", imageName: "cheese_pizza", price: 10.99),
        FoodItem(title: "Sausage Pizza", imageName: "sausage_pizza", price: 11.99)
    ]
    
    var body: some View {
        VStack {
            ForEach($foodItems) { $item in
                HStack {
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.fmtPrice)
                        Text(item.numItems.description)
                        Button("Add to order") {
                            item.numItems += 1
                        }
                    }
                }
            }
            let cost = String(format: "%.2f", calcCost())
            Button("Place Order $\(cost)") {
                
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
    
    func calcCost () -> Double {
        let cost = foodItems.reduce(0) { result, item in
            result + item.price * Double(item.numItems)
        }
        let total = cost * 1.0805
    return total
    }
    
    
    
}

#Preview {
    ContentView()
}
