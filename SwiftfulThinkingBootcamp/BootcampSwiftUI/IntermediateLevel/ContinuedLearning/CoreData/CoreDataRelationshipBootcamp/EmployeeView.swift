//
//  EmployeeView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 12/03/24.
//

import SwiftUI

struct EmployeeView: View {
    let entity: EmployeeEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            Text("Age: \(entity.age)")
                .bold()
            
            Text("Date Joined: ")
                .bold()
            
            Text("\(entity.dateJoint ?? Date())")
                .bold()
            
            
            Text("Business: ")
                .bold()
            
            Text(entity.businesses?.name ?? "")
                .bold()
            
            Text("Departments: ")
                .bold()
            
            Text(entity.department?.name ?? "")
                .bold()
            
        }
        .padding()
        .frame(maxWidth: 350, alignment: .leading)
        .background(Color.blue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)

        
    }
}
