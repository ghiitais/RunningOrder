//
//  SearchBarView.swift
//  RunningOrder
//
//  Created by Ghita Laoud on 21/03/2021.
//  Copyright © 2021 Worldline. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var inputText: String
    @State private var isFocused = false
    @EnvironmentObject var searchManager: SearchManager

    var body: some View {
        HStack {
            TextField("Search story", text: $inputText) { editing in
                isFocused = editing
                if editing {
                    searchManager.selectedSearchItem = nil
                }
            }
            .overlay(
                HStack {
//                    Image(systemName: "magnifyingglass")
//                        .foregroundColor(.gray)
//                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 8)
                    Spacer()
                    if inputText.count > 0 {
                        Button(action: {
                            self.inputText = ""
                            searchManager.selectedSearchItem = nil
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.horizontal, 8)

                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            )
            .frame(width: 300)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .popover(isPresented: Binding(get: { isFocused && (searchManager.selectedSearchItem == nil)},
                                      set: { _ in})) {
            SearchBarSuggestions(searchText: $inputText)
        }

        //        HStack(alignment: .center, spacing: 0) {
        //            Image(systemName: "magnifyingglass")
        //            TextField("Search test",
        //                      text: $inputText)
        //                .padding(.horizontal)
        //            if !inputText.isEmpty {
        //                Button(action: {
        //                    self.inputText = ""
        //                }, label: {
        //                    Image(systemName: "multiply.circle.fill")
        //                        .foregroundColor(.gray)
        //                        .padding(.horizontal, 8)
        //
        //                })
        //                .buttonStyle(BorderlessButtonStyle())
        //                .animation(.easeInOut)
        //            }
        //        }
        //        .padding(4)
        //        .background(Color(identifier: .snowbank))
        //        .cornerRadius(12)
    }
}
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(inputText: .constant(""))
    }
}