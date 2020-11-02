control 'tgPort80hc' do
    title 'Verify Health-Check of Target Group for Port 80'
    desc 'Verifies the Health-Check settings og the Load Balancer target group for port 80.'

    # verify the health check path
    describe input('lb_tg_80_full')[:health_check][0][:path] do
        it {should eq '/'}
    end

    # verify the health-check port
    describe input('lb_tg_80_full')[:health_check][0][:port] do
        it {should cmp 80}
    end

    # verify the health-check protocol
    describe input('lb_tg_80_full')[:health_check][0][:protocol] do
        it {should eq 'HTTP'}
    end

end