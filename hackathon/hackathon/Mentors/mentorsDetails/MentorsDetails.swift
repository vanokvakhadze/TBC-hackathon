//
//  MentorsDetails.swift
//  hakaton
//
//  Created by vano Kvakhadze on 04.07.24.
//

import SwiftUI

struct MentorsDetails: View {
    @EnvironmentObject var viewModel: ViewModel
    
    
    var mentorID: Int
    
    var body: some View {
        
        ZStack (alignment: .top){
            
            VStack (spacing: 25){
                if let mentor = viewModel.selectedMentor {
                    HStack{
                        Text("დეტალური ინფრომაცია")
                      
                    }
                    .font(.system(size: 22, weight: .bold))
                    
                    HStack{
                        MentorDetialsPhoto(mentor: mentor)
                        
                        Spacer()
                            .frame(width: 50)
                        
                        VStack{
                            VStack{
                                Text(mentor.user.first_name)
                                
                                Text(mentor.user.last_name)
                            }
                            .font(.system(size: 22, weight: .bold))
                            
                            Spacer()
                                .frame(height: 30)
                            
                            HStack{
                                Spacer()
                                Text(mentor.city)
                                    .foregroundStyle(Color(uiColor: .systemGray))
                                    .frame(width: 100, height: 20)
                                    .background(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(width: 170)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 180)
                    .background(.backgroundC)
                    .cornerRadius(10)
                    
                    DetailsInfo(mentor: viewModel.selectedMentor!)
                   
                    description
                    
                }
            }
            .onAppear {
                viewModel.fetchMentorDetails(id: mentorID)
            }
            
        }
    }
    
    var description: some View {
        VStack{
            if let details = viewModel.selectedMentor{
                VStack(alignment: .leading){
                    Text("აღწერა")
                        .bold()
                    
                    
                    ScrollView{
                        Text(details.description)
                            .foregroundStyle(.gray)
                    }
                    .frame(height: 200)
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

struct DetailsInfo: View {
    var mentor: MentorDetails
    var body: some View {
        HStack{
            Spacer()
                .frame(width: 10)
            
            VStack(alignment: .leading, spacing: 10){
                Text("კონტაქტი")
                    .font(.headline)
                    .padding(.bottom, 5)
                
                HStack{
                    Image(systemName: "phone.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.green)
                    Text(mentor.user.phone_number)
                        
                }
                HStack{
                    Image(systemName: "envelope.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.blue)
                    Text(mentor.user.email)
                }
                
                HStack{
                    Image(systemName: "location.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.cyan)
                    Text(mentor.address)
                        
                }
            }
            .font(.system(size: 16))
            
            
            Spacer()
            VStack{
                VStack{
                    Text(mentor.subject)
                        .bold()
                    
                    HStack {
                        
                        Text("\(String(mentor.month_price).split(separator: ".").first ?? "")")
                            .foregroundStyle(.green)
                        Text("₾")
                    }
                    .frame(width: 80, height: 30)
                    .shadow(color: .blue, radius: 20)
                    .cornerRadius(20)
                    
                }
                .padding(10)
                .font(.system(size: 16))
                .frame(height: 70)
                .background(Color(uiColor: .systemGray5))
                .cornerRadius(10)
                
                Spacer()
                    .frame(height: 60)
            }
            Spacer()
                .frame(width: 10)
        }
    }
}


#Preview {
    MentorsDetails( mentorID: 1)
        .environmentObject(ViewModel())
    
}


