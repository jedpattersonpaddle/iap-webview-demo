import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            Text("Purchase Successful!")
                .font(.system(size: 32, weight: .bold))
            
            Text("Thank you for upgrading to Premium. You now have access to all features.")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding(.horizontal)
            
            Button(action: {
                NotificationCenter.default.post(name: NSNotification.Name("DismissToRoot"), object: nil)
            }) {
                Text("Continue")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(16)
            }
            .padding(.horizontal)
            .padding(.top, 20)
        }
        .padding()
    }
} 