//
//  ContentView.swift
//  swiftuitest
//
//  Created by Renat on 05/06/2019.
//  Copyright © 2019 softeam. All rights reserved.
//

import SwiftUI

struct ContentView : View {
 
    @State var statusString : String = "World Time"
    @State var isTimeLoaded : Bool = false
    
    var body: some View {
        NavigationView {           
                VStack {
                    if isTimeLoaded {
                       addNavigationButton()    
                    }
                    Text(statusString).font(.system(size: 30)).lineLimit(nil)                              
                }.navigationBarTitle(Text("World Time"), displayMode: .inline)
            }.onAppear { 
                self.loadTime()
            }        
    }
    
    func addNavigationButton() -> some View {
        return NavigationLink(destination: Text("This is detailed screen")) {
            Text("Go Detail")
        }      
    }
    
    func loadTime(){        
        NetworkService().getTime { (time) in
            if let aTime = time {
                self.statusString = "\(aTime.date().description(with: Locale.current))"
                self.isTimeLoaded = true
            }
        }
    }
}

struct DetailView : View {
    
    var timeString : String
    
    var body : some View {
        Text(timeString).font(.system(size: 40)).lineLimit(nil)
    }
}
