////
////  CardView.swift
////  DooDooGame
////
////  Created by Raghad on 25/12/2023.
////
//
//import SwiftUI
//
//struct CardView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    CardView()
//}


//
//  CardView.swift
//  MatchingCard
//
//  Created by Zinab Zooba on 04/06/1445 AH.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card:Card = createCardlist().first!
    let width:Int = 300
    let hight:Int = 200
    @Binding var MatchedCards:[Card]
    @Binding var UserChoices :[Card]
    var resetCardsCallback: () -> Void

    
    
    var body: some View {
        
        
        // Display content based on the state of the card

        
        if card.isFaceUp || MatchedCards.contains(where:{$0.id == card.id}){
            // Display when the card is face up or already matched

            Text(card.text)
                .font(.system(size: 100))//هنا اكبر حجم الصور الرمزية
                .padding()
                .frame (width:CGFloat(width), height: CGFloat(hight))
                .background(Color(red:1, green: 0.7450980392156863,blue: 0.5294117647058824))
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius:10)
                        .stroke(Color(red: 0.36470588235294116, green: 0.2196078431372549, blue: 0.5686274509803921), lineWidth: 5) //حدود الصورة لمن تنفتح
                )
        }
        else
        {
            // Display when the card is face down

            Image ("cardBG")
                .font (.system(size: 50))
                . padding()
                .frame (width: CGFloat (width), height:
                            CGFloat (hight))
                .background (Color(red: 0.36470588235294116, green: 0.2196078431372549, blue:
                                    0.5686274509803921))
                .cornerRadius (10)
//                .overlay(
//                    RoundedRectangle (cornerRadius: 10)
//                        .stroke (Color(red: 0.36470588235294116, green: 0.2196078431372549, blue:
//                                        0.5686274509803921), lineWidth: 5)
//                )
                .onTapGesture {
                    // Handle tap gesture on the face-down card

                    if UserChoices.count == 0 {//يعني لسا ماختار شي
                        card.turnOver()
                        UserChoices.append (card)
                    } else if UserChoices.count == 1 {//المستخدم لو كان مختار كرد
                        card.turnOver()
                        UserChoices.append (card)
                        withAnimation(Animation.linear.delay (0.5)){
                            for thisCard in UserChoices {
                                thisCard.turnOver()

                            }
                        }
                        checkForMatch()
//                        if MatchedCards.count == card.text.count {
//                                            resetCardsCallback()
//                                        }


                        
                    }
                    
                }
                .accessibility(label: Text("Face-down card"))
                .accessibility(hint: Text("Double-tap to flip the card and reveal its content"))
                .accessibility(addTraits: .isButton)
//                .sensoryFeedback(.error, trigger: !MatchedCards)
        }
        
 }
    
    
    func checkForMatch(){
    if UserChoices[0].text == UserChoices[1].text {
        // If the text content of the two chosen cards is the same

    MatchedCards.append(UserChoices[0])//MatchedCardsعبارة عن مصفوفة اضيف لها الكروت المتشابه يا عسل
    MatchedCards.append(UserChoices[1])
    
    }
        //This is done to reset the user's choices for the next turn.
        UserChoices.removeAll()
        
    }

        
}

