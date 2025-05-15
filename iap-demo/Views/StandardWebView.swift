import SwiftUI

struct StandardWebView: View {
    @State private var showWebView = false
    @State private var showSuccess = false
    private let checkoutUrl = "https://webview-payments-demo.vercel.app/"
    
    var body: some View {
        if showSuccess {
            SuccessView()
        } else if showWebView {
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        showWebView = false
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .semibold))
                            Text("Back")
                                .font(.system(size: 17))
                        }
                        .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Text("Complete Purchase")
                        .font(.system(size: 17, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemBackground))
                
                WebView(url: URL(string: checkoutUrl)!, showSuccess: $showSuccess)
            }
        } else {
            ZStack {
                ScrollView {
                    VStack(spacing: 30) {
                        VStack(spacing: 16) {
                            Image(systemName: "star.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(.yellow)
                            
                            Text("Upgrade to Premium")
                                .font(.system(size: 32, weight: .bold))
                            
                            Text("Unlock all features and take your experience to the next level")
                                .font(.system(size: 18))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 40)
                        
                        VStack(spacing: 20) {
                            FeatureRow(icon: "checkmark.circle.fill", text: "Unlimited access to all content")
                            FeatureRow(icon: "checkmark.circle.fill", text: "Ad-free experience")
                            FeatureRow(icon: "checkmark.circle.fill", text: "Priority support")
                            FeatureRow(icon: "checkmark.circle.fill", text: "Exclusive features")
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 8) {
                            Text("$9.99")
                                .font(.system(size: 48, weight: .bold))
                            
                            Text("per month")
                                .font(.system(size: 18))
                                .foregroundColor(.secondary)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(16)
                        .padding(.horizontal)
                        
                        Button(action: {
                            showWebView = true
                        }) {
                            Text("Upgrade Now")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(16)
                        }
                        .padding(.horizontal)
                        
                        Text("Cancel anytime. Terms and conditions apply.")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                            .padding(.bottom, 40)
                    }
                }
            }
        }
    }
} 
