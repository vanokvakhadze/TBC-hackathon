//
//  MentorDetailsPhoto.swift
//  hackathon
//
//  Created by vano Kvakhadze on 05.07.24.
//

import SwiftUI

struct MentorDetialsPhoto: View {
    var mentor: MentorDetails
    
    var body: some View {
        AsyncImage(url: URL(string: mentor.photo )) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(10)
                                        .scaledToFill()
                                        .shadow(radius: 3)
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(10)
                                        .foregroundColor(.gray)
                                }
                            }
    }
}


