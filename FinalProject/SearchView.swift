//
//  SearchView.swift
//  FinalProject
//
//  Created by 王瑋 on 2020/1/11.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State private var Search = ""
    @State private var moveDis: CGFloat = 300
    @State private var opacity: Double = 0
    @State private var showAlert = false
    @State private var items = [Item]()
    @State private var showPlayerView = false
    @State private var nowIndex = 0
    @State private var longPressTime: CGFloat = 1
    let screenSize: CGRect = UIScreen.main.bounds
    
    func GetSearch(){
        
        let urlStr = "https://www.googleapis.com/customsearch/v1?cx=002779568533849920752:gmnwmsf0fcr&key=AIzaSyA4-Di_R6il21-2GnfBvMDrQPU6TfuM3bY&q=臺灣&siteSearch=youtube.com"
        let newUrl = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        if let url = URL(string: newUrl) {
            URLSession.shared.dataTask(with: url) { (data, response , error) in
            if let data = data {
                do{
                    let searchResults = try JSONDecoder().decode(SearchObject.self, from: data)
                    self.items = searchResults.items
                }
                catch{
                    print(error)
                }
            }
            }.resume()
        }
    }
    var body: some View {

        NavigationView {
        VStack {
        Image("Youtube2")
            .resizable()
            .scaledToFit()
            .frame(width:360,height:140)
            .opacity(opacity)
            .scaleEffect(longPressTime)
            .onLongPressGesture {
                if self.longPressTime < 2{
                    self.longPressTime *= 2
                }
            }
            .onAppear{
                if self.opacity != 0{
                    self.opacity = 0
                    withAnimation (Animation.linear(duration: 3)){
                       self.opacity += 0.8
                    }
                }
                else{
                    withAnimation (Animation.linear(duration: 3)){
                       self.opacity += 0.8
                    }
                }
            }
            HStack {
            TextField("搜尋...", text: $Search, onEditingChanged: { (editing) in
               print("onEditingChanged", editing)
            }) {
               print(self.Search)
            }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.red, lineWidth: 3))
                .frame(width: 300)
                .opacity(opacity)
                NavigationLink(destination: ContentView(BandName: Band(name: String(self.Search), imageName:""))) {
                    Image(systemName:"magnifyingglass")
                    .foregroundColor(.red)
                    .padding()
                    .font(.largeTitle)
                    .opacity(opacity)

                }
            }
            List(items.indices, id: \.self) { (index)  in
                SearchRow(item: self.items[index])
                    .onTapGesture {
                       self.showPlayerView = true
                       self.nowIndex = index
                    }
                }.sheet(isPresented: self.$showPlayerView) {
                    PlayerView(link: self.items[self.nowIndex].link)
            }
            .onAppear {
                if self.items.count == 0 {
                    self.GetSearch()
                }
            }
            Spacer()
        }.frame(height: screenSize.height)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
