# frozen_string_literal: true

class BulkUploadsController < ApplicationController
  # GET /bulk_upload
  def new; end

  def create
    ::BulkUploads::ProcessFiles.new(path_files).import

    redirect_to invoices_path, notice: 'Sus archivos están siendo procesados'
  end

  private

  def path_files
    params.dig(:bulk_upload, :files).compact_blank.map(&:path)
  end
end
