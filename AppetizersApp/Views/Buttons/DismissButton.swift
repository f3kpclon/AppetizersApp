//
//  DismissButton.swift
//  AppetizersApp
//
//  Created by Felix Sotelo on 01-09-23.
//

import SwiftUI

struct DismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
                .padding()
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 40)
                .foregroundColor(.black)
            
        }
    }
}

struct DismissButton_Previews: PreviewProvider {
    static var previews: some View {
        DismissButton()
    }
}
