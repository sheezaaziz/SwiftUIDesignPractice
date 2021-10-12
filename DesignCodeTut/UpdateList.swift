//
//  UpdateList.swift
//  DesignCodeTut
//
//  Created by Sheeza Aziz on 2021-10-08.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(Update(image: "Card1", title: "New item", text: "text", date: "Jan 1"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    store.updates.remove(at: index.first!)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle(Text("Updates"))
            .navigationBarItems(leading: Button(action: addUpdate) {
                Text("Add Update")
            }, trailing: EditButton())
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI", text: "Learn how to create views using SwiftUI", date: "Jan 1"),
    Update(image: "Card2", title: "SwiftUI Advanced", text: "Learn advanced SwiftUI concepts", date: "Jan 20"),
    Update(image: "Card3", title: "React", text: "Learn how to create webpages using Reactjs", date: "Feb 16"),
    Update(image: "Card4", title: "React Hooks", text: "Learn all about React Hooks using React", date: "Mar 7"),
    Update(image: "Card5", title: "Figma", text: "Learn how to use Figma for designers", date: "Apr 1"),
]
