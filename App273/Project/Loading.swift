//
//  Loading.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI

struct Loading: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("logo_big")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .shadow(color: Color("primary"), radius: 150, x: 0, y: 0)
            
            ProgressView()
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding()
        }
    }
}

#Preview {
    Loading()
}
