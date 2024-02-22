//
//  DatePickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 17/12/23.
//

import SwiftUI

struct DatePickerBootcamp: View {
    @State var pickDate: Date = Date()
    let startDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    
    // pengaturan display tanggal
    var formatDate: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.timeZone = .autoupdatingCurrent
        formatter.locale = .autoupdatingCurrent
        formatter.dateStyle = .medium // full, loong short
        return formatter
    }
    
    
    var body: some View {
            VStack {
                Text(formatDate.string(from: pickDate))
                    .font(.caption)
                    .foregroundColor(.green)
                    .fontWeight(.semibold)
                    .frame(width: 100)
                
//                DatePicker("Picker Name", selection: $pickDate, displayedComponents: [.date, .hourAndMinute])
//                DatePicker("Picker Name", selection: $pickDate)
//                DatePicker(selection: $pickDate, in: startDate...endingDate,label: {Text("Picker Name")})
                DatePicker(selection: $pickDate, in: startDate...endingDate,displayedComponents: .date ,label: {Text("Picker Name")})
                
                
                // modifier
                    .foregroundColor(.black)
                    .tint(Color.green)
                    .datePickerStyle(
//                        GraphicalDatePickerStyle()
//                        WheelDatePickerStyle()
                        CompactDatePickerStyle()
//                        DefaultDatePickerStyle()
                    )
                    .padding(.horizontal)
        
        

                
            }
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp()
    }
}

// small summary
// date picker
/*
 date picker adalah picking options tanggal/penanggalan dimana user bisa emmilih tanggal sesuai yang dimau oleh user. dimana terdiri atas dd//mm//yyyy, and with different style dari datepicker itu sendiri.
    CompactDatePickerStyle() adalah default style untuk picker date style.
 
 
 macam macam date picker
 1. DatePicker("Picker Name", selection: $pickDate, displayedComponents: [.date, .hourAndMinute])
    date picker component dalam bentuk biasa juga bisa, dalam bentuk array juga bisa
 2. DatePicker("Picker Name", selection: $pickDate)
    date picker component tanpa pengaturan display tanggal atau jam atau minute yang di display
 3. DatePicker(selection: $pickDate, in: startDate...endingDate, label: {Text("Picker Name")})
    date picker component dengan batasan tanggal awal dan akhir yang harus didefinisikan dahulu diatasnya.
 4. DatePicker(selection: $pickDate, in: startDate...endingDate,displayedComponents: .date ,label: {Text("Picker Name")})
    date picker dengan batasan tanggal awal dan akhir serta pengaturan tampilan opsi yang ingin di tampilkan apakah tanggal saja ataupun jam saja atau keduanya
 

 modifier explanation
 tint // padda date picker berguna untuk mengubah warna basic pada calendar saat di click atau di hover. warna ketika dia tampil tetap hitam, diubahnya dengan foreground color dan ituoun hanya kepada title saja
 
 displayed components // displayed components berguna untuk mengatuer dosplay yang akan di tampilkan oleh datePicker apakah tanggal,  jam ataupu keduanya. kalo keduanya cukup dengan menghapusnya saja, karena default dari modifiernya.
 
 date formatter merupakan format pengaturan display tanggal
 
 untuk date bertipe range
 let selectDate: Date = Calendar.current.date(from: DateComponents(
 //        calendar: <#T##Calendar?#>,
 //        timeZone: <#T##TimeZone?#>,
 //        era: <#T##Int?#>,
 //        year: <#T##Int?#>,
 //        month: <#T##Int?#>,
 //        day: <#T##Int?#>,
 //        hour: <#T##Int?#>,
 //        minute: <#T##Int?#>,
 //        second: <#T##Int?#>,
 //        nanosecond: <#T##Int?#>,
 //        weekday: <#T##Int?#>,
 //        weekdayOrdinal: <#T##Int?#>,
 //        quarter: <#T##Int?#>,
 //        weekOfMonth: <#T##Int?#>,
 //        weekOfYear: <#T##Int?#>,
 //        yearForWeekOfYear: <#T##Int?#>)
 //    )

 
 
 */
