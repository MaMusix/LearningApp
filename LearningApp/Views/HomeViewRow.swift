//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Michael Ketelaar on 14.05.21.
//

import SwiftUI


struct HomeViewRow: View {
    
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipShape(Circle())
                    .padding(.trailing, 30)
                VStack (alignment: .leading) {
                    Text(title)
                        .fontWeight(.bold)
                    Text(description)
                        .padding(.bottom, 20)
                        .font(.caption)
                    HStack {
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text(count)
                            .font(.system(size: 10))
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text(time)
                            .font(.system(size: 10))
                    }
                }
            }
            .padding()
        }
        
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learn Swift", description: "Some description", count: "15 lessons", time: "3 hours")
    }
}
