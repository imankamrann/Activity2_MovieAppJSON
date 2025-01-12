//
//  InputView.swift
//  Activity2_MovieAppJSON
//
//  Created by Iman on 2025-01-12.
//

import SwiftUI

struct InputView: View {
    @Binding var test: String
    let title: String
    let placeholder: String
    var isSecureField: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField {
                SecureField(placeholder, text: $test)
                    .font(.system(size: 14))
            }
            else{
                TextField(placeholder, text: $test)
                    .font(.system(size: 14))
            }
            
            Divider()
            
        }
    }
}

#Preview {
    InputView(test: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
