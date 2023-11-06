//
//  DetailView.swift
//  SpaceX
//
//  Created by Karim Sakr on 31/10/2023.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    private let viewModel = DetailViewModel()
    
    @State var rocket = Rocket()
    
    @Binding var launch: Launch
    
    @State var isLoading = true
    
    @State var loadedImage: Image? = nil
    
    

    
    var body: some View {
        
        ZStack{
            
            if verticalSizeClass == .compact{
                
                
                HStack {
                    
                    AsyncImage(url: URL(string: rocket.flickrImages.first ?? "")) { image in
                        image
                            .resizable()
                            .onAppear {
                                loadedImage = image
                            }
                    } placeholder: {
                        EmptyView()
                    }
                    .ignoresSafeArea()
                    .frame(width: UIScreen.screenSize.width, height: UIScreen.screenSize.height / 2 )
                    .overlay {
                        
                        ZStack {
                            
                            Color.appBlue.opacity(0.6)
                                .ignoresSafeArea()

                            HStack{
                                
                                VStack {
                                    
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "x.square.fill")
                                            .foregroundStyle(Color.white)
                                            .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 20))
                                            .font(.system(size: 40))
                                    })
                                    Spacer()
                                }
                                Spacer()
                            }
                        
                        }

                    }

                    Spacer()
                }
                
            } else {
                VStack {
                    AsyncImage(url: URL(string: rocket.flickrImages.first ?? "")) { image in
                        image
                            .resizable()
                    } placeholder: {
                        EmptyView()
                    }
                    .ignoresSafeArea()
                    .frame(width: UIScreen.screenSize.width, height: UIScreen.screenSize.height / 2 )
                    .overlay {
                        
                        ZStack {

                            HStack{
                                Spacer()
                                VStack {
                                    
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "x.square.fill")
                                            .foregroundStyle(Color.white)
                                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
                                            .font(.system(size: 40))
                                    })
                                    Spacer()
                                }
                            }
                            
                            Color.appBlue.opacity(0.6)
                                .ignoresSafeArea()
                        }

                    }

                    Spacer()
                }
            }

            
            //MARK: - Landscape
            if verticalSizeClass == .compact {
                
                HStack {

                        HStack{
                            
                            Spacer()
                            
                            VStack(spacing: 0) {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 3, height: (UIScreen.screenSize.width/2) - 45)
                                    .foregroundStyle(Color.gold)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: 3, height: (UIScreen.screenSize.width/2) - 45)
                                    .foregroundStyle(Color.white)
                                
                            }
                        
                    }
                    
                    ZStack {
                        
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .ignoresSafeArea()
                            .frame(height: UIScreen.screenSize.height * 0.5)
                            .foregroundStyle(colorScheme == .dark ? Color(.black) : Color(.white))
                        
                        
                        if isLoading {
                            
                            ProgressView("prepare for liftoff")
                                .tint(Color.appBlue)
                            
                        } else {
                          
                            VStack(alignment:.leading) {
                                
                                HStack {
                                    Text(rocket.name)
                                        .font(.title2)
                                    Spacer()
                                    Text(String(launch.flightNumber))
                                        .font(.title2)
                                        .foregroundStyle(Color.appBlue)
                                }
                                .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
                                
                                Divider()
                                
                                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                                
                                Text(launch.dateLocal)
                                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 0))
                                
                                ScrollView(.vertical) {
                                    Text(rocket.description)
                                        .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                                        .foregroundStyle(Color.gray)
                                }
                                .frame(height: UIScreen.screenSize.width * 0.35 )
                                
                                
                                Button(action: {
                                    UIApplication.shared.open(URL(string: rocket.wikipedia)!)
                                }, label: {
                                    Text("Read More")
                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                        .font(.system(size: 20))
                                        .foregroundStyle(Color.white)
                                        .frame(width: UIScreen.screenSize.width * 0.9)
                                        .background{
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundStyle(Color.appBlue)
                                        }
                                })
                                .frame(width: UIScreen.screenSize.width)
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                                
                                Button(action: {}, label: {
                                    Text("Share")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Color.gold)
                                })
                                .frame(width: UIScreen.screenSize.width)
                                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                                
                            }
                        }
                    }
                        
                }
                
                //MARK: - Portrait
            } else {
                
                VStack {

                        VStack{
                            HStack {
                                Spacer()
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                    Image(systemName: "x.square.fill")
                                        .foregroundStyle(Color.white)
                                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
                                        .font(.system(size: 40))
                                })
                            }
                            Spacer()
                            
                            
                            Spacer()
                            
                            HStack(spacing: 0) {
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: (UIScreen.screenSize.width/2) - 45, height: 3)
                                    .foregroundStyle(Color.gold)
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .frame(width: (UIScreen.screenSize.width/2) - 45, height: 3)
                                    .foregroundStyle(Color.white)
                                
                            }
                        
                    }
                    
                    ZStack {
                        
                        
                        RoundedRectangle(cornerRadius: 25.0)
                            .ignoresSafeArea()
                            .frame(height: UIScreen.screenSize.height * 0.5)
                            .foregroundStyle(colorScheme == .dark ? Color(.black) : Color(.white))
                        
                        
                        if isLoading {
                            
                            ProgressView("prepare for liftoff")
                                .tint(Color.appBlue)
                            
                        } else {
                          
                            VStack(alignment:.leading) {
                                
                                HStack {
                                    Text(rocket.name)
                                        .font(.title2)
                                    Spacer()
                                    Text(String(launch.flightNumber))
                                        .font(.title2)
                                        .foregroundStyle(Color.appBlue)
                                }
                                .padding(EdgeInsets(top: 30, leading: 30, bottom: 0, trailing: 30))
                                
                                Divider()
                                
                                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                                
                                Text(launch.dateLocal)
                                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 0))
                                
                                ScrollView(.vertical) {
                                    Text(rocket.description)
                                        .padding(EdgeInsets(top: 10, leading: 30, bottom: 0, trailing: 30))
                                        .foregroundStyle(Color.gray)
                                }
  
                                
                                Button(action: {
                                    UIApplication.shared.open(URL(string: rocket.wikipedia)!)
                                }, label: {
                                    Text("Read More")
                                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                                        .font(.system(size: 20))
                                        .foregroundStyle(Color.white)
                                        .frame(width: UIScreen.screenSize.width * 0.9)
                                        .background{
                                            RoundedRectangle(cornerRadius: 8)
                                                .foregroundStyle(Color.appBlue)
                                        }
                                })
                                .frame(width: UIScreen.screenSize.width)
                                .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
                                
                                Button(action: {}, label: {
                                    Text("Share")
                                        .font(.system(size: 20))
                                        .foregroundStyle(Color.gold)
                                })
                                .frame(width: UIScreen.screenSize.width)
                                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                                
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchRocket(id: launch.rocket) { rocket, error in
                if error == nil {
                    guard let rocket = rocket else {
                        return
                    }
                    self.rocket = rocket
                }
                isLoading = false
            }
        }
    }
}
