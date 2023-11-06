//
//  BackgroundView.swift
//  SpaceX
//
//  Created by Karim Sakr on 30/10/2023.
//

import SwiftUI

struct BackgroundView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    var body: some View {
        
        if verticalSizeClass == .compact {
            //MARK: - Landscape
            HStack {
                Spacer()
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color(.gold))
                    .frame(width: UIScreen.screenSize.height * 0.5)
            }
            
        } else {
            //MARK: - Portrait
            VStack {
                Spacer()
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color(.gold))
                .frame(height: UIScreen.screenSize.height * 0.35)
            }
            
        }
            
    }
}

#Preview {
    BackgroundView()
}
