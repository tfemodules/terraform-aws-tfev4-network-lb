control 'alb' do
    title 'Test the Load Balancer.'
    desc 'Confirm that the Load Balancer exists and the setup of its listeners.'
    
    describe aws_alb(input('lb_arn')) do
      it {should exist}
      its('external_ports') {should include 443}
      its('external_ports') {should include 80}
      its('external_ports') {should include 8800}
    end
end