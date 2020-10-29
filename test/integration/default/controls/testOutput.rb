control 'testOutput' do
    title 'Test Module Outputs'
    desc 'Confirms that the module outputs are as expected.'
    
    # test the NLB DNS output
    describe input('lb_dns_name') do
        its('class') { should eq String }
        it { should match /.*\.elb\..*\.amazonaws\.com$/ } 
    end

    # test the target group arns outputs
    [input('lb_tg_80_arn'), input('lb_tg_443_arn'), input('lb_tg_8800_arn')].each do | tg |
        describe tg do
            its('class') { should eq String }
            it { should match /arn\:aws\:elasticloadbalancing\:.*\:targetgroup\/.*/ } 
        end
    end

end