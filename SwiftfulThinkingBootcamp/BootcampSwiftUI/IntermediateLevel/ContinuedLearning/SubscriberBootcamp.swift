//
//  SubscriberBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 25/03/24.
//

import SwiftUI
import  Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
//    var anyCancelable: AnyCancellable? // gunakan kalo punya satu publisher
    var anyCancelables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    
    @Published var showButton: Bool = false
    
    init () {
        setupTimer()
        addTexFieldSubscriber()
        addButtonSUbscriber()
    }
    
    func addTexFieldSubscriber() {
        $textFieldText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) /* sebuah penunggu untuk delay dikit untuk logic banyak yang bermain dengan database */
            .map { returnedText -> Bool in
                if returnedText.count > 3 {
                    return true
                }else {
                    return false
                }
            }
            .sink(receiveValue: { [weak self] receiveValue in
                self?.textIsValid = receiveValue
            })
            .store(in: &anyCancelables)
        
    }
    
    func setupTimer() {
        /*anyCancelable = */ Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
                // cara stop melalui cancelable
                /*
                 // single publisher
                 if self.count >= 10 {
                 self.anyCancelable?.cancel()
                 }
                 
                 // banyak publisher
                 if count >= 10 {
                 for item in anyCancelabes {
                 item.cancel()
                 }
                 }
                 */
            }
            .store(in: &anyCancelables)
            
    }
    
    func addButtonSUbscriber() {
        $textIsValid
            .combineLatest($count)
            .sink {[weak self] (textIsValid, count) in
                guard let self = self else {return}
                if textIsValid && count >= 10 {
                    self.showButton = true
                }else {
                    self.showButton = false
                }
            }
            .store(in: &anyCancelables)
            
    }
}

struct SubscriberBootcamp: View {
    
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            Text(vm.textIsValid.description)
            
            TextField("Text here", text: $vm.textFieldText)
                .padding(.vertical, 10)
                .padding(.horizontal, 5)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(alignment: .trailing) {
                    ZStack {
                      Image(systemName: "xmark")
                            .opacity(
                                vm.textFieldText.count < 1 ? 0.0 :
                                vm.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(Color.green)
                            .opacity(vm.textIsValid ? 1.0 : 0.0)
                        
                    }
                    .font(.headline)
                    .foregroundStyle(.red)
                    .padding(.trailing, 10)
                }
                .padding(.horizontal)
            
            Button("save") {
                vm.textFieldText = ""
            }
            .buttonStyle(.borderedProminent)
            .opacity(vm.textIsValid ? 1 : 0.5)
            .disabled(!vm.showButton)
            
        }
    }
}

#Preview {
    SubscriberBootcamp()
}

// small summary
/*
 menggabungkan antara materi timer dengan subscriber dan publisher pada framwework combine
 menggunakan sinking data ke publisher dan menggunkana sinking completion
 .sink(receiveValue: )
 
 cara lain untuk cancel seluruh set yang ada di cancelable
 if self.count >= 10 {
     for item in self.timerCancelable {
         item.cancel()
     }
 }
 syarat :
            1. harus berbentuk set<anyCancelable>()
            2. kondisional diatas ditaruh di sink
 
 Nb:
 1. fungsi any cancelable untuk mengcancel kapanpun, dengan bantuan self?.namaVariableCancelable.cancel()
 
 */
