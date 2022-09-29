//
//  TaskBootcamp.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Denys on 29.09.2022.
//

import SwiftUI

class TaskBootcampViemModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var image2: UIImage? = nil
    
    func fetchImage() async {
        try? await Task.sleep(nanoseconds: 5_000_000_000)
        do {
            guard let url = URL(string: "https://picsum.photos/200") else {return}
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run(body: {
                self.image = UIImage(data: data)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else {return}
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run(body: {
                self.image2 = UIImage(data: data)
            })
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

struct TaskBootcampHomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink("CLICK ME") {
                    TaskBootcamp()
                }
            }
        }
    }
}

struct TaskBootcamp: View {
    
    @StateObject private var viewModel = TaskBootcampViemModel()
    @State private var fetchImageTask: Task<(), Never>? = nil
    
    var body: some View {
        VStack(spacing: 40) {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                Text("Squallex? huh")
                    .font(.title)
                    .fontWeight(.bold)
            }
            if let image = viewModel.image2 {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
            await viewModel.fetchImage()
        }
//        .onDisappear {
//            fetchImageTask?.cancel()
//        }
//        .onAppear{
//            fetchImageTask = Task {
//                await viewModel.fetchImage()
//            }
//            Task {
//                print(Thread.current)
//                print(Task.currentPriority)
//                await viewModel.fetchImage2()
//            }
//            Task(priority: .low) {
//                //try? await Task.sleep(nanoseconds: 2_000_000_000)
//                await Task.yield()
//                print("LOW: \(Thread.current): \(Task.currentPriority) ")
//            }
//            Task(priority: .medium) {
//                print("medium: \(Thread.current): \(Task.currentPriority) ")
//            }
//            Task(priority: .high) {
//                print("high: \(Thread.current): \(Task.currentPriority) ")
//            }
//            Task(priority: .background) {
//                print("background: \(Thread.current): \(Task.currentPriority) ")
//            }
//            Task(priority: .utility) {
//                print("utility: \(Thread.current): \(Task.currentPriority) ")
//            }
//            Task(priority: .userInitiated) {
//                print("userInitiated: \(Thread.current): \(Task.currentPriority) ")
//            }
            
//            Task(priority: .userInitiated) {
//                print("userInitiated: \(Thread.current): \(Task.currentPriority) ")
//
//                Task.detached {
//                    print("userInitiated2: \(Thread.current): \(Task.currentPriority) ")
//                }
//            }
//        }
    }
}

struct TaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskBootcamp()
    }
}
