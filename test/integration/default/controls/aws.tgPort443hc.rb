control 'tgPort443hc' do
    title 'Verify Health-Check of Target Group for Port 443'
    desc 'Verifies the Health-Check settings og the Load Balancer target group for port 443.'

    # verify the health check path
    describe input('lb_tg_443_full')[:health_check][0][:path] do
        it {should eq '/_health_check'}
    end

    # verify the health-check port
    describe input('lb_tg_443_full')[:health_check][0][:port] do
        it {should cmp 443}
    end

    # verify the health-check protocol
    describe input('lb_tg_443_full')[:health_check][0][:protocol] do
        it {should eq 'HTTPS'}
    end

end