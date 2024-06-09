//////
//////  MainPage.swift
//////  DooDooGame
//////
//////  Created by Raghad on 19/12/2023.
//////
////
//
//
//import SwiftUI
//
//struct MainPage: View {
//    @State private var isGamePagePresented = false
//
//    var body: some View {
//        
////        NavigationLink {
////            gamePage()
////        }label: {
//            VStack {
//                Spacer()
//                Spacer()
//                Spacer()
//                
//                Button("Play") {
//                    isGamePagePresented.toggle()
//                }
//                .padding()
//                .frame(width: 200, height: 60) // Adjust the frame size as needed
//                .background(Color.purple)
//                .foregroundColor(.white)
//                .cornerRadius(10)
//                .font(.title)
//                .sheet(isPresented: $isGamePagePresented) {
//                    gamePage()
//                }
//                
//                Spacer()
//            }
//        }
//    //}
//}
//
//struct MainPage_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPage()
//    }
//}

//
//  MainPage.swift
//  AutiZone1
//
//  Created by Raghad on 28/11/2023.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationStack{
            
                   ZStack {
                       Image( "dodoSplashBG")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .edgesIgnoringSafeArea(.all)
                       
                       GifImage("dodoDanceNoBG")
                           .scaledToFit()
                           .frame(width: 624, height: 542)
                           .padding(.leading, -2.0)
                      
                       
                       VStack{
                           Spacer()
                       
                    
                           HStack{
                               NavigationLink {
                                   gamePage()
                               } label: {
                                   ZStack{
                                       
                                       RoundedRectangle(cornerRadius:30).foregroundColor(Color("purple") )
                                           .frame(width: 250, height: 100)
                                       
                                       
                                       Text("Play")
                                           .accessibilityLabel("Play")
                                           .font(.custom("Helvetica Neue", size: 40))
                                           .fontWeight(.bold)
                                           .foregroundColor(.white)
                                       
                                   }
                               
                                   
                               }
                               
                               
                               }
                           
//                           .accessibilityLabel(Text("Play Button"))
//                           .accessibilityHint(Text("Press this button to start the game"))
                              
                               
                           
                           .padding(.top,500)
                           Spacer()
                        
                       }
                       .padding(.horizontal, 200)
                   }
                            

                }
    }
}

#Preview {
    MainPage()
}
