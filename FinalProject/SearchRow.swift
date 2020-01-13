//
//  SearchRow.swift
//  FinalProject
//
//  Created by User22 on 2020/1/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct SearchRow: View {
    var item: Item
    var body: some View {
        HStack(){
            KFImage(item.pagemap.cse_thumbnail[0].src)
            .resizable()
            .scaledToFill()
            .frame(width: 145, height: 84)
            .clipped()
            Text(item.title)
            .bold()
        }
    }
}

struct SearchRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchRow(item: Item(title:"告五人Accusefive 【披星戴月的想你】Official Music Video - YouTube",link: URL(string:"https://www.youtube.com/watch?v=VpwAq7hiij0")!,snippet:"",pagemap: Pagemap(cse_thumbnail: [Thumbnail(src: URL(string:"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSasFOHAylcyk1AtqDas13TqyXayKaOGwkcpP-dx96MCMImWfBfkT-_V3wW")!)]))
        )
    }
}
