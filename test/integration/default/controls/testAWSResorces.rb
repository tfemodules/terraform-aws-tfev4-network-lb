control 'testAWSResources' do
    title 'Verify NLB DNS'
    desc 'Confirms that the DNS name of the NLB is resolvable'

    describe host(input('lb_dns_name')) do
        it { should be_resolvable }
    end
end