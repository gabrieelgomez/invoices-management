require 'rails_helper'

RSpec.describe AsyncProcesses::ProcessFiles do
  context 'Bulk upload massive XML files path' do
    describe '.new' do
      context 'when initialize AsyncProcesses::ProcessFiles Service with whatever path' do
        before(:each) do
          @xmls_path_stubs = [
            'spec/stubs/invoices/4b03c0b2-aa3f-4309-81a9-28a7d4f67ce9.xml',
            'spec/stubs/invoices/52a1b5b7-cd0c-48a0-8633-0b16516c199d.xml',
            'spec/stubs/invoices/81f78af2-7f6c-445c-8510-4493f4774a5a.xml',
            'spec/stubs/invoices/91c1424f-87b3-4933-99e7-2fb3e24924e9.xml'
          ]

          @async_process_service = AsyncProcesses::ProcessFiles.new(@xmls_path_stubs)
        end

        it 'should be respond to xmls instance method' do
          expect(@async_process_service).to respond_to(:xmls)
        end

        it 'should be respond to files instance method' do
          expect(@async_process_service).to respond_to(:files)
        end

        it 'returns four items' do
          expect(@async_process_service.xmls.size).to eq(4)
        end

        it 'returns valid keys' do
          expect(@async_process_service.xmls.first['hash'].keys).to eq(%w[invoice_uuid status emitter receiver amount emitted_at expires_at signed_at cfdi_digital_stamp])
        end
      end
    end

    describe '.import' do
      context 'when import XML data invoices' do
        let(:invoices_uuid) { %w[4b03c0b2-aa3f-4309-81a9-28a7d4f67ce9 52a1b5b7-cd0c-48a0-8633-0b16516c199d 81f78af2-7f6c-445c-8510-4493f4774a5a 91c1424f-87b3-4933-99e7-2fb3e24924e9] }

        before(:each) do
          @xmls_path_stubs = [
            'spec/stubs/invoices/4b03c0b2-aa3f-4309-81a9-28a7d4f67ce9.xml',
            'spec/stubs/invoices/52a1b5b7-cd0c-48a0-8633-0b16516c199d.xml',
            'spec/stubs/invoices/81f78af2-7f6c-445c-8510-4493f4774a5a.xml',
            'spec/stubs/invoices/91c1424f-87b3-4933-99e7-2fb3e24924e9.xml'
          ]

          @async_process_service = AsyncProcesses::ProcessFiles.new(@xmls_path_stubs).import
        end

        it 'returns four invoices' do
          expect(@async_process_service.rows.size).to eq(4)
        end

        it 'returns invoice_uuid invoices' do
          expect(@async_process_service.rows.map(&:first)).to eq(invoices_uuid)
        end

        it 'returns invoices from database' do
          expect(Invoice.count).to eq(4)
        end

        it 'should be a instace ActiveRecord::Result valid' do
          expect(@async_process_service).to be_a(ActiveRecord::Result)
        end
      end
    end
  end
end
