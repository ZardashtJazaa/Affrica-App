//
//  CenterModifier.swift
//  Africa
//
//  Created by Zardasht on 8/4/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
