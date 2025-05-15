import SwiftUI
import WebKit

struct AppleOneToOneView: View {
    @State private var showSuccess = false
    
    var body: some View {
        if showSuccess {
            SuccessView()
        } else {
            ScrollView {
                VStack(spacing: 24) {
                    Text("Premium Access")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.top, 40)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        AppleFeatureRow(icon: "star.fill", title: "Premium Content", description: "Access to exclusive features and content")
                        AppleFeatureRow(icon: "bolt.fill", title: "Faster Performance", description: "Enhanced speed and reliability")
                        AppleFeatureRow(icon: "lock.fill", title: "Secure Access", description: "Enterprise-grade security")
                    }
                    .padding(.horizontal)
                    
                    // Price
                    VStack(spacing: 8) {
                        Text("$9.99")
                            .font(.system(size: 48, weight: .bold))
                        Text("per month")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical)
                    
                    WebView(url: URL(string: "https://webview-payments-demo.vercel.app/apple")!, showSuccess: $showSuccess)
                        .frame(height: 400)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 40)
            }
        }
    }
}

struct AppleFeatureRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 32)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    AppleOneToOneView()
} 
