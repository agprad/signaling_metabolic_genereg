model=modelOri;
model = changeRxnBounds(model,'EX_glc(e)',-18.5,'l');%maxglucoseuptake
model = changeRxnBounds(model,'EX_o2(e)',-1000,'l');%oxygenunlimited
model = changeObjective(model,'Biomass_Ecoli_core_N(w/GAM)-Nmet2');%objectivefunc
FBAsolution = optimizeCbModel(model,'max')
FBAsolution.f
FBAsolution.v
fluxData = FBAsolution.v;
nonZeroFlag = 1;
printFluxVector(model, fluxData, nonZeroFlag)
model = changeRxnBounds(model,'EX_o2(e)',0,'l');
FBAsolution2 = optimizeCbModel(model,'max');
FBAsolution2.f