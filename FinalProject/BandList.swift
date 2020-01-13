//
//  SearchView.swift
//  FinalProject
//
//  Created by User22 on 2020/1/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import SwiftUI

struct BandList: View {
    

    @ObservedObject var mybandData = BandData()
    @State private var showBandInsert = false
    @ObservedObject var photoData = PhotoData()
    
    private func delete(item band: Band) {
        if let index = self.mybandData.bands.firstIndex(where: { $0.id == band.id }) {
            self.mybandData.bands.remove(at: index)
        }
    }
    
    var body: some View {
        VStack(){
            Image("Youtube")
                .resizable()
                .scaledToFit()
                .frame(width:360,height:140)
            NavigationView{
                List{
                    ForEach(mybandData.bands){(band) in            NavigationLink(destination: ContentView(BandName: band)){BandRow(bands: band)
                        .contextMenu {
                            Button(action: {
                                self.delete(item: band)
                            }) {
                                HStack {
                                    Text("刪除")
                                    Image(systemName: "trash")
                                }
                            }
                        }
                        }
                    }.onDelete { (indexSet) in
                    self.mybandData.bands.remove(atOffsets: indexSet)}
                    .onMove { (indexSet, index) in
                    self.mybandData.bands.move(fromOffsets: indexSet, toOffset: index)}
                    
                }.navigationBarTitle("我的關注樂團")
                    .navigationBarItems(leading: EditButton().foregroundColor(.red), trailing: Button(action:{self.showBandInsert = true},
                label: {Image(systemName: "plus.circle.fill").foregroundColor(.red)}))
                 .sheet(isPresented: $showBandInsert){
                            BandInsert(bandData: self.mybandData, trphotoData: self.photoData)
                    }
            }
        }
    }
}


struct BandList_Previews: PreviewProvider {
    static var previews: some View {
        BandList()
    }
}


