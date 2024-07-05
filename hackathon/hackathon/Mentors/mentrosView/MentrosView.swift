//
//  MentrosView.swift
//  hakaton
//
//  Created by vano Kvakhadze on 04.07.24.
//

import SwiftUI

struct MentrosView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    
    var body: some View {
        ZStack{
            NavigationStack {
                VStack{
                    HStack{
                        Spacer()
                            .frame(width: 15)
                        Text("მენტორები")
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                    }
                    
                    HStack {
                        searchView
                        
                        Spacer()
                            .frame(width: 19)
                        
                        menuPicker
                            .onChange(of: viewModel.searchMode) { viewModel.searchText = ""
                            }
                    }
                    
                    Spacer()
                        .frame(height: 15)
                    
                    ScrollView{
                        if viewModel.searchText.isEmpty {
                            ForEach(viewModel.mentors)  {  item in
                                NavigationLink(value: item) {
                                    mentorList(mentor: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .background(Color(uiColor:.secondarySystemGroupedBackground))
                                .cornerRadius(10)
                            }
                            .frame(width: 360)
                            
                        } else if  viewModel.searchMode == .Subject {
                            ForEach(viewModel.filteredBySubject) { item in
                                NavigationLink(value: item) {
                                    mentorList(mentor: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .background(Color(uiColor:.secondarySystemGroupedBackground))
                                .cornerRadius(10)
                            }
                            .frame(width: 360)
                            
                            
                        } else if  viewModel.searchMode == .City {
                            ForEach(viewModel.filterByCity ) { item in
                                NavigationLink(value: item) {
                                    mentorList(mentor: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .background(Color(uiColor:.secondarySystemGroupedBackground))
                                .cornerRadius(10)
                            }
                            .frame(width: 360)
                        } else {
                            ForEach(viewModel.filteredByName) { item in
                                NavigationLink(value: item) {
                                    mentorList(mentor: item)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .background(Color(uiColor:.secondarySystemGroupedBackground))
                                .cornerRadius(10)
                            }
                            .frame(width: 360)
                        }
                    }
                    .frame(maxWidth: .infinity - 40)
                    .frame(maxHeight: .infinity)
                    .ignoresSafeArea(.all)
                    .onAppear {
                        viewModel.fetchData()
                    }
                }
                
                .navigationDestination(for: Mentors.self) { value in
                    MentorsDetails(mentorID: value.id)
                    
                }
                .background(.backgroundC)
                
                
            }
            
            
        }
    }
    
    var searchView: some View {
        HStack{
            TextField("", text: $viewModel.searchText)
                .foregroundColor(.gray)
            
            
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color.gray)
            
        } .padding()
        
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 0)
                    .background(Color(uiColor: .secondarySystemBackground))
                    .frame(width: 310 ,height: 42)
                    .cornerRadius(16)
            )
            .frame(width: 310)
    }
    
    var menuPicker: some View {
        Menu {
            Picker("Search Mode", selection: $viewModel.searchMode) {
                ForEach(SearchMode.allCases) { mode in
                    Text(mode.rawValue).tag(mode)
                }
            }
        }
    label:
        {
            Image(systemName: "ellipsis.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
        }
    }
    
}

struct mentorList: View {
    var mentor: Mentors
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            HStack{
                
                ImageOfMentors(mentor: mentor)
                    .padding(10)
                VStack{
                    
                    Text(mentor.user.first_name)
                        .font(.system(size: 16))
                    
                    
                    Text(mentor.user.last_name)
                        .font(.system(size: 16))
                    
                    Spacer()
                        .frame(height: 20)
                    
                    
                    HStack{
                        VStack(alignment: .leading){
                            
                            Text(mentor.subject)
                                .font(.system(size: 12))
                                .padding(.horizontal, 10)
                            
                            Spacer()
                                .frame(height: 5)
                            
                            HStack{
                                Text("\(String(mentor.month_price).split(separator: ".").first ?? "")")
                                    .font(.system(size: 12))
                                    .foregroundStyle(.green)
                                
                                Text("₾")
                                    .font(.system(size: 12))
                            }
                            .padding(.leading, 15)
                        }
                        .frame(width: 100, height: 40)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .brown, radius: 10)
                        Spacer()
                        
                        VStack{
                            Spacer()
                                .frame(height: 20)
                            
                            Text(mentor.city)
                                .foregroundStyle(.white)
                                .font(.system(size: 10))
                                .frame(width: 60, height: 20)
                                .background(Color(uiColor: .systemGray2))
                                .cornerRadius(10)
                        }
                        Spacer()
                            .frame(width: 5)
                        
                    }
                    
                }
            }
            
            HStack{
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.yellow)
                
                
                Text("\(String(format: "%.1f", mentor.average_rating))")
                    .font(.system(size: 12))
                
            }
            .padding(.trailing, 15)
            .padding(.top, 10)
        }
        
    }
}



struct ImageOfMentors: View {
    var mentor: Mentors
    
    var body: some View {
        if let imageURL = URL(string: mentor.photo) {
            AsyncImage(url: imageURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .cornerRadius(10)
                        .scaledToFit()
                        .shadow(radius: 3)
                    
                }
            }
            
        } else {
            Image(systemName: "photo")
                .resizable()
                .cornerRadius(8)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
        }
    }
}



#Preview {
    MentrosView()
        .environmentObject(ViewModel())
    
}
