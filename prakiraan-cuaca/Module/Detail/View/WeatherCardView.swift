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
                Text(Date.fromAPI(date: data?.datetime ?? "").toTimeFormat() + " WIB") 
                    .font(.largeTitle)
                    .fontWeight(.bold)
                CustomImageView(imageUrl: data?.image)
                Text(data?.t?.toString() ?? "-" + " °C")
                    .font(.system(size: 64))
                    .fontWeight(.semibold)
                Text(data?.weatherDescEn ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                List {
                    HStack(alignment: .center) {
                        Image(systemName: "drop.fill")
                        Text(data?.hu?.toString() ?? "-")
                            .frame(alignment: .trailing)
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "wind")
                        Text(data?.ws?.toString() ?? "-")
                            .frame(alignment: .trailing)
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "safari.fill")
                        Text(data?.wd ?? "-")
                            .frame(alignment: .trailing)
                    }
                    HStack(alignment: .center) {
                        Image(systemName: "eye.fill")
                        Text(data?.ws?.toString() ?? "-")
                            .frame(alignment: .trailing)
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
