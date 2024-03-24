require 'open3'

RSpec.describe 'Cash Register CLI', type: :feature do
  before do
    allow(Kernel).to receive(:system).with("stty", any_args).and_return(true)
  end

  it 'calculates total price for products added' do
    command = 'ruby bin/cash_register'
    user_inputs = ["gr1\n", "cf1\n", "sr1\n", "cf1\n", "cf1\n"].join

    Open3.popen2e(command) do |stdin, stdout_err, wait_thr|
      stdin.puts(user_inputs)
      stdin.close

      output = stdout_err.read

      expect(output).to include('GR1  |  1')
      expect(output).to include('CF1  |  3') 
      expect(output).to include('SR1  |  1') 
      expect(output).to include('Order Total: 30.57€') 
      
      expect(wait_thr.value).to be_success
    end

    # TODO: Add error handling spec for invalid product codes
  end
end
