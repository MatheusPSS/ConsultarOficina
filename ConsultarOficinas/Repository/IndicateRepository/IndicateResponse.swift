//
//  IndicateResponse.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 28/03/22.
//

import Foundation

struct IndicateResponse: Codable {
    let retornoErroIndicate: RetornoErro
    let sucesso: String?

    enum CodingKeys: String, CodingKey {
        case retornoErroIndicate = "RetornoErro"
        case sucesso = "Sucesso"
    }
}
