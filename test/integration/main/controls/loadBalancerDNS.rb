control 'loadBalancerDNS' do
    title 'Test Load Balancer DNS Output'
    desc 'Confirm that the lb_dns output value is a string, matches the AWS NLB DNS pattern and is resolvable.'

    # confirm output type and pattern
    describe input('lb_dns_name') do
        its('class') { should eq String }
        it { should match /.*\.elb\..*\.amazonaws\.com$/ } 
    end

    # confirm output is a resolvable DNS
    describe host(input('lb_dns_name')) do
        it { should be_resolvable }
    end
end