//
//  stateObjectandEnvironmentObject.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 25/12/23.
//

import SwiftUI
struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isAnimated: Bool = false
    @Published var name: Bool = false
    @Published var cartItem: [FruitModel] = []
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let item1 = FruitModel(name: "Apples", count: 99)
        let item2 = FruitModel(name: "Banana", count: 10)
        let item3 = FruitModel(name: "Mango", count: 17)

//        isAnimated = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(item1)
            self.fruitArray.append(item2)
            self.fruitArray.append(item3)
            
//            self.isAnimated = false
//        }
    }
    
    func deleteItems(indexset: IndexSet) {
        fruitArray.remove(atOffsets: indexset)
    }
    
    func moveItems(indexset: IndexSet, destination: Int) {
        fruitArray.move(fromOffsets: indexset, toOffset: destination)
    }
    
    func cartItemAdd() {
        let item1 = FruitModel(name: "this is in cart", count: 99)
        
        self.cartItem.append(item1)
    }
}

struct stateObjectandEnvironmentObject: View {
    
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationStack {
            List {
            if fruitViewModel.isAnimated {
                ProgressView()
            }else {
                ForEach(fruitViewModel.fruitArray) { fruits in
                    HStack {
                        Text("\(fruits.count)")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.red)
                        
                        Text(fruits.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(fruitViewModel.name ? Color.blue : Color.black)
                    }
                }
                .onDelete(perform: fruitViewModel.deleteItems)
                .onMove(perform: fruitViewModel.moveItems)
                }
            }
            Button{
                fruitViewModel.cartItemAdd()
            } label: {
                Text("Add Item To Cart".capitalized)
            }
            .buttonStyle(.borderedProminent)
            
            
            // navigation stack items
            
            .navigationTitle("Property Wrapper")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        newScreen(fruitViewModel: fruitViewModel)
                    } label: {
                        Image(systemName: "cart.fill")
                            .foregroundColor(.black)
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .foregroundColor(.black)
                        .buttonStyle(.borderedProminent)
                }
            }
            
        }
    }
}

struct newScreen: View {
    @ObservedObject var fruitViewModel : FruitViewModel
    @Environment (\.dismiss) var dismiss
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                VStack {
                    ForEach(fruitViewModel.cartItem) { fruits in
                        VStack {
                            Text(fruits.name)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Text("\(fruits.count)")
                                .font(.caption)
                                .foregroundColor(.yellow)
                        }
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.medium)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                    }

                }
            }
        .navigationBarBackButtonHidden(true)
        }
    }
}

struct stateObjectandEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        stateObjectandEnvironmentObject()
    }
}


// small summary
// state object dan observed object

// observed object
/*
@observedObject adalah property wrapper dimana akan mengupdate ke view apabila di class ada perubahan. apabila terjadi perubahan pada fruitViewModel maka update atau perbarui ke view
 tetapi pada observed object apapun yang terjadi pada observed object jika kita segue layar ataupun kita menganimasikan sesuatu. maka scrreen akan reload dan data tidak ada yang disimpan. akan mereload ulang terus menerus. bisa dilihat
 apabila kita ke press me button dan segue ke layar lainnya. maka akan mereload ulang dan data seharusnya tetap/konstan
 
 gunakan observed object pada subview atau scond screen
 manggilnya
 @observedObject var fruitViewModel : FruitViewModel
 
*/


// state object
/*
 state object hampir sama seperti observable object yaitu apabila ada perubahan diclass maka akan updated view direcly. pada state object apabila sebelumnya di observed object akan reload dan refresh . pada state object object akan konstan / tetap tidak akan merefresh
 
 gunakan state objetct pada parent view untuk menginit semua yang ada di class untuk bisa dialirkan ke subview atau second scrren dengan observed object
 */

// apa yang bisa dilakukan di dalam class View Model
/*
 apabila di state variable kita bisa mengubah variable dan toggle kan. di class pun bisa, tetapi menggunakan property wrapper yang berbeda yaitu @published, fungsinya sama yang memberdakan adalah cara aksesnya saja dan penempatannya
 */

// rule of thumb
// ketika membuat kelas yang observable object dan instance di parent view maka gunakan @stateObject. dan apabila ingin mempassing data di parent view dan ingin menggunakan property kelas parent di child passing data menggunakan @observedObject dan gunakan @observedObject apabila ingin menggunakan di seconscreen atau second View
// @stateObject use this for INIT ? CREATION
// @observedObject use this for subview atau secondScreen


// fungsi init
//fungsi yang pertama kali dipanggil ketika instansiasi kelas dan berguna saat property wrapper. dimana state dan observed bekerja secara optimal dengan init functions
