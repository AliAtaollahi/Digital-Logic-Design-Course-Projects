`timescale 1ns/1ns
module ALU_STR1 (input signed [15:0] inM,inN,input [2:0] opc,input inC,output zer,neg,output signed [15:0] outF);
	wire [15:0] w1,w2,w3,w4,i,j,k;
	wire l,m,n,co,s1,s2,o,p;
	assign neg=outF[15];
	logic [15:0] one=16'b1;
	logic zero=1'b0;
	or or1(o,opc[1],opc[0]);
	not not1(p,opc[0]);
	and and1(s1,opc[2],o);
	and and2(s2,opc[2],p);
	mux16bit mux1(w1,w2,w3,w4,{s1,s2},outF);
	allor a1(outF,n);
	not not2(zer,n);
	adder16bits adder(inM,k,m,co,w1);
	and16 a2(inM,inN,w2);
	or16 a3(inM,inN,w3);
	allinv a4(inM,w4);
	mux16bit mux2(inN,i,one,j,{opc[1],opc[0]},k);
	shifter sh1(inN,i);
	shifter sh2(inM,j);
	mux2to1 mux3(zero,inC,l,m);
	or or2(q,opc[0],opc[1]);
	not not3(l,q);
endmodule
module shifter (input signed [15:0] in,output signed [15:0] out);
	assign out=in>>>1;
endmodule
module adder16bits (input signed [15:0] in1,in2,input cin,output co,output signed [15:0] out);
	assign {co,out}=in1+in2+cin;
endmodule
module mux16bit (input [15:0] a,b,c,d,input [1:0] select,output [15:0] outF);
	assign outF =   (select==2'd0) ? a:
			(select==2'd1) ? b:
			(select==2'd2) ? c:
			(select==2'd3) ? d:16'bx;
endmodule
module mux2to1 (input a,b,select,output outF);
	assign outF =   (select==1'b0) ? a: 
			(select==1'b1) ? b:1'bx;
endmodule
module and16 (input [15:0] a,b,output [15:0] outF);
	assign outF = a&b;
endmodule
module or16 (input [15:0] a,b,output [15:0] outF);
	assign outF = a|b;
endmodule
module allor (input [15:0] a,output outF);
	assign outF = |a;
endmodule
module allinv (input [15:0] a,output [15:0] outF);
	assign outF=~a;
endmodule



module ALU_STR2(inM, inN, opc, inC, zer, neg, outF);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire co;
  wire [15:0] i;
  input inC;
  input [15:0] inM;
  input [15:0] inN;
  wire [15:0] j;
  wire [15:0] k;
  wire l;
  wire m;
  wire n;
  output neg;
  input [2:0] opc;
  output [15:0] outF;
  wire s1;
  wire s2;
  wire [15:0] w1;
  wire [15:0] w2;
  wire [15:0] w3;
  wire [15:0] w4;
  output zer;
  NOT _10_ (
    .A(_01_),
    .Y(_02_)
  );
  NOR _11_ (
    .A(_05_),
    .B(_04_),
    .Y(_06_)
  );
  NOT _12_ (
    .A(_07_),
    .Y(_03_)
  );
  NOR _13_ (
    .A(_06_),
    .B(_03_),
    .Y(_08_)
  );
  NOR _14_ (
    .A(_03_),
    .B(_05_),
    .Y(_09_)
  );
  allor a1 (
    .a(outF),
    .outF(n)
  );
  and16 a2 (
    .a(inM),
    .b(inN),
    .outF(w2)
  );
  or16 a3 (
    .a(inM),
    .b(inN),
    .outF(w3)
  );
  allinv a4 (
    .a(inM),
    .outF(w4)
  );
  adder16bits adder (
    .cin(m),
    .co(co),
    .in1(inM),
    .in2(k),
    .out(w1)
  );
  mux16bit mux1 (
    .a(w1),
    .b(w2),
    .c(w3),
    .d(w4),
    .outF(outF),
    .select({ s1, s2 })
  );
  mux16bit mux2 (
    .a(inN),
    .b(i),
    .c(16'b0000000000000001),
    .d(j),
    .outF(k),
    .select(opc[1:0])
  );
  mux2to1 mux3 (
    .a(1'b0),
    .b(inC),
    .outF(m),
    .select(l)
  );
  shifter sh1 (
    .in(inN),
    .out(i)
  );
  shifter sh2 (
    .in(inM),
    .out(j)
  );
  assign neg = outF[15];
  assign _01_ = n;
  assign zer = _02_;
  assign _04_ = opc[1];
  assign _05_ = opc[0];
  assign l = _06_;
  assign _07_ = opc[2];
  assign s1 = _08_;
  assign s2 = _09_;
endmodule

module adder16bits(in1, in2, cin, co, out);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  wire _212_;
  wire _213_;
  wire _214_;
  wire _215_;
  wire _216_;
  wire _217_;
  wire _218_;
  wire _219_;
  wire _220_;
  wire _221_;
  wire _222_;
  wire _223_;
  wire _224_;
  wire _225_;
  wire _226_;
  wire _227_;
  wire _228_;
  wire _229_;
  wire _230_;
  wire _231_;
  wire _232_;
  wire _233_;
  wire _234_;
  wire _235_;
  wire _236_;
  wire _237_;
  wire _238_;
  wire _239_;
  wire _240_;
  wire _241_;
  wire _242_;
  wire _243_;
  wire _244_;
  wire _245_;
  wire _246_;
  wire _247_;
  wire _248_;
  wire _249_;
  wire _250_;
  wire _251_;
  wire _252_;
  wire _253_;
  wire _254_;
  wire _255_;
  wire _256_;
  wire _257_;
  wire _258_;
  wire _259_;
  wire _260_;
  wire _261_;
  wire _262_;
  wire _263_;
  wire _264_;
  wire _265_;
  wire _266_;
  wire _267_;
  wire _268_;
  wire _269_;
  wire _270_;
  wire _271_;
  wire _272_;
  wire _273_;
  wire _274_;
  wire _275_;
  wire _276_;
  wire _277_;
  wire _278_;
  wire _279_;
  wire _280_;
  wire _281_;
  wire _282_;
  wire _283_;
  wire _284_;
  wire _285_;
  wire _286_;
  wire _287_;
  wire _288_;
  wire _289_;
  wire _290_;
  wire _291_;
  wire _292_;
  wire _293_;
  wire _294_;
  wire _295_;
  wire _296_;
  wire _297_;
  wire _298_;
  wire _299_;
  wire _300_;
  wire _301_;
  wire _302_;
  wire _303_;
  wire _304_;
  wire _305_;
  wire _306_;
  wire _307_;
  wire _308_;
  wire _309_;
  wire _310_;
  wire _311_;
  wire _312_;
  input cin;
  output co;
  input [15:0] in1;
  input [15:0] in2;
  output [15:0] out;
  NOT _313_ (
    .A(_240_),
    .Y(_252_)
  );
  NAND _314_ (
    .A(_083_),
    .B(_082_),
    .Y(_253_)
  );
  NOT _315_ (
    .A(_082_),
    .Y(_254_)
  );
  NOT _316_ (
    .A(_083_),
    .Y(_255_)
  );
  NAND _317_ (
    .A(_255_),
    .B(_254_),
    .Y(_257_)
  );
  NAND _318_ (
    .A(_257_),
    .B(_253_),
    .Y(_259_)
  );
  NOR _319_ (
    .A(_259_),
    .B(_252_),
    .Y(_261_)
  );
  NOR _320_ (
    .A(_255_),
    .B(_254_),
    .Y(_262_)
  );
  NOR _321_ (
    .A(_083_),
    .B(_082_),
    .Y(_263_)
  );
  NOR _322_ (
    .A(_263_),
    .B(_262_),
    .Y(_265_)
  );
  NOR _323_ (
    .A(_265_),
    .B(_240_),
    .Y(_266_)
  );
  NOR _324_ (
    .A(_266_),
    .B(_261_),
    .Y(_246_)
  );
  NOR _325_ (
    .A(_261_),
    .B(_262_),
    .Y(_267_)
  );
  NOR _326_ (
    .A(_264_),
    .B(_250_),
    .Y(_268_)
  );
  NAND _327_ (
    .A(_264_),
    .B(_250_),
    .Y(_269_)
  );
  NOT _328_ (
    .A(_269_),
    .Y(_270_)
  );
  NOR _329_ (
    .A(_270_),
    .B(_268_),
    .Y(_272_)
  );
  NOT _330_ (
    .A(_272_),
    .Y(_274_)
  );
  NOR _331_ (
    .A(_274_),
    .B(_267_),
    .Y(_276_)
  );
  NAND _332_ (
    .A(_265_),
    .B(_240_),
    .Y(_277_)
  );
  NAND _333_ (
    .A(_277_),
    .B(_253_),
    .Y(_278_)
  );
  NOR _334_ (
    .A(_272_),
    .B(_278_),
    .Y(_279_)
  );
  NOR _335_ (
    .A(_279_),
    .B(_276_),
    .Y(_084_)
  );
  NOR _336_ (
    .A(_276_),
    .B(_270_),
    .Y(_281_)
  );
  NOR _337_ (
    .A(_113_),
    .B(_098_),
    .Y(_283_)
  );
  NAND _338_ (
    .A(_113_),
    .B(_098_),
    .Y(_285_)
  );
  NOT _339_ (
    .A(_285_),
    .Y(_286_)
  );
  NOR _340_ (
    .A(_286_),
    .B(_283_),
    .Y(_287_)
  );
  NOT _341_ (
    .A(_287_),
    .Y(_288_)
  );
  NOR _342_ (
    .A(_288_),
    .B(_281_),
    .Y(_289_)
  );
  NAND _343_ (
    .A(_272_),
    .B(_278_),
    .Y(_290_)
  );
  NAND _344_ (
    .A(_290_),
    .B(_269_),
    .Y(_291_)
  );
  NOR _345_ (
    .A(_287_),
    .B(_291_),
    .Y(_292_)
  );
  NOR _346_ (
    .A(_292_),
    .B(_289_),
    .Y(_153_)
  );
  NOR _347_ (
    .A(_289_),
    .B(_286_),
    .Y(_295_)
  );
  NOT _348_ (
    .A(_163_),
    .Y(_297_)
  );
  NOT _349_ (
    .A(_174_),
    .Y(_298_)
  );
  NOR _350_ (
    .A(_298_),
    .B(_297_),
    .Y(_299_)
  );
  NOR _351_ (
    .A(_174_),
    .B(_163_),
    .Y(_300_)
  );
  NOR _352_ (
    .A(_300_),
    .B(_299_),
    .Y(_302_)
  );
  NOT _353_ (
    .A(_302_),
    .Y(_304_)
  );
  NOR _354_ (
    .A(_304_),
    .B(_295_),
    .Y(_306_)
  );
  NAND _355_ (
    .A(_287_),
    .B(_291_),
    .Y(_307_)
  );
  NAND _356_ (
    .A(_307_),
    .B(_285_),
    .Y(_308_)
  );
  NOR _357_ (
    .A(_302_),
    .B(_308_),
    .Y(_309_)
  );
  NOR _358_ (
    .A(_309_),
    .B(_306_),
    .Y(_221_)
  );
  NOR _359_ (
    .A(_306_),
    .B(_299_),
    .Y(_310_)
  );
  NOR _360_ (
    .A(_239_),
    .B(_231_),
    .Y(_311_)
  );
  NAND _361_ (
    .A(_239_),
    .B(_231_),
    .Y(_312_)
  );
  NOT _362_ (
    .A(_312_),
    .Y(_085_)
  );
  NOR _363_ (
    .A(_085_),
    .B(_311_),
    .Y(_087_)
  );
  NOT _364_ (
    .A(_087_),
    .Y(_089_)
  );
  NOR _365_ (
    .A(_089_),
    .B(_310_),
    .Y(_091_)
  );
  NOT _366_ (
    .A(_299_),
    .Y(_092_)
  );
  NAND _367_ (
    .A(_302_),
    .B(_308_),
    .Y(_093_)
  );
  NAND _368_ (
    .A(_093_),
    .B(_092_),
    .Y(_094_)
  );
  NOR _369_ (
    .A(_087_),
    .B(_094_),
    .Y(_095_)
  );
  NOR _370_ (
    .A(_095_),
    .B(_091_),
    .Y(_241_)
  );
  NOR _371_ (
    .A(_091_),
    .B(_085_),
    .Y(_097_)
  );
  NOR _372_ (
    .A(_243_),
    .B(_242_),
    .Y(_100_)
  );
  NAND _373_ (
    .A(_243_),
    .B(_242_),
    .Y(_102_)
  );
  NOT _374_ (
    .A(_102_),
    .Y(_103_)
  );
  NOR _375_ (
    .A(_103_),
    .B(_100_),
    .Y(_104_)
  );
  NOT _376_ (
    .A(_104_),
    .Y(_105_)
  );
  NOR _377_ (
    .A(_105_),
    .B(_097_),
    .Y(_106_)
  );
  NAND _378_ (
    .A(_087_),
    .B(_094_),
    .Y(_107_)
  );
  NAND _379_ (
    .A(_107_),
    .B(_312_),
    .Y(_109_)
  );
  NOR _380_ (
    .A(_104_),
    .B(_109_),
    .Y(_111_)
  );
  NOR _381_ (
    .A(_111_),
    .B(_106_),
    .Y(_244_)
  );
  NOR _382_ (
    .A(_106_),
    .B(_103_),
    .Y(_114_)
  );
  NOT _383_ (
    .A(_245_),
    .Y(_115_)
  );
  NOT _384_ (
    .A(_247_),
    .Y(_116_)
  );
  NOR _385_ (
    .A(_116_),
    .B(_115_),
    .Y(_118_)
  );
  NOR _386_ (
    .A(_247_),
    .B(_245_),
    .Y(_119_)
  );
  NOR _387_ (
    .A(_119_),
    .B(_118_),
    .Y(_120_)
  );
  NOT _388_ (
    .A(_120_),
    .Y(_121_)
  );
  NOR _389_ (
    .A(_121_),
    .B(_114_),
    .Y(_122_)
  );
  NAND _390_ (
    .A(_104_),
    .B(_109_),
    .Y(_123_)
  );
  NAND _391_ (
    .A(_123_),
    .B(_102_),
    .Y(_124_)
  );
  NOR _392_ (
    .A(_120_),
    .B(_124_),
    .Y(_125_)
  );
  NOR _393_ (
    .A(_125_),
    .B(_122_),
    .Y(_248_)
  );
  NOT _394_ (
    .A(_118_),
    .Y(_127_)
  );
  NAND _395_ (
    .A(_120_),
    .B(_124_),
    .Y(_128_)
  );
  NAND _396_ (
    .A(_128_),
    .B(_127_),
    .Y(_129_)
  );
  NOT _397_ (
    .A(_249_),
    .Y(_130_)
  );
  NOT _398_ (
    .A(_251_),
    .Y(_131_)
  );
  NOR _399_ (
    .A(_131_),
    .B(_130_),
    .Y(_132_)
  );
  NOR _400_ (
    .A(_251_),
    .B(_249_),
    .Y(_133_)
  );
  NOR _401_ (
    .A(_133_),
    .B(_132_),
    .Y(_134_)
  );
  NOR _402_ (
    .A(_134_),
    .B(_129_),
    .Y(_135_)
  );
  NOR _403_ (
    .A(_122_),
    .B(_118_),
    .Y(_136_)
  );
  NOT _404_ (
    .A(_134_),
    .Y(_137_)
  );
  NOR _405_ (
    .A(_137_),
    .B(_136_),
    .Y(_138_)
  );
  NOR _406_ (
    .A(_138_),
    .B(_135_),
    .Y(_256_)
  );
  NOR _407_ (
    .A(_260_),
    .B(_258_),
    .Y(_139_)
  );
  NAND _408_ (
    .A(_260_),
    .B(_258_),
    .Y(_140_)
  );
  NOT _409_ (
    .A(_140_),
    .Y(_141_)
  );
  NOR _410_ (
    .A(_141_),
    .B(_139_),
    .Y(_142_)
  );
  NOT _411_ (
    .A(_142_),
    .Y(_143_)
  );
  NOR _412_ (
    .A(_133_),
    .B(_136_),
    .Y(_144_)
  );
  NOR _413_ (
    .A(_144_),
    .B(_132_),
    .Y(_145_)
  );
  NOR _414_ (
    .A(_145_),
    .B(_143_),
    .Y(_146_)
  );
  NOR _415_ (
    .A(_132_),
    .B(_129_),
    .Y(_147_)
  );
  NOR _416_ (
    .A(_147_),
    .B(_133_),
    .Y(_148_)
  );
  NOR _417_ (
    .A(_148_),
    .B(_142_),
    .Y(_149_)
  );
  NOR _418_ (
    .A(_149_),
    .B(_146_),
    .Y(_271_)
  );
  NAND _419_ (
    .A(_148_),
    .B(_142_),
    .Y(_150_)
  );
  NAND _420_ (
    .A(_150_),
    .B(_140_),
    .Y(_151_)
  );
  NOT _421_ (
    .A(_273_),
    .Y(_152_)
  );
  NOT _422_ (
    .A(_275_),
    .Y(_154_)
  );
  NOR _423_ (
    .A(_154_),
    .B(_152_),
    .Y(_155_)
  );
  NOR _424_ (
    .A(_275_),
    .B(_273_),
    .Y(_156_)
  );
  NOR _425_ (
    .A(_156_),
    .B(_155_),
    .Y(_157_)
  );
  NOT _426_ (
    .A(_157_),
    .Y(_158_)
  );
  NAND _427_ (
    .A(_158_),
    .B(_151_),
    .Y(_159_)
  );
  NOR _428_ (
    .A(_146_),
    .B(_141_),
    .Y(_160_)
  );
  NAND _429_ (
    .A(_157_),
    .B(_160_),
    .Y(_161_)
  );
  NAND _430_ (
    .A(_161_),
    .B(_159_),
    .Y(_280_)
  );
  NOT _431_ (
    .A(_282_),
    .Y(_162_)
  );
  NOT _432_ (
    .A(_284_),
    .Y(_164_)
  );
  NOR _433_ (
    .A(_164_),
    .B(_162_),
    .Y(_165_)
  );
  NOR _434_ (
    .A(_284_),
    .B(_282_),
    .Y(_166_)
  );
  NOR _435_ (
    .A(_166_),
    .B(_165_),
    .Y(_167_)
  );
  NOT _436_ (
    .A(_167_),
    .Y(_168_)
  );
  NOR _437_ (
    .A(_156_),
    .B(_160_),
    .Y(_169_)
  );
  NOR _438_ (
    .A(_169_),
    .B(_155_),
    .Y(_170_)
  );
  NOR _439_ (
    .A(_170_),
    .B(_168_),
    .Y(_171_)
  );
  NOR _440_ (
    .A(_155_),
    .B(_151_),
    .Y(_172_)
  );
  NOR _441_ (
    .A(_172_),
    .B(_156_),
    .Y(_173_)
  );
  NOR _442_ (
    .A(_173_),
    .B(_167_),
    .Y(_175_)
  );
  NOR _443_ (
    .A(_175_),
    .B(_171_),
    .Y(_293_)
  );
  NOT _444_ (
    .A(_165_),
    .Y(_176_)
  );
  NAND _445_ (
    .A(_173_),
    .B(_167_),
    .Y(_177_)
  );
  NAND _446_ (
    .A(_177_),
    .B(_176_),
    .Y(_178_)
  );
  NOT _447_ (
    .A(_294_),
    .Y(_179_)
  );
  NOT _448_ (
    .A(_296_),
    .Y(_180_)
  );
  NOR _449_ (
    .A(_180_),
    .B(_179_),
    .Y(_181_)
  );
  NOR _450_ (
    .A(_296_),
    .B(_294_),
    .Y(_182_)
  );
  NOR _451_ (
    .A(_182_),
    .B(_181_),
    .Y(_183_)
  );
  NOT _452_ (
    .A(_183_),
    .Y(_184_)
  );
  NAND _453_ (
    .A(_184_),
    .B(_178_),
    .Y(_185_)
  );
  NOR _454_ (
    .A(_171_),
    .B(_165_),
    .Y(_186_)
  );
  NAND _455_ (
    .A(_183_),
    .B(_186_),
    .Y(_187_)
  );
  NAND _456_ (
    .A(_187_),
    .B(_185_),
    .Y(_301_)
  );
  NOT _457_ (
    .A(_303_),
    .Y(_188_)
  );
  NOT _458_ (
    .A(_305_),
    .Y(_189_)
  );
  NOR _459_ (
    .A(_189_),
    .B(_188_),
    .Y(_190_)
  );
  NOR _460_ (
    .A(_305_),
    .B(_303_),
    .Y(_191_)
  );
  NOR _461_ (
    .A(_191_),
    .B(_190_),
    .Y(_192_)
  );
  NOT _462_ (
    .A(_192_),
    .Y(_193_)
  );
  NOR _463_ (
    .A(_182_),
    .B(_186_),
    .Y(_194_)
  );
  NOR _464_ (
    .A(_194_),
    .B(_181_),
    .Y(_195_)
  );
  NOR _465_ (
    .A(_195_),
    .B(_193_),
    .Y(_196_)
  );
  NOR _466_ (
    .A(_181_),
    .B(_178_),
    .Y(_197_)
  );
  NOR _467_ (
    .A(_197_),
    .B(_182_),
    .Y(_198_)
  );
  NOR _468_ (
    .A(_198_),
    .B(_192_),
    .Y(_199_)
  );
  NOR _469_ (
    .A(_199_),
    .B(_196_),
    .Y(_086_)
  );
  NOT _470_ (
    .A(_190_),
    .Y(_200_)
  );
  NAND _471_ (
    .A(_198_),
    .B(_192_),
    .Y(_201_)
  );
  NAND _472_ (
    .A(_201_),
    .B(_200_),
    .Y(_202_)
  );
  NOT _473_ (
    .A(_088_),
    .Y(_203_)
  );
  NOT _474_ (
    .A(_090_),
    .Y(_204_)
  );
  NOR _475_ (
    .A(_204_),
    .B(_203_),
    .Y(_205_)
  );
  NOR _476_ (
    .A(_090_),
    .B(_088_),
    .Y(_206_)
  );
  NOR _477_ (
    .A(_206_),
    .B(_205_),
    .Y(_207_)
  );
  NOT _478_ (
    .A(_207_),
    .Y(_208_)
  );
  NAND _479_ (
    .A(_208_),
    .B(_202_),
    .Y(_209_)
  );
  NOR _480_ (
    .A(_196_),
    .B(_190_),
    .Y(_210_)
  );
  NAND _481_ (
    .A(_207_),
    .B(_210_),
    .Y(_211_)
  );
  NAND _482_ (
    .A(_211_),
    .B(_209_),
    .Y(_096_)
  );
  NOT _483_ (
    .A(_099_),
    .Y(_212_)
  );
  NOT _484_ (
    .A(_101_),
    .Y(_213_)
  );
  NOR _485_ (
    .A(_213_),
    .B(_212_),
    .Y(_214_)
  );
  NOR _486_ (
    .A(_101_),
    .B(_099_),
    .Y(_215_)
  );
  NOR _487_ (
    .A(_215_),
    .B(_214_),
    .Y(_216_)
  );
  NOT _488_ (
    .A(_216_),
    .Y(_217_)
  );
  NOR _489_ (
    .A(_206_),
    .B(_210_),
    .Y(_218_)
  );
  NOR _490_ (
    .A(_218_),
    .B(_205_),
    .Y(_219_)
  );
  NOR _491_ (
    .A(_219_),
    .B(_217_),
    .Y(_220_)
  );
  NOR _492_ (
    .A(_205_),
    .B(_202_),
    .Y(_222_)
  );
  NOR _493_ (
    .A(_222_),
    .B(_206_),
    .Y(_223_)
  );
  NOR _494_ (
    .A(_223_),
    .B(_216_),
    .Y(_224_)
  );
  NOR _495_ (
    .A(_224_),
    .B(_220_),
    .Y(_108_)
  );
  NOT _496_ (
    .A(_214_),
    .Y(_225_)
  );
  NAND _497_ (
    .A(_223_),
    .B(_216_),
    .Y(_226_)
  );
  NAND _498_ (
    .A(_226_),
    .B(_225_),
    .Y(_227_)
  );
  NOT _499_ (
    .A(_110_),
    .Y(_228_)
  );
  NOT _500_ (
    .A(_112_),
    .Y(_229_)
  );
  NOR _501_ (
    .A(_229_),
    .B(_228_),
    .Y(_230_)
  );
  NOR _502_ (
    .A(_112_),
    .B(_110_),
    .Y(_232_)
  );
  NOR _503_ (
    .A(_232_),
    .B(_230_),
    .Y(_233_)
  );
  NOT _504_ (
    .A(_233_),
    .Y(_234_)
  );
  NAND _505_ (
    .A(_234_),
    .B(_227_),
    .Y(_235_)
  );
  NOR _506_ (
    .A(_220_),
    .B(_214_),
    .Y(_236_)
  );
  NAND _507_ (
    .A(_233_),
    .B(_236_),
    .Y(_237_)
  );
  NAND _508_ (
    .A(_237_),
    .B(_235_),
    .Y(_117_)
  );
  NOR _509_ (
    .A(_230_),
    .B(_227_),
    .Y(_238_)
  );
  NOR _510_ (
    .A(_238_),
    .B(_232_),
    .Y(_126_)
  );
  assign _082_ = in2[0];
  assign _083_ = in1[0];
  assign _240_ = cin;
  assign out[0] = _246_;
  assign _250_ = in2[1];
  assign _264_ = in1[1];
  assign out[1] = _084_;
  assign _098_ = in2[2];
  assign _113_ = in1[2];
  assign out[2] = _153_;
  assign _163_ = in2[3];
  assign _174_ = in1[3];
  assign out[3] = _221_;
  assign _231_ = in2[4];
  assign _239_ = in1[4];
  assign out[4] = _241_;
  assign _242_ = in2[5];
  assign _243_ = in1[5];
  assign out[5] = _244_;
  assign _245_ = in2[6];
  assign _247_ = in1[6];
  assign out[6] = _248_;
  assign _249_ = in2[7];
  assign _251_ = in1[7];
  assign out[7] = _256_;
  assign _258_ = in2[8];
  assign _260_ = in1[8];
  assign out[8] = _271_;
  assign _273_ = in2[9];
  assign _275_ = in1[9];
  assign out[9] = _280_;
  assign _282_ = in2[10];
  assign _284_ = in1[10];
  assign out[10] = _293_;
  assign _294_ = in2[11];
  assign _296_ = in1[11];
  assign out[11] = _301_;
  assign _303_ = in2[12];
  assign _305_ = in1[12];
  assign out[12] = _086_;
  assign _088_ = in2[13];
  assign _090_ = in1[13];
  assign out[13] = _096_;
  assign _099_ = in2[14];
  assign _101_ = in1[14];
  assign out[14] = _108_;
  assign _110_ = in2[15];
  assign _112_ = in1[15];
  assign out[15] = _117_;
  assign co = _126_;
endmodule

module allinv(a, outF);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  input [15:0] a;
  output [15:0] outF;
  NOT _32_ (
    .A(_00_),
    .Y(_01_)
  );
  NOT _33_ (
    .A(_12_),
    .Y(_23_)
  );
  NOT _34_ (
    .A(_26_),
    .Y(_27_)
  );
  NOT _35_ (
    .A(_28_),
    .Y(_29_)
  );
  NOT _36_ (
    .A(_30_),
    .Y(_31_)
  );
  NOT _37_ (
    .A(_02_),
    .Y(_03_)
  );
  NOT _38_ (
    .A(_04_),
    .Y(_05_)
  );
  NOT _39_ (
    .A(_06_),
    .Y(_07_)
  );
  NOT _40_ (
    .A(_08_),
    .Y(_09_)
  );
  NOT _41_ (
    .A(_10_),
    .Y(_11_)
  );
  NOT _42_ (
    .A(_13_),
    .Y(_14_)
  );
  NOT _43_ (
    .A(_15_),
    .Y(_16_)
  );
  NOT _44_ (
    .A(_17_),
    .Y(_18_)
  );
  NOT _45_ (
    .A(_19_),
    .Y(_20_)
  );
  NOT _46_ (
    .A(_21_),
    .Y(_22_)
  );
  NOT _47_ (
    .A(_24_),
    .Y(_25_)
  );
  assign _00_ = a[0];
  assign outF[0] = _01_;
  assign _12_ = a[1];
  assign outF[1] = _23_;
  assign _26_ = a[2];
  assign outF[2] = _27_;
  assign _28_ = a[3];
  assign outF[3] = _29_;
  assign _30_ = a[4];
  assign outF[4] = _31_;
  assign _02_ = a[5];
  assign outF[5] = _03_;
  assign _04_ = a[6];
  assign outF[6] = _05_;
  assign _06_ = a[7];
  assign outF[7] = _07_;
  assign _08_ = a[8];
  assign outF[8] = _09_;
  assign _10_ = a[9];
  assign outF[9] = _11_;
  assign _13_ = a[10];
  assign outF[10] = _14_;
  assign _15_ = a[11];
  assign outF[11] = _16_;
  assign _17_ = a[12];
  assign outF[12] = _18_;
  assign _19_ = a[13];
  assign outF[13] = _20_;
  assign _21_ = a[14];
  assign outF[14] = _22_;
  assign _24_ = a[15];
  assign outF[15] = _25_;
endmodule

module allor(a, outF);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  wire _23_;
  wire _24_;
  wire _25_;
  wire _26_;
  wire _27_;
  wire _28_;
  wire _29_;
  wire _30_;
  wire _31_;
  wire _32_;
  wire _33_;
  wire _34_;
  wire _35_;
  wire _36_;
  wire _37_;
  wire _38_;
  wire _39_;
  wire _40_;
  wire _41_;
  wire _42_;
  wire _43_;
  wire _44_;
  input [15:0] a;
  output outF;
  NOR _45_ (
    .A(_16_),
    .B(_44_),
    .Y(_21_)
  );
  NOR _46_ (
    .A(_42_),
    .B(_14_),
    .Y(_23_)
  );
  NAND _47_ (
    .A(_23_),
    .B(_21_),
    .Y(_24_)
  );
  NOR _48_ (
    .A(_33_),
    .B(_26_),
    .Y(_25_)
  );
  NOR _49_ (
    .A(_20_),
    .B(_19_),
    .Y(_27_)
  );
  NAND _50_ (
    .A(_27_),
    .B(_25_),
    .Y(_29_)
  );
  NOR _51_ (
    .A(_29_),
    .B(_24_),
    .Y(_30_)
  );
  NOR _52_ (
    .A(_17_),
    .B(_43_),
    .Y(_32_)
  );
  NOR _53_ (
    .A(_38_),
    .B(_15_),
    .Y(_34_)
  );
  NAND _54_ (
    .A(_34_),
    .B(_32_),
    .Y(_35_)
  );
  NOR _55_ (
    .A(_31_),
    .B(_28_),
    .Y(_36_)
  );
  NOR _56_ (
    .A(_22_),
    .B(_18_),
    .Y(_37_)
  );
  NAND _57_ (
    .A(_37_),
    .B(_36_),
    .Y(_40_)
  );
  NOR _58_ (
    .A(_40_),
    .B(_35_),
    .Y(_41_)
  );
  NAND _59_ (
    .A(_41_),
    .B(_30_),
    .Y(_39_)
  );
  assign _14_ = a[10];
  assign _15_ = a[11];
  assign _38_ = a[8];
  assign _42_ = a[9];
  assign _43_ = a[14];
  assign _44_ = a[15];
  assign _16_ = a[12];
  assign _17_ = a[13];
  assign _18_ = a[2];
  assign _19_ = a[3];
  assign _20_ = a[0];
  assign _22_ = a[1];
  assign _26_ = a[6];
  assign _28_ = a[7];
  assign _31_ = a[4];
  assign _33_ = a[5];
  assign outF = _39_;
endmodule

module and16(a, b, outF);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  input [15:0] a;
  input [15:0] b;
  output [15:0] outF;
  NOR _080_ (
    .A(_068_),
    .B(_066_),
    .Y(_026_)
  );
  NOT _081_ (
    .A(_027_),
    .Y(_069_)
  );
  NOT _082_ (
    .A(_028_),
    .Y(_070_)
  );
  NOR _083_ (
    .A(_070_),
    .B(_069_),
    .Y(_029_)
  );
  NOT _084_ (
    .A(_030_),
    .Y(_071_)
  );
  NOT _085_ (
    .A(_031_),
    .Y(_072_)
  );
  NOR _086_ (
    .A(_072_),
    .B(_071_),
    .Y(_032_)
  );
  NOT _087_ (
    .A(_033_),
    .Y(_073_)
  );
  NOT _088_ (
    .A(_035_),
    .Y(_074_)
  );
  NOR _089_ (
    .A(_074_),
    .B(_073_),
    .Y(_036_)
  );
  NOT _090_ (
    .A(_037_),
    .Y(_076_)
  );
  NOT _091_ (
    .A(_038_),
    .Y(_077_)
  );
  NOR _092_ (
    .A(_077_),
    .B(_076_),
    .Y(_039_)
  );
  NOT _093_ (
    .A(_040_),
    .Y(_078_)
  );
  NOT _094_ (
    .A(_041_),
    .Y(_079_)
  );
  NOR _095_ (
    .A(_079_),
    .B(_078_),
    .Y(_042_)
  );
  NOT _096_ (
    .A(_000_),
    .Y(_043_)
  );
  NOT _097_ (
    .A(_001_),
    .Y(_045_)
  );
  NOR _098_ (
    .A(_045_),
    .B(_043_),
    .Y(_012_)
  );
  NOT _099_ (
    .A(_023_),
    .Y(_046_)
  );
  NOT _100_ (
    .A(_034_),
    .Y(_047_)
  );
  NOR _101_ (
    .A(_047_),
    .B(_046_),
    .Y(_044_)
  );
  NOT _102_ (
    .A(_052_),
    .Y(_048_)
  );
  NOT _103_ (
    .A(_059_),
    .Y(_049_)
  );
  NOR _104_ (
    .A(_049_),
    .B(_048_),
    .Y(_067_)
  );
  NOT _105_ (
    .A(_075_),
    .Y(_050_)
  );
  NOT _106_ (
    .A(_002_),
    .Y(_051_)
  );
  NOR _107_ (
    .A(_051_),
    .B(_050_),
    .Y(_003_)
  );
  NOT _108_ (
    .A(_004_),
    .Y(_053_)
  );
  NOT _109_ (
    .A(_005_),
    .Y(_054_)
  );
  NOR _110_ (
    .A(_054_),
    .B(_053_),
    .Y(_006_)
  );
  NOT _111_ (
    .A(_007_),
    .Y(_055_)
  );
  NOT _112_ (
    .A(_008_),
    .Y(_056_)
  );
  NOR _113_ (
    .A(_056_),
    .B(_055_),
    .Y(_009_)
  );
  NOT _114_ (
    .A(_010_),
    .Y(_057_)
  );
  NOT _115_ (
    .A(_011_),
    .Y(_058_)
  );
  NOR _116_ (
    .A(_058_),
    .B(_057_),
    .Y(_013_)
  );
  NOT _117_ (
    .A(_014_),
    .Y(_060_)
  );
  NOT _118_ (
    .A(_015_),
    .Y(_061_)
  );
  NOR _119_ (
    .A(_061_),
    .B(_060_),
    .Y(_016_)
  );
  NOT _120_ (
    .A(_017_),
    .Y(_062_)
  );
  NOT _121_ (
    .A(_018_),
    .Y(_063_)
  );
  NOR _122_ (
    .A(_063_),
    .B(_062_),
    .Y(_019_)
  );
  NOT _123_ (
    .A(_020_),
    .Y(_064_)
  );
  NOT _124_ (
    .A(_021_),
    .Y(_065_)
  );
  NOR _125_ (
    .A(_065_),
    .B(_064_),
    .Y(_022_)
  );
  NOT _126_ (
    .A(_024_),
    .Y(_066_)
  );
  NOT _127_ (
    .A(_025_),
    .Y(_068_)
  );
  assign _000_ = b[0];
  assign _001_ = a[0];
  assign outF[0] = _012_;
  assign _023_ = b[1];
  assign _034_ = a[1];
  assign outF[1] = _044_;
  assign _052_ = b[2];
  assign _059_ = a[2];
  assign outF[2] = _067_;
  assign _075_ = b[3];
  assign _002_ = a[3];
  assign outF[3] = _003_;
  assign _004_ = b[4];
  assign _005_ = a[4];
  assign outF[4] = _006_;
  assign _007_ = b[5];
  assign _008_ = a[5];
  assign outF[5] = _009_;
  assign _010_ = b[6];
  assign _011_ = a[6];
  assign outF[6] = _013_;
  assign _014_ = b[7];
  assign _015_ = a[7];
  assign outF[7] = _016_;
  assign _017_ = b[8];
  assign _018_ = a[8];
  assign outF[8] = _019_;
  assign _020_ = b[9];
  assign _021_ = a[9];
  assign outF[9] = _022_;
  assign _024_ = b[10];
  assign _025_ = a[10];
  assign outF[10] = _026_;
  assign _027_ = b[11];
  assign _028_ = a[11];
  assign outF[11] = _029_;
  assign _030_ = b[12];
  assign _031_ = a[12];
  assign outF[12] = _032_;
  assign _033_ = b[13];
  assign _035_ = a[13];
  assign outF[13] = _036_;
  assign _037_ = b[14];
  assign _038_ = a[14];
  assign outF[14] = _039_;
  assign _040_ = b[15];
  assign _041_ = a[15];
  assign outF[15] = _042_;
endmodule

module mux16bit(a, b, c, d, select, outF);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  wire _151_;
  wire _152_;
  wire _153_;
  wire _154_;
  wire _155_;
  wire _156_;
  wire _157_;
  wire _158_;
  wire _159_;
  wire _160_;
  wire _161_;
  wire _162_;
  wire _163_;
  wire _164_;
  wire _165_;
  wire _166_;
  wire _167_;
  wire _168_;
  wire _169_;
  wire _170_;
  wire _171_;
  wire _172_;
  wire _173_;
  wire _174_;
  wire _175_;
  wire _176_;
  wire _177_;
  wire _178_;
  wire _179_;
  wire _180_;
  wire _181_;
  wire _182_;
  wire _183_;
  wire _184_;
  wire _185_;
  wire _186_;
  wire _187_;
  wire _188_;
  wire _189_;
  wire _190_;
  wire _191_;
  wire _192_;
  wire _193_;
  wire _194_;
  wire _195_;
  wire _196_;
  wire _197_;
  wire _198_;
  wire _199_;
  wire _200_;
  wire _201_;
  wire _202_;
  wire _203_;
  wire _204_;
  wire _205_;
  wire _206_;
  wire _207_;
  wire _208_;
  wire _209_;
  wire _210_;
  wire _211_;
  wire _212_;
  wire _213_;
  wire _214_;
  wire _215_;
  wire _216_;
  wire _217_;
  wire _218_;
  wire _219_;
  wire _220_;
  wire _221_;
  wire _222_;
  wire _223_;
  wire _224_;
  wire _225_;
  wire _226_;
  wire _227_;
  wire _228_;
  wire _229_;
  wire _230_;
  wire _231_;
  wire _232_;
  wire _233_;
  wire _234_;
  wire _235_;
  wire _236_;
  wire _237_;
  wire _238_;
  wire _239_;
  wire _240_;
  wire _241_;
  wire _242_;
  wire _243_;
  wire _244_;
  wire _245_;
  wire _246_;
  wire _247_;
  wire _248_;
  wire _249_;
  wire _250_;
  wire _251_;
  wire _252_;
  wire _253_;
  wire _254_;
  wire _255_;
  wire _256_;
  wire _257_;
  wire _258_;
  wire _259_;
  wire _260_;
  wire _261_;
  wire _262_;
  wire _263_;
  wire _264_;
  wire _265_;
  wire _266_;
  wire _267_;
  wire _268_;
  input [15:0] a;
  input [15:0] b;
  input [15:0] c;
  input [15:0] d;
  output [15:0] outF;
  input [1:0] select;
  NOT _269_ (
    .A(_000_),
    .Y(_205_)
  );
  NOT _270_ (
    .A(_001_),
    .Y(_207_)
  );
  NAND _271_ (
    .A(_207_),
    .B(_205_),
    .Y(_208_)
  );
  NOR _272_ (
    .A(_208_),
    .B(_018_),
    .Y(_210_)
  );
  NOT _273_ (
    .A(_194_),
    .Y(_211_)
  );
  NAND _274_ (
    .A(_001_),
    .B(_205_),
    .Y(_213_)
  );
  NAND _275_ (
    .A(_207_),
    .B(_000_),
    .Y(_215_)
  );
  NAND _276_ (
    .A(_215_),
    .B(_213_),
    .Y(_218_)
  );
  NOR _277_ (
    .A(_218_),
    .B(_211_),
    .Y(_220_)
  );
  NOR _278_ (
    .A(_001_),
    .B(_205_),
    .Y(_221_)
  );
  NAND _279_ (
    .A(_221_),
    .B(_185_),
    .Y(_223_)
  );
  NOT _280_ (
    .A(_216_),
    .Y(_224_)
  );
  NAND _281_ (
    .A(_224_),
    .B(_001_),
    .Y(_226_)
  );
  NAND _282_ (
    .A(_226_),
    .B(_205_),
    .Y(_228_)
  );
  NAND _283_ (
    .A(_228_),
    .B(_223_),
    .Y(_230_)
  );
  NOR _284_ (
    .A(_230_),
    .B(_220_),
    .Y(_232_)
  );
  NOR _285_ (
    .A(_232_),
    .B(_210_),
    .Y(_034_)
  );
  NOR _286_ (
    .A(_208_),
    .B(_092_),
    .Y(_003_)
  );
  NOT _287_ (
    .A(_054_),
    .Y(_004_)
  );
  NOR _288_ (
    .A(_218_),
    .B(_004_),
    .Y(_006_)
  );
  NAND _289_ (
    .A(_221_),
    .B(_044_),
    .Y(_008_)
  );
  NOT _290_ (
    .A(_073_),
    .Y(_010_)
  );
  NAND _291_ (
    .A(_010_),
    .B(_001_),
    .Y(_012_)
  );
  NAND _292_ (
    .A(_012_),
    .B(_205_),
    .Y(_013_)
  );
  NAND _293_ (
    .A(_013_),
    .B(_008_),
    .Y(_015_)
  );
  NOR _294_ (
    .A(_015_),
    .B(_006_),
    .Y(_016_)
  );
  NOR _295_ (
    .A(_016_),
    .B(_003_),
    .Y(_102_)
  );
  NOR _296_ (
    .A(_208_),
    .B(_160_),
    .Y(_020_)
  );
  NOT _297_ (
    .A(_122_),
    .Y(_022_)
  );
  NOR _298_ (
    .A(_218_),
    .B(_022_),
    .Y(_024_)
  );
  NAND _299_ (
    .A(_221_),
    .B(_112_),
    .Y(_025_)
  );
  NOT _300_ (
    .A(_141_),
    .Y(_027_)
  );
  NAND _301_ (
    .A(_027_),
    .B(_001_),
    .Y(_028_)
  );
  NAND _302_ (
    .A(_028_),
    .B(_205_),
    .Y(_030_)
  );
  NAND _303_ (
    .A(_030_),
    .B(_025_),
    .Y(_032_)
  );
  NOR _304_ (
    .A(_032_),
    .B(_024_),
    .Y(_033_)
  );
  NOR _305_ (
    .A(_033_),
    .B(_020_),
    .Y(_161_)
  );
  NOR _306_ (
    .A(_208_),
    .B(_165_),
    .Y(_035_)
  );
  NOT _307_ (
    .A(_163_),
    .Y(_036_)
  );
  NOR _308_ (
    .A(_218_),
    .B(_036_),
    .Y(_037_)
  );
  NAND _309_ (
    .A(_221_),
    .B(_162_),
    .Y(_038_)
  );
  NOT _310_ (
    .A(_164_),
    .Y(_039_)
  );
  NAND _311_ (
    .A(_039_),
    .B(_001_),
    .Y(_040_)
  );
  NAND _312_ (
    .A(_040_),
    .B(_205_),
    .Y(_041_)
  );
  NAND _313_ (
    .A(_041_),
    .B(_038_),
    .Y(_042_)
  );
  NOR _314_ (
    .A(_042_),
    .B(_037_),
    .Y(_043_)
  );
  NOR _315_ (
    .A(_043_),
    .B(_035_),
    .Y(_166_)
  );
  NOR _316_ (
    .A(_208_),
    .B(_170_),
    .Y(_045_)
  );
  NOT _317_ (
    .A(_168_),
    .Y(_046_)
  );
  NOR _318_ (
    .A(_218_),
    .B(_046_),
    .Y(_047_)
  );
  NAND _319_ (
    .A(_221_),
    .B(_167_),
    .Y(_048_)
  );
  NOT _320_ (
    .A(_169_),
    .Y(_049_)
  );
  NAND _321_ (
    .A(_049_),
    .B(_001_),
    .Y(_050_)
  );
  NAND _322_ (
    .A(_050_),
    .B(_205_),
    .Y(_051_)
  );
  NAND _323_ (
    .A(_051_),
    .B(_048_),
    .Y(_052_)
  );
  NOR _324_ (
    .A(_052_),
    .B(_047_),
    .Y(_053_)
  );
  NOR _325_ (
    .A(_053_),
    .B(_045_),
    .Y(_171_)
  );
  NOR _326_ (
    .A(_208_),
    .B(_175_),
    .Y(_055_)
  );
  NOT _327_ (
    .A(_173_),
    .Y(_056_)
  );
  NOR _328_ (
    .A(_218_),
    .B(_056_),
    .Y(_057_)
  );
  NAND _329_ (
    .A(_221_),
    .B(_172_),
    .Y(_058_)
  );
  NOT _330_ (
    .A(_174_),
    .Y(_059_)
  );
  NAND _331_ (
    .A(_059_),
    .B(_001_),
    .Y(_060_)
  );
  NAND _332_ (
    .A(_060_),
    .B(_205_),
    .Y(_061_)
  );
  NAND _333_ (
    .A(_061_),
    .B(_058_),
    .Y(_062_)
  );
  NOR _334_ (
    .A(_062_),
    .B(_057_),
    .Y(_063_)
  );
  NOR _335_ (
    .A(_063_),
    .B(_055_),
    .Y(_176_)
  );
  NOR _336_ (
    .A(_208_),
    .B(_180_),
    .Y(_064_)
  );
  NOT _337_ (
    .A(_178_),
    .Y(_065_)
  );
  NOR _338_ (
    .A(_218_),
    .B(_065_),
    .Y(_066_)
  );
  NAND _339_ (
    .A(_221_),
    .B(_177_),
    .Y(_067_)
  );
  NOT _340_ (
    .A(_179_),
    .Y(_068_)
  );
  NAND _341_ (
    .A(_068_),
    .B(_001_),
    .Y(_069_)
  );
  NAND _342_ (
    .A(_069_),
    .B(_205_),
    .Y(_070_)
  );
  NAND _343_ (
    .A(_070_),
    .B(_067_),
    .Y(_071_)
  );
  NOR _344_ (
    .A(_071_),
    .B(_066_),
    .Y(_072_)
  );
  NOR _345_ (
    .A(_072_),
    .B(_064_),
    .Y(_181_)
  );
  NOR _346_ (
    .A(_208_),
    .B(_186_),
    .Y(_074_)
  );
  NOT _347_ (
    .A(_183_),
    .Y(_075_)
  );
  NOR _348_ (
    .A(_218_),
    .B(_075_),
    .Y(_076_)
  );
  NAND _349_ (
    .A(_221_),
    .B(_182_),
    .Y(_077_)
  );
  NOT _350_ (
    .A(_184_),
    .Y(_078_)
  );
  NAND _351_ (
    .A(_078_),
    .B(_001_),
    .Y(_079_)
  );
  NAND _352_ (
    .A(_079_),
    .B(_205_),
    .Y(_080_)
  );
  NAND _353_ (
    .A(_080_),
    .B(_077_),
    .Y(_081_)
  );
  NOR _354_ (
    .A(_081_),
    .B(_076_),
    .Y(_082_)
  );
  NOR _355_ (
    .A(_082_),
    .B(_074_),
    .Y(_187_)
  );
  NOR _356_ (
    .A(_208_),
    .B(_191_),
    .Y(_083_)
  );
  NOT _357_ (
    .A(_189_),
    .Y(_084_)
  );
  NOR _358_ (
    .A(_218_),
    .B(_084_),
    .Y(_085_)
  );
  NAND _359_ (
    .A(_221_),
    .B(_188_),
    .Y(_086_)
  );
  NOT _360_ (
    .A(_190_),
    .Y(_087_)
  );
  NAND _361_ (
    .A(_087_),
    .B(_001_),
    .Y(_088_)
  );
  NAND _362_ (
    .A(_088_),
    .B(_205_),
    .Y(_089_)
  );
  NAND _363_ (
    .A(_089_),
    .B(_086_),
    .Y(_090_)
  );
  NOR _364_ (
    .A(_090_),
    .B(_085_),
    .Y(_091_)
  );
  NOR _365_ (
    .A(_091_),
    .B(_083_),
    .Y(_192_)
  );
  NOR _366_ (
    .A(_208_),
    .B(_197_),
    .Y(_093_)
  );
  NOT _367_ (
    .A(_195_),
    .Y(_094_)
  );
  NOR _368_ (
    .A(_218_),
    .B(_094_),
    .Y(_095_)
  );
  NAND _369_ (
    .A(_221_),
    .B(_193_),
    .Y(_096_)
  );
  NOT _370_ (
    .A(_196_),
    .Y(_097_)
  );
  NAND _371_ (
    .A(_097_),
    .B(_001_),
    .Y(_098_)
  );
  NAND _372_ (
    .A(_098_),
    .B(_205_),
    .Y(_099_)
  );
  NAND _373_ (
    .A(_099_),
    .B(_096_),
    .Y(_100_)
  );
  NOR _374_ (
    .A(_100_),
    .B(_095_),
    .Y(_101_)
  );
  NOR _375_ (
    .A(_101_),
    .B(_093_),
    .Y(_198_)
  );
  NOR _376_ (
    .A(_208_),
    .B(_202_),
    .Y(_103_)
  );
  NOT _377_ (
    .A(_200_),
    .Y(_104_)
  );
  NOR _378_ (
    .A(_218_),
    .B(_104_),
    .Y(_105_)
  );
  NAND _379_ (
    .A(_221_),
    .B(_199_),
    .Y(_106_)
  );
  NOT _380_ (
    .A(_201_),
    .Y(_107_)
  );
  NAND _381_ (
    .A(_107_),
    .B(_001_),
    .Y(_108_)
  );
  NAND _382_ (
    .A(_108_),
    .B(_205_),
    .Y(_109_)
  );
  NAND _383_ (
    .A(_109_),
    .B(_106_),
    .Y(_110_)
  );
  NOR _384_ (
    .A(_110_),
    .B(_105_),
    .Y(_111_)
  );
  NOR _385_ (
    .A(_111_),
    .B(_103_),
    .Y(_203_)
  );
  NOR _386_ (
    .A(_208_),
    .B(_212_),
    .Y(_113_)
  );
  NOT _387_ (
    .A(_206_),
    .Y(_114_)
  );
  NOR _388_ (
    .A(_218_),
    .B(_114_),
    .Y(_115_)
  );
  NAND _389_ (
    .A(_221_),
    .B(_204_),
    .Y(_116_)
  );
  NOT _390_ (
    .A(_209_),
    .Y(_117_)
  );
  NAND _391_ (
    .A(_117_),
    .B(_001_),
    .Y(_118_)
  );
  NAND _392_ (
    .A(_118_),
    .B(_205_),
    .Y(_119_)
  );
  NAND _393_ (
    .A(_119_),
    .B(_116_),
    .Y(_120_)
  );
  NOR _394_ (
    .A(_120_),
    .B(_115_),
    .Y(_121_)
  );
  NOR _395_ (
    .A(_121_),
    .B(_113_),
    .Y(_214_)
  );
  NOR _396_ (
    .A(_208_),
    .B(_225_),
    .Y(_123_)
  );
  NOT _397_ (
    .A(_219_),
    .Y(_124_)
  );
  NOR _398_ (
    .A(_218_),
    .B(_124_),
    .Y(_125_)
  );
  NAND _399_ (
    .A(_221_),
    .B(_217_),
    .Y(_126_)
  );
  NOT _400_ (
    .A(_222_),
    .Y(_127_)
  );
  NAND _401_ (
    .A(_127_),
    .B(_001_),
    .Y(_128_)
  );
  NAND _402_ (
    .A(_128_),
    .B(_205_),
    .Y(_129_)
  );
  NAND _403_ (
    .A(_129_),
    .B(_126_),
    .Y(_130_)
  );
  NOR _404_ (
    .A(_130_),
    .B(_125_),
    .Y(_131_)
  );
  NOR _405_ (
    .A(_131_),
    .B(_123_),
    .Y(_227_)
  );
  NOR _406_ (
    .A(_208_),
    .B(_005_),
    .Y(_132_)
  );
  NOT _407_ (
    .A(_231_),
    .Y(_133_)
  );
  NOR _408_ (
    .A(_218_),
    .B(_133_),
    .Y(_134_)
  );
  NAND _409_ (
    .A(_221_),
    .B(_229_),
    .Y(_135_)
  );
  NOT _410_ (
    .A(_002_),
    .Y(_136_)
  );
  NAND _411_ (
    .A(_136_),
    .B(_001_),
    .Y(_137_)
  );
  NAND _412_ (
    .A(_137_),
    .B(_205_),
    .Y(_138_)
  );
  NAND _413_ (
    .A(_138_),
    .B(_135_),
    .Y(_139_)
  );
  NOR _414_ (
    .A(_139_),
    .B(_134_),
    .Y(_140_)
  );
  NOR _415_ (
    .A(_140_),
    .B(_132_),
    .Y(_007_)
  );
  NOR _416_ (
    .A(_208_),
    .B(_017_),
    .Y(_142_)
  );
  NOT _417_ (
    .A(_011_),
    .Y(_143_)
  );
  NOR _418_ (
    .A(_218_),
    .B(_143_),
    .Y(_144_)
  );
  NAND _419_ (
    .A(_221_),
    .B(_009_),
    .Y(_145_)
  );
  NOT _420_ (
    .A(_014_),
    .Y(_146_)
  );
  NAND _421_ (
    .A(_146_),
    .B(_001_),
    .Y(_147_)
  );
  NAND _422_ (
    .A(_147_),
    .B(_205_),
    .Y(_148_)
  );
  NAND _423_ (
    .A(_148_),
    .B(_145_),
    .Y(_149_)
  );
  NOR _424_ (
    .A(_149_),
    .B(_144_),
    .Y(_150_)
  );
  NOR _425_ (
    .A(_150_),
    .B(_142_),
    .Y(_019_)
  );
  NOR _426_ (
    .A(_208_),
    .B(_029_),
    .Y(_151_)
  );
  NOT _427_ (
    .A(_023_),
    .Y(_152_)
  );
  NOR _428_ (
    .A(_218_),
    .B(_152_),
    .Y(_153_)
  );
  NAND _429_ (
    .A(_221_),
    .B(_021_),
    .Y(_154_)
  );
  NOT _430_ (
    .A(_026_),
    .Y(_155_)
  );
  NAND _431_ (
    .A(_155_),
    .B(_001_),
    .Y(_156_)
  );
  NAND _432_ (
    .A(_156_),
    .B(_205_),
    .Y(_157_)
  );
  NAND _433_ (
    .A(_157_),
    .B(_154_),
    .Y(_158_)
  );
  NOR _434_ (
    .A(_158_),
    .B(_153_),
    .Y(_159_)
  );
  NOR _435_ (
    .A(_159_),
    .B(_151_),
    .Y(_031_)
  );
  assign _000_ = select[1];
  assign _001_ = select[0];
  assign _185_ = c[0];
  assign _194_ = d[0];
  assign _216_ = b[0];
  assign _018_ = a[0];
  assign outF[0] = _034_;
  assign _044_ = c[1];
  assign _054_ = d[1];
  assign _073_ = b[1];
  assign _092_ = a[1];
  assign outF[1] = _102_;
  assign _112_ = c[2];
  assign _122_ = d[2];
  assign _141_ = b[2];
  assign _160_ = a[2];
  assign outF[2] = _161_;
  assign _162_ = c[3];
  assign _163_ = d[3];
  assign _164_ = b[3];
  assign _165_ = a[3];
  assign outF[3] = _166_;
  assign _167_ = c[4];
  assign _168_ = d[4];
  assign _169_ = b[4];
  assign _170_ = a[4];
  assign outF[4] = _171_;
  assign _172_ = c[5];
  assign _173_ = d[5];
  assign _174_ = b[5];
  assign _175_ = a[5];
  assign outF[5] = _176_;
  assign _177_ = c[6];
  assign _178_ = d[6];
  assign _179_ = b[6];
  assign _180_ = a[6];
  assign outF[6] = _181_;
  assign _182_ = c[7];
  assign _183_ = d[7];
  assign _184_ = b[7];
  assign _186_ = a[7];
  assign outF[7] = _187_;
  assign _188_ = c[8];
  assign _189_ = d[8];
  assign _190_ = b[8];
  assign _191_ = a[8];
  assign outF[8] = _192_;
  assign _193_ = c[9];
  assign _195_ = d[9];
  assign _196_ = b[9];
  assign _197_ = a[9];
  assign outF[9] = _198_;
  assign _199_ = c[10];
  assign _200_ = d[10];
  assign _201_ = b[10];
  assign _202_ = a[10];
  assign outF[10] = _203_;
  assign _204_ = c[11];
  assign _206_ = d[11];
  assign _209_ = b[11];
  assign _212_ = a[11];
  assign outF[11] = _214_;
  assign _217_ = c[12];
  assign _219_ = d[12];
  assign _222_ = b[12];
  assign _225_ = a[12];
  assign outF[12] = _227_;
  assign _229_ = c[13];
  assign _231_ = d[13];
  assign _002_ = b[13];
  assign _005_ = a[13];
  assign outF[13] = _007_;
  assign _009_ = c[14];
  assign _011_ = d[14];
  assign _014_ = b[14];
  assign _017_ = a[14];
  assign outF[14] = _019_;
  assign _021_ = c[15];
  assign _023_ = d[15];
  assign _026_ = b[15];
  assign _029_ = a[15];
  assign outF[15] = _031_;
endmodule

module mux2to1(a, b, select, outF);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  input a;
  input b;
  output outF;
  input select;
  NOR _07_ (
    .A(_02_),
    .B(_00_),
    .Y(_04_)
  );
  NOT _08_ (
    .A(_02_),
    .Y(_05_)
  );
  NOR _09_ (
    .A(_05_),
    .B(_01_),
    .Y(_06_)
  );
  NOR _10_ (
    .A(_06_),
    .B(_04_),
    .Y(_03_)
  );
  assign _00_ = a;
  assign _01_ = b;
  assign _02_ = select;
  assign outF = _03_;
endmodule

module or16(a, b, outF);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  input [15:0] a;
  input [15:0] b;
  output [15:0] outF;
  NOT _080_ (
    .A(_000_),
    .Y(_043_)
  );
  NOT _081_ (
    .A(_001_),
    .Y(_045_)
  );
  NAND _082_ (
    .A(_045_),
    .B(_043_),
    .Y(_012_)
  );
  NOT _083_ (
    .A(_023_),
    .Y(_046_)
  );
  NOT _084_ (
    .A(_034_),
    .Y(_047_)
  );
  NAND _085_ (
    .A(_047_),
    .B(_046_),
    .Y(_044_)
  );
  NOT _086_ (
    .A(_052_),
    .Y(_048_)
  );
  NOT _087_ (
    .A(_059_),
    .Y(_049_)
  );
  NAND _088_ (
    .A(_049_),
    .B(_048_),
    .Y(_067_)
  );
  NOT _089_ (
    .A(_075_),
    .Y(_050_)
  );
  NOT _090_ (
    .A(_002_),
    .Y(_051_)
  );
  NAND _091_ (
    .A(_051_),
    .B(_050_),
    .Y(_003_)
  );
  NOT _092_ (
    .A(_004_),
    .Y(_053_)
  );
  NOT _093_ (
    .A(_005_),
    .Y(_054_)
  );
  NAND _094_ (
    .A(_054_),
    .B(_053_),
    .Y(_006_)
  );
  NOT _095_ (
    .A(_007_),
    .Y(_055_)
  );
  NOT _096_ (
    .A(_008_),
    .Y(_056_)
  );
  NAND _097_ (
    .A(_056_),
    .B(_055_),
    .Y(_009_)
  );
  NOT _098_ (
    .A(_010_),
    .Y(_057_)
  );
  NOT _099_ (
    .A(_011_),
    .Y(_058_)
  );
  NAND _100_ (
    .A(_058_),
    .B(_057_),
    .Y(_013_)
  );
  NOT _101_ (
    .A(_014_),
    .Y(_060_)
  );
  NOT _102_ (
    .A(_015_),
    .Y(_061_)
  );
  NAND _103_ (
    .A(_061_),
    .B(_060_),
    .Y(_016_)
  );
  NOT _104_ (
    .A(_017_),
    .Y(_062_)
  );
  NOT _105_ (
    .A(_018_),
    .Y(_063_)
  );
  NAND _106_ (
    .A(_063_),
    .B(_062_),
    .Y(_019_)
  );
  NOT _107_ (
    .A(_020_),
    .Y(_064_)
  );
  NOT _108_ (
    .A(_021_),
    .Y(_065_)
  );
  NAND _109_ (
    .A(_065_),
    .B(_064_),
    .Y(_022_)
  );
  NOT _110_ (
    .A(_024_),
    .Y(_066_)
  );
  NOT _111_ (
    .A(_025_),
    .Y(_068_)
  );
  NAND _112_ (
    .A(_068_),
    .B(_066_),
    .Y(_026_)
  );
  NOT _113_ (
    .A(_027_),
    .Y(_069_)
  );
  NOT _114_ (
    .A(_028_),
    .Y(_070_)
  );
  NAND _115_ (
    .A(_070_),
    .B(_069_),
    .Y(_029_)
  );
  NOT _116_ (
    .A(_030_),
    .Y(_071_)
  );
  NOT _117_ (
    .A(_031_),
    .Y(_072_)
  );
  NAND _118_ (
    .A(_072_),
    .B(_071_),
    .Y(_032_)
  );
  NOT _119_ (
    .A(_033_),
    .Y(_073_)
  );
  NOT _120_ (
    .A(_035_),
    .Y(_074_)
  );
  NAND _121_ (
    .A(_074_),
    .B(_073_),
    .Y(_036_)
  );
  NOT _122_ (
    .A(_037_),
    .Y(_076_)
  );
  NOT _123_ (
    .A(_038_),
    .Y(_077_)
  );
  NAND _124_ (
    .A(_077_),
    .B(_076_),
    .Y(_039_)
  );
  NOT _125_ (
    .A(_040_),
    .Y(_078_)
  );
  NOT _126_ (
    .A(_041_),
    .Y(_079_)
  );
  NAND _127_ (
    .A(_079_),
    .B(_078_),
    .Y(_042_)
  );
  assign _000_ = b[0];
  assign _001_ = a[0];
  assign outF[0] = _012_;
  assign _023_ = b[1];
  assign _034_ = a[1];
  assign outF[1] = _044_;
  assign _052_ = b[2];
  assign _059_ = a[2];
  assign outF[2] = _067_;
  assign _075_ = b[3];
  assign _002_ = a[3];
  assign outF[3] = _003_;
  assign _004_ = b[4];
  assign _005_ = a[4];
  assign outF[4] = _006_;
  assign _007_ = b[5];
  assign _008_ = a[5];
  assign outF[5] = _009_;
  assign _010_ = b[6];
  assign _011_ = a[6];
  assign outF[6] = _013_;
  assign _014_ = b[7];
  assign _015_ = a[7];
  assign outF[7] = _016_;
  assign _017_ = b[8];
  assign _018_ = a[8];
  assign outF[8] = _019_;
  assign _020_ = b[9];
  assign _021_ = a[9];
  assign outF[9] = _022_;
  assign _024_ = b[10];
  assign _025_ = a[10];
  assign outF[10] = _026_;
  assign _027_ = b[11];
  assign _028_ = a[11];
  assign outF[11] = _029_;
  assign _030_ = b[12];
  assign _031_ = a[12];
  assign outF[12] = _032_;
  assign _033_ = b[13];
  assign _035_ = a[13];
  assign outF[13] = _036_;
  assign _037_ = b[14];
  assign _038_ = a[14];
  assign outF[14] = _039_;
  assign _040_ = b[15];
  assign _041_ = a[15];
  assign outF[15] = _042_;
endmodule

module shifter(in, out);
  input [15:0] in;
  output [15:0] out;
  assign out = { in[15], in[15:1] };
endmodule


module NOT(A, Y);
input A;
output Y;
assign Y = ~A;
endmodule

module NAND(A, B, Y);
input A, B;
output Y;
assign Y = ~(A & B);
endmodule

module NOR(A, B, Y);
input A, B;
output Y;
assign Y = ~(A | B);
endmodule

module DFF(C, D, Q);
input C, D;
output logic Q;
always @(posedge C)
	Q <= D;
endmodule

