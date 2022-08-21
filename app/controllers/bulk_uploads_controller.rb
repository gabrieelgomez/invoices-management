# frozen_string_literal: true

class BulkUploadsController < ApplicationController
  # GET /bulk_upload
  def new; end

  def create
    ::BulkUploads::ParseFiles.new(params).call

    redirect_to invoices_path, notice: 'Sus archivos están siendo procesados'
  end
end
