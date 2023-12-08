//
//  Currencies.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI

struct Currencies: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Graphic")
                        .foregroundColor(.white)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 15, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("EUR/USD")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                    
                    HStack(alignment: .bottom, spacing: 10, content: {
                        
                        Text("\(Int.random(in: 1...25005))")
                            .foregroundColor(.white)
                            .font(.system(size: 21, weight: .semibold))
                        
                        Text("+\(Int.random(in: 1...5))%")
                            .foregroundColor(.green)
                            .font(.system(size: 13, weight: .regular))
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.1)))
                    })
                })
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                Image("graph")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Apply")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                    })
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.red))
                    })
                }
                .padding()
            }
        }
    }
}

#Preview {
    Currencies()
}
