//
//  PillsView.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI

struct PillsView: View {
    
    @StateObject var viewModel = PillsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Pills")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                NavigationLink(destination: {
                    
                    Currencies()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Currency")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("EUR/USD")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                        
                        Spacer()
                        
                        Text("edit")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [.orange, .orange.opacity(0.8), .orange.opacity(0.6)], startPoint: .leading, endPoint: .trailing)))
                    .padding(.horizontal)
                })
                
                if viewModel.pills.isEmpty {
                    
                    VStack(alignment: .center, spacing: 6, content: {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 19, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don’t have any added treatment")
                            .foregroundColor(.white.opacity(0.6))
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.pills, id: \.self) { index in
                            
                                HStack {
                                    
                                    Image("Ibuprofen")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 90)
                                    
                                    VStack(alignment: .leading, spacing: 8, content: {
                                        
                                        Text("Price: $\(index.price)")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text("Cold")
                                                .foregroundColor(.blue)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.15)))
                                            
                                            Text("Flu")
                                                .foregroundColor(.green)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.15)))
                                            
                                            Text("Pain Relief")
                                                .foregroundColor(.orange)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.orange.opacity(0.15)))
                                        }
                                    })
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.5)))
                            }
                        }
                        .padding(.horizontal)
                        .padding(1)
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        PillsAdd(viewModel: viewModel)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .bold))
                            .frame(width: 50, height: 50)
                            .background(Circle().fill(.green))
                    })
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchPills()
        }
    }
}

#Preview {
    PillsView()
}
