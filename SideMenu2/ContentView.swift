//
//  ContentView.swift
//  SideMenu2
//
//  Created by usuario on 04-08-21.
//

import SwiftUI


struct MenuItem: Identifiable {
    var id = UUID()
    let text: String
}


struct MenuContent: View {
    let items: [MenuItem] = [
        MenuItem(text: "Inicio"),
        MenuItem(text: "Configuracion"),
        MenuItem(text: "Perfil"),
        MenuItem(text: "Actividad")
        
    ]
    var body: some View {
        ZStack {
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))
            VStack(alignment: .leading, spacing: 0) {
                ForEach(items) { item in
                    HStack {
                        Text(item.text)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(.top, 20)
                        
                    }
                }
                Spacer()
            }
            .onTapGesture {
               print("hello world")
            }
            .padding(.top, 25)
            Divider()
            
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
                
            }
            .background(Color.gray.opacity(0.15))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.2))
            .onTapGesture {
                self.toggleMenu()
            }
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                Spacer()
            }
            
        }
    }
}

struct ContentView: View {
    @State var menuOpened = false
    var body: some View {
        ZStack {
            if !menuOpened {
                Button(action: {
                    // Open Menu
                    self.menuOpened.toggle()
                }, label: {
                    Text("Abrir Menu")
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                })
            }
            SideMenu(width: UIScreen.main.bounds.width / 1.8, menuOpened: menuOpened, toggleMenu: toggleMenu)
    
        }.edgesIgnoringSafeArea(.all)
    }
    func toggleMenu() {
        menuOpened.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
