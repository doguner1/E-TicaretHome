//
//  ContentView.swift
//  E-TicaretHome
//
//  Created by Doğu GNR on 31.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ETabView().navigationBarTitle("",displayMode: .inline)
                .navigationBarHidden(true)
        }
    }
}

struct Mobilya : Identifiable,Hashable{
    var id : Int
    var goruntu : String
    var baslık : String
    var ucret : String
}

var mobilya = [
    [
    Mobilya(id: 0, goruntu: "m11", baslık: "Tahta Çerçeve", ucret: "1200"),
    Mobilya(id: 1, goruntu: "m12", baslık: "Sarı Tekli Koltuk", ucret: "600")
    ],
    [
    Mobilya(id: 2, goruntu: "m21", baslık: "Modern Koltuk", ucret: "240"),
    Mobilya(id: 3, goruntu: "m22", baslık: "IKEA Ingolf", ucret: "1500")
    ],
    [
    Mobilya(id: 4, goruntu: "m31", baslık: "Sarı Uçak", ucret: "2200"),
    Mobilya(id: 5, goruntu: "m32", baslık: "IKEA Poang", ucret: "1650")
    ]
]

struct EHome : View {
    @Environment(\.colorScheme) var sema
    @State var ara = ""
    
    var body: some View{
        VStack{
            ZStack{
                
                HStack(spacing: 15){
                    Button{} label: { Image("menu").foregroundColor(.primary)}
                    Spacer()
                    Button{} label: { Image("qr").foregroundColor(.primary)}
                    Button(action: {
                        UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = self.sema == .dark ? .light : .dark
                    }, label: {
                        Image(systemName: self.sema == .dark ? "sun.max.fill" : "moon.fill")
                            .font(.system(size: 22)).foregroundColor(.primary)
                    })
                    
                }//Üst Bar Alanı
                
                Text("Mobilyalar").font(.title).fontWeight(.bold)
                
                
            }.padding()
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                    HStack(spacing:15){
                        TextField("İstediğin ürünü ara", text: self.$ara)
                        if self.ara != "" {
                            Button{} label: {
                                Image(systemName: "magnifyingglass").foregroundColor(.primary)}
                        }
                    }//Arama Çubuğu ve özellikleri
                    .padding(.vertical,10).padding(.horizontal).background(Color.primary.opacity(0.06)).cornerRadius(12)
                    
                    
                    HStack {
                        Text("Günün Seçilenleri").fontWeight(.bold).font(.title)
                        Spacer()
                    }.padding(.top ,22)
                    
                    VStack{
                        Image("anaUrun")
                        Text("Tekli Koltuk").fontWeight(.bold)
                        Text("1200₺")
                    }//Ana ürün ve özellikleri
                    .background(Color.primary.opacity(0.06).frame(width: UIScreen.main.bounds.width - 30).cornerRadius(25).padding(.top,95))
                    
                    HStack{
                        Text("Tavsiye Edilenler").fontWeight(.bold).font(.title)
                        Spacer()
                    }.padding(.top,20).padding(.bottom,20)
                    
                    //Mobilyalar
                    ForEach(mobilya,id:\.self){ ikiliMobilya in
                        HStack(spacing:15){
                            ForEach(ikiliMobilya, id:\.self){ m1 in
                                VStack{
                                    Image(m1.goruntu)
                                    Text(m1.baslık).fontWeight(.bold)
                                    Text(m1.ucret).padding(.top,6)
                                }.padding().background(Color.primary.opacity(0.06)).cornerRadius(20)
                            }
                        }
                    }
                    
                }.padding()
            }//ScrollView Sonu
            Spacer()
        }
    }
}

struct Arama : View {
    var body: some View{
        VStack{ Text("Arama Dolacak")}.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct Sepet : View {
    var body: some View{
        VStack{ Text("Sepet Dolacak")}.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct Hesap : View {
    var body: some View{
        VStack{ Text("Hesap Dolacak")}.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

struct ETabView : View {
    @State var index = 0
    @Environment(\.colorScheme) var sema
    var body: some View {
        VStack(spacing : 0){
            ZStack{
                EHome().opacity(self.index == 0 ? 1 : 0)
                Arama().opacity(self.index == 1 ? 1 : 0)
                Sepet().opacity(self.index == 2 ? 1 : 0)
                Hesap().opacity(self.index == 3 ? 1 : 0)
            }
            HStack{
                //1.Button
                Button(action :{self.index = 0} ) {
                    HStack(spacing:6){
                        Image("ana").foregroundColor(self.index == 0 ? .white : .primary)
                        
                        
                        if self.index == 0 { 
                            Text("Ana Sayfa").foregroundColor(.white)}
                    }
                    .padding(.vertical,10).padding(.horizontal).background(self.index == 0 ? Color("Renk") : Color.clear).clipShape(Capsule())
                }
                Spacer()
                
                //2.Button
                Button(action :{self.index = 1} ) {
                    HStack(spacing:6){
                        Image("ara").foregroundColor(self.index == 1 ? .white : .primary)
                        
                        if self.index == 1 { Text("Ara").foregroundColor(.white)}
                    }.padding(.vertical,10).padding(.horizontal).background(self.index == 1 ? Color("Renk") : Color.clear).clipShape(Capsule())
                }
                Spacer()
                
                //3.Button
                Button(action :{self.index = 2} ) {
                    HStack(spacing:6){
                        Image("sepet").foregroundColor(self.index == 2 ? .white : .primary)
                        
                        if self.index == 2 { Text("Sepet").foregroundColor(.white)}
                    }.padding(.vertical,10).padding(.horizontal).background(self.index == 2 ? Color("Renk") : Color.clear).clipShape(Capsule())
                }
                Spacer()
                
                //4.Button
                Button(action :{self.index = 3} ) {
                    HStack(spacing:6){
                        Image("hesap").foregroundColor(self.index == 3 ? .white : .primary)
                        
                        if self.index == 3 { Text("Hesap").foregroundColor(.white)}
                    }.padding(.vertical,10).padding(.horizontal).background(self.index == 3 ? Color("Renk") : Color.clear).clipShape(Capsule())
                }
                
            }//HStack
            .padding(.horizontal,25).padding(.top)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 10 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            .background(self.sema == .dark ? Color.black : Color.white)
            //gölge
            .shadow(color: Color.primary.opacity(0.08), radius: 5, x:5,y:-5)
            
        }.edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
