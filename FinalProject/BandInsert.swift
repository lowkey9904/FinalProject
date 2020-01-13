//
//  BandInsert.swift
//  FinalProject
//
//  Created by 王瑋 on 2020/1/12.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import SwiftUI

struct BandInsert: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var content = ""
    @State private var selectImage: UIImage?
    @State var showAlert = false
    @State var showingImagePicker = false
    @ObservedObject var photoData = PhotoData()
    var bandData: BandData
    var trphotoData: PhotoData
    var body: some View {
        NavigationView{
            Form{
                TextField("名字...", text: $name)
                Button(action:{self.showingImagePicker = true}){
                    Group {
                         if self.selectImage != nil {
                             Image(uiImage: self.selectImage!)
                                .resizable()
                                .renderingMode(.original)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                        }
                    }.scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    Text("選擇樂團照片")
                }.foregroundColor(Color.red)
                .sheet(isPresented: $showingImagePicker) {
                    ImagePickerController(selectImage: self.$selectImage, showSelectPhoto: self.$showingImagePicker)}
            }.navigationBarTitle("增加新關注的樂團")
            .navigationBarItems(trailing: Button("儲存"){
                if self.selectImage != nil {
                    let imageName = UUID().uuidString
                    let url = PhotoData.documentsDirectory.appendingPathComponent(imageName)
                    try? self.selectImage?.jpegData(compressionQuality: 0.9)?.write(to: url)
                    let photo = Photo(content: self.content, imageName: imageName)
                    self.photoData.photos.insert(photo, at: 0)
                    self.selectImage = nil
                    self.content = ""
                    self.trphotoData.photos.insert(photo, at: 0)
                    self.selectImage = nil
                    self.content = ""
                    let newband = Band(name: self.name, imageName: imageName)
                    self.bandData.bands.insert(newband, at: 0)
                    self.presentationMode.wrappedValue.dismiss()
                }
                else if self.name.isEmpty == true{
                    self.showAlert = true
                }
                else if self.name.isEmpty != true{
                    let newband = Band(name: self.name, imageName: "Nothing")
                    self.bandData.bands.insert(newband, at: 0)
                    self.presentationMode.wrappedValue.dismiss()
                }
            }.foregroundColor(Color.red))
            .alert(isPresented: $showAlert) { () -> Alert in
               let answer = ["請輸入名稱！", "記得輸入名稱！"].randomElement()!
               return Alert(title: Text(answer))
            }
        }
    }
}

struct BandInsert_Previews: PreviewProvider {
    static var previews: some View {
        BandInsert(bandData: BandData(), trphotoData: PhotoData())
    }
}
