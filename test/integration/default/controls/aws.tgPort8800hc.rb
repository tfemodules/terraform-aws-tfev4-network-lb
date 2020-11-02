control 'tgPort8800hc' do
    title 'Verify Health-Check of Target Group for Port 8800'
    desc 'Verifies the Health-Check settings og the Load Balancer target group for port 8800.'

    # verify that the health-check protocol is TCP
    describe input('lb_tg_8800_full')[:health_check][0][:protocol] do
        it {should eq 'TCP'}
    end

end