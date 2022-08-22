# frozen_string_literal: true

class AsyncProcessesController < ApplicationController
  # GET /async_processes
  def new
    @async_process = AsyncProcess.new
  end

  # POST /async_processes
  def create
    @async_process = AsyncProcess.new(async_process_params)

    respond_to do |format|
      if @async_process.save
        AsyncProcessesJob.perform_later @async_process.blob_url_path
        format.html { redirect_to invoices_path, notice: 'Sus archivos están siendo procesados' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def async_process_params
    params.require(:async_process).permit(files: [])
  end
end
