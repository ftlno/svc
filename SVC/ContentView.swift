//
//  ContentView.swift
//  SVC
//
//  Created by Fredrik Lillejordet on 19/10/2021.
//

import SwiftUI
import SafariServices

struct ContentView: View {
    @State var showSafari = false
    @State var urlString = "https://www.bekk.no"
    
    var body: some View {
        Button(action: {
            self.urlString = "https://www.bekk.no"
            self.showSafari = true
        }) {
            Text("Bekk")
        }
        // summon the Safari sheet
        .sheet(isPresented: $showSafari) {
            SafariView(url:URL(string: self.urlString)!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
