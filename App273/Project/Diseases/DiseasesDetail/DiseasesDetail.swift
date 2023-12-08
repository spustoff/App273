//
//  DiseasesDetail.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI

struct DiseasesDetail: View {
    
    let detail: DiseasesModel
    
    @StateObject var viewModel = DiseasesViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text(detail.name ?? "")
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
                    
                    LazyVStack(alignment: .leading, spacing: 15) {
                        
                        Text("Status: Active")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 14, weight: .regular))
                        
                        Text(detail.name ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                
                                Text("Treatment time")
                                    .foregroundColor(.blue.opacity(0.5))
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text(detail.treatment_time ?? "")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 16, weight: .medium))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.blue.opacity(0.1)))
                            
                            VStack(alignment: .leading, spacing: 8, content: {
                                
                                Text("Total cost of drugs")
                                    .foregroundColor(Color("primary").opacity(0.5))
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("$20-30")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .medium))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary").opacity(0.1)))
                        }
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Treatment")
                                .foregroundColor(.white)
                                .font(.system(size: 19, weight: .semibold))
                            
                            let index = viewModel.getTreatmentByID(detail.treatment_id)
                            
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
                    .padding()
                }
            }
        }
    }
}

//#Preview {
//    DiseasesDetail()
//}
