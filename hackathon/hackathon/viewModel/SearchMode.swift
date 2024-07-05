//
//  SearchMode.swift
//  hackathon
//
//  Created by vano Kvakhadze on 05.07.24.
//

import Foundation

enum SearchMode: String, CaseIterable, Identifiable {
    case Name = "სახელი"
    case Subject = "საგანი"
    case City = "ქალაქი"
    
    var id: String { self.rawValue }
}

