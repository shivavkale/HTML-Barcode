package HTML::Barcode::Code93;
use Any::Moose;
extends 'HTML::Barcode::1D';
use Barcode::Code93;

has '_code93' => (
    is      => 'ro',
    default => sub { Barcode::Code93->new },
);

sub barcode_data {
    my ($self) = @_;
    return $self->_code93->barcode(uc $self->text);
}

=head1 NAME

HTML::Barcode::Code93 - Generate HTML representations of Code 93 barcodes

=head1 SYNOPSIS

  my $code = HTML::Barcode::Code93->new(text => 'MONKEY');
  print $code->render;

=head1 DESCRIPTION

This class allows you easily create HTML representations of Code 93 barcodes.

=begin html

<p>Here is an example of a Code 93 barcode rendered with this module:</p>
<style type="text/css">table.hbc{border-width:0;border-spacing:0;}table.hbc{border-width:0;border-spacing:0;}table.hbc tr, table.hbc td{border:0;margin:0;padding:0;}table.hbc td{text-align:center;}table.hbc td.hbc_on,table.hbc td.hbc_off{width:2px;height:100px;}table.hbc td.hbc_on{background-color:#000;color:inherit;}table.hbc td.hbc_off{background-color:#fff;color:inherit;}</style><table class="hbc"><tr><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_on"></td><td class="hbc_off"></td><td class="hbc_on"></td></tr><tr><td colspan="91">MONKEY</td></tr></table>

=end html

You can read more about Code 93 online (e.g. L<http://en.wikipedia.org/wiki/Code_93>).

=head1 METHODS

=head2 new (%attributes)

Instantiate a new HTML::Barcode::Code93 object. The C<%attributes> hash
requires the L</text> attribute, and can take any of the other
L<attributes|/ATTRIBUTES> listed below.

=head2 render

This is a convenience routine which returns C<< <style>...</style> >> tags
and the rendered barcode.

If you are printing multiple barcodes or want to ensure your C<style> tags
are in your HTML headers, then you probably want to output the barcode
and style separately with L</render_barcode> and
L</css>.

=head2 render_barcode

Returns only the rendered barcode.  You will need to provide stylesheets
separately, either writing them yourself or using the output of L</css>.

=head2 css

Returns CSS needed to properly display your rendered barcode.  This is
only necessary if you are using L</render_barcode> instead of the
easier L</render> method.

=head1 ATTRIBUTES

These attributes can be passed to L<new|/"new (%attributes)">, or used
as accessors.

=head2 text

B<Required> - The information to put into the barcode.

=head2 foreground_color

A CSS color value (e.g. '#000' or 'black') for the foreground. Default is '#000'.

=head2 background_color

A CSS color value background. Default is '#fff'.

=head2 bar_width

A CSS value for the width of an individual bar. Default is '2px'.

=head2 bar_height

A CSS value for the height of an individual bar. Default is '100px'.

=head2 show_text

Boolean, default true. Indicates whether or not to render the text
below the barcode.

=head2 css_class

The value for the C<class> attribute applied to any container tags
in the HTML (e.g. C<table> or C<div>).
C<td> tags within the table will have either css_class_on or css_class_off
classes applied to them.

For example, if css_class is "barcode", you will get C<< <table class="barcode"> >> and its cells will be either C<< <td class="barcode_on"> >> or
C<< <td class="barcode_off"> >>.

=head1 AUTHOR

Mark A. Stratman, C<< <stratman@gmail.com> >>

=head1 SOURCE REPOSITORY

L<http://github.com/mstratman/HTML-Barcode>

=head1 SEE ALSO

L<Barcode::Code93>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Mark A. Stratman.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

no Any::Moose;
1; # End of HTML::Barcode
