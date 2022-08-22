class AsyncProcessesJob < ApplicationJob
  queue_as :default

  def perform(path_files)
    ::AsyncProcesses::ProcessFiles.new(path_files).import
  end
end
