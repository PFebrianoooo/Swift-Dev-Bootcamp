//
//  DragGestureBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 01/03/24.
//

import SwiftUI

struct DragGestureBootcamp: View {
    @State var offset: CGSize = .zero
    
    var body: some View {
        // basic example
        ZStack {
            VStack {
                // untuk ketahui moving anchor dari item yang di gesture drag
                Text("\(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 350, height: 600)
                .offset(offset)
                .scaleEffect(amountScaleEffect())
                .rotationEffect(.degrees(amountRotationEffect()))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                )

        }
        
    }
    // fungsi untuk basic example
    func amountScaleEffect() -> CGFloat {
        /*
         // penjelasan apa yang terjadi
         
         u/  max variable berfungsi untuk mencari nilai maksimum daripada layar yang dimiliki dibagi 2 untuk mendapatkan nilai tengahnya . pada contoh misalkan kita punya layar 400px / 2 = 200 hasilnya untuk nilai maksimum
         u/ current amount merupakan nilai yang didapat untuk drag gesturenye dari user, makanya ditaruh offset.width diatas untuk tahu koordinatnya. ditaro nilai absolut untuk memasikan data yang di simpan ke current amount akan selalu positif. Misalkan saya drag mendapatkan koordinat 100 atau -100 tapi data yang di passing akan terus 100, karena aboslut.
         u/ persentage merupakan nilai akhir yang didapatkan untuk scale dari element, dari 2 penjelasan diatas
                nilai maks = 200
                nilai currentAmount = 100
                maka persentage didapatkan = 2
         NB: Nilai sewaktu waktu berubah sesuai dengan gesture atau cursor dari user
         
         u/ compare to min value untuk membatasi persentase yang berubah akibat gesture yang dilakukan, dibatasi besarannya sampai 0.5 boleh kurang tidak lebih.
         u/ 1.0 nilai scale standar atau bawaan atau default
         u/ 0.7 merupakan rate of change atau kecepatan perubahan scale, dan dapat diubah
         */
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        let compareToMinValue = min(percentage, 0.5)
        return 1.0 - compareToMinValue * 0.65
    }
    
    func amountRotationEffect() -> Double {
        /*
         u/ variable max, currentAmount , percentage sama pengertiannya.
         u/ max angle digunakan untuk rotation degree maksissmal yang bisa digunakan
         */
        let max = UIScreen.main.bounds.width
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 30
        return percentageAsDouble * maxAngle
    }
    
}

#Preview {
    DragGestureBootcamp()
}


// small summary
/*
 Drag Gesture
 
 Drag Gesture merupakan modifier fungsi dimana drag gesture memperbolehkan kita untuk drag ke kiri atau ke kanan. drag gesture kita dapat temukan pada aplikasi tinder atau tantan, dimana drag gesture ke kiri dan ke kanan ada untuk memilih apakah tertarik atau tidak.
 
 memanggil drag Gesture
 .gesture (
    DragGesture()
 )
 
 NB:
 1. kalo ingin ketika di drag gesture agak lebih cepat, maka hilangkan animasi disana. Tapi penggunaan daripada animasi membuat tampilan jauh lebih smooth dan enak dilihat.
 
 
 */


// MARK: Learning Material
extension DragGestureBootcamp {
    private var basicExample: some View {
        Text("Basics example")
    }
}
