# frozen_string_literal: true

module Api
  module V1
    class RoteirosController < ApplicationController
      # Listar todos os roteiros
      def index
        roteiros = Roteiro.order('created_at DESC');
        render json: { status: 'SUCCESS', message: 'Roteiros carregados', data: roteiros }, status: :ok
      end

      # Listar roteiro passando ID
      def show
        roteiro = Roteiro.find_by_id(params[:id])
        message = if roteiro
                    'Roteiro carregado'
                  else
                    'Roteiro não encontrado'
                  end
        render json: { status: 'SUCCESS', message: message, data: roteiro }, status: :ok
      end

      # Criar um novo roteiro
      def create
        roteiro = Roteiro.new(roteiro_params)
        if roteiro.save
          render json: {status: 'SUCCESS', message:'Roteiro Gerado', data: roteiro}, status: :ok
        else
          render json: {status: 'ERROR', message:'Roteiro não gerado', data: roteiro.errors},status: :unprocessable_entity
        end
      end

      # Excluir roteiro
      def destroy
        roteiro = Roteiro.find(params[:id])
        roteiro.destroy
        render json: { status: 'SUCCESS', message: 'Roteiro deletado', data: roteiro}, status: :ok
      end

      # Parametros aceitos
      private

      def roteiro_params
        params.permit(:data_saida, :data_chegada, :atrativos, :qtde_pessoas)
      end
    end
  end
end
