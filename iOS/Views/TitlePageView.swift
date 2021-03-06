//
//  TitlePageView.swift
//  ICS4U-Culminating
//
//  Created by Moritz Asche on 2022-05-30.
//

import SwiftUI

struct TitlePageView: View {
    
    // MARK: Stored properties (store things)
    
    // What page are we on
    @State var activeNode = 0
    
    // Ending Counter
    @State var endCount = 0
    
    // MARK: Computed properties (tell us things or show us things)
    
    // Wheter the game is being played or not
    var gameIsOn: Bool {
        // Returns true when the game is being played
        //          CONDITION
        return activeNode > 0
    }
    
    // The currently active actual node
    var currentNode: Node {
        // Return the active node
        // If we cannot do so, return an empty node
        // (we use the nil coalescing opeerator ?? to do this)
        return storyNodes[activeNode] ?? emptyNode
    }
    
    var body: some View {
        
        if gameIsOn == false {
            
            // Welcome screen
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.yellow, .purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Text("THE BIG ESCAPE")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                    
                    
                    
                    
                    Text("You will try escaping a prison by \n making your own decisions")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    
                    
                    Image("prison1")
                        .resizable()
                        .padding(.all)
                        .scaledToFit()
                    
                    
                    if endCount == 0 {
                        
                        Text("\(endCount) endings discovered out of 12")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                    } else if  endCount == 1 {
                        
                        Text("\(endCount) ending discovered out of 12")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                    } else if endCount >= 2  {
                        
                        Text("\(endCount) endings discovered out of 12")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                        
                        
                        
                        
                        
                    }}
                .onTapGesture {
                    startGame()
                }
                
                
                
            }
            
            
            
            
        } else {
            
            // Game is being played
            // Show the node
            NodeView(node: currentNode,
                     activeNode: $activeNode, endCount: $endCount)
            .ignoresSafeArea()
        }
    }
    
    // MARK: Functions (Do things)
    
    func startGame() {
        // NOTE: We can set this to whatever we want for debugging later on
        activeNode = 1
    }
    
}

struct TitlePageView_Previews: PreviewProvider {
    static var previews: some View {
        TitlePageView()
    }
}
