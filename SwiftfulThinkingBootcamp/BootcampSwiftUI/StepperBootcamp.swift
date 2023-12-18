//
//  StepperBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 18/12/23.
//

import SwiftUI

struct StepperBootcamp: View {
    @State var stepper: Int = 0
    @State var stepper2: CGFloat = 100
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Stepper 1 : \(stepper)")
            Text("Stepper 2 : \(stepper2)")
            RoundedRectangle(cornerRadius: 10)
                .frame(width: stepper2 ,height: 100)
            
            
            Spacer()
            
            Stepper("Stepper Here 1", value: $stepper)
                .padding()
            
            Stepper("Stepper Here 2") {
                incrementValue(amount: 50)
            } onDecrement: {
                decrementValue(amount: 50)
            }
            .padding()
            

        }
        .padding()
    }
    
    func incrementValue(amount: CGFloat) {
        withAnimation(.easeInOut(duration: 0.5)) {
            stepper2 += amount
        }
    }
    
    func decrementValue(amount: CGFloat) {
        if stepper2 != 0 {
            withAnimation(.easeInOut) {
                stepper2 -= amount
                
            }
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}

// small summary
// Stepper Bootcamp
/*
 stepper adalah component dimana user bisa melakukan sesuatu dengan stepper, dimana user bisa increment atau decrement a value.
 
 Penggunaan Stepper
 1. mengincrementkan sesuatu atau decrement sesuatu apabila menekan tombol plus akan bertambah, apabila decrement akan berkurang 1.
 2. kita bisa menekan tombol plus untuk menjalankan fungsi tertentu dan memencet tombil minus untuk menhapus tertentu dari fungsi yang didefinisikan.
 
 MACAM - MACAM STEPPER
 1. Stepper(<#T##title: StringProtocol##StringProtocol#>, value: <#T##Binding<Strideable>#>)
    berguna untuk menambahkan dan mengurangkan saja, tanpa menggunakan fungsi khusus lainnya.
 
 2 Stepper(<#T##title: StringProtocol##StringProtocol#>, onIncrement: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>, onDecrement: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    berguna untuk inc dan decrement tetapi yang ini berbeda, kita bisa menambahkan pengaturan atau kustomisasi didalamnya
 
 

 // Istilah Istilah
 strideable merupakan nilai satu dimensi dimana kita kita bisa up and down state variable
 
 */
