//
//  ContentView.swift
//  MylaunchScreen
//
//  Created by Admin on 4/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var animate = false
    @State var endSplash = false
    var body: some View {
        ZStack {
            LoginView()
            ZStack{
                Color("bg")
                VStack{
                    Image("aba").resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: animate ? nil : 100, height: animate ? nil :100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .scaleEffect(animate ? 3 : 1)
                        .frame(width: UIScreen.main.bounds.width)
                    Text("Customer Financing Made EASY ™").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("The Financial Win-Win for Business Owners & Customers")
                        .font(.system(size: 11))
                    
                }.foregroundColor(.white)
              
                
            }
            .ignoresSafeArea()
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
        
    }
    
    func animateSplash()  {
        DispatchQueue.main.asyncAfter(deadline:.now() + 1){
            withAnimation(Animation.easeOut(duration:1)){
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 1)){
                endSplash.toggle()
            }
        }
        
    }
}


struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
  
    
    var body: some View {
       
        
        NavigationView{
            ZStack {
                Color("bg")
                    .ignoresSafeArea()
                VStack{
                    Image("instagramLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width:220,height: 100)
                        .foregroundColor(.white)
                    
                    VStack(spacing:20){
                        CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal,32)
                        
                        CustomSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal,32)
                    }
                    HStack{
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Forgot Password")
                        })
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.top)
                        .padding(.trailing,28)
                    }
                    Button(action: {
                      
                    }, label: {
                        Text("Sign in").foregroundColor(.black)
                    })
                    .font(.headline)
                    .frame(width: 360, height: 50)
                    .foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                    .cornerRadius(10)
                    .padding()
                    
                    Spacer()
                    
//                    Text("Don't have an account? ")
//                        .font(.system(size: 14))
//                        + Text("Sign Up")
//                        .font(.system(size: 14, weight: .bold))
//                    .foregroundColor(.white)
                   
                
                
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
