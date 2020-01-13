//
//  BandRow.swift
//  FinalProject
//
//  Created by User22 on 2020/1/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import SwiftUI

struct BandRow: View {
    var bands:Band
    var body: some View {
        
        HStack(){
            if self.bands.imageName != "" && self.bands.imageName != "Nothing"{
                Image(uiImage: UIImage(contentsOfFile:bands.imagePath)!)
                .resizable()
                .scaledToFill()
                .frame(width:80,height:80)
                .clipped()
                VStack(alignment: .leading) {
                    Text(bands.name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.orange)
                }
                Spacer()
            }
            else if self.bands.imageName == "Nothing"{
                Image(systemName: "person")
                .resizable()
                .padding()
                .scaledToFill()
                .frame(width:80,height:80)
                .clipped()
                .foregroundColor(Color.red)
                .opacity(0.7)
                VStack(alignment: .leading) {
                    Text(bands.name)
                        .fontWeight(.medium)
                        .foregroundColor(Color.orange)
                }
                Spacer()
            }
            else{
                Image(bands.name)
                  .resizable()
                  .scaledToFill()
                  .frame(width:80,height:80)
                  .clipped()
                  VStack(alignment: .leading) {
                      Text(bands.name)
                          .fontWeight(.medium)
                          .foregroundColor(Color.orange)
                  }
                  Spacer()
            }
        }
    }
}

struct BandRow_Previews: PreviewProvider {
    static var previews: some View {
        BandRow(bands: Band(name:"告五人", imageName:"告五人"))
    }
}
