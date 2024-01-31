//
//  EnvironmentObjectDI.swift
//  ThinkingInSwiftUI
//
//  Created by 佐藤俊輔 on 2022/12/28.
//

import SwiftUI

class EnvironmentObjectDIViewModel: ObservableObject {
    
    deinit {
        print("EnvironmentObjectDIViewModel deinit")
    }
    
    @Published var someList: [String] = ["aaa", "bbbbb"]
}

struct EnvironmentObjectDIView: View {
    
    @EnvironmentObject var vm: EnvironmentObjectDIViewModel
    
    var body: some View {
        NavigationLink(
            destination: EnvironmentObjectDINextView().environmentObject(vm),
            label: {
                Text(vm.someList.joined(separator: ", "))
            }
        )
    }
}

struct EnvironmentObjectDINextView: View {
    
    @EnvironmentObject var vm: EnvironmentObjectDIViewModel
    
    var body: some View {
        Text(vm.someList.joined(separator: " + "))
            .onTapGesture {
                vm.someList = ["ccccccc"]
            }
    }
}

struct EnvironmentObjectDI_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectDIView()
            .environmentObject(EnvironmentObjectDIViewModel())
    }
}
