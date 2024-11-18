//
//  AchievementsView.swift
//  HabitHive
//
//  Created by Alejandro Martinez on 10/30/24.
//

import SwiftUI

struct AchievementsView: View {
    
    @State private var showDay1Alert = false
    @State private var showDay7Alert = false
    @State private var showDay31Alert = false
    
    @State private var show100PointsAlert = false
    @State private var show500PointsAlert = false
    @State private var show1000PointsAlert = false





    var body: some View {
        
        ZStack{
            
            
            VStack{
                Text("Achievements")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .padding(.top, 15)
                
                Divider()
                    .frame(height: 4) // Adjust thickness
                    .background(Color.black) // Adjust color
                
                Spacer()
                
                
                HStack {
                    
                    
                    VStack{
                        
                        VStack{
                            Text("Day 1")
                                .font(.system(size: 25))
                                .padding(.bottom)
                            
                            Button{
                                
                                showDay1Alert = true
                                
                            }
                        label: {
                            Image("Day1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120)
                        }
                        .alert(isPresented: $showDay1Alert){
                            
                            Alert(
                                title: Text("Day 1 Log-In"),
                                message: Text("Log-in for the first time for this achievemnt"),
                                dismissButton: .default(Text("OK"))
                            )
                            
                            }
                            
                            Spacer()
                        }
                        
                        
                        Spacer()
                        
                        Divider()
                            .frame(height: 3) // Adjust thickness
                            .background(Color.black) // Adjust color
                        
                        Spacer()
                        
                        
                        //=======================================================
                        //      Day 7
                        
                        
                        VStack{
                            Text("First Week")
                                .font(.system(size: 25))
                                .padding(.bottom)
                            
                            Button{
                                
                                showDay7Alert = true
                                
                            }
                            label: {
                                Image("Day7")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120)
                            }
                            .alert(isPresented: $showDay7Alert){
                            
                                Alert(
                                    title: Text("Day 7 Log-In"),
                                    message: Text("Log-in for 7 days"),
                                    dismissButton: .default(Text("OK"))
                            )
                            
                        }
                            
                            Spacer()
                            
                    }
                        
                        
                        
                        
                            
                            
                            
                        Spacer()
                            
                        Divider()
                            .frame(height: 3) // Adjust thickness
                            .background(Color.black) // Adjust color
                            
                        Spacer()
                        
                        
                        VStack{
                            Text("First Month")
                                .font(.system(size: 25))
                                .padding(.bottom)
                            
                            Button{
                                
                                showDay31Alert = true
                                
                            }
                            label: {
                                Image("Day31")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120)
                            }
                            .alert(isPresented: $showDay31Alert){
                            
                                Alert(
                                    title: Text("Day 31 Log-In"),
                                    message: Text("Log-in for 31 days"),
                                    dismissButton: .default(Text("OK"))
                            )
                            
                        }
                            
                            Spacer()
                            
                    }
                        
                        
                        
                        //Divider()
                        //    .frame(height: 3) // Adjust thickness
                        //    .background(Color.black) // Adjust color
                            
                       // Spacer()
                        
                        
                        
                            
                        //Text("bottom left")
                          //      .padding()
                            
                        //Spacer()
                        
                            
                            
                        
                    
                        
                        
                        
                            .padding()
                        
                        Spacer()
                        
                        
                        
                    }
                    
                    Spacer() // Push the divider to start at the horizontal divider
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 3) // Thickness of the vertical divider
                        //.padding(.top, 10) // Align with the horizontal divider
                        //.padding(.horizontal, 20) // Add some padding on the sides if needed
                    
                    //Spacer()
                    
                    VStack{
                        
                        
                        
                        
                            
                            VStack{
                                Text("100 Points")
                                    .font(.system(size: 25))
                                    .padding(.bottom)
                                
                                Button{
                                    
                                    show100PointsAlert = true
                                    
                                }
                            label: {
                                Image("100points")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120)
                            }
                            .alert(isPresented: $show100PointsAlert){
                                
                                Alert(
                                    title: Text("100 Points Collected"),
                                    message: Text("Collect your first 100 points for this achievemnt"),
                                    dismissButton: .default(Text("OK"))
                                )
                                
                                }
                                
                                Spacer()
                            }
                            
                            
                            Spacer()
                            
                            Divider()
                                .frame(height: 3) // Adjust thickness
                                .background(Color.black) // Adjust color
                            
                            Spacer()
                            
                            
                            //=======================================================
                            //      Day 7
                            
                            
                            VStack{
                                Text("500 Points")
                                    .font(.system(size: 25))
                                    .padding(.bottom)
                                
                                Button{
                                    
                                    show500PointsAlert = true
                                    
                                }
                                label: {
                                    Image("500points")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120)
                                }
                                .alert(isPresented: $show500PointsAlert){
                                
                                    Alert(
                                        title: Text("500 Points Collected"),
                                        message: Text("Collect a total of 500 points for this achievemnt"),
                                        dismissButton: .default(Text("OK"))
                                )
                                
                            }
                                
                                Spacer()
                                
                        }
                            
                            
                            
                            
                                
                                
                                
                            Spacer()
                                
                            Divider()
                                .frame(height: 3) // Adjust thickness
                                .background(Color.black) // Adjust color
                                
                            Spacer()
                            
                            
                            VStack{
                                Text("1000 Points")
                                    .font(.system(size: 25))
                                    .padding(.bottom)
                                
                                Button{
                                    
                                    show1000PointsAlert = true
                                    
                                }
                                label: {
                                    Image("1000points")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120)
                                }
                                .alert(isPresented: $show1000PointsAlert){
                                
                                    Alert(
                                        title: Text("1000 Points Collected"),
                                        message: Text("Collect a total of 1000 points for this achievemnt"),
                                        dismissButton: .default(Text("OK"))
                                )
                                
                            }
                                
                                Spacer()
                                
                        }
                            
                            
                            
                            //Divider()
                            //    .frame(height: 3) // Adjust thickness
                            //    .background(Color.black) // Adjust color
                                
                           // Spacer()
                            
                            
                            
                                
                            //Text("bottom left")
                              //      .padding()
                                
                            //Spacer()
                            
                                
                                
                            
                        
                            
                            
                            
                                .padding()
                            
                            Spacer()
                            
                            
                            
                        
                        
                        
                        
                        
                        //Text("top right")
                            //.padding()
                        
                        //Divider()
                            //.frame(height: 3) // Adjust thickness
                            //.background(Color.black) // Adjust color
                        
                        
                        
                        
                        
                        
                        //Text("bottom right")
                        
                        
                        
                        
                            //.padding()
                        
                        
                        
                        
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
            
        }
    }
}

#Preview {
    AchievementsView()
}
