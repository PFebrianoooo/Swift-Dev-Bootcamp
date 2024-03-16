//
//  CoreDataRelationshipBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 08/03/24.
//

import SwiftUI

struct CoreDataRelationshipBootcamp: View {
    @StateObject var VM: CDRelationshipBootcamp = CDRelationshipBootcamp()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    Button {
                        VM.updateBusiness()
                    } label: {
                        Text("Perform Actions")
                            .font(.subheadline)
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(
                                Color.accentColor
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(VM.businesses) { business in
                                BusinessView(entity: business)
                                    .padding(.leading)
                            }
                        }
                        .padding(.trailing)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.vertical, 10)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(VM.department) { department in
                                DepartmentsView(entity: department)
                                    .padding(.leading)
                            }
                        }
                        .padding(.trailing)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.vertical, 10)
                    
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(VM.employee) { employee in
                                EmployeeView(entity: employee)
                                    .padding(.leading)
                            }
                        }
                        .padding(.trailing)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.vertical, 10)


                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Relationship")
        }
    }
}

#Preview {
    CoreDataRelationshipBootcamp()
}
