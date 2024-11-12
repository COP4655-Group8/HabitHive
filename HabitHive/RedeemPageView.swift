//
//  RedeemPageView.swift
//  HabitHive
//
//  Created by Chrisopher Franco on 10/31/24.
//
import SwiftUI

struct GiftCard: Identifiable {
    let id = UUID()
    let name: String
    let pointCost: Int
    let imageName: String
}

struct RedeemCardView: View {
    @State private var userPoints: Int = 500
    @State private var showPopup = false
    @State private var selectedGiftCard: GiftCard? = nil

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
                                        .background(Color.blue)
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
                
                // Pop-Up Overlay
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
            }
        }
    }
    
    private func redeemGiftCard(_ card: GiftCard) {
        if userPoints >= card.pointCost {
            userPoints -= card.pointCost
            print("\(card.name) redeemed!")
        } else {
            print("Not enough points to redeem \(card.name)")
        }
    }
}

struct RedeemCardView_Previews: PreviewProvider {
    static var previews: some View {
        RedeemCardView()
    }
}
