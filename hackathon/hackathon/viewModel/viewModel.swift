//
//  viewModel.swift
//  hackathon
//
//  Created by vano Kvakhadze on 05.07.24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var mentors: [Mentors] = []
    @Published var selectedMentor: MentorDetails?
    @Published var searchText: String = ""
    @Published var searchMode: SearchMode = .Name
   
    var filteredByName: [Mentors] {
        mentors.filter({$0.user.first_name.localizedStandardContains(searchText)})
    }
    var filteredBySubject: [Mentors] {
        mentors.filter({$0.subject.localizedStandardContains(searchText)})
    }
    
    var  filterByCity: [Mentors] {
        mentors.filter({$0.city.localizedStandardContains(searchText)})
    }
    
    
    var isSearchResultsAreEmpty: Bool {
        switch searchMode {
        case .Name:
            return filteredByName.isEmpty
        case .Subject:
            return filteredBySubject.isEmpty
        case .City:
            return filterByCity.isEmpty
        }
    }
    
        func fetchData() {
            let urlString = "https://freegrand.pythonanywhere.com/api/tutor/?format=json"
    
            NetworkService().requestData(urlString: urlString) { [weak self] (result: [Mentors]?, error) in
                if let result = result {
                    DispatchQueue.main.async {
                        self?.mentors = result
                    }
                }
            }
        }
    
    
    func fetchMentorDetails(id: Int) {
        let urlString = "https://freegrand.pythonanywhere.com/api/tutor/\(id)/?format=json"
        
        NetworkService().requestData(urlString: urlString) { [weak self] (result: MentorDetails?, error) in
            if let result = result {
                DispatchQueue.main.async {
                    self?.selectedMentor = result
                }
            }
        }
        
    }
}
