//
//  ContentView.swift
//  SVC
//
//  Created by Fredrik Lillejordet on 19/10/2021.
//

import SwiftUI
import SafariServices
import WebKit

struct ContentView: View {
    @State var showSafari = false
    @State var showWebView = false
    @State var url = "https://www.bekk.no"
    
    var body: some View {
        Button(action: {
            self.showSafari = true
        }) {
            Text("Safari View Controller")
        }
        // summon the Safari sheet
        .sheet(isPresented: $showSafari) {
            SafariView(url:URL(string: url)!)
        }
        Button(action: {
            self.showWebView = true
        }) {
            Text("WebView")
        }
        // summon the Safari sheet
        .sheet(isPresented: $showWebView) {
            WebView(request: URLRequest(url: URL(string: url)!))
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

struct WebView : UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
