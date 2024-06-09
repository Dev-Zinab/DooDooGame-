//
//  ContentView.swift
//  DooDooGame
//
//  Created by Raghad on 18/12/2023.
//



import SwiftUI
import WebKit

struct ContentView: View {
    @State private var showMainPage = false

    var body: some View {
        if showMainPage {
            MainPage()
        } else {
            

       
            ZStack {

                GeometryReader{ geo in

                    Image("dodoSplashBG")
                        .resizable()
                    /// .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: geo.size.width, height: geo.size.height ,alignment: .center)
                        .opacity(1.0)


                }
                HStack{
                    
                    
                    GifImage("dodoWalkGIFBG")
                        .scaledToFit()
                        .frame(width: 624, height: 542)
                        .padding(.leading, -2.0)
                    
                    HStack{
                        
                        Image("lamp")
                            .resizable()
                            .frame(width: 111, height: 436)
                            .padding(.leading, -650)
                       
                    } //end of small Hstack

                } //end of Big Hstack
          
                        } // end of Zstack
            
                .onAppear {
                    // Show for 5 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            self.showMainPage = true
                        }
                    }
                }
            
        }
           

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


