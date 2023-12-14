//
//  AlertBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 14/12/23.
//

import SwiftUI

struct accountBalance {
    let id: String = UUID().uuidString
    let amountBalance: Int
}

struct AlertBootcamp: View {
    
    @State var showAlert: Bool = false
    @State var balanceAccount: accountBalance? = nil
    
    @State var temp: [Int] = [Int]()
    
    var body: some View {
        
        VStack {
            Button("Press Me!") {
                balanceAccount = accountBalance(amountBalance: 1000000)
                showAlert.toggle()
            }
            .buttonStyle(.borderedProminent)
            
            List {
                ForEach(temp, id: \.self) { items in
                    Text("balance account is \(items)")
                }
            }
        }
        
        // IOS 15 LATER
        // default args
//        .alert(<#T##titleKey: LocalizedStringKey##LocalizedStringKey#>, isPresented: <#T##Binding<Bool>#>, actions: <#T##() -> View#>)
        
        // modifier args
        // put the message in heree is alert title
        // this is for nothing data pass
//        .alert("Tittle Value", isPresented: $showAlert) {
//            // put the button ac give the actions in here
//            Button("Confirm") {
//
//            }
//
//            Button("Delete", role: .destructive) {
//
//
//            }
//        } message: {
//            Text("Message Value")
//        }
  
        // this is fore data pass to UI
        .alert("This is tittle", isPresented: $showAlert, presenting: balanceAccount) { balance in
            Button("Confirm") {
                addItemToList(itemsAppended: balance.amountBalance)
            }
            
            Button("Cancel") {
                
            }
        } message: { balance in
                Text("Your issuficient balance is \(balance.amountBalance). CONFIRM to give to your friends")
        }
        
        
    }
    
    func addItemToList(itemsAppended: Int) {
        temp.append(itemsAppended)
    }
}

struct AlertBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AlertBootcamp()
    }
}

// alert Bootcamps
// small summary
/*
 alert merupakan cara untuk mempresent popup kepada user, dimana akan berada diteengah dan alert dapate berisi apa saja, seperti Button, text dan apapun.
 
 arelt ditaruh pada parent view misalkan pada container vstack
 allert dapaat diguakan pada:
 1. Misalkan user akan membuat decision saat mendownload, is yes no. u can click the button.
 
 
 intinya alert merupakan popup untuk decision dari user 
 
 */
