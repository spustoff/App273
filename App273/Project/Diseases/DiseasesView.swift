//
//  DiseasesView.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI

struct DiseasesView: View {
    
    @StateObject var viewModel = DiseasesViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Diseases List")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Amount: \(0)")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("Active diseases")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [.green, .green.opacity(0.8), .green.opacity(0.6)], startPoint: .leading, endPoint: .trailing)))
                        .padding(.horizontal)
                        
                        if viewModel.diseases.isEmpty {
                            
                            VStack(alignment: .center, spacing: 6, content: {
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                Text("You don’t have any active diseases")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .padding()
                            .padding(.vertical, 50)
                            
                        } else {
                            
                            ForEach(viewModel.diseases, id: \.self) { index in
                                
                                NavigationLink(destination: {
                                    
                                    DiseasesDetail(detail: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 7, content: {
                                        
                                        Text("Active")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.treatment_time ?? "")
                                                .foregroundColor(.blue)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.15)))
                                            
                                            Text("Total cost of drugs: $20-30")
                                                .foregroundColor(.green)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.15)))
                                        }
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.5)))
                                    .padding(.horizontal)
                                })
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 7, content: {
                            
                            Text("Amount: \(viewModel.diseases.count)")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .regular))
                            
                            Text("Active diseases")
                                .foregroundColor(.white)
                                .font(.system(size: 17, weight: .semibold))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [.purple, .purple.opacity(0.8), .purple.opacity(0.6)], startPoint: .leading, endPoint: .trailing)))
                        .padding(.horizontal)
                        
                        if viewModel.diseases.isEmpty {
                            
                            VStack(alignment: .center, spacing: 6, content: {
                                
                                Text("Empty")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                
                                Text("You don’t have any diseases")
                                    .foregroundColor(.white.opacity(0.6))
                                    .font(.system(size: 14, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .padding()
                            .padding(.vertical, 50)
                            
                        } else {
                            
                            ForEach(viewModel.diseases, id: \.self) { index in
                                
                                NavigationLink(destination: {
                                    
                                    DiseasesDetail(detail: index)
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 7, content: {
                                        
                                        Text("Active")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.name ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.treatment_time ?? "")
                                                .foregroundColor(.blue)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.15)))
                                            
                                            Text("Total cost of drugs: $20-30")
                                                .foregroundColor(.green)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.15)))
                                        }
                                    })
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.5)))
                                    .padding(.horizontal)
                                })
                            }
                        }
                    }
                }
            }
            
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        DiseasesAdd(viewModel: viewModel)
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
            
            viewModel.fetchDiseases()
        }
    }
}

#Preview {
    DiseasesView()
}
