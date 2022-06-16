//
//  ContentView.swift
//  landmarks
//
//  Created by yakir on 2022/6/12.
//
import SwiftUI

struct WeSplit: View {
	
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20
	
	@FocusState private var amountIsFocused: Bool
	
	let tipPercentages = [10,15,20,25,0]
	
	var totalPerPersopn : Double{
		// 人数
		let peopleCount = Double(numberOfPeople+2)
		// 选择的小费百分比
		let tipSelection = Double(tipPercentage)
		// 小费总额
		let tipValue = checkAmount / 100 * tipSelection
		// 消费总额
		let grandTotal = checkAmount + tipValue
		// 人均消费
		let amoutPerPerson = grandTotal / peopleCount
		return amoutPerPerson
	}
	
	var body: some View {
		NavigationView{
			Form {
				Section{
					TextField("Amount",value: $checkAmount,format: .currency(code: Locale.current.currencyCode ?? "CNY"))
						.focused($amountIsFocused)
					Picker("Number of people",selection: $numberOfPeople){
						ForEach(1 ..< 10 ){
							Text("\($0) people")
						}
					}
					Picker("Tip Percentage",selection: $tipPercentage){
						ForEach(tipPercentages,id : \.self){
							Text($0,format: .percent)
						}
					}
					.pickerStyle(.segmented)
				} header: {
					Text("How much tip")
				}
				//搜索
				Section{
					Text(totalPerPersopn,format: .currency(code: Locale.current.currencyCode ?? "CNY"))
						.keyboardType(.decimalPad)
				}header: {
					Text("人均消费")
				}
			}
			.navigationTitle("Home")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar{
				ToolbarItemGroup(placement: .keyboard){
					Spacer()
					Button("确定"){
						amountIsFocused = false
					}
				}
			}
		}
		
		
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		WeSplit()
			.previewDevice("iPhone 13 mini")
	}
}
