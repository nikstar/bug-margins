//
//  ContentView.swift
//  Margins
//
//  Created by nikstar on 25.11.2024.
//

import SwiftUI
import UIKit

class InsetGroupedTableViewController: UITableViewController {

    // Sample data
    let data = [
        ["Apple", "Banana", "Cherry"],
        ["Carrot", "Broccoli", "Spinach"]
    ]
    let sectionTitles = ["Fruits", "Vegetables"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the table view style to inset grouped
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)

        // Register a standard cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}


import SwiftUI

struct InsetGroupedListView: View {
    // Sample data
    let data = [
        ["Apple", "Banana", "Cherry"],
        ["Carrot", "Broccoli", "Spinach"]
    ]
    let sectionTitles = ["Fruits", "Vegetables"]

    var body: some View {
        List {
            ForEach(0..<data.count, id: \.self) { sectionIndex in
                Section(header: Text(sectionTitles[sectionIndex])) {
                    ForEach(data[sectionIndex], id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // UIKit view in the first tab
            NavigationView {
                UIKitTab()
                    .navigationTitle("UIKit")
            }
            .tabItem {
                Label("UIKit", systemImage: "1.square.fill")
            }
            
            // SwiftUI view in the second tab
            NavigationView {
                InsetGroupedListView()
                    .navigationTitle("SwiftUI")
            }
            .tabItem {
                Label("SwiftUI", systemImage: "2.square.fill")
            }
        }
    }
}

// A SwiftUI wrapper for the UIKit view
struct UIKitTab: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> InsetGroupedTableViewController {
        return InsetGroupedTableViewController()
    }

    func updateUIViewController(_ uiViewController: InsetGroupedTableViewController, context: Context) {
        // No updates needed
    }
}
