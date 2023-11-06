//
//  CardView.swift
//  SpaceX
//
//  Created by Karim Sakr on 30/10/2023.
//

import SwiftUI

struct CardView: View {
    
    private let cornerSize: CGFloat = 200.0
    
    let launch: Launch
    
    @State var urlString = ""
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 8)
            .frame(width: cornerSize, height: cornerSize)
            .foregroundStyle(Color.appBlue.opacity(0.9))
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 10))
            .overlay {
                    
                    VStack {
                        
                        Text(String(launch.flightNumber))
                            .foregroundStyle(Color.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .frame(width: cornerSize, alignment: .leading)
                            .padding(EdgeInsets(top: 20, leading: 50, bottom: 0, trailing: 0))
                        
                        Text(launch.dateLocal)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 12))
                            .frame(width: cornerSize, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0))
                        Spacer()
                        
                        Text(launch.name)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 12))
                            .frame(width: cornerSize, alignment: .leading)
                            .padding(EdgeInsets(top: 0, leading: 50, bottom: 20, trailing: 0))
                        
                        HStack(spacing: 0) {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: (cornerSize/2) - 30, height: 3)
                                .foregroundStyle(Color.gold)
                            
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: (cornerSize/2) - 30, height: 3)
                                .foregroundStyle(Color.white)
                            
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                }
            }
            .background(content: {
                AsyncImage(url: URL(string: urlString)) { image in
                    image
                        .resizable()
                        .frame(width: cornerSize - 10, height: cornerSize - 10)
                } placeholder: {
                    EmptyView()
                }
            })
            .onAppear {
                urlString = (launch.links?.patch?.small)!
            }
            .onDisappear {
                urlString = ""
            }
    }
}

//MARK: - EmptyCard
/// When Loading for the first time
struct EmptyCardView: View {
    
    private let cornerSize: CGFloat = 200.0
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(width: cornerSize, height: cornerSize)
            .foregroundStyle(Color.gray)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
        
    }
}

//#Preview {
//    CardView(launch: )
//}
