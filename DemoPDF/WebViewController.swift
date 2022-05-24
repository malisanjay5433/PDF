//
//  WebViewController.swift
//  DemoPDF
//
//  Created by Sanjay Mali on 02/05/22.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    var urlString :String?

    override func viewDidLoad() {
        super.viewDidLoad()
        load(urlString ?? "")        
    }
    func load(_ urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    @IBAction func btn(sender : UIButton){
        navigateToPdfView(path: urlString ?? "")
    }
    func navigateToPdfView(path: String) {
        let urlArr = path.components(separatedBy: "/")
        let filelast = urlArr.last
        guard let og = filelast?.trimmingCharacters(in: .whitespacesAndNewlines) else { return}
//        self.downloadPdf(downloadUrl : path, fileName:og.removingPercentEncoding ?? "") { (localFileUrl, bool) in
            let fileURL = NSURL(fileURLWithPath: path)
            let activityViewController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        debugPrint("Started to load")
//        activityIndicator.isHidden = false
//        activityIndicator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint("Finished loading")
//        activityIndicator.stopAnimating()
//        activityIndicator.isHidden = true
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        debugPrint(error.localizedDescription)
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        // TODO
        decisionHandler(.allow)
    }
}
   
