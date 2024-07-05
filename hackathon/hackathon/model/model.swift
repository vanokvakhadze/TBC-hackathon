//
//  Mentors.swift
//  hakaton
//
//  Created by vano Kvakhadze on 04.07.24.
//
import Foundation

struct Mentors: Decodable, Identifiable, Hashable {
    var id: Int
    let user: Mentorsname
    let subject: String
    let city: String
    let month_price: String
    let average_rating: Double
    let photo: String
    
    struct Mentorsname: Decodable, Hashable {
        let first_name: String
        let last_name: String
    }

}
    struct MentorDetails: Decodable, Identifiable, Hashable {
        let id: Int
        let user: ContactDetails
        let subject: String
        let city: String
        let month_price: String
        let photo: String
        let address: String
        let description: String
        
        struct ContactDetails: Decodable, Hashable {
            let email: String
            let first_name: String
            let last_name: String
            let phone_number: String
        }
    }


