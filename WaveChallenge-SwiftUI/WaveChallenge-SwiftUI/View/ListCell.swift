//
//  ListCell.swift
//  WaveChallenge-SwiftUI
//
//  Created by John De Guzman on 2020-06-29.
//

import SwiftUI

struct ListCell: View {
    private var title: String
    private var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
            Text(subtitle)
                .font(.body)
                .foregroundColor(Color.gray)
        }
    }
}


struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell(title: "Dog", subtitle: "Cat")
            .previewLayout(.sizeThatFits)
    }
}
