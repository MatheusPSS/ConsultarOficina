//
//  WorkshopsListResponse.swift
//  ConsultarOficinas
//
//  Created by Matheus Pereira da Silva Souza on 24/03/22.
//

import Foundation

struct WorkshopsListResponse: Codable {
    let token: String?
    let retornoErroWorkshops: RetornoErro
    let listaOficinas: [ListaOficina]

    enum CodingKeys: String, CodingKey {
        case token = "Token"
        case retornoErroWorkshops = "RetornoErro"
        case listaOficinas = "ListaOficinas"
    }
}

struct ListaOficina: Codable {
    let id: Int?
    let descricao: String?
    let telefone2: String?
    let email: String?
    let latitude: String?
    let ativo: Bool?
    let foto, descricaoCurta, endereco, longitude: String?
    let telefone1: String?
    let nome: String?
    let codigoAssociacao, avaliacaoUsuario: Int?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case descricao = "Descricao"
        case telefone2 = "Telefone2"
        case email = "Email"
        case latitude = "Latitude"
        case ativo = "Ativo"
        case foto = "Foto"
        case descricaoCurta = "DescricaoCurta"
        case endereco = "Endereco"
        case longitude = "Longitude"
        case telefone1 = "Telefone1"
        case nome = "Nome"
        case codigoAssociacao = "CodigoAssociacao"
        case avaliacaoUsuario = "AvaliacaoUsuario"
    }
}

struct RetornoErro: Codable {
    let retornoErro: String?
    
    enum CodingKeys: String, CodingKey {
        case retornoErro = "retornoErro"
    }
}
