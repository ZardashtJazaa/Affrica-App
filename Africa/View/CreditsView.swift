//
//  CreditsView.swift
//  Africa
//
//  Created by Zardasht on 8/4/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing:10) {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
            Copyright © Zardasht Jaza
            All right reserved
            Better Apps ♡ Less Code
            """)
            .font(.footnote)
        }//VStack
        .multilineTextAlignment(.center)
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
