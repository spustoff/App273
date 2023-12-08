//
//  Treatments.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI

struct Treatments: View {
    
    @StateObject var viewModel = DiseasesViewModel()
    
    @Binding var treatment: TreatmentModel?
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Treatment")
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.treatments_list) { index in
                        
                            Button(action: {
                                
                                treatment = index
                                router.wrappedValue.dismiss()
                                
                            }, label: {
                                
                                HStack {
                                    
                                    Image(index.title)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 90)
                                    
                                    VStack(alignment: .leading, spacing: 8, content: {
                                        
                                        Text("Price: $\(index.price)")
                                            .foregroundColor(Color("primary"))
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Text(index.title)
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        HStack {
                                            
                                            Text(index.param1)
                                                .foregroundColor(.blue)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.15)))
                                            
                                            Text(index.param2)
                                                .foregroundColor(.green)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(8)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.green.opacity(0.15)))
                                            
                                            Text(index.param3)
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
                            })
                        }
                    }
                    .padding(1)
                    .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    Treatments(treatment: .constant(TreatmentModel(treatID: 3, title: "dsa", price: 32, param1: "fpdosj", param2: "fdspo", param3: "fdpos")))
}
