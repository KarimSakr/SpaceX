//
//  HomeView.swift
//  SpaceX
//
//  Created by Karim Sakr on 30/10/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var didTapOnCard = false
    @State private var selectedLaunch = Launch()
    
    @ObservedObject private var viewModel = HomeViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    
    var body: some View {
        
        ZStack {
            
            BackgroundView()
            
            //MARK: - Landscape
            if verticalSizeClass == .compact {
                
                HStack {
                    
                    VStack {
                    HStack{
                        Text("Launches")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                        
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.appBlue)
                        Image(systemName: "bell")
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 30))
                            .foregroundStyle(Color.appBlue)
                    }
                    
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVStack  (spacing: 0) {
                                Rectangle()
                                    .foregroundStyle(Color.clear)
                                    .frame(width: 30, height: 10)
                                if viewModel.allSuccessfullLaunches.isEmpty {
                                    ForEach(1..<4) { _ in
                                        
                                        EmptyCardView()
                                        
                                    }
                                } else {
                                    ForEach(viewModel.allSuccessfullLaunches) { launch in
                                        
                                        CardView(launch: launch)
                                            .onTapGesture {
                                                selectedLaunch = launch
                                                didTapOnCard = true
                                            }
                                    }
                                }
                            }
                        }
                    }
                    ScrollView(.vertical) {
                        VStack{
                            
                            Text("The Big Launch")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                            
                            HStack {
                                Text("GOLD")
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .foregroundStyle(Color(.white))
                                    .font(.system(size: 12))
                                    .kerning(4)
                                    .background{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .foregroundStyle(Color(.gold))
                                    }
                                
                                Text("SPACE SHIPS")
                                    .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                                    .foregroundStyle(colorScheme == .dark ? Color(.white) : Color(.black))
                                    .font(.system(size: 12))
                                    .kerning(4)
                            }
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                            
                            Image(.iss)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .frame(width: UIScreen.screenSize.width, height: 180, alignment: .center)
                                .overlay {
                                    VStack{
                                        
                                        Spacer()
                                        
                                        Image(.person)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.gold, lineWidth: 10))
                                            .frame(width: UIScreen.screenSize.width, height: 70, alignment: .leading)
                                            .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 0))
                                            .offset(y:30)
                                    }
                                    
                                }
                            
                            
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    Text("2355")
                                        .font(.system(size: 25))
                                        .fontWeight(.bold)
                                        .padding(.bottom)
                                        .foregroundStyle(Color(.white))
                                    
                                    
                                    Text("24 Feb 2022 \n 11:24GMT+5")
                                        .foregroundStyle(Color(.white))
                                        .font(.system(size: 13))
                                    
                                }
                                
                                Spacer()
                                
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eros enim, dictum vitae quam nec, congue feugiat neque. Vivamus ut luctus enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eros enim, dictum vitae quam nec, congue feugiat neque. Vivamus ut luctus enim.")
                                    .font(.system(size: 12))
                                    .lineSpacing(5)
                                    .frame(width: UIScreen.screenSize.width * 0.6)
                                    .foregroundStyle(Color(.white))
                            }
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 30))
                            .frame(width: UIScreen.screenSize.width)
                            
                        }
                    }
                }

                
            } else {
                
                //MARK: - Portrait
                VStack (alignment: .leading) {
                    
                    HStack{
                        Text("Launches")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                        
                        Spacer()
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.appBlue)
                        Image(systemName: "bell")
                            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 30))
                            .foregroundStyle(Color.appBlue)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack  (spacing: 0) {
                            Rectangle()
                                .foregroundStyle(Color.clear)
                                .frame(width: 30, height: 10)
                            if viewModel.allSuccessfullLaunches.isEmpty {
                                ForEach(1..<4) { _ in
                                    
                                    EmptyCardView()
                                    
                                }
                            } else {
                                ForEach(viewModel.allSuccessfullLaunches) { launch in
                                    
                                    CardView(launch: launch)
                                        .onTapGesture {
                                            selectedLaunch = launch
                                            didTapOnCard = true
                                        }
                                }
                            }
                        }
                    }
                    
                    
                    Text("The Big Launch")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                    
                    
                    HStack {
                        Text("GOLD")
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                            .foregroundStyle(Color(.white))
                            .font(.system(size: 12))
                            .kerning(4)
                            .background{
                                RoundedRectangle(cornerRadius: 25.0)
                                    .foregroundStyle(Color(.gold))
                            }
                        
                        Text("SPACE SHIPS")
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                            .foregroundStyle(colorScheme == .dark ? Color(.white) : Color(.black))
                            .font(.system(size: 12))
                            .kerning(4)
                    }
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 0))
                    
                    Image(.iss)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: UIScreen.screenSize.width, height: 180, alignment: .center)
                        .overlay {
                            VStack{
                                
                                Spacer()
                                
                                Image(.person)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gold, lineWidth: 10))
                                    .frame(width: UIScreen.screenSize.width, height: 70, alignment: .leading)
                                    .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 0))
                                    .offset(y:30)
                            }
                            
                        }
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            Text("2355")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .padding(.bottom)
                                .foregroundStyle(Color(.white))
                            
                            
                            Text("24 Feb 2022 \n 11:24GMT+5")
                                .foregroundStyle(Color(.white))
                                .font(.system(size: 13))
                            
                        }
                        
                        Spacer()
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eros enim, dictum vitae quam nec, congue feugiat neque. Vivamus ut luctus enim. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eros enim, dictum vitae quam nec, congue feugiat neque. Vivamus ut luctus enim.")
                            .font(.system(size: 12))
                            .lineSpacing(5)
                            .frame(width: UIScreen.screenSize.width * 0.6)
                            .foregroundStyle(Color(.white))
                    }
                    .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                    .frame(width: UIScreen.screenSize.width)
                    
                }

                
            }
            
        }
        .onAppear {
            viewModel.fetchLaunches()
        }
        .fullScreenCover(isPresented: $didTapOnCard, content: {
            DetailView(launch: $selectedLaunch)
        })
    }
}

#Preview {
    HomeView()
}
