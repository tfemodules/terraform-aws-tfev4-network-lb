control 'targetGroupsARNs' do
    title 'Test Target Groups ARN Outputs'
    desc 'Iterates over all Target Group outputs (lb_tg_*_arn) and confirms that their values are strings and match an AWS TG ARN pattern.'

    # Iterate over all Target Group outputs and confirm they are strings and match a TG arn pattern,
    [input('lb_tg_80_arn'), input('lb_tg_443_arn'), input('lb_tg_8800_arn')].each do | tg |
        describe tg do
            its('class') { should eq String }
            it { should match /arn\:aws\:elasticloadbalancing\:.*\:targetgroup\/.*/ } 
        end
    end
end