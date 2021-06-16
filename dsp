interrupt void ISRTimer0();
void main()
{
InitSysCtrl();
DINT;
InitPieCtrl();
IER = 0X0000;
IFR = 0X0000;
InitPieVectTable();
EALLOW;
PieVectTable.TINT0 = &ISRTimer0;
EDIS;
InitCpuTimers();
ConfigCpuTimers(&CpuTimer0,150,500000);
StartCpuTimer0;
IER |= M_INT1;
PieCtrlRegs.PIECTRL.bit.ENPIE = 1;
PieCtrlRegs.PIEIER1.bit.INTx7 = 1;
EINT;
ERTM;
