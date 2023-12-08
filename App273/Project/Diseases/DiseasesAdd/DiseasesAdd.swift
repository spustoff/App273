//
//  DiseasesAdd.swift
//  App273
//
//  Created by Вячеслав on 12/8/23.
//

import SwiftUI

struct DiseasesAdd: View {
    
    @StateObject var viewModel: DiseasesViewModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Add Disease")
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
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.name.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.name)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Treatment time")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.treatment_time.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.treatment_time)
                                .foregroundColor(.white)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                        
                       NavigationLink(destination: {
                           
                           Treatments(treatment: $viewModel.treatment)
                               .navigationBarBackButtonHidden()
                           
                       }, label: {
                           
                           HStack {
                               
                               Text(viewModel.treatment == nil ? "Treatment" : viewModel.treatment?.title ?? "")
                                   .foregroundColor(.white)
                                   .font(.system(size: 14, weight: .regular))
                               
                               Spacer()
                               
                               Image(systemName: "chevron.right")
                                   .foregroundColor(.white)
                                   .font(.system(size: 14, weight: .regular))
                           }
                           .padding()
                           .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                       })
                    }
                    .padding([.horizontal, .bottom])
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addDisease()
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.name = ""
                    viewModel.treatment_time = ""
                    viewModel.treatment = nil
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name.isEmpty || viewModel.treatment_time.isEmpty || viewModel.treatment == nil ? 0.5 : 1)
                .disabled(viewModel.name.isEmpty || viewModel.treatment_time.isEmpty || viewModel.treatment == nil ? true : false)
            }
        }
    }
}

#Preview {
    DiseasesAdd(viewModel: DiseasesViewModel())
}
