import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    @State private var isEditing: Bool = false
    @State private var editedTitle: String = ""
    @FocusState private var textFieldFocus: Bool
    
    var body: some View {
        HStack {
            VStack {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(item.isCompleted ? .green : .red)
            }
            
            if isEditing {
                TextField("Edit title", text: $editedTitle, onCommit: {
                    saveEditedTitle()
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onAppear {
                    editedTitle = item.title
                }
                .focused($textFieldFocus)
            } else {
                Text(item.title)
                    .onTapGesture {
                        isEditing = true
                        textFieldFocus = true
                    }
            }
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 9)
    }
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    func saveEditedTitle() {
        if !editedTitle.isEmpty {
            listViewModel.updateItemTitle(item: item, newTitle: editedTitle)
        }
        isEditing = false
    }
}

