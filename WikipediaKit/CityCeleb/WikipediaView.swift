//
//  WikipediaView.swift
//  CityCeleb
//
//  Created by Seyfülmülük Kutluk on 15.07.2022.
//

import SwiftUI
import WikipediaKit

extension String {
    func load() -> UIImage {
        do{
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            let data: Data = try
            Data(contentsOf: url, options: .uncached)
            return UIImage(data: data) ?? UIImage()
        } catch {
            
        }
        return UIImage()
    }
}

class WikipediaViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
    }
}

struct WikipediaView: View {

    func fetchDataWikipedia(element: String) {
        Wikipedia.shared.requestSearchResults(method: WikipediaSearchMethod.fullText, language: WikipediaLanguage("en"), term: element) {
            (searchResults, error) in
            guard error == nil else { return }
            guard let searchResults == searchResults else { return }
            for articlePreview in searchResults.items {
                if let image = articlePreview.imageURL {
                    wikiImage.append("\(image)")
                }
                wikiText.append(articlePreview.displayText)
                wikiTitle.append(articlePreview.title)
                break
            }
        }
    }
    
    @State private var wikiImage = ""
    @State private var wikiSearch = ""
    @State private var wikiText = ""
    @State private var wikiTitle = ""
    @State private var showWiki = false
    
    var body = some View {
        NavigationView {
            
            ScrollView {
                if showWiki == true {
                    VStack{
                        Image(uiImage: wikiImage.load())
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                        Text(wikiTitle)
                            .font(.largeTitle)
                        Text(wikiText)
                            .padding()
                    }
                } else {
                    TextField("Search", text: $wikiSearch)
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 30, alignment: .center)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                        .padding()
                }
            }
            .navigationBarTitle("Wikipedia")
            .navigationBarItems(leading: Button(action: {
                self.showWiki = false
                self.wikiText = removeAll()
                self.wikiTitle = removeAll()
                self.wikiImage = removeAll()
            }) {
                Text("Cancel")
                
            },
                                trailing: Button(action: {
                fetchDataWikipedia(element: wikiSearch)
                self.showWiki = true
            }) {
                Text("Search")
            })
        }
    }
}

struct WikipediaView_Previews: PreviewProvider {
    struct var previews: some View {
        WikipediaView()
    }
}

