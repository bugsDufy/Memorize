//
//  ContentView.swift
//  Memorize
//
//  Created by Murat Gules on 24.10.2023.
//

import SwiftUI

struct ContentView: View {
    
  //  let emojis: Array<String> = ["👻","🎃","🕷️","👿"] // ikisi de ayni
  //  let emojis: [String] = ["👻","🎃","🕷️","👿"] // tabiki asagida ki kullanim daha sade
    let emojis = ["👻","🎃","🕷️","👿"]
    
    var body: some View {
        
        HStack {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
                
                
            }
            
//            CardView(content: emojis[0], isFaceUp: true)
//            CardView(content: emojis[1])
//            CardView(content: emojis[2])
//            CardView(content: emojis[3])
//           // TapGestureExample()
        }
        .padding()
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    let content: String
   // var isFaceUp: Bool = false
   @State var isFaceUp = false
    /// burada ki bu @state ozelligi swiftUI da gorunumu icinde tutar ve
    ///  ve otomatik olarak verilerde bir degisiklik olursa onu aninda ekrana
    ///  yansitma isini yapar.
    
    var body: some View {
        ZStack {
          //  let base : RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            // genel de asagidaki gibi yapiliyormus daha iyi bir okuma sagladigi soyleniyor
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                // Rectangle() koseleri yuvarlatilmis bir dikdortgen kullanicam
                base.fill(.white)
                base.stroke(lineWidth: 2) // bir sinir olusturmak icin stroke kullandim
                Text(content).font(.largeTitle)
            }else{
                base // .foregroundColor(.white)
            }
        }.onTapGesture {
            print("tapped")
            //  isFaceUp = !isFaceUp
            
            // 26:03'te kaldim
            // baska bir kullanimi
            
            isFaceUp.toggle()
            
        }
    }
    
}

struct TapGestureExample: View {
    let colors: [Color] = [.gray, .red, .orange, .yellow,
                           .green, .blue, .purple, .pink]
    @State private var fgColor: Color = .gray
    
    
    /// burada ki yapiya dikkatle bakarsan eger bir image dosyasina colors adli biz renk dizisi foreground olarak
    /// veriliyor ve randomelement() calistiriliyor  yani anlayacagin resime her dokunuldugunda resimdeki renk
    /// degistiriliyor...
    /// yukari da da kullanacagimiz tapGesture bunun icin var. yani dokunuldugunda bir sey yap diyoruz ne yapacagini
    /// tabi ki biz belirleyecegiz.


    var body: some View {
        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 200, height: 200)
            .foregroundColor(fgColor)
            .onTapGesture(count: 2) { // kac kere dokunulacagini belirledigimiz
                fgColor = colors.randomElement()!
            }
    }
}


/// bu asagida kulllanilar kodlar chatCPT tarafindan yazilidi
/// ve sadece @state durumunu anlatmak icin varlar.
/// 

struct StateView: View {
    // @State ile işaretlenmiş bir değişken
    @State private var counter = 0
    
    var body: some View {
        VStack {
            Text("Counter: \(counter)") // Counter değerini ekranda gösterir
            
            // Button, tıklandığında counter değerini artırır
            Button(action: {
                self.counter += 1
            }) {
                Text("Increase Counter")
            }
        }
    }
}













#Preview {
    ContentView()
}
