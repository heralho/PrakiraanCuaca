//
//  WeatherCardView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 14/10/25.
//

import SwiftUI

struct WeatherCardView: View {
    let data: Weather?
    var body: some View {
        ZStack(alignment: .leading) {
            Color.blueFrenchPass.opacity(0.2)
            VStack(alignment: .leading, spacing: 8) {
                Text(Date.fromAPI(date: data?.localDatetime ?? "").toDateFormat())
                    .font(.title2)
                    .fontWeight(.bold)
                Text(Date.fromAPI(date: data?.localDatetime ?? "").toTimeFormat() + " WIB")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                //CustomImageView(imageUrl: data?.image)
                Image(systemName: <#T##String#>)
                Text((data?.t?.toString() ?? "-") + " °C")
                    .font(.system(size: 64))
                    .fontWeight(.semibold)
                Text(data?.weatherDescEn ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                List {
                    HStack(alignment: .center) {
                        Image(systemName: "drop.fill")
                        Spacer()
                            .background(Color.clear)
                        Text((data?.hu?.toString() ?? "-") + "%")
                            .frame(alignment: .trailing)
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                        return 0
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "wind")
                        Spacer()
                            .background(Color.clear)
                        Text((data?.ws?.toString() ?? "-") + "km/h")
                            .frame(alignment: .trailing)
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                        return 0
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "safari.fill")
                        Spacer()
                            .background(Color.clear)
                        Text(data?.wd ?? "-")
                            .frame(alignment: .trailing)
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                        return 0
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "eye.fill")
                        Spacer()
                            .background(Color.clear)
                        Text("> " + (data?.ws?.toString() ?? "-") + " km")
                            .frame(alignment: .trailing)
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                        return 0
                    }
                }
                .listStyle(.plain)
                .scrollDisabled(true)
                .background(.clear)
                .listRowSeparator(.visible, edges: .bottom)
                .cornerRadius(8)
            }
            .padding( 16)
        }
        .cornerRadius(9)
        .padding(8)
    }
}

#Preview {
    WeatherCardView(data: Weather(datetime: nil,
                                  t: nil,
                                  tcc: nil,
                                  tp: nil,
                                  weather: nil,
                                  weatherDesc: nil,
                                  weatherDescEn: nil,
                                  wdDeg: nil,
                                  wd: nil,
                                  wdTo: nil,
                                  ws: nil,
                                  hu: nil,
                                  vs: nil,
                                  vsText: nil,
                                  timeIndex: nil,
                                  analysisDate: nil,
                                  image: nil,
                                  utcDatetime: nil,
                                  localDatetime: nil))
}
