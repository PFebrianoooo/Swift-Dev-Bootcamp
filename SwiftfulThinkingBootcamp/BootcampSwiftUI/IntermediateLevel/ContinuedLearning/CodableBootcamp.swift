//
//  CodableBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/03/24.
//

import SwiftUI

struct CustomerModel: Identifiable, Codable {
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool

    // enum untuk key
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case points
        case isPremium
    }

    // default
    init(id: String, name: String, points: Int, isPremium: Bool) {
        self.id = id
        self.name = name
        self.points = points
        self.isPremium = isPremium
    }
    
    // decodable init
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.points = try container.decode(Int.self, forKey: .points)
        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
    }
    
    // encodable
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.points, forKey: .points)
        try container.encode(self.isPremium, forKey: .isPremium)
    }
}

class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        /*
         Untuk melihat proses dan ukuran byte encode serta encode ke string
         print("Json Data size : \(data)")
         let encodeStringData = String(data: data, encoding: .utf8)
         */
        
        // data datang dari internet
        guard let data = getJsonData() else { return }
        
        // cara pendek implisit
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
        // cara rada panjang eksplisit
        /*
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print("Error message for decode data \(error)")
        }
        
         converting manually with implicit try?
         tanpa menggunakan protokol decodable dan init dari decodable
        if
            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
            let dictionary = localData as? [String:Any],
            let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String,
            let points = dictionary["points"] as? Int,
            let isPremium = dictionary["isPremium"] as? Bool {
            
            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
            customer = newCustomer
         
        }
         */
    }
    
    func getJsonData() -> Data? {
        // encode data starts
        let customer = CustomerModel(id: "111", name: "emily", points: 100, isPremium: false)
        
        let jsonData = try? JSONEncoder().encode(customer)
        // encode data ends
        
        // decode data starts
        /*
        // download dari internet berbentuk returning Data
        let fakeData: [String:Any] = [
            "id" : "12345",
            "name" : "jamal hammadi",
            "points" : 150000,
            "isPremium" : true
        ]
        
        // cara ke -1
        let jsonData: Data?
        do {
            jsonData = try JSONSerialization.data(withJSONObject: fakeData, options: [])
        } catch let error {
            print("Error when encode data due to \(error)")
        }
        
         cara ke-2
        let jsonData = try? JSONSerialization.data(withJSONObject: fakeData, options: [])
        */
        // decode data ends
        return jsonData
    }
}

struct CodableBootcamp: View {
    
    @StateObject var VM = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = VM.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text("\(customer.isPremium.description)")
                
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}

// small summary
/*
 Codable Bootcamp
 Codable merupakan sebuah protocol dimana kita bisa mengencode dan mendecode data kita. codable bekerja dengan menggunakan encode dan decode. Biasanya untuk membuat user defaults, membuat data json and fetch json data.
 codable ptotocol juga berguna untuk menconvert data ke sesuatu yang bisa digunakan
 kalo mendownload data dari internet, pada dasarnya bentuknya tidak seperti sruktur data yang dimiliki. tetapi harus di decode dulu setelah itu dimasukkan ke data struktur kita.
 
 ^proses yang terjadi
 Decode data -> keambil datanya -> Encode data -> kirim ke internet.
 
 Decode mengambil sebuah data dan transfer atau di convert kedalam data yang bisa digunakan kedalam aplikasi. Sebagai contoh diatas, converting data Json ke dalam data yang bisa digunakan di customer model.
 Encode merupakan sebuah proses untuk mentransformasi data ke internet

 TIPS:
 jadi data yang kita ambil dari database ataupun internet, pada dasarnya menggunakan form atau bentuk yang tidak sesuai yang kita inginkan, yang harus dilakukan adalah mendecode data yang ada, biasanya dalam bentuk JSON baru bisa digunakan secara lokal

*/
