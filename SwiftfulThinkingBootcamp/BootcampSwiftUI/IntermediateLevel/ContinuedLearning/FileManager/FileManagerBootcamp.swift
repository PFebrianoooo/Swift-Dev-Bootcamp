//
//  FileManagerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 06/04/24.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager() // singleton class
    let folderName: String = "Bootcamp_Images"
    
    init(){
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appending(path: folderName)
                .path() else {
            return
        }
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating a folder")
            } catch let error {
                print("error creating folder \(error)")
            }
        }
    }
    
    func saveImage(image: UIImage, name: String) -> String {
        // untuk tipe data jpeg, macamnya ada heic png dsb
        guard
            let image = image.jpegData(compressionQuality: 1.0),
            let path = pathDirectory(name: name) else {
            return "Error while downloading a data"
        }
        
        do {
            try image.write(to: path)
            return "Success Saving data to file manager"
        } catch let error {
            return "Cannot write data to file manager your app because \(error)"
        }
    }
    
    func pathDirectory(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appending(path: folderName)
                .appending(path: "\(name).jpg")
        else {
            print("Error while downloading data")
            return nil
        }
        return path
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = pathDirectory(name: name)?.path(),
            FileManager.default.fileExists(atPath: path) else {
            print("error getting path")
            return nil
        }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) -> String {
        guard
            let path = pathDirectory(name: name)?.path(),
            FileManager.default.fileExists(atPath: path) else {
            return "error getting path"
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Success delete an image"
        } catch let error {
            return "Error deleting an image \(error)"
        }
    }
    
    func deleteFolder() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appending(path: folderName)
                .path() else {
            print("Error while downloading data")
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            print("success deleting a folder")
        } catch let error {
            print("Error deleting a folder \(error)")
        }
    }
}

class FileManagerViewModel: ObservableObject {
    
    let manager = LocalFileManager.instance
    
    @Published var image: UIImage? = nil
    @Published var infoMessage: String = ""
    
    init() {
        getImageFromAssetsFolder()
//        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        let getImage: String = "Image-Profile"
        image = UIImage(named: getImage)
    }
    
    func saveImageToFileManager() {
        guard let image = image else { return }
        let message = manager.saveImage(image: image, name: "Image-Profile")
        infoMessage = message
        
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(name: "Image-Profile")
    }
    
    func deleteImageFromFileManager() {
        let getImage: String = "Image-Profile"
        let message = manager.deleteImage(name: getImage)
        infoMessage = message
        manager.deleteFolder()
    }
    
    
}

struct FileManagerBootcamp: View {
    
    @StateObject var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    if let image = vm.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    HStack {
                        Button {
                            vm.deleteImageFromFileManager()
                        } label: {
                            Text("Delete Image From File Manager")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .padding(.all, 10)
                        }
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        
                        Button {
                            vm.saveImageToFileManager()
                        } label: {
                            Text("Save Image To File Manager")
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.white)
                                .padding(.all, 10)
                        }
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Text(vm.infoMessage)
                    
                    Spacer()
                }
            }
                .navigationTitle("FIle Manager")
        }
    }
}

#Preview {
    FileManagerBootcamp()
}

// small summary
/*
 FIle Manager merupakan sebuah opsi untuk menyimpan seuah file baik itu image, document dan lainnya dari aplikasi untuk menjaga data user tetap pesist atau terjaga.
 macam-macam penyimpanan
 1. File Manager
 2. User Defaults
 3. Core Data
 
 jadi sebagai developer kita harus membuat file dimana kita menaruh hasil download dari user, jangan suruh user memilih folder dan menyimpan downloadannya dari aplikasi tapi harus kita atur dimana dimananya untuk menyimpan sebuah file atau gambar didalam folder tersebut.
 
 ada 3 direktory yang pelru diketahui
 1. document directory
    document directory untuk ditaruh filenya sebagai direktory doument, yang artinya setiap user in this case bisa untuk mengirimkan file yang didowload ke iphone nya dan dikirimkan ke gallery langsung sync to i cloud, gapangnya adlaah peruntukan untuk user saja.
 2. cache diroctory
    cache direktory untuk file atau data yang bisa di dwonload kembali untuk dipergunakan selanjutnya, ditaruh di cache direktory, misalkan mau didownload lagi lagi dan lagi harus di cache directory
 3. temporary diectory
    temp directory adalah direktory file dimana dan apabila file yang ditaruh di file manager directory file maka akan hilang apabila aplikasi ditutup
 
 
 1. cara panjang menulis direktory dan path
 
 // macam macam direktory
  let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
  let directory3 = FileManager.default.temporaryDirectory
  let directory2 = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
 
 // path directory
  let path = directory2?.appending(path: "\(name).jpg", directoryHint: .notDirectory)
  
 
 2. cara pendek menulis direktory dan path
 
 guard
     let path = FileManager
         .default
         .urls(for: .cachesDirectory, in: .userDomainMask)
         .first?
         .appending(path: "\(name).jpg")
 else {
     print("Error while downloading data")
     return
 }

*/
