//
//  SliderBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 18/12/23.
//

import SwiftUI

struct SliderBootcamp: View {
    
    @State private var sliderValue: Double = 0
    @State private var colorChange: Color = .black
    
    @State private var storedAge: [Double] = [Double]()
    var body: some View {
        VStack {
            Text(
//                "\(sliderValue)"
//                "\(Int (sliderValue))"
                String(format: "%.0f", sliderValue)
            )
            .foregroundColor(colorChange)
//            ForEach(storedAge, id: \.self) { items in
//                Text("age of kid is : \(Int(items))")
//            }

            
            // course material
            
//            Slider(value: $sliderValue)
//            Slider(value: $sliderValue, in: 0...100 )
//            Slider(
//                value: $sliderValue,
//                in: 0...50,
//                step: 1.0
//            )
            Slider(value: $sliderValue,
                   in: 0...100,
                   step: 1.0,
                   label: {
                Text("Slider Label")
            },
                   minimumValueLabel: {
                // bisa menaruh ui component disini
                Text("1")
                    .foregroundColor(.mint)
                    .fontWeight(.semibold)
            },
                   maximumValueLabel: {
                // bisa naro semua UIcomponent disini
                Text("100")
                    .foregroundColor(.mint)
                    .fontWeight(.semibold)
            },
                   onEditingChanged: { _ in
                commandSliderChange(color: .orange)
            })
            
                .tint(Color.green)
            
//            Button("save") {
////                saveUserCustomisations(item: sliderValue)
//            }
//            .buttonStyle(.borderedProminent)
            
            
            
        }
        .padding()
    }
    
//    func saveUserCustomisations(item: Double) {
//        storedAge.append(item)
//
//    }
    
    func commandSliderChange(color: Color) {
        withAnimation(Animation.easeOut) {
            colorChange = color
        }
    }
}

struct SliderBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SliderBootcamp()
    }
}

// slider
// Small Summary
/*
 slider merupakan modider atau components dimana kita bisa scroll secara horizontal dimana didalam slider berisi content floating point. biasanya digunakan pada saat login untuk menetukan umur dari pengguna
 
 MACAM - MACAM SLIDER
 1. Slider(value: T##Binding<BinaryFloatingPoint>)
    jadi binary floating point disini berguna untuk menetukan nilai awal dari slider, slider tipe ini tanpa batasan atas dan bawah dari slider
 
 2. Slider(value: T##Binding<BinaryFloatingPoint>, in: T##ClosedRange<BinaryFloatingPoint>)
    jadi untuk binary floating point disini masih sama seperti sebelumnya, tetapi pada tipe ini terdatapat batasan yang akan menjadi batasan atas bawah dari slider.
 
 3. Slider(
            value: T##Binding<BinaryFloatingPoint>,
            in: T##ClosedRange<BinaryFloatingPoint>,
            step: T##BinaryFloatingPoint,
          )
    jadi untuk modifier value and in masih sama, teteapi disini dalam penambahannya bisa diatur. dimana kita bisa mengatur di parameter step dimana kita bisa sesuaikan dnegan kebututuhan. misalkan penambahan 1.0 / 2.0 / 1.5 based on user customisation

 4. Slider(value: $sliderValue,
            in: 0..<100,
            step: 1.0,
            label: ,
            minimumValueLabel: ,
            maximumValueLabel: ,
            nEditingChanged: { _ in   })
    jadi pada slider tipe ini terdapat label minimum value label, maximum value label. dan lain sebagainya. fungsi value, in, step masih sama. dan terdapat modifier baru
        1. minimumValueLabel berfungsi untuk memberikan modifier diawal slider pada ui dan bisa memasukkan ui components disitu
        2. maximumValueLabel berfungsi untuk memberikan modifier diakhir slider pada ui dan bisa memasukkan ui component disitu
        2. onEditingChanged berfungsi untuk menambahkan argumen dimana dan apabila nilainya berubah maka siapa yang akan terdampak pada perubahannya
        2. label saat ini belu kelihatan fungsinya disini dan label berfungsi untuk memberikan format atau memberikan different completions atau penyematan pada label

 
 */
