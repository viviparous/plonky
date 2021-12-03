#! /usr/bin/perl
use strict;
use warnings;
use feature 'say';
use Data::Dumper;
use Digest::SHA qw(sha256_hex);
use Scalar::Util qw(looks_like_number);
use List::Util qw( 
head tail uniqstr uniqnum uniq pairs any all none notall first max maxstr min minstr product sum sum0 pairs pairkeys pairvalues shuffle 
);



my $giENTRPY= 1 + $$ + int rand(time);


package cOrdict { 
	sub new { 
		my $class=shift; my @aKeys=(); my %dKeysVals=(); my %dRefData=();
		my $uicInt = ::getSHA(::getEntropyVal() + int rand(__LINE__) + int rand(time));
		my $self = { uic=>$class."-".$uicInt , aKeys=>\@aKeys , dRefData=>\%dRefData , dKeysVals=>\%dKeysVals , bDbg=>0 };
		return bless $self, $class;
	}
	
	sub dbgOff { my $self=shift; $self->{bDbg}=0; }
	sub dbgOn { my $self=shift; $self->{bDbg}=1; }
	
	sub identify { my $self=shift; say "cOrdict ". substr($self->{uic}, 0, int (length($self->{uic})/2) ) . "... ";}	
	sub identifyLong { my $self=shift; say "cOrdict ". $self->{uic};}

	sub addKV { my ($self,$key,$value)=@_; 
		if($self->{bDbg}==1){ say $self->{uic}." addKV $key , $value" ; }
		my $arf=$self->{aKeys}; my $pkcount=scalar(@$arf); push @$arf,$key; 
		if($self->{bDbg}==1){ say $self->{uic}." kcount was $pkcount, now ". scalar(@$arf); }
		
		my $hrf=$self->{dKeysVals}; my $phkcount=scalar(keys %$hrf);
		$hrf->{$key}=$value; 
		if($self->{bDbg}==1){ say $self->{uic}." hkcount was $phkcount, now ". scalar(keys %$hrf); }
		
	}
	sub setKV { my ($self,$key,$value)=@_; 
		if($self->{bDbg}==1){ say $self->{uic}." setKV $key , $value" ; }
		my $hrf=$self->{dKeysVals}; my $phkcount=scalar(keys %$hrf);

		if( exists $hrf->{$key} ) { 
			my $preVal=$hrf->{$key}; 
			$hrf->{$key}=$value;
			if($self->{bDbg}==1){ say $self->{uic}." key $key was $preVal, now $value"; }        
		}
		else { say "key $key not found in ". $self->{uic}; }        
	}

	sub setRefData { my ($self, $refdata)=@_; $self->{dRefData}=$refdata; }
	sub getRefData { my $self=shift; return $self->{dRefData}; }
	
	sub getVofK { my ($self,$key)=@_; my $hrf=$self->{dKeysVals}; return $hrf->{$key}; }
	sub getKeysArf { my $self=shift; return $self->{aKeys};  }
	sub getValsArf { my $self=shift; my $arf=$self->{aKeys}; my $drf=$self->{dKeysVals}; my @aRV = map { $drf->{$_} } @$arf ; return \@aRV; }
	
	sub listKeys { my $self=shift; my $arf=$self->{aKeys}; say $self->identify()." keys: ". join(" ;; ", @$arf); }
	sub listValues { my $self=shift; my $arf=$self->{aKeys}; my $drf=$self->{dKeysVals}; say $self->identify()." values: ". join(" ;; ", map { $drf->{$_} } @$arf ); }
	
};


#subroutines
sub mksqbracks { my $v=shift; return "[ $v ] " ; }
sub mkDivider { my $val=shift; say "\n". 'x' x 80 . "_$val\n"; }
sub getkbinput { my $msg=shift; say $msg; my $kbStr=<STDIN>;chomp($kbStr); return $kbStr; } 
sub getSHA { my $arg=shift; return sha256_hex($arg); }
sub getEntropyVal { my $rv=$giENTRPY; $giENTRPY++; return $rv; }


my $oCONKY=cOrdict->new();

my @aCFG=();
$oCONKY->addKV("conky.config", \@aCFG); 
my @aTXT=();
$oCONKY->addKV("conky.text", \@aTXT);

my @aCmts=();
push @aCmts, "-- generated by ". $0;


push @aCFG, qq/alignment = 'top_right',/;
push @aCFG, qq/background = false,/;
push @aCFG, qq/border_width = 1,/;
push @aCFG, qq/cpu_avg_samples = 2,/;
push @aCFG,	qq/default_color = 'white',/;
push @aCFG, qq/default_outline_color = 'white',/;
push @aCFG, qq/default_shade_color = 'white',/;
push @aCFG, qq/draw_borders = false,/;
push @aCFG, qq/draw_graph_borders = true,/;
push @aCFG, qq/draw_outline = false,/;
push @aCFG, qq/draw_shades = false,/;
push @aCFG, qq/use_xft = true,/;
push @aCFG, qq/font = 'DejaVu Sans Mono:size=9',/;
push @aCFG, qq/gap_x = 7,/;
push @aCFG, qq/gap_y = 6,/;
push @aCFG, qq/minimum_height = 5,/;
push @aCFG,	qq/minimum_width = 5,/;
push @aCFG, qq/net_avg_samples = 2,/;
push @aCFG, qq/no_buffers = true,/;
push @aCFG, qq/out_to_console = false,/;
push @aCFG, qq/out_to_stderr = false,/;
push @aCFG, qq/extra_newline = false,/;
push @aCFG, qq/own_window = true,/;
push @aCFG, qq/own_window_class = 'Conky',/;
push @aCFG, qq/own_window_type = 'normal',/;
push @aCFG,	qq/own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',/;
push @aCFG, qq/stippled_borders = 0,/;
push @aCFG, qq/update_interval = 5.0,/;
push @aCFG, qq/uppercase = false,/;
push @aCFG, qq/use_spacer = 'none',/;
push @aCFG, qq/show_graph_scale = false,/;
push @aCFG, qq/show_graph_range = false,/;
push @aCFG,	qq/override_utf8_locale = true/;    


my $iCpuCount=qx{cat /proc/cpuinfo | grep vendor_id | wc -l}; chomp($iCpuCount);
my $sCpuNym=qx{cat /proc/cpuinfo | grep 'model name' | sort -u}; chomp($sCpuNym);

my @aNymPcs=split(/:/,$sCpuNym);
$sCpuNym=$aNymPcs[1];


my $sIFs=qx{ip route | grep -E "^[0-9]"}; chomp($sIFs);
#say "cpu $sCpuNym , count $iCpuCount , network adapters $sIFs";

my @aIFnyms=split("\n",$sIFs);



push @aTXT, "\${color lightgrey}";
push @aTXT, $sCpuNym;
push @aTXT, "\$stippled_hr";
push @aTXT, "\$sysname \$kernel ★ \$machine";
push @aTXT, "Uptime: \$uptime";
push @aTXT, "Processes: \$processes (\$running_processes)"; 
push @aTXT, "/fs/file-nr: \${execi 5 cat /proc/sys/fs/file-nr | cut -f 1} CPUfreq: \${color yellow}\${freq} \${color lightgrey}MHz";
push @aTXT, "\$stippled_hr";

for my $cpu (0..$iCpuCount-1){ 
	my $cpuHN=$cpu+1;
	push @aTXT, "\${color lightgrey}Core $cpuHN:\${color yellow} \${cpu cpu$cpu}\%";
	push @aTXT, "\${cpubar cpu$cpu 25 100}";
	push @aTXT, "\${color black}\${cpugraph cpu$cpu 000000 5000a0}";
}
push @aTXT, "\${color lightgrey}";
push @aTXT, "\$stippled_hr";


my %dIFs=();
for my $IFL (@aIFnyms) {
	
 push @aTXT, "\${color lightgrey}";
 my @aFLpcs=split(/ /,$IFL);
 my $nic=$aFLpcs[2];
	if( ! exists $dIFs{$nic} ) {
	 $dIFs{$nic}=1;
	 push @aTXT, "◉ $nic \${addr $nic}";	
	 push @aTXT, "▼: \${downspeed $nic} k/s ▲: \${upspeed $nic} k/s"; 
	 push @aTXT, "∑▼: \${totaldown $nic} ∑▲: \${totalup $nic}";
	 push @aTXT, "▼ \${downspeedgraph $nic 16,150} ▲ \${upspeedgraph $nic 16,150}";
	}
	else { $dIFs{$nic}++; }
}

push @aTXT, "\$stippled_hr";
push @aTXT, "◉ \${color lightgrey}Swap: \$swap/\$swapmax - \$swapperc% \${swapbar}";
push @aTXT, "◉ \${color grey}FSuser: \${fs_used /home}/\${fs_size /home} - \${fs_used_perc /home}% \${fs_bar /home}";
push @aTXT, "◉ \${color lightgrey}RAM: \$mem/\$memmax - \$memperc% \$membar";
push @aTXT, "\$stippled_hr";
push @aTXT, "Process     ★       PID  ★  CPU ★  RAM";
 
for my $proc (1..10){

 my $bullet="◎"; 
 my $colr="lightgrey";
 if($proc==1) { $bullet="◉"; $colr="yellow";} 
 push @aTXT, "\${color $colr}$bullet \${top name $proc} \${top pid $proc} \${top cpu $proc} \${top mem $proc}";

}


say join("\n",@aCmts);

my $arfk=$oCONKY->getKeysArf();

say $arfk->[0]."={\n".join("\n",@aCFG)."\n}";

say $arfk->[1]."=[[\n".join("\n",@aTXT)."\n]]";



