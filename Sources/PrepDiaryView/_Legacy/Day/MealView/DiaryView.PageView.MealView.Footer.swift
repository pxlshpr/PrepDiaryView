import SwiftUI
import SwiftHaptics
import PrepDataTypes

extension DiaryView.ListPage.MealView {
    struct Footer: View {
        @EnvironmentObject var diaryController: DiaryView.Controller
        
        //TODO: CoreData
//        @ObservedObject var meal: Meal
        var meal: Meal
    }
}

extension DiaryView.ListPage.MealView.Footer {
    var body: some View {
        content
        .listRowBackground(
            ListRowBackground(
                includeTopSeparator: true
            )
        )
        .listRowInsets(.none)
        .listRowSeparator(.hidden)
    }
    
    var content: some View {
        HStack(spacing: 0) {
            if !meal.isCompleted {
                addFoodButton
            }
            Spacer()
            energyButton
        }
    }
    
    var addFoodButton: some View {
        Button {
            tappedAddFood()
        } label: {
            Text("Add Food")
        }
        .contentShape(Rectangle())
        .padding(.trailing)
        .buttonStyle(.borderless)
        .frame(maxHeight: .infinity)
    }

    var energyButton: some View {
        Button {
            tappedEnergy()
        } label: {
            Text("\(Int(meal.energyAmount)) kcal")
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
        }
        .contentShape(Rectangle())
        .padding(.leading)
        .buttonStyle(.borderless)
        .frame(maxHeight: .infinity)
    }
    
    //MARK: - Actions
    func tappedAddFood() {
        Haptics.feedback(style: .soft)
        diaryController.mealToAddFoodTo = meal
    }
    
    func tappedEnergy() {
        Haptics.feedback(style: .soft)
        diaryController.mealToShowChartsFor = meal
    }
}