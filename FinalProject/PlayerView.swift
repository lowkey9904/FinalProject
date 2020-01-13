//
//  PlayerView.swift
//  FinalProject
//
//  Created by User22 on 2020/1/5.
//  Copyright © 2020 Lawrence. All rights reserved.
//

import SwiftUI
import SafariServices

struct PlayerView: View {
    @State var link: URL
    
    var body: some View {
        SafariView(url:self.link)
    }

}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(link: URL(string:"https://www.youtube.com/watch?v=VpwAq7hiij0")!)
    }
}

struct SafariView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
    }
}

