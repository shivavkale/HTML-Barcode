use Test::More;

eval { require Barcode::Code128; 1 };
my $has_mod = $@ ? 0 : 1;
subtest 'code128' => sub {
    plan(skip_all => 'Barcode::Code128 not installed') unless $has_mod;
    require_ok( 'HTML::Barcode::Code128' );
    my $code = new_ok('HTML::Barcode::Code128' => [text => 'MONKEY']);
    my $output = $code->render;
    cmp_ok($output, 'eq', render_expected(), 'render() output was as expected');
};

done_testing;

sub render_expected {
    return '<style type="text/css">table.hbc{border-width:0;border-spacing:0;}table.hbc{border-width:0;border-spacing:0;}table.hbc tr, table.hbc td{border:0;margin:0;padding:0;}table.hbc td{text-align:center;}table.hbc td.hbc_on,table.hbc td.hbc_off{width:2px;height:100px;}table.hbc td.hbc_on{background-color:#000;color:inherit;}table.hbc td.hbc_off{background-color:#fff;color:inherit;}</style><table class="hbc"><tr><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td></tr><tr><td colspan="101">MONKEY</td></tr></table>';
}
