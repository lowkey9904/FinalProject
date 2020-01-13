//
//  AppView.swift
//  FinalProject
//
//  Created by User22 on 2020/1/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @State var selected = 0
    
    var body: some View {
        TabView{
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("搜尋")
            }
            StyleView()
                .tabItem{
                    Image(systemName: "list.dash")
                    Text("分類")
            }
            BandList()
                .tabItem{
                    Image(systemName: "headphones")
                    Text("樂團")
            }
        }.accentColor(.red)
       
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

