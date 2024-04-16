//
//  BusinessView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 08/03/24.
//

import SwiftUI

struct BusinessView: View {
    let entity: BusinessEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name : \(entity.name ?? "")")
                .bold()
            
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Departments: ")
                    .bold()
                
                ForEach(departments) { departments in
                    Text(departments.name ?? "")
                        .bold()
                }
            }
            
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employee: ")
                    .bold()
                
                ForEach(employees) { employees in
                    Text(employees.name ?? "")
                        .bold()
                }
            }
        }
        .padding()
        .frame(maxWidth: 400, alignment: .leading)
        .background(Color.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}



struct DepartmentsView: View {
    let entity: DepartmentEntity
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Name: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Business : ")
                    .bold()
                
                
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                        .bold()
                }
            }
            
            if let employees = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Employee: ")
                    .bold()
                
                
                ForEach(employees) { employee in
                    Text(employee.name ?? "")
                        .bold()
                }
            }
        }
        .padding()
        .frame(maxWidth: 400, alignment: .leading)
        .background(Color.green.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}
