import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    let url: URL
    @Binding var showSuccess: Bool


    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        return webView
    }


    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }


    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }


    class Coordinator: NSObject, WKNavigationDelegate, WKUIDelegate {
        var parent: WebView


        init(_ parent: WebView) {
            self.parent = parent
        }


        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url,
               url.path == "/success" {
                parent.showSuccess = true
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }


        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if let url = navigationAction.request.url {
                webView.load(navigationAction.request)
            }
            return nil
        }
    }
}
