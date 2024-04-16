//
//  CoreDataViewModelBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 08/03/24.
//

import Foundation
import CoreData

class CDRelationshipBootcamp: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    @Published var department: [DepartmentEntity] = []
    @Published var employee: [EmployeeEntity] = []
    
    init () {
        fetchBusinessdata()
        fetchDepartmentData()
        fetchEmployeeData()
    }
    
    func fetchBusinessdata() {
        let requestBusiness = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        // sorting
//        let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
//        requestBusiness.sortDescriptors = [sort]
        
        
        // filtering
//        let filter = NSPredicate(format: "name == %@", "Tokopedia")
//        requestBusiness.predicate = filter
        
        do {
            try businesses = manager.context.fetch(requestBusiness)
        }catch let error {
            print("Error Fetch Business Data, Message : \(error.localizedDescription)")
        }
    }
    
    func fetchDepartmentData() {
        let requestDepartment = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
//        let filter = NSPredicate(format: "name == %@", "Engineering")
//        requestDepartment.predicate = filter
        
        do {
            try department = manager.context.fetch(requestDepartment)
        }catch let error {
            print("Error Fetch Department Data, Message : \(error.localizedDescription)")
        }
    }
    
    func fetchEmployeeData() {
        let requestEntity = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        do {
            try employee = manager.context.fetch(requestEntity)
        }catch let error {
            print("Error Fetch Employee Data, Message : \(error.localizedDescription)")
        }
    }
    
    func updateBusiness() {
        let currentBusiness = businesses[0]
        currentBusiness.addToEmployees(employee[2])
        
        save()
    }
    
    func deleteBusiness() {
        let currentBusiness = businesses[0]
        manager.context.delete(currentBusiness)
        save()
    }
    
    func addNewBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)
        newBusiness.name = "Tokopedia"
        
        // add existing departements to new business
//        newBusiness.departments = []
        
        
        // add existing employee to new business
//        newBusiness.employees = []
        
        
        // add new business to existing departments
//        newBusiness.addToDepartments(department[8])
        
        
        // add new business to existing employee
//        newBusiness.addToEmployees(employee[2])
                
        save()
    }
    
    func addNewDepartments() {
        let newDepartments = DepartmentEntity(context: manager.context)
        newDepartments.name = "Legal Office"
//        newDepartments.businesses = [businesses[0]]
        
        newDepartments.addToEmployees(employee[2])
        save()
    }
    
    func addNewEmployee() {
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.name = "Clara Lasutt"
        newEmployee.dateJoint = Date()
        newEmployee.age = 21
        
//        newEmployee.businesses = businesses[1]
//        newEmployee.department = department[1]
        save()
    }
    
    
    func save() {
        businesses.removeAll()
        department.removeAll()
        employee.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.fetchBusinessdata()
            self.fetchDepartmentData()
            self.fetchEmployeeData()
        }
    }
}



class CoreDataManager {
    static let instance = CoreDataManager() // singleton
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "DataCoreContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Load Core Data. Message : \(error)")
            }else {
                print("Sucess Load Core Data")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Save Sucesfully")
        }catch let error {
            print("Cannot Save Data Because \(error.localizedDescription)")
        }
    }
}
