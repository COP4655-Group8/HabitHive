//
//  ShopView.swift
//  HabitHive
//
//  Created by Chrisopher Franco on 11/12/24.
//
import SwiftUI

struct GiftCard: Identifiable {
    let id = UUID()
    let name: String
    let pointCost: Int
    let imageName: String
}

struct ShopView: View {
    @State private var userPoints: Int = 500
    @State private var showPopup = false
    @State private var showRedeemedPopup = false
    @State private var selectedGiftCard: GiftCard? = nil
    @State private var redeemedCards: [GiftCard] = []
    @State private var showRedemptionCodePopup = false
    @State private var redemptionCode: String = ""
    @State private var showCopyAlert = false

    let giftCards = [
        GiftCard(name: "Amazon Gift Card", pointCost: 300, imageName: "amazon_gift_card"),
        GiftCard(name: "Starbucks Gift Card", pointCost: 200, imageName: "starbucks_gift_card"),
        GiftCard(name: "Target Gift Card", pointCost: 500, imageName: "target_gift_card"),
        GiftCard(name: "Apple Gift Card", pointCost: 700, imageName: "apple_gift_card")
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Your Points: \(userPoints)")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        showRedeemedPopup = true
                    }) {
                        Text("View Redeemed Cards")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                            .padding(.bottom)
                    }

                    List(giftCards) { card in
                        HStack {
                            Image(card.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading) {
                                Text(card.name)
                                    .font(.headline)
                                Text("Cost: \(card.pointCost) points")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            if userPoints >= card.pointCost {
                                Button(action: {
                                    selectedGiftCard = card
                                    showPopup = true
                                }) {
                                    Text("Redeem")
                                        .foregroundColor(.white)
                                        .padding(.horizontal)
                                        .padding(.vertical, 6)
                                        .background(Color.green)
                                        .cornerRadius(8)
                                }
                            } else {
                                Text("Insufficient Points")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .navigationTitle("Redeem Gift Cards")
                
                // Gift Card Redeem Pop-Up
                if showPopup, let giftCard = selectedGiftCard {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showPopup = false
                        }

                    VStack {
                        Image(giftCard.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                        
                        Text(giftCard.name)
                            .font(.title)
                            .padding(.top, 10)
                        
                        Text("Cost: \(giftCard.pointCost) points")
                            .font(.headline)
                            .padding(.bottom, 20)
                        
                        Button(action: {
                            redeemGiftCard(giftCard)
                            showPopup = false
                        }) {
                            Text("Confirm Redeem")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                    .frame(width: 300, height: 400)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                }
                
                // Redeemed Cards Pop-Up
                if showRedeemedPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showRedeemedPopup = false
                        }

                    VStack {
                        Text("Redeemed Gift Cards")
                            .font(.title)
                            .padding()
                        
                        if redeemedCards.isEmpty {
                            Text("No gift cards redeemed yet.")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            List(redeemedCards) { card in
                                HStack {
                                    Image(card.imageName)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)
                                    
                                    Text(card.name)
                                        .font(.headline)
                                    
                                    Spacer()
                                }
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    generateRedemptionCode()
                                    showRedemptionCodePopup = true
                                }
                            }
                            .frame(height: 200) // Limit the height of the list
                        }
                        
                        Button(action: {
                            showRedeemedPopup = false
                        }) {
                            Text("Close")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .bold()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                    .frame(width: 300, height: 400)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                }
                
                // Redemption Code Pop-Up
                if showRedemptionCodePopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showRedemptionCodePopup = false
                        }

                    VStack {
                        Text("Redemption Code")
                            .font(.title)
                            .padding(.bottom, 10)
                        
                        HStack {
                            Text(redemptionCode)
                                .font(.headline)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                            
                            Button(action: {
                                UIPasteboard.general.string = redemptionCode
                                showCopyAlert = true
                            }) {
                                Image(systemName: "doc.on.doc") //copy
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding()
                                    .foregroundColor(.black)
                            }
                        }
                        
                        Button(action: {
                            showRedemptionCodePopup = false
                        }) {
                            Text("Close")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                }
                
                // Copy Alert
                if showCopyAlert {
                    VStack {
                        Text("Code copied to clipboard!")
                            .font(.headline)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }
                    .transition(.opacity)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            showCopyAlert = false
                        }
                    }
                }
            }
        }
    }
    
    private func redeemGiftCard(_ card: GiftCard) {
        if userPoints >= card.pointCost {
            userPoints -= card.pointCost
            redeemedCards.append(card) // Add the card to redeemed list
            print("\(card.name) redeemed!")
        } else {
            print("Not enough points to redeem \(card.name)")
        }
    }

    private func generateRedemptionCode() {
        let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        redemptionCode = String((0..<10).map { _ in characters.randomElement()! })
    }
}

struct Shop_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}

