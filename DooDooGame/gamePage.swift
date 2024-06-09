////
////  gamePage.swift
////  DooDooGame
////
////  Created by Raghad on 20/12/2023.
////
//
//import SwiftUI
//
//struct gamePage: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    gamePage()
//}




import SwiftUI

struct gamePage: View {//هنا عدد الصفوف و الاعمدة
    //GridItem هو نوع من أنواع SwiftUI يستخدم لتحديد خصائص العناصر داخل شبكة (Grid). يتيح لك GridItem تحديد عدة خصائص مثل حجم العنصر، والمسافة بين العناصر، وما إلى ذلك.
    

    private var threeColumnGrid = [GridItem(.flexible()),
                                //  GridItem(.flexible()),
                                   GridItem(.flexible()),
                                   GridItem(.flexible())]
    @State var cards = createCardlist().shuffled()//تكشينة الورق عشان يكون مختلف
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        GeometryReader{geo in
            VStack {
                
                Spacer()
                //                Text ("دودو")
                //                    .font (.largeTitle)
                LazyVGrid(columns: threeColumnGrid, spacing: 70){
                    ForEach(cards){card in
                        CardView(card:card, MatchedCards: $MatchedCards, UserChoices: $UserChoices, resetCardsCallback: restartGame)
                    }
                }
                
                Spacer()
                
                Button("Restart") {
                    restartGame()
                }
                .frame(width: 200, height: 70)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.bottom,60)

            }
            .accessibilityLabel(Text("Restart Button"))
            .accessibilityHint(Text("Press this button to restart the game"))

            .background(Color(uiColor: UIColor(red: 0.91, green: 0.89, blue: 0.89, alpha: 1.00)))

        }
    }
    func restartGame() {
        cards = createCardlist().shuffled()
        MatchedCards.removeAll()
        UserChoices.removeAll()
        
        if MatchedCards.count == cards.count {
            restartGame()
        }

    }

}
    
    struct gamePage_Previews: PreviewProvider {
        static var previews: some View {
            gamePage()
        }
    }

