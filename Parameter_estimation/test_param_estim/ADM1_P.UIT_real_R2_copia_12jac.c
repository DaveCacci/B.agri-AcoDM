/* Jacobians 22 */
#include "ADM1_P.UIT_real_R2_copia_model.h"
#include "ADM1_P.UIT_real_R2_copia_12jac.h"
#include "simulation/jacobian_util.h"
#include "util/omc_file.h"
/* constant equations */
/* dynamic equations */

/*
equation index: 462
type: SIMPLE_ASSIGN
uit.maize.outlet.S_ic.$pDERNLSJac2.dummyVarNLSJac2 = if uit.maize.liquid == false then 0.0 else uit.maize.S_hco3.SeedNLSJac2 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) * uit.maize.Ka_co2 / uit.maize.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_462(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,462};
  modelica_real tmp1;
  modelica_boolean tmp2;
  modelica_real tmp3;
  tmp2 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0));
  if(tmp2)
  {
    tmp3 = 0.0;
  }
  else
  {
    tmp1 = (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */);
    tmp3 = DIVISION(((jacobian->seedVars[0] /* uit.maize.S_hco3.SeedNLSJac2 SEED_VAR */) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h"))) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(tmp1 * tmp1),"uit.maize.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.maize.outlet.S_ic.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_DIFF_VAR */ = tmp3;
  TRACE_POP
}

/*
equation index: 463
type: SIMPLE_ASSIGN
uit.maize.S_co3.$pDERNLSJac2.dummyVarNLSJac2 = uit.maize.outlet.S_ic.$pDERNLSJac2.dummyVarNLSJac2 * uit.maize.Ka_hco3 / (uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_463(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,463};
  modelica_real tmp4;
  tmp4 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */);
  jacobian->tmpVars[1] /* uit.maize.S_co3.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.maize.outlet.S_ic.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),DIVISION((tmp4 * tmp4),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2") + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),"uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 464
type: SIMPLE_ASSIGN
$res_NLSJac2_1.$pDERNLSJac2.dummyVarNLSJac2 = (if noEvent(0.0 > (if uit.maize.liquid == false then uit.maize.outlet.S_ic * uit.maize.Ka_co2 / (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) else uit.maize.Alk_mol - (uit.maize.S_acm + uit.maize.S_prom + uit.maize.S_bum + uit.maize.S_vam) - uit.maize.S_oh - uit.maize.S_nh3 + uit.maize.S_h - uit.maize.S_hpo4 - 2.0 * uit.maize.S_po4 + uit.maize.S_h3po4 - 2.0 * uit.maize.S_co3)) then 0.0 else if uit.maize.liquid == false then uit.maize.outlet.S_ic.$pDERNLSJac2.dummyVarNLSJac2 * uit.maize.Ka_co2 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) / (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) ^ 2.0 else (-2.0) * uit.maize.S_co3.$pDERNLSJac2.dummyVarNLSJac2) - uit.maize.S_hco3.SeedNLSJac2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_464(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,464};
  modelica_boolean tmp6;
  modelica_real tmp8;
  modelica_boolean tmp9;
  modelica_real tmp10;
  modelica_boolean tmp11;
  modelica_real tmp12;
  tmp6 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h"),"uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h"):(data->localData[0]->realVars[962] /* uit.maize.Alk_mol variable */) - ((data->localData[0]->realVars[1056] /* uit.maize.S_acm variable */) + (data->localData[0]->realVars[1069] /* uit.maize.S_prom variable */) + (data->localData[0]->realVars[1057] /* uit.maize.S_bum variable */) + (data->localData[0]->realVars[1070] /* uit.maize.S_vam variable */)) - (data->localData[0]->realVars[1067] /* uit.maize.S_oh variable */) - (data->localData[0]->realVars[1065] /* uit.maize.S_nh3 variable */) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) - (data->localData[0]->realVars[1064] /* uit.maize.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1068] /* uit.maize.S_po4 variable */))) + (data->localData[0]->realVars[1062] /* uit.maize.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */)))));
  tmp11 = (modelica_boolean)tmp6;
  if(tmp11)
  {
    tmp12 = 0.0;
  }
  else
  {
    tmp9 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0));
    if(tmp9)
    {
      tmp8 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h");
      tmp10 = DIVISION(((jacobian->tmpVars[0] /* uit.maize.outlet.S_ic.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */))) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h")),(tmp8 * tmp8),"(uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) ^ 2.0");
    }
    else
    {
      tmp10 = (-2.0) * (jacobian->tmpVars[1] /* uit.maize.S_co3.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_DIFF_VAR */);
    }
    tmp12 = tmp10;
  }
  jacobian->resultVars[0] /* $res_NLSJac2_1.$pDERNLSJac2.dummyVarNLSJac2 JACOBIAN_VAR */ = tmp12 - jacobian->seedVars[0] /* uit.maize.S_hco3.SeedNLSJac2 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac2_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac2;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac2_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac2;
  ADM1_P_UIT_real_R2_copia_eqFunction_462(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_463(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_464(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 585
type: SIMPLE_ASSIGN
uit.tomatosouce.outlet.S_ic.$pDERNLSJac3.dummyVarNLSJac3 = if uit.tomatosouce.liquid == false then 0.0 else uit.tomatosouce.S_hco3.SeedNLSJac3 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) * uit.tomatosouce.Ka_co2 / uit.tomatosouce.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_585(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,585};
  modelica_real tmp14;
  modelica_boolean tmp15;
  modelica_real tmp16;
  tmp15 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0));
  if(tmp15)
  {
    tmp16 = 0.0;
  }
  else
  {
    tmp14 = (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */);
    tmp16 = DIVISION(((jacobian->seedVars[0] /* uit.tomatosouce.S_hco3.SeedNLSJac3 SEED_VAR */) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h"))) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(tmp14 * tmp14),"uit.tomatosouce.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.tomatosouce.outlet.S_ic.$pDERNLSJac3.dummyVarNLSJac3 JACOBIAN_DIFF_VAR */ = tmp16;
  TRACE_POP
}

/*
equation index: 586
type: SIMPLE_ASSIGN
uit.tomatosouce.S_co3.$pDERNLSJac3.dummyVarNLSJac3 = uit.tomatosouce.outlet.S_ic.$pDERNLSJac3.dummyVarNLSJac3 * uit.tomatosouce.Ka_hco3 / (uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_586(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,586};
  modelica_real tmp17;
  tmp17 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */);
  jacobian->tmpVars[1] /* uit.tomatosouce.S_co3.$pDERNLSJac3.dummyVarNLSJac3 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.tomatosouce.outlet.S_ic.$pDERNLSJac3.dummyVarNLSJac3 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),DIVISION((tmp17 * tmp17),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2") + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),"uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 587
type: SIMPLE_ASSIGN
$res_NLSJac3_1.$pDERNLSJac3.dummyVarNLSJac3 = (if noEvent(0.0 > (if uit.tomatosouce.liquid == false then uit.tomatosouce.outlet.S_ic * uit.tomatosouce.Ka_co2 / (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) else uit.tomatosouce.Alk_mol - (uit.tomatosouce.S_acm + uit.tomatosouce.S_prom + uit.tomatosouce.S_bum + uit.tomatosouce.S_vam) - uit.tomatosouce.S_oh - uit.tomatosouce.S_nh3 + uit.tomatosouce.S_h - uit.tomatosouce.S_hpo4 - 2.0 * uit.tomatosouce.S_po4 + uit.tomatosouce.S_h3po4 - 2.0 * uit.tomatosouce.S_co3)) then 0.0 else if uit.tomatosouce.liquid == false then uit.tomatosouce.outlet.S_ic.$pDERNLSJac3.dummyVarNLSJac3 * uit.tomatosouce.Ka_co2 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) / (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) ^ 2.0 else (-2.0) * uit.tomatosouce.S_co3.$pDERNLSJac3.dummyVarNLSJac3) - uit.tomatosouce.S_hco3.SeedNLSJac3
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_587(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,587};
  modelica_boolean tmp19;
  modelica_real tmp21;
  modelica_boolean tmp22;
  modelica_real tmp23;
  modelica_boolean tmp24;
  modelica_real tmp25;
  tmp19 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h"),"uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h"):(data->localData[0]->realVars[1506] /* uit.tomatosouce.Alk_mol variable */) - ((data->localData[0]->realVars[1600] /* uit.tomatosouce.S_acm variable */) + (data->localData[0]->realVars[1613] /* uit.tomatosouce.S_prom variable */) + (data->localData[0]->realVars[1601] /* uit.tomatosouce.S_bum variable */) + (data->localData[0]->realVars[1614] /* uit.tomatosouce.S_vam variable */)) - (data->localData[0]->realVars[1611] /* uit.tomatosouce.S_oh variable */) - (data->localData[0]->realVars[1609] /* uit.tomatosouce.S_nh3 variable */) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) - (data->localData[0]->realVars[1608] /* uit.tomatosouce.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1612] /* uit.tomatosouce.S_po4 variable */))) + (data->localData[0]->realVars[1606] /* uit.tomatosouce.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */)))));
  tmp24 = (modelica_boolean)tmp19;
  if(tmp24)
  {
    tmp25 = 0.0;
  }
  else
  {
    tmp22 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0));
    if(tmp22)
    {
      tmp21 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h");
      tmp23 = DIVISION(((jacobian->tmpVars[0] /* uit.tomatosouce.outlet.S_ic.$pDERNLSJac3.dummyVarNLSJac3 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */))) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h")),(tmp21 * tmp21),"(uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) ^ 2.0");
    }
    else
    {
      tmp23 = (-2.0) * (jacobian->tmpVars[1] /* uit.tomatosouce.S_co3.$pDERNLSJac3.dummyVarNLSJac3 JACOBIAN_DIFF_VAR */);
    }
    tmp25 = tmp23;
  }
  jacobian->resultVars[0] /* $res_NLSJac3_1.$pDERNLSJac3.dummyVarNLSJac3 JACOBIAN_VAR */ = tmp25 - jacobian->seedVars[0] /* uit.tomatosouce.S_hco3.SeedNLSJac3 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac3_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac3;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac3_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac3;
  ADM1_P_UIT_real_R2_copia_eqFunction_585(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_586(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_587(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 708
type: SIMPLE_ASSIGN
uit.eggpasta.outlet.S_ic.$pDERNLSJac4.dummyVarNLSJac4 = if uit.eggpasta.liquid == false then 0.0 else uit.eggpasta.S_hco3.SeedNLSJac4 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) * uit.eggpasta.Ka_co2 / uit.eggpasta.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_708(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,708};
  modelica_real tmp27;
  modelica_boolean tmp28;
  modelica_real tmp29;
  tmp28 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0));
  if(tmp28)
  {
    tmp29 = 0.0;
  }
  else
  {
    tmp27 = (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */);
    tmp29 = DIVISION(((jacobian->seedVars[0] /* uit.eggpasta.S_hco3.SeedNLSJac4 SEED_VAR */) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h"))) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(tmp27 * tmp27),"uit.eggpasta.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.eggpasta.outlet.S_ic.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_DIFF_VAR */ = tmp29;
  TRACE_POP
}

/*
equation index: 709
type: SIMPLE_ASSIGN
uit.eggpasta.S_co3.$pDERNLSJac4.dummyVarNLSJac4 = uit.eggpasta.outlet.S_ic.$pDERNLSJac4.dummyVarNLSJac4 * uit.eggpasta.Ka_hco3 / (uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_709(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,709};
  modelica_real tmp30;
  tmp30 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */);
  jacobian->tmpVars[1] /* uit.eggpasta.S_co3.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.eggpasta.outlet.S_ic.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),DIVISION((tmp30 * tmp30),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2") + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),"uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 710
type: SIMPLE_ASSIGN
$res_NLSJac4_1.$pDERNLSJac4.dummyVarNLSJac4 = (if noEvent(0.0 > (if uit.eggpasta.liquid == false then uit.eggpasta.outlet.S_ic * uit.eggpasta.Ka_co2 / (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) else uit.eggpasta.Alk_mol - (uit.eggpasta.S_acm + uit.eggpasta.S_prom + uit.eggpasta.S_bum + uit.eggpasta.S_vam) - uit.eggpasta.S_oh - uit.eggpasta.S_nh3 + uit.eggpasta.S_h - uit.eggpasta.S_hpo4 - 2.0 * uit.eggpasta.S_po4 + uit.eggpasta.S_h3po4 - 2.0 * uit.eggpasta.S_co3)) then 0.0 else if uit.eggpasta.liquid == false then uit.eggpasta.outlet.S_ic.$pDERNLSJac4.dummyVarNLSJac4 * uit.eggpasta.Ka_co2 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) / (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) ^ 2.0 else (-2.0) * uit.eggpasta.S_co3.$pDERNLSJac4.dummyVarNLSJac4) - uit.eggpasta.S_hco3.SeedNLSJac4
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_710(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,710};
  modelica_boolean tmp32;
  modelica_real tmp34;
  modelica_boolean tmp35;
  modelica_real tmp36;
  modelica_boolean tmp37;
  modelica_real tmp38;
  tmp32 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h"),"uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h"):(data->localData[0]->realVars[742] /* uit.eggpasta.Alk_mol variable */) - ((data->localData[0]->realVars[836] /* uit.eggpasta.S_acm variable */) + (data->localData[0]->realVars[849] /* uit.eggpasta.S_prom variable */) + (data->localData[0]->realVars[837] /* uit.eggpasta.S_bum variable */) + (data->localData[0]->realVars[850] /* uit.eggpasta.S_vam variable */)) - (data->localData[0]->realVars[847] /* uit.eggpasta.S_oh variable */) - (data->localData[0]->realVars[845] /* uit.eggpasta.S_nh3 variable */) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) - (data->localData[0]->realVars[844] /* uit.eggpasta.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[848] /* uit.eggpasta.S_po4 variable */))) + (data->localData[0]->realVars[842] /* uit.eggpasta.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */)))));
  tmp37 = (modelica_boolean)tmp32;
  if(tmp37)
  {
    tmp38 = 0.0;
  }
  else
  {
    tmp35 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0));
    if(tmp35)
    {
      tmp34 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h");
      tmp36 = DIVISION(((jacobian->tmpVars[0] /* uit.eggpasta.outlet.S_ic.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */))) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h")),(tmp34 * tmp34),"(uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) ^ 2.0");
    }
    else
    {
      tmp36 = (-2.0) * (jacobian->tmpVars[1] /* uit.eggpasta.S_co3.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_DIFF_VAR */);
    }
    tmp38 = tmp36;
  }
  jacobian->resultVars[0] /* $res_NLSJac4_1.$pDERNLSJac4.dummyVarNLSJac4 JACOBIAN_VAR */ = tmp38 - jacobian->seedVars[0] /* uit.eggpasta.S_hco3.SeedNLSJac4 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac4_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac4;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac4_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac4;
  ADM1_P_UIT_real_R2_copia_eqFunction_708(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_709(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_710(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 831
type: SIMPLE_ASSIGN
uit.semolina.outlet.S_ic.$pDERNLSJac5.dummyVarNLSJac5 = if uit.semolina.liquid == false then 0.0 else uit.semolina.S_hco3.SeedNLSJac5 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) * uit.semolina.Ka_co2 / uit.semolina.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_831(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,831};
  modelica_real tmp40;
  modelica_boolean tmp41;
  modelica_real tmp42;
  tmp41 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0));
  if(tmp41)
  {
    tmp42 = 0.0;
  }
  else
  {
    tmp40 = (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */);
    tmp42 = DIVISION(((jacobian->seedVars[0] /* uit.semolina.S_hco3.SeedNLSJac5 SEED_VAR */) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h"))) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(tmp40 * tmp40),"uit.semolina.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.semolina.outlet.S_ic.$pDERNLSJac5.dummyVarNLSJac5 JACOBIAN_DIFF_VAR */ = tmp42;
  TRACE_POP
}

/*
equation index: 832
type: SIMPLE_ASSIGN
uit.semolina.S_co3.$pDERNLSJac5.dummyVarNLSJac5 = uit.semolina.outlet.S_ic.$pDERNLSJac5.dummyVarNLSJac5 * uit.semolina.Ka_hco3 / (uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_832(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,832};
  modelica_real tmp43;
  tmp43 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */);
  jacobian->tmpVars[1] /* uit.semolina.S_co3.$pDERNLSJac5.dummyVarNLSJac5 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.semolina.outlet.S_ic.$pDERNLSJac5.dummyVarNLSJac5 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),DIVISION((tmp43 * tmp43),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2") + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),"uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 833
type: SIMPLE_ASSIGN
$res_NLSJac5_1.$pDERNLSJac5.dummyVarNLSJac5 = (if noEvent(0.0 > (if uit.semolina.liquid == false then uit.semolina.outlet.S_ic * uit.semolina.Ka_co2 / (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) else uit.semolina.Alk_mol - (uit.semolina.S_acm + uit.semolina.S_prom + uit.semolina.S_bum + uit.semolina.S_vam) - uit.semolina.S_oh - uit.semolina.S_nh3 + uit.semolina.S_h - uit.semolina.S_hpo4 - 2.0 * uit.semolina.S_po4 + uit.semolina.S_h3po4 - 2.0 * uit.semolina.S_co3)) then 0.0 else if uit.semolina.liquid == false then uit.semolina.outlet.S_ic.$pDERNLSJac5.dummyVarNLSJac5 * uit.semolina.Ka_co2 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) / (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) ^ 2.0 else (-2.0) * uit.semolina.S_co3.$pDERNLSJac5.dummyVarNLSJac5) - uit.semolina.S_hco3.SeedNLSJac5
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_833(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,833};
  modelica_boolean tmp45;
  modelica_real tmp47;
  modelica_boolean tmp48;
  modelica_real tmp49;
  modelica_boolean tmp50;
  modelica_real tmp51;
  tmp45 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h"),"uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h"):(data->localData[0]->realVars[1150] /* uit.semolina.Alk_mol variable */) - ((data->localData[0]->realVars[1244] /* uit.semolina.S_acm variable */) + (data->localData[0]->realVars[1257] /* uit.semolina.S_prom variable */) + (data->localData[0]->realVars[1245] /* uit.semolina.S_bum variable */) + (data->localData[0]->realVars[1258] /* uit.semolina.S_vam variable */)) - (data->localData[0]->realVars[1255] /* uit.semolina.S_oh variable */) - (data->localData[0]->realVars[1253] /* uit.semolina.S_nh3 variable */) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) - (data->localData[0]->realVars[1252] /* uit.semolina.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1256] /* uit.semolina.S_po4 variable */))) + (data->localData[0]->realVars[1250] /* uit.semolina.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */)))));
  tmp50 = (modelica_boolean)tmp45;
  if(tmp50)
  {
    tmp51 = 0.0;
  }
  else
  {
    tmp48 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0));
    if(tmp48)
    {
      tmp47 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h");
      tmp49 = DIVISION(((jacobian->tmpVars[0] /* uit.semolina.outlet.S_ic.$pDERNLSJac5.dummyVarNLSJac5 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */))) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h")),(tmp47 * tmp47),"(uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) ^ 2.0");
    }
    else
    {
      tmp49 = (-2.0) * (jacobian->tmpVars[1] /* uit.semolina.S_co3.$pDERNLSJac5.dummyVarNLSJac5 JACOBIAN_DIFF_VAR */);
    }
    tmp51 = tmp49;
  }
  jacobian->resultVars[0] /* $res_NLSJac5_1.$pDERNLSJac5.dummyVarNLSJac5 JACOBIAN_VAR */ = tmp51 - jacobian->seedVars[0] /* uit.semolina.S_hco3.SeedNLSJac5 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac5_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac5;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac5_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac5;
  ADM1_P_UIT_real_R2_copia_eqFunction_831(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_832(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_833(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 954
type: SIMPLE_ASSIGN
uit.slurry.outlet.S_ic.$pDERNLSJac6.dummyVarNLSJac6 = if uit.slurry.liquid == false then 0.0 else uit.slurry.S_hco3.SeedNLSJac6 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) * uit.slurry.Ka_co2 / uit.slurry.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_954(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,954};
  modelica_real tmp53;
  modelica_boolean tmp54;
  modelica_real tmp55;
  tmp54 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0));
  if(tmp54)
  {
    tmp55 = 0.0;
  }
  else
  {
    tmp53 = (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */);
    tmp55 = DIVISION(((jacobian->seedVars[0] /* uit.slurry.S_hco3.SeedNLSJac6 SEED_VAR */) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h"))) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(tmp53 * tmp53),"uit.slurry.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.slurry.outlet.S_ic.$pDERNLSJac6.dummyVarNLSJac6 JACOBIAN_DIFF_VAR */ = tmp55;
  TRACE_POP
}

/*
equation index: 955
type: SIMPLE_ASSIGN
uit.slurry.S_co3.$pDERNLSJac6.dummyVarNLSJac6 = uit.slurry.outlet.S_ic.$pDERNLSJac6.dummyVarNLSJac6 * uit.slurry.Ka_hco3 / (uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_955(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,955};
  modelica_real tmp56;
  tmp56 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */);
  jacobian->tmpVars[1] /* uit.slurry.S_co3.$pDERNLSJac6.dummyVarNLSJac6 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.slurry.outlet.S_ic.$pDERNLSJac6.dummyVarNLSJac6 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),DIVISION((tmp56 * tmp56),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2") + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),"uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 956
type: SIMPLE_ASSIGN
$res_NLSJac6_1.$pDERNLSJac6.dummyVarNLSJac6 = (if noEvent(0.0 > (if uit.slurry.liquid == false then uit.slurry.outlet.S_ic * uit.slurry.Ka_co2 / (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) else uit.slurry.Alk_mol - (uit.slurry.S_acm + uit.slurry.S_prom + uit.slurry.S_bum + uit.slurry.S_vam) - uit.slurry.S_oh - uit.slurry.S_nh3 + uit.slurry.S_h - uit.slurry.S_hpo4 - 2.0 * uit.slurry.S_po4 + uit.slurry.S_h3po4 - 2.0 * uit.slurry.S_co3)) then 0.0 else if uit.slurry.liquid == false then uit.slurry.outlet.S_ic.$pDERNLSJac6.dummyVarNLSJac6 * uit.slurry.Ka_co2 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) / (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) ^ 2.0 else (-2.0) * uit.slurry.S_co3.$pDERNLSJac6.dummyVarNLSJac6) - uit.slurry.S_hco3.SeedNLSJac6
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_956(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,956};
  modelica_boolean tmp58;
  modelica_real tmp60;
  modelica_boolean tmp61;
  modelica_real tmp62;
  modelica_boolean tmp63;
  modelica_real tmp64;
  tmp58 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h"),"uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h"):(data->localData[0]->realVars[1328] /* uit.slurry.Alk_mol variable */) - ((data->localData[0]->realVars[1422] /* uit.slurry.S_acm variable */) + (data->localData[0]->realVars[1435] /* uit.slurry.S_prom variable */) + (data->localData[0]->realVars[1423] /* uit.slurry.S_bum variable */) + (data->localData[0]->realVars[1436] /* uit.slurry.S_vam variable */)) - (data->localData[0]->realVars[1433] /* uit.slurry.S_oh variable */) - (data->localData[0]->realVars[1431] /* uit.slurry.S_nh3 variable */) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) - (data->localData[0]->realVars[1430] /* uit.slurry.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1434] /* uit.slurry.S_po4 variable */))) + (data->localData[0]->realVars[1428] /* uit.slurry.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */)))));
  tmp63 = (modelica_boolean)tmp58;
  if(tmp63)
  {
    tmp64 = 0.0;
  }
  else
  {
    tmp61 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0));
    if(tmp61)
    {
      tmp60 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h");
      tmp62 = DIVISION(((jacobian->tmpVars[0] /* uit.slurry.outlet.S_ic.$pDERNLSJac6.dummyVarNLSJac6 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */))) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h")),(tmp60 * tmp60),"(uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) ^ 2.0");
    }
    else
    {
      tmp62 = (-2.0) * (jacobian->tmpVars[1] /* uit.slurry.S_co3.$pDERNLSJac6.dummyVarNLSJac6 JACOBIAN_DIFF_VAR */);
    }
    tmp64 = tmp62;
  }
  jacobian->resultVars[0] /* $res_NLSJac6_1.$pDERNLSJac6.dummyVarNLSJac6 JACOBIAN_VAR */ = tmp64 - jacobian->seedVars[0] /* uit.slurry.S_hco3.SeedNLSJac6 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac6_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac6;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac6_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac6;
  ADM1_P_UIT_real_R2_copia_eqFunction_954(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_955(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_956(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 2233
type: SIMPLE_ASSIGN
uit.maize.outlet.S_ic.$pDERNLSJac9.dummyVarNLSJac9 = if uit.maize.liquid == false then 0.0 else uit.maize.S_hco3.SeedNLSJac9 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) * uit.maize.Ka_co2 / uit.maize.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2233(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,2233};
  modelica_real tmp66;
  modelica_boolean tmp67;
  modelica_real tmp68;
  tmp67 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0));
  if(tmp67)
  {
    tmp68 = 0.0;
  }
  else
  {
    tmp66 = (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */);
    tmp68 = DIVISION(((jacobian->seedVars[0] /* uit.maize.S_hco3.SeedNLSJac9 SEED_VAR */) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h"))) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(tmp66 * tmp66),"uit.maize.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.maize.outlet.S_ic.$pDERNLSJac9.dummyVarNLSJac9 JACOBIAN_DIFF_VAR */ = tmp68;
  TRACE_POP
}

/*
equation index: 2234
type: SIMPLE_ASSIGN
uit.maize.S_co3.$pDERNLSJac9.dummyVarNLSJac9 = uit.maize.outlet.S_ic.$pDERNLSJac9.dummyVarNLSJac9 * uit.maize.Ka_hco3 / (uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2234(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,2234};
  modelica_real tmp69;
  tmp69 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */);
  jacobian->tmpVars[1] /* uit.maize.S_co3.$pDERNLSJac9.dummyVarNLSJac9 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.maize.outlet.S_ic.$pDERNLSJac9.dummyVarNLSJac9 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),DIVISION((tmp69 * tmp69),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2") + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),"uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 2235
type: SIMPLE_ASSIGN
$res_NLSJac9_1.$pDERNLSJac9.dummyVarNLSJac9 = (if noEvent(0.0 > (if uit.maize.liquid == false then uit.maize.outlet.S_ic * uit.maize.Ka_co2 / (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) else uit.maize.Alk_mol - (uit.maize.S_acm + uit.maize.S_prom + uit.maize.S_bum + uit.maize.S_vam) - uit.maize.S_oh - uit.maize.S_nh3 + uit.maize.S_h - uit.maize.S_hpo4 - 2.0 * uit.maize.S_po4 + uit.maize.S_h3po4 - 2.0 * uit.maize.S_co3)) then 0.0 else if uit.maize.liquid == false then uit.maize.outlet.S_ic.$pDERNLSJac9.dummyVarNLSJac9 * uit.maize.Ka_co2 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) / (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) ^ 2.0 else (-2.0) * uit.maize.S_co3.$pDERNLSJac9.dummyVarNLSJac9) - uit.maize.S_hco3.SeedNLSJac9
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2235(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,2235};
  modelica_boolean tmp71;
  modelica_real tmp73;
  modelica_boolean tmp74;
  modelica_real tmp75;
  modelica_boolean tmp76;
  modelica_real tmp77;
  tmp71 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h"),"uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h"):(data->localData[0]->realVars[962] /* uit.maize.Alk_mol variable */) - ((data->localData[0]->realVars[1056] /* uit.maize.S_acm variable */) + (data->localData[0]->realVars[1069] /* uit.maize.S_prom variable */) + (data->localData[0]->realVars[1057] /* uit.maize.S_bum variable */) + (data->localData[0]->realVars[1070] /* uit.maize.S_vam variable */)) - (data->localData[0]->realVars[1067] /* uit.maize.S_oh variable */) - (data->localData[0]->realVars[1065] /* uit.maize.S_nh3 variable */) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) - (data->localData[0]->realVars[1064] /* uit.maize.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1068] /* uit.maize.S_po4 variable */))) + (data->localData[0]->realVars[1062] /* uit.maize.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */)))));
  tmp76 = (modelica_boolean)tmp71;
  if(tmp76)
  {
    tmp77 = 0.0;
  }
  else
  {
    tmp74 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0));
    if(tmp74)
    {
      tmp73 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h");
      tmp75 = DIVISION(((jacobian->tmpVars[0] /* uit.maize.outlet.S_ic.$pDERNLSJac9.dummyVarNLSJac9 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */))) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h")),(tmp73 * tmp73),"(uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) ^ 2.0");
    }
    else
    {
      tmp75 = (-2.0) * (jacobian->tmpVars[1] /* uit.maize.S_co3.$pDERNLSJac9.dummyVarNLSJac9 JACOBIAN_DIFF_VAR */);
    }
    tmp77 = tmp75;
  }
  jacobian->resultVars[0] /* $res_NLSJac9_1.$pDERNLSJac9.dummyVarNLSJac9 JACOBIAN_VAR */ = tmp77 - jacobian->seedVars[0] /* uit.maize.S_hco3.SeedNLSJac9 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac9_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac9;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac9_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac9;
  ADM1_P_UIT_real_R2_copia_eqFunction_2233(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2234(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2235(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 2356
type: SIMPLE_ASSIGN
uit.tomatosouce.outlet.S_ic.$pDERNLSJac10.dummyVarNLSJac10 = if uit.tomatosouce.liquid == false then 0.0 else uit.tomatosouce.S_hco3.SeedNLSJac10 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) * uit.tomatosouce.Ka_co2 / uit.tomatosouce.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2356(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,2356};
  modelica_real tmp79;
  modelica_boolean tmp80;
  modelica_real tmp81;
  tmp80 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0));
  if(tmp80)
  {
    tmp81 = 0.0;
  }
  else
  {
    tmp79 = (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */);
    tmp81 = DIVISION(((jacobian->seedVars[0] /* uit.tomatosouce.S_hco3.SeedNLSJac10 SEED_VAR */) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h"))) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(tmp79 * tmp79),"uit.tomatosouce.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.tomatosouce.outlet.S_ic.$pDERNLSJac10.dummyVarNLSJac10 JACOBIAN_DIFF_VAR */ = tmp81;
  TRACE_POP
}

/*
equation index: 2357
type: SIMPLE_ASSIGN
uit.tomatosouce.S_co3.$pDERNLSJac10.dummyVarNLSJac10 = uit.tomatosouce.outlet.S_ic.$pDERNLSJac10.dummyVarNLSJac10 * uit.tomatosouce.Ka_hco3 / (uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2357(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,2357};
  modelica_real tmp82;
  tmp82 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */);
  jacobian->tmpVars[1] /* uit.tomatosouce.S_co3.$pDERNLSJac10.dummyVarNLSJac10 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.tomatosouce.outlet.S_ic.$pDERNLSJac10.dummyVarNLSJac10 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),DIVISION((tmp82 * tmp82),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2") + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),"uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 2358
type: SIMPLE_ASSIGN
$res_NLSJac10_1.$pDERNLSJac10.dummyVarNLSJac10 = (if noEvent(0.0 > (if uit.tomatosouce.liquid == false then uit.tomatosouce.outlet.S_ic * uit.tomatosouce.Ka_co2 / (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) else uit.tomatosouce.Alk_mol - (uit.tomatosouce.S_acm + uit.tomatosouce.S_prom + uit.tomatosouce.S_bum + uit.tomatosouce.S_vam) - uit.tomatosouce.S_oh - uit.tomatosouce.S_nh3 + uit.tomatosouce.S_h - uit.tomatosouce.S_hpo4 - 2.0 * uit.tomatosouce.S_po4 + uit.tomatosouce.S_h3po4 - 2.0 * uit.tomatosouce.S_co3)) then 0.0 else if uit.tomatosouce.liquid == false then uit.tomatosouce.outlet.S_ic.$pDERNLSJac10.dummyVarNLSJac10 * uit.tomatosouce.Ka_co2 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) / (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) ^ 2.0 else (-2.0) * uit.tomatosouce.S_co3.$pDERNLSJac10.dummyVarNLSJac10) - uit.tomatosouce.S_hco3.SeedNLSJac10
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2358(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,2358};
  modelica_boolean tmp84;
  modelica_real tmp86;
  modelica_boolean tmp87;
  modelica_real tmp88;
  modelica_boolean tmp89;
  modelica_real tmp90;
  tmp84 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h"),"uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h"):(data->localData[0]->realVars[1506] /* uit.tomatosouce.Alk_mol variable */) - ((data->localData[0]->realVars[1600] /* uit.tomatosouce.S_acm variable */) + (data->localData[0]->realVars[1613] /* uit.tomatosouce.S_prom variable */) + (data->localData[0]->realVars[1601] /* uit.tomatosouce.S_bum variable */) + (data->localData[0]->realVars[1614] /* uit.tomatosouce.S_vam variable */)) - (data->localData[0]->realVars[1611] /* uit.tomatosouce.S_oh variable */) - (data->localData[0]->realVars[1609] /* uit.tomatosouce.S_nh3 variable */) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) - (data->localData[0]->realVars[1608] /* uit.tomatosouce.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1612] /* uit.tomatosouce.S_po4 variable */))) + (data->localData[0]->realVars[1606] /* uit.tomatosouce.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */)))));
  tmp89 = (modelica_boolean)tmp84;
  if(tmp89)
  {
    tmp90 = 0.0;
  }
  else
  {
    tmp87 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0));
    if(tmp87)
    {
      tmp86 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h");
      tmp88 = DIVISION(((jacobian->tmpVars[0] /* uit.tomatosouce.outlet.S_ic.$pDERNLSJac10.dummyVarNLSJac10 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */))) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h")),(tmp86 * tmp86),"(uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) ^ 2.0");
    }
    else
    {
      tmp88 = (-2.0) * (jacobian->tmpVars[1] /* uit.tomatosouce.S_co3.$pDERNLSJac10.dummyVarNLSJac10 JACOBIAN_DIFF_VAR */);
    }
    tmp90 = tmp88;
  }
  jacobian->resultVars[0] /* $res_NLSJac10_1.$pDERNLSJac10.dummyVarNLSJac10 JACOBIAN_VAR */ = tmp90 - jacobian->seedVars[0] /* uit.tomatosouce.S_hco3.SeedNLSJac10 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac10_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac10;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac10_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac10;
  ADM1_P_UIT_real_R2_copia_eqFunction_2356(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2357(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2358(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 2479
type: SIMPLE_ASSIGN
uit.eggpasta.outlet.S_ic.$pDERNLSJac11.dummyVarNLSJac11 = if uit.eggpasta.liquid == false then 0.0 else uit.eggpasta.S_hco3.SeedNLSJac11 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) * uit.eggpasta.Ka_co2 / uit.eggpasta.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2479(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,2479};
  modelica_real tmp92;
  modelica_boolean tmp93;
  modelica_real tmp94;
  tmp93 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0));
  if(tmp93)
  {
    tmp94 = 0.0;
  }
  else
  {
    tmp92 = (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */);
    tmp94 = DIVISION(((jacobian->seedVars[0] /* uit.eggpasta.S_hco3.SeedNLSJac11 SEED_VAR */) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h"))) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(tmp92 * tmp92),"uit.eggpasta.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.eggpasta.outlet.S_ic.$pDERNLSJac11.dummyVarNLSJac11 JACOBIAN_DIFF_VAR */ = tmp94;
  TRACE_POP
}

/*
equation index: 2480
type: SIMPLE_ASSIGN
uit.eggpasta.S_co3.$pDERNLSJac11.dummyVarNLSJac11 = uit.eggpasta.outlet.S_ic.$pDERNLSJac11.dummyVarNLSJac11 * uit.eggpasta.Ka_hco3 / (uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2480(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,2480};
  modelica_real tmp95;
  tmp95 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */);
  jacobian->tmpVars[1] /* uit.eggpasta.S_co3.$pDERNLSJac11.dummyVarNLSJac11 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.eggpasta.outlet.S_ic.$pDERNLSJac11.dummyVarNLSJac11 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),DIVISION((tmp95 * tmp95),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2") + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),"uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 2481
type: SIMPLE_ASSIGN
$res_NLSJac11_1.$pDERNLSJac11.dummyVarNLSJac11 = (if noEvent(0.0 > (if uit.eggpasta.liquid == false then uit.eggpasta.outlet.S_ic * uit.eggpasta.Ka_co2 / (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) else uit.eggpasta.Alk_mol - (uit.eggpasta.S_acm + uit.eggpasta.S_prom + uit.eggpasta.S_bum + uit.eggpasta.S_vam) - uit.eggpasta.S_oh - uit.eggpasta.S_nh3 + uit.eggpasta.S_h - uit.eggpasta.S_hpo4 - 2.0 * uit.eggpasta.S_po4 + uit.eggpasta.S_h3po4 - 2.0 * uit.eggpasta.S_co3)) then 0.0 else if uit.eggpasta.liquid == false then uit.eggpasta.outlet.S_ic.$pDERNLSJac11.dummyVarNLSJac11 * uit.eggpasta.Ka_co2 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) / (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) ^ 2.0 else (-2.0) * uit.eggpasta.S_co3.$pDERNLSJac11.dummyVarNLSJac11) - uit.eggpasta.S_hco3.SeedNLSJac11
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2481(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,2481};
  modelica_boolean tmp97;
  modelica_real tmp99;
  modelica_boolean tmp100;
  modelica_real tmp101;
  modelica_boolean tmp102;
  modelica_real tmp103;
  tmp97 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h"),"uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h"):(data->localData[0]->realVars[742] /* uit.eggpasta.Alk_mol variable */) - ((data->localData[0]->realVars[836] /* uit.eggpasta.S_acm variable */) + (data->localData[0]->realVars[849] /* uit.eggpasta.S_prom variable */) + (data->localData[0]->realVars[837] /* uit.eggpasta.S_bum variable */) + (data->localData[0]->realVars[850] /* uit.eggpasta.S_vam variable */)) - (data->localData[0]->realVars[847] /* uit.eggpasta.S_oh variable */) - (data->localData[0]->realVars[845] /* uit.eggpasta.S_nh3 variable */) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) - (data->localData[0]->realVars[844] /* uit.eggpasta.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[848] /* uit.eggpasta.S_po4 variable */))) + (data->localData[0]->realVars[842] /* uit.eggpasta.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */)))));
  tmp102 = (modelica_boolean)tmp97;
  if(tmp102)
  {
    tmp103 = 0.0;
  }
  else
  {
    tmp100 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0));
    if(tmp100)
    {
      tmp99 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h");
      tmp101 = DIVISION(((jacobian->tmpVars[0] /* uit.eggpasta.outlet.S_ic.$pDERNLSJac11.dummyVarNLSJac11 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */))) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h")),(tmp99 * tmp99),"(uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) ^ 2.0");
    }
    else
    {
      tmp101 = (-2.0) * (jacobian->tmpVars[1] /* uit.eggpasta.S_co3.$pDERNLSJac11.dummyVarNLSJac11 JACOBIAN_DIFF_VAR */);
    }
    tmp103 = tmp101;
  }
  jacobian->resultVars[0] /* $res_NLSJac11_1.$pDERNLSJac11.dummyVarNLSJac11 JACOBIAN_VAR */ = tmp103 - jacobian->seedVars[0] /* uit.eggpasta.S_hco3.SeedNLSJac11 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac11_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac11;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac11_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac11;
  ADM1_P_UIT_real_R2_copia_eqFunction_2479(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2480(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2481(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 2602
type: SIMPLE_ASSIGN
uit.semolina.outlet.S_ic.$pDERNLSJac12.dummyVarNLSJac12 = if uit.semolina.liquid == false then 0.0 else uit.semolina.S_hco3.SeedNLSJac12 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) * uit.semolina.Ka_co2 / uit.semolina.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2602(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,2602};
  modelica_real tmp105;
  modelica_boolean tmp106;
  modelica_real tmp107;
  tmp106 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0));
  if(tmp106)
  {
    tmp107 = 0.0;
  }
  else
  {
    tmp105 = (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */);
    tmp107 = DIVISION(((jacobian->seedVars[0] /* uit.semolina.S_hco3.SeedNLSJac12 SEED_VAR */) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h"))) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(tmp105 * tmp105),"uit.semolina.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.semolina.outlet.S_ic.$pDERNLSJac12.dummyVarNLSJac12 JACOBIAN_DIFF_VAR */ = tmp107;
  TRACE_POP
}

/*
equation index: 2603
type: SIMPLE_ASSIGN
uit.semolina.S_co3.$pDERNLSJac12.dummyVarNLSJac12 = uit.semolina.outlet.S_ic.$pDERNLSJac12.dummyVarNLSJac12 * uit.semolina.Ka_hco3 / (uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2603(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,2603};
  modelica_real tmp108;
  tmp108 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */);
  jacobian->tmpVars[1] /* uit.semolina.S_co3.$pDERNLSJac12.dummyVarNLSJac12 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.semolina.outlet.S_ic.$pDERNLSJac12.dummyVarNLSJac12 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),DIVISION((tmp108 * tmp108),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2") + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),"uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 2604
type: SIMPLE_ASSIGN
$res_NLSJac12_1.$pDERNLSJac12.dummyVarNLSJac12 = (if noEvent(0.0 > (if uit.semolina.liquid == false then uit.semolina.outlet.S_ic * uit.semolina.Ka_co2 / (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) else uit.semolina.Alk_mol - (uit.semolina.S_acm + uit.semolina.S_prom + uit.semolina.S_bum + uit.semolina.S_vam) - uit.semolina.S_oh - uit.semolina.S_nh3 + uit.semolina.S_h - uit.semolina.S_hpo4 - 2.0 * uit.semolina.S_po4 + uit.semolina.S_h3po4 - 2.0 * uit.semolina.S_co3)) then 0.0 else if uit.semolina.liquid == false then uit.semolina.outlet.S_ic.$pDERNLSJac12.dummyVarNLSJac12 * uit.semolina.Ka_co2 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) / (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) ^ 2.0 else (-2.0) * uit.semolina.S_co3.$pDERNLSJac12.dummyVarNLSJac12) - uit.semolina.S_hco3.SeedNLSJac12
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2604(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,2604};
  modelica_boolean tmp110;
  modelica_real tmp112;
  modelica_boolean tmp113;
  modelica_real tmp114;
  modelica_boolean tmp115;
  modelica_real tmp116;
  tmp110 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h"),"uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h"):(data->localData[0]->realVars[1150] /* uit.semolina.Alk_mol variable */) - ((data->localData[0]->realVars[1244] /* uit.semolina.S_acm variable */) + (data->localData[0]->realVars[1257] /* uit.semolina.S_prom variable */) + (data->localData[0]->realVars[1245] /* uit.semolina.S_bum variable */) + (data->localData[0]->realVars[1258] /* uit.semolina.S_vam variable */)) - (data->localData[0]->realVars[1255] /* uit.semolina.S_oh variable */) - (data->localData[0]->realVars[1253] /* uit.semolina.S_nh3 variable */) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) - (data->localData[0]->realVars[1252] /* uit.semolina.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1256] /* uit.semolina.S_po4 variable */))) + (data->localData[0]->realVars[1250] /* uit.semolina.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */)))));
  tmp115 = (modelica_boolean)tmp110;
  if(tmp115)
  {
    tmp116 = 0.0;
  }
  else
  {
    tmp113 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0));
    if(tmp113)
    {
      tmp112 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h");
      tmp114 = DIVISION(((jacobian->tmpVars[0] /* uit.semolina.outlet.S_ic.$pDERNLSJac12.dummyVarNLSJac12 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */))) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h")),(tmp112 * tmp112),"(uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) ^ 2.0");
    }
    else
    {
      tmp114 = (-2.0) * (jacobian->tmpVars[1] /* uit.semolina.S_co3.$pDERNLSJac12.dummyVarNLSJac12 JACOBIAN_DIFF_VAR */);
    }
    tmp116 = tmp114;
  }
  jacobian->resultVars[0] /* $res_NLSJac12_1.$pDERNLSJac12.dummyVarNLSJac12 JACOBIAN_VAR */ = tmp116 - jacobian->seedVars[0] /* uit.semolina.S_hco3.SeedNLSJac12 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac12_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac12;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac12_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac12;
  ADM1_P_UIT_real_R2_copia_eqFunction_2602(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2603(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2604(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 2725
type: SIMPLE_ASSIGN
uit.slurry.outlet.S_ic.$pDERNLSJac13.dummyVarNLSJac13 = if uit.slurry.liquid == false then 0.0 else uit.slurry.S_hco3.SeedNLSJac13 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) * uit.slurry.Ka_co2 / uit.slurry.Ka_co2 ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2725(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,2725};
  modelica_real tmp118;
  modelica_boolean tmp119;
  modelica_real tmp120;
  tmp119 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0));
  if(tmp119)
  {
    tmp120 = 0.0;
  }
  else
  {
    tmp118 = (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */);
    tmp120 = DIVISION(((jacobian->seedVars[0] /* uit.slurry.S_hco3.SeedNLSJac13 SEED_VAR */) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h"))) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(tmp118 * tmp118),"uit.slurry.Ka_co2 ^ 2.0");
  }
  jacobian->tmpVars[0] /* uit.slurry.outlet.S_ic.$pDERNLSJac13.dummyVarNLSJac13 JACOBIAN_DIFF_VAR */ = tmp120;
  TRACE_POP
}

/*
equation index: 2726
type: SIMPLE_ASSIGN
uit.slurry.S_co3.$pDERNLSJac13.dummyVarNLSJac13 = uit.slurry.outlet.S_ic.$pDERNLSJac13.dummyVarNLSJac13 * uit.slurry.Ka_hco3 / (uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2726(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,2726};
  modelica_real tmp121;
  tmp121 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */);
  jacobian->tmpVars[1] /* uit.slurry.S_co3.$pDERNLSJac13.dummyVarNLSJac13 JACOBIAN_DIFF_VAR */ = (jacobian->tmpVars[0] /* uit.slurry.outlet.S_ic.$pDERNLSJac13.dummyVarNLSJac13 JACOBIAN_DIFF_VAR */) * (DIVISION((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),DIVISION((tmp121 * tmp121),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2") + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),"uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 2727
type: SIMPLE_ASSIGN
$res_NLSJac13_1.$pDERNLSJac13.dummyVarNLSJac13 = (if noEvent(0.0 > (if uit.slurry.liquid == false then uit.slurry.outlet.S_ic * uit.slurry.Ka_co2 / (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) else uit.slurry.Alk_mol - (uit.slurry.S_acm + uit.slurry.S_prom + uit.slurry.S_bum + uit.slurry.S_vam) - uit.slurry.S_oh - uit.slurry.S_nh3 + uit.slurry.S_h - uit.slurry.S_hpo4 - 2.0 * uit.slurry.S_po4 + uit.slurry.S_h3po4 - 2.0 * uit.slurry.S_co3)) then 0.0 else if uit.slurry.liquid == false then uit.slurry.outlet.S_ic.$pDERNLSJac13.dummyVarNLSJac13 * uit.slurry.Ka_co2 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) / (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) ^ 2.0 else (-2.0) * uit.slurry.S_co3.$pDERNLSJac13.dummyVarNLSJac13) - uit.slurry.S_hco3.SeedNLSJac13
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2727(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,2727};
  modelica_boolean tmp123;
  modelica_real tmp125;
  modelica_boolean tmp126;
  modelica_real tmp127;
  modelica_boolean tmp128;
  modelica_real tmp129;
  tmp123 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h"),"uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h"):(data->localData[0]->realVars[1328] /* uit.slurry.Alk_mol variable */) - ((data->localData[0]->realVars[1422] /* uit.slurry.S_acm variable */) + (data->localData[0]->realVars[1435] /* uit.slurry.S_prom variable */) + (data->localData[0]->realVars[1423] /* uit.slurry.S_bum variable */) + (data->localData[0]->realVars[1436] /* uit.slurry.S_vam variable */)) - (data->localData[0]->realVars[1433] /* uit.slurry.S_oh variable */) - (data->localData[0]->realVars[1431] /* uit.slurry.S_nh3 variable */) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) - (data->localData[0]->realVars[1430] /* uit.slurry.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1434] /* uit.slurry.S_po4 variable */))) + (data->localData[0]->realVars[1428] /* uit.slurry.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */)))));
  tmp128 = (modelica_boolean)tmp123;
  if(tmp128)
  {
    tmp129 = 0.0;
  }
  else
  {
    tmp126 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0));
    if(tmp126)
    {
      tmp125 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h");
      tmp127 = DIVISION(((jacobian->tmpVars[0] /* uit.slurry.outlet.S_ic.$pDERNLSJac13.dummyVarNLSJac13 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */))) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h")),(tmp125 * tmp125),"(uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) ^ 2.0");
    }
    else
    {
      tmp127 = (-2.0) * (jacobian->tmpVars[1] /* uit.slurry.S_co3.$pDERNLSJac13.dummyVarNLSJac13 JACOBIAN_DIFF_VAR */);
    }
    tmp129 = tmp127;
  }
  jacobian->resultVars[0] /* $res_NLSJac13_1.$pDERNLSJac13.dummyVarNLSJac13 JACOBIAN_VAR */ = tmp129 - jacobian->seedVars[0] /* uit.slurry.S_hco3.SeedNLSJac13 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac13_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac13;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac13_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac13;
  ADM1_P_UIT_real_R2_copia_eqFunction_2725(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2726(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_2727(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 3648
type: SIMPLE_ASSIGN
uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14 = 2.0 * uit.digester.z * uit.digester.z.SeedNLSJac14
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3648(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,3648};
  jacobian->tmpVars[0] /* uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (2.0) * (((data->localData[0]->realVars[739] /* uit.digester.z variable */)) * (jacobian->seedVars[1] /* uit.digester.z.SeedNLSJac14 SEED_VAR */));
  TRACE_POP
}

/*
equation index: 3649
type: SIMPLE_ASSIGN
uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 = if noEvent(uit.digester.ideality == true) then 0.0 else 10.0 ^ ((-2.04) * (uit.digester.z / (1.0 + uit.digester.z) - 0.24 * uit.digester.I)) * 2.302585092994046 * (-2.04) * (uit.digester.z.SeedNLSJac14 * (1.0 + uit.digester.z - uit.digester.z) / (1.0 + uit.digester.z) ^ 2.0 - 0.24 * uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3649(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,3649};
  modelica_real tmp131;
  modelica_real tmp132;
  modelica_real tmp133;
  modelica_real tmp134;
  modelica_real tmp135;
  modelica_real tmp136;
  modelica_real tmp137;
  modelica_real tmp138;
  modelica_boolean tmp139;
  modelica_real tmp140;
  tmp139 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1));
  if(tmp139)
  {
    tmp140 = 0.0;
  }
  else
  {
    tmp131 = 10.0;
    tmp132 = (-2.04) * (DIVISION((data->localData[0]->realVars[739] /* uit.digester.z variable */),1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */),"1.0 + uit.digester.z") - ((0.24) * ((data->localData[0]->realVars[433] /* uit.digester.I variable */))));
    if(tmp131 < 0.0 && tmp132 != 0.0)
    {
      tmp134 = modf(tmp132, &tmp135);
      
      if(tmp134 > 0.5)
      {
        tmp134 -= 1.0;
        tmp135 += 1.0;
      }
      else if(tmp134 < -0.5)
      {
        tmp134 += 1.0;
        tmp135 -= 1.0;
      }
      
      if(fabs(tmp134) < 1e-10)
        tmp133 = pow(tmp131, tmp135);
      else
      {
        tmp137 = modf(1.0/tmp132, &tmp136);
        if(tmp137 > 0.5)
        {
          tmp137 -= 1.0;
          tmp136 += 1.0;
        }
        else if(tmp137 < -0.5)
        {
          tmp137 += 1.0;
          tmp136 -= 1.0;
        }
        if(fabs(tmp137) < 1e-10 && ((unsigned long)tmp136 & 1))
        {
          tmp133 = -pow(-tmp131, tmp134)*pow(tmp131, tmp135);
        }
        else
        {
          throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp131, tmp132);
        }
      }
    }
    else
    {
      tmp133 = pow(tmp131, tmp132);
    }
    if(isnan(tmp133) || isinf(tmp133))
    {
      throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp131, tmp132);
    }tmp138 = 1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */);
    tmp140 = ((tmp133) * (2.302585092994046)) * ((-2.04) * (DIVISION((jacobian->seedVars[1] /* uit.digester.z.SeedNLSJac14 SEED_VAR */) * (1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */) - (data->localData[0]->realVars[739] /* uit.digester.z variable */)),(tmp138 * tmp138),"(1.0 + uit.digester.z) ^ 2.0") - ((0.24) * (jacobian->tmpVars[0] /* uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */))));
  }
  jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = tmp140;
  TRACE_POP
}

/*
equation index: 3650
type: SIMPLE_ASSIGN
uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 = if noEvent(uit.digester.ideality == true) then 0.0 else 10.0 ^ ((-4.59) * (uit.digester.z / (1.0 + uit.digester.z) - 0.24 * uit.digester.I)) * 2.302585092994046 * (-4.59) * (uit.digester.z.SeedNLSJac14 * (1.0 + uit.digester.z - uit.digester.z) / (1.0 + uit.digester.z) ^ 2.0 - 0.24 * uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3650(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,3650};
  modelica_real tmp142;
  modelica_real tmp143;
  modelica_real tmp144;
  modelica_real tmp145;
  modelica_real tmp146;
  modelica_real tmp147;
  modelica_real tmp148;
  modelica_real tmp149;
  modelica_boolean tmp150;
  modelica_real tmp151;
  tmp150 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1));
  if(tmp150)
  {
    tmp151 = 0.0;
  }
  else
  {
    tmp142 = 10.0;
    tmp143 = (-4.59) * (DIVISION((data->localData[0]->realVars[739] /* uit.digester.z variable */),1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */),"1.0 + uit.digester.z") - ((0.24) * ((data->localData[0]->realVars[433] /* uit.digester.I variable */))));
    if(tmp142 < 0.0 && tmp143 != 0.0)
    {
      tmp145 = modf(tmp143, &tmp146);
      
      if(tmp145 > 0.5)
      {
        tmp145 -= 1.0;
        tmp146 += 1.0;
      }
      else if(tmp145 < -0.5)
      {
        tmp145 += 1.0;
        tmp146 -= 1.0;
      }
      
      if(fabs(tmp145) < 1e-10)
        tmp144 = pow(tmp142, tmp146);
      else
      {
        tmp148 = modf(1.0/tmp143, &tmp147);
        if(tmp148 > 0.5)
        {
          tmp148 -= 1.0;
          tmp147 += 1.0;
        }
        else if(tmp148 < -0.5)
        {
          tmp148 += 1.0;
          tmp147 -= 1.0;
        }
        if(fabs(tmp148) < 1e-10 && ((unsigned long)tmp147 & 1))
        {
          tmp144 = -pow(-tmp142, tmp145)*pow(tmp142, tmp146);
        }
        else
        {
          throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp142, tmp143);
        }
      }
    }
    else
    {
      tmp144 = pow(tmp142, tmp143);
    }
    if(isnan(tmp144) || isinf(tmp144))
    {
      throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp142, tmp143);
    }tmp149 = 1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */);
    tmp151 = ((tmp144) * (2.302585092994046)) * ((-4.59) * (DIVISION((jacobian->seedVars[1] /* uit.digester.z.SeedNLSJac14 SEED_VAR */) * (1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */) - (data->localData[0]->realVars[739] /* uit.digester.z variable */)),(tmp149 * tmp149),"(1.0 + uit.digester.z) ^ 2.0") - ((0.24) * (jacobian->tmpVars[0] /* uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */))));
  }
  jacobian->tmpVars[2] /* uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = tmp151;
  TRACE_POP
}

/*
equation index: 3651
type: SIMPLE_ASSIGN
uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 = if noEvent(uit.digester.ideality == true) then 0.0 else 10.0 ^ ((-0.51) * (uit.digester.z / (1.0 + uit.digester.z) - 0.24 * uit.digester.I)) * 2.302585092994046 * (-0.51) * (uit.digester.z.SeedNLSJac14 * (1.0 + uit.digester.z - uit.digester.z) / (1.0 + uit.digester.z) ^ 2.0 - 0.24 * uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3651(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 3;
  const int equationIndexes[2] = {1,3651};
  modelica_real tmp153;
  modelica_real tmp154;
  modelica_real tmp155;
  modelica_real tmp156;
  modelica_real tmp157;
  modelica_real tmp158;
  modelica_real tmp159;
  modelica_real tmp160;
  modelica_boolean tmp161;
  modelica_real tmp162;
  tmp161 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1));
  if(tmp161)
  {
    tmp162 = 0.0;
  }
  else
  {
    tmp153 = 10.0;
    tmp154 = (-0.51) * (DIVISION((data->localData[0]->realVars[739] /* uit.digester.z variable */),1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */),"1.0 + uit.digester.z") - ((0.24) * ((data->localData[0]->realVars[433] /* uit.digester.I variable */))));
    if(tmp153 < 0.0 && tmp154 != 0.0)
    {
      tmp156 = modf(tmp154, &tmp157);
      
      if(tmp156 > 0.5)
      {
        tmp156 -= 1.0;
        tmp157 += 1.0;
      }
      else if(tmp156 < -0.5)
      {
        tmp156 += 1.0;
        tmp157 -= 1.0;
      }
      
      if(fabs(tmp156) < 1e-10)
        tmp155 = pow(tmp153, tmp157);
      else
      {
        tmp159 = modf(1.0/tmp154, &tmp158);
        if(tmp159 > 0.5)
        {
          tmp159 -= 1.0;
          tmp158 += 1.0;
        }
        else if(tmp159 < -0.5)
        {
          tmp159 += 1.0;
          tmp158 -= 1.0;
        }
        if(fabs(tmp159) < 1e-10 && ((unsigned long)tmp158 & 1))
        {
          tmp155 = -pow(-tmp153, tmp156)*pow(tmp153, tmp157);
        }
        else
        {
          throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp153, tmp154);
        }
      }
    }
    else
    {
      tmp155 = pow(tmp153, tmp154);
    }
    if(isnan(tmp155) || isinf(tmp155))
    {
      throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp153, tmp154);
    }tmp160 = 1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */);
    tmp162 = ((tmp155) * (2.302585092994046)) * ((-0.51) * (DIVISION((jacobian->seedVars[1] /* uit.digester.z.SeedNLSJac14 SEED_VAR */) * (1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */) - (data->localData[0]->realVars[739] /* uit.digester.z variable */)),(tmp160 * tmp160),"(1.0 + uit.digester.z) ^ 2.0") - ((0.24) * (jacobian->tmpVars[0] /* uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */))));
  }
  jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = tmp162;
  TRACE_POP
}

/*
equation index: 3652
type: SIMPLE_ASSIGN
uit.digester.a_hpo4.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.S_ip * uit.digester.Ka_h3po4 * (uit.digester.a_h * (-uit.digester.Ka_h2po4) * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + uit.digester.Ka_h3po4 * ((2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0 + uit.digester.Ka_h2po4 * ((uit.digester.a_h.SeedNLSJac14 * uit.digester.g_bi - uit.digester.a_h * uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_bi ^ 2.0 - uit.digester.Ka_hpo4 * uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 / uit.digester.g_tri ^ 2.0))) / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))) ^ 2.0 + uit.digester.a_h.SeedNLSJac14 * uit.digester.Ka_h2po4 / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3652(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 4;
  const int equationIndexes[2] = {1,3652};
  modelica_real tmp163;
  modelica_real tmp164;
  modelica_real tmp165;
  modelica_real tmp166;
  modelica_real tmp167;
  modelica_real tmp168;
  modelica_real tmp169;
  modelica_real tmp170;
  modelica_real tmp171;
  modelica_real tmp172;
  tmp163 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp164 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp165 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp166 = (data->localData[0]->realVars[633] /* uit.digester.g_bi variable */);
  tmp167 = (data->localData[0]->realVars[635] /* uit.digester.g_tri variable */);
  tmp168 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp169 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp170 = (tmp168 * tmp168 * tmp168) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((tmp169 * tmp169),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi") + DIVISION((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri")));
  tmp171 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp172 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[4] /* uit.digester.a_hpo4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = ((data->localData[0]->realVars[38] /* uit.digester.S_ip STATE(1) */)) * (((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (((-(data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */))) * (DIVISION((3.0) * (((tmp163 * tmp163)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp164 * tmp164)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp165 * tmp165),"uit.digester.g_mono ^ 2.0") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)) - (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp166 * tmp166),"uit.digester.g_bi ^ 2.0") - (((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */)) * (DIVISION(jacobian->tmpVars[2] /* uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */,(tmp167 * tmp167),"uit.digester.g_tri ^ 2.0"))))),(tmp170 * tmp170),"(uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))) ^ 2.0"))) + (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */),(tmp171 * tmp171 * tmp171) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((tmp172 * tmp172),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi") + DIVISION((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri"))),"uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))"))));
  TRACE_POP
}

/*
equation index: 3653
type: SIMPLE_ASSIGN
uit.digester.a_po4.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.S_ip * uit.digester.Ka_h3po4 * uit.digester.Ka_h2po4 * (-uit.digester.Ka_hpo4) * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + uit.digester.Ka_h3po4 * ((2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0 + uit.digester.Ka_h2po4 * ((uit.digester.a_h.SeedNLSJac14 * uit.digester.g_bi - uit.digester.a_h * uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_bi ^ 2.0 - uit.digester.Ka_hpo4 * uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 / uit.digester.g_tri ^ 2.0))) / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))) ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3653(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 5;
  const int equationIndexes[2] = {1,3653};
  modelica_real tmp173;
  modelica_real tmp174;
  modelica_real tmp175;
  modelica_real tmp176;
  modelica_real tmp177;
  modelica_real tmp178;
  modelica_real tmp179;
  modelica_real tmp180;
  tmp173 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp174 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp175 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp176 = (data->localData[0]->realVars[633] /* uit.digester.g_bi variable */);
  tmp177 = (data->localData[0]->realVars[635] /* uit.digester.g_tri variable */);
  tmp178 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp179 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp180 = (tmp178 * tmp178 * tmp178) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((tmp179 * tmp179),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi") + DIVISION((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri")));
  jacobian->tmpVars[5] /* uit.digester.a_po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = ((data->localData[0]->realVars[38] /* uit.digester.S_ip STATE(1) */)) * (((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (((-(data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */))) * (DIVISION((3.0) * (((tmp173 * tmp173)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp174 * tmp174)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp175 * tmp175),"uit.digester.g_mono ^ 2.0") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)) - (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp176 * tmp176),"uit.digester.g_bi ^ 2.0") - (((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */)) * (DIVISION(jacobian->tmpVars[2] /* uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */,(tmp177 * tmp177),"uit.digester.g_tri ^ 2.0"))))),(tmp180 * tmp180),"(uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))) ^ 2.0")))));
  TRACE_POP
}

/*
equation index: 3654
type: SIMPLE_ASSIGN
uit.digester.a_h2po4.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.S_ip * (uit.digester.a_h ^ 2.0 * (-uit.digester.Ka_h3po4) * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + uit.digester.Ka_h3po4 * ((2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0 + uit.digester.Ka_h2po4 * ((uit.digester.a_h.SeedNLSJac14 * uit.digester.g_bi - uit.digester.a_h * uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_bi ^ 2.0 - uit.digester.Ka_hpo4 * uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 / uit.digester.g_tri ^ 2.0))) / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))) ^ 2.0 + 2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.Ka_h3po4 / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3654(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 6;
  const int equationIndexes[2] = {1,3654};
  modelica_real tmp181;
  modelica_real tmp182;
  modelica_real tmp183;
  modelica_real tmp184;
  modelica_real tmp185;
  modelica_real tmp186;
  modelica_real tmp187;
  modelica_real tmp188;
  modelica_real tmp189;
  modelica_real tmp190;
  modelica_real tmp191;
  tmp181 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp182 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp183 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp184 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp185 = (data->localData[0]->realVars[633] /* uit.digester.g_bi variable */);
  tmp186 = (data->localData[0]->realVars[635] /* uit.digester.g_tri variable */);
  tmp187 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp188 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp189 = (tmp187 * tmp187 * tmp187) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((tmp188 * tmp188),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi") + DIVISION((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri")));
  tmp190 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp191 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[6] /* uit.digester.a_h2po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = ((data->localData[0]->realVars[38] /* uit.digester.S_ip STATE(1) */)) * (((tmp181 * tmp181)) * (((-(data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */))) * (DIVISION((3.0) * (((tmp182 * tmp182)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp183 * tmp183)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp184 * tmp184),"uit.digester.g_mono ^ 2.0") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)) - (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp185 * tmp185),"uit.digester.g_bi ^ 2.0") - (((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */)) * (DIVISION(jacobian->tmpVars[2] /* uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */,(tmp186 * tmp186),"uit.digester.g_tri ^ 2.0"))))),(tmp189 * tmp189),"(uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))) ^ 2.0"))) + (2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */),(tmp190 * tmp190 * tmp190) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION((tmp191 * tmp191),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono") + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi") + DIVISION((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri"))),"uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))")))));
  TRACE_POP
}

/*
equation index: 3655
type: SIMPLE_ASSIGN
uit.digester.a_hco3.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.Ka_co2 * (-uit.digester.S_ic) * ((1.0 + (1.0 / (uit.digester.a_h * uit.digester.g_mono) + uit.digester.Ka_hco3 / (uit.digester.a_h ^ 2.0 * uit.digester.g_bi)) * uit.digester.Ka_co2) * uit.digester.a_h.SeedNLSJac14 + (((-uit.digester.g_mono) * uit.digester.a_h.SeedNLSJac14 - uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.a_h) / (uit.digester.g_mono * uit.digester.a_h) ^ 2.0 - uit.digester.Ka_hco3 * (uit.digester.a_h ^ 2.0 * uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 + 2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_bi) / (uit.digester.a_h ^ 2.0 * uit.digester.g_bi) ^ 2.0) * uit.digester.Ka_co2 * uit.digester.a_h) / ((1.0 + (1.0 / (uit.digester.a_h * uit.digester.g_mono) + uit.digester.Ka_hco3 / (uit.digester.a_h ^ 2.0 * uit.digester.g_bi)) * uit.digester.Ka_co2) * uit.digester.a_h) ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3655(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 7;
  const int equationIndexes[2] = {1,3655};
  modelica_real tmp192;
  modelica_real tmp193;
  modelica_real tmp194;
  modelica_real tmp195;
  modelica_real tmp196;
  modelica_real tmp197;
  modelica_real tmp198;
  tmp192 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp193 = ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) * ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */));
  tmp194 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp195 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp196 = ((tmp195 * tmp195)) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */));
  tmp197 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp198 = (1.0 + (DIVISION(1.0,((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)),"uit.digester.a_h * uit.digester.g_mono") + DIVISION((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */),((tmp197 * tmp197)) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)),"uit.digester.a_h ^ 2.0 * uit.digester.g_bi")) * ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */))) * ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */));
  jacobian->tmpVars[7] /* uit.digester.a_hco3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (DIVISION(((-(data->localData[0]->realVars[36] /* uit.digester.S_ic STATE(1) */))) * ((1.0 + (DIVISION(1.0,((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)),"uit.digester.a_h * uit.digester.g_mono") + DIVISION((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */),((tmp192 * tmp192)) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)),"uit.digester.a_h ^ 2.0 * uit.digester.g_bi")) * ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */))) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) + (DIVISION(((-(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */))) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) - ((jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */))),(tmp193 * tmp193),"(uit.digester.g_mono * uit.digester.a_h) ^ 2.0") - (((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */)) * (DIVISION(((tmp194 * tmp194)) * (jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)))),(tmp196 * tmp196),"(uit.digester.a_h ^ 2.0 * uit.digester.g_bi) ^ 2.0")))) * (((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)))),(tmp198 * tmp198),"((1.0 + (1.0 / (uit.digester.a_h * uit.digester.g_mono) + uit.digester.Ka_hco3 / (uit.digester.a_h ^ 2.0 * uit.digester.g_bi)) * uit.digester.Ka_co2) * uit.digester.a_h) ^ 2.0"));
  TRACE_POP
}

/*
equation index: 3656
type: SIMPLE_ASSIGN
uit.digester.a_co3.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.S_ic * uit.digester.Ka_co2 * (uit.digester.a_h * (-uit.digester.Ka_hco3) * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + uit.digester.Ka_co2 * (uit.digester.Ka_hco3 * (uit.digester.a_h.SeedNLSJac14 * uit.digester.g_bi - uit.digester.a_h * uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_bi ^ 2.0 + (2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0)) / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_co2 * (uit.digester.Ka_hco3 * uit.digester.a_h / uit.digester.g_bi + uit.digester.a_h ^ 2.0 / uit.digester.g_mono)) ^ 2.0 + uit.digester.a_h.SeedNLSJac14 * uit.digester.Ka_hco3 / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_co2 * (uit.digester.Ka_hco3 * uit.digester.a_h / uit.digester.g_bi + uit.digester.a_h ^ 2.0 / uit.digester.g_mono)))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3656(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 8;
  const int equationIndexes[2] = {1,3656};
  modelica_real tmp199;
  modelica_real tmp200;
  modelica_real tmp201;
  modelica_real tmp202;
  modelica_real tmp203;
  modelica_real tmp204;
  modelica_real tmp205;
  modelica_real tmp206;
  modelica_real tmp207;
  tmp199 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp200 = (data->localData[0]->realVars[633] /* uit.digester.g_bi variable */);
  tmp201 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp202 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp203 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp204 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp205 = (tmp203 * tmp203 * tmp203) + ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */)) * (DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi")) + DIVISION((tmp204 * tmp204),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono"));
  tmp206 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp207 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[8] /* uit.digester.a_co3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = ((data->localData[0]->realVars[36] /* uit.digester.S_ic STATE(1) */)) * (((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (((-(data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */))) * (DIVISION((3.0) * (((tmp199 * tmp199)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */)) * (DIVISION((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)) - (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp200 * tmp200),"uit.digester.g_bi ^ 2.0")) + DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp201 * tmp201)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp202 * tmp202),"uit.digester.g_mono ^ 2.0")),(tmp205 * tmp205),"(uit.digester.a_h ^ 3.0 + uit.digester.Ka_co2 * (uit.digester.Ka_hco3 * uit.digester.a_h / uit.digester.g_bi + uit.digester.a_h ^ 2.0 / uit.digester.g_mono)) ^ 2.0"))) + (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */),(tmp206 * tmp206 * tmp206) + ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */)) * (DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi")) + DIVISION((tmp207 * tmp207),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono")),"uit.digester.a_h ^ 3.0 + uit.digester.Ka_co2 * (uit.digester.Ka_hco3 * uit.digester.a_h / uit.digester.g_bi + uit.digester.a_h ^ 2.0 / uit.digester.g_mono)"))));
  TRACE_POP
}

/*
equation index: 3657
type: SIMPLE_ASSIGN
uit.digester.a_acm.$pDERNLSJac14.dummyVarNLSJac14 = 0.0156119900083264 * uit.digester.S_ac * ((-1.737800828749376e-05) * uit.digester.a_h ^ 2.0 * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + 1.737800828749376e-05 * (2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0) / (uit.digester.a_h ^ 3.0 + 1.737800828749376e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0 + 3.475601657498753e-05 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 / (uit.digester.a_h ^ 3.0 + 1.737800828749376e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3657(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 9;
  const int equationIndexes[2] = {1,3657};
  modelica_real tmp208;
  modelica_real tmp209;
  modelica_real tmp210;
  modelica_real tmp211;
  modelica_real tmp212;
  modelica_real tmp213;
  modelica_real tmp214;
  modelica_real tmp215;
  modelica_real tmp216;
  tmp208 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp209 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp210 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp211 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp212 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp213 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp214 = (tmp212 * tmp212 * tmp212) + (1.737800828749376e-05) * (DIVISION((tmp213 * tmp213),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono"));
  tmp215 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp216 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[9] /* uit.digester.a_acm.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (0.0156119900083264) * (((data->localData[0]->realVars[22] /* uit.digester.S_ac STATE(1) */)) * ((-1.737800828749376e-05) * (((tmp208 * tmp208)) * (DIVISION((3.0) * (((tmp209 * tmp209)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + (1.737800828749376e-05) * (DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp210 * tmp210)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp211 * tmp211),"uit.digester.g_mono ^ 2.0")),(tmp214 * tmp214),"(uit.digester.a_h ^ 3.0 + 1.737800828749376e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0"))) + (3.475601657498753e-05) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (DIVISION(jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */,(tmp215 * tmp215 * tmp215) + (1.737800828749376e-05) * (DIVISION((tmp216 * tmp216),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono")),"uit.digester.a_h ^ 3.0 + 1.737800828749376e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono")))));
  TRACE_POP
}

/*
equation index: 3658
type: SIMPLE_ASSIGN
uit.digester.a_nh4.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.a_h * (-uit.digester.S_in) * (uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) * (uit.digester.Ka_nh4 / (uit.digester.Ka_nh4 * uit.digester.g_mono * (1.0 + uit.digester.a_h / (uit.digester.Ka_nh4 * uit.digester.g_mono)) * uit.digester.Ka_nh4)) ^ 2.0 + uit.digester.a_h.SeedNLSJac14 * uit.digester.S_in / (uit.digester.Ka_nh4 * (1.0 + uit.digester.a_h / (uit.digester.Ka_nh4 * uit.digester.g_mono)))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3658(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 10;
  const int equationIndexes[2] = {1,3658};
  modelica_real tmp217;
  tmp217 = DIVISION((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */),(((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */)) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */))) * ((1.0 + DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */)) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)),"uit.digester.Ka_nh4 * uit.digester.g_mono")) * ((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */))),"uit.digester.Ka_nh4 * uit.digester.g_mono * (1.0 + uit.digester.a_h / (uit.digester.Ka_nh4 * uit.digester.g_mono)) * uit.digester.Ka_nh4");
  jacobian->tmpVars[10] /* uit.digester.a_nh4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (((-(data->localData[0]->realVars[37] /* uit.digester.S_in STATE(1) */))) * (((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */))) * ((tmp217 * tmp217)))) + (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[37] /* uit.digester.S_in STATE(1) */),((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */)) * (1.0 + DIVISION((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */)) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)),"uit.digester.Ka_nh4 * uit.digester.g_mono")),"uit.digester.Ka_nh4 * (1.0 + uit.digester.a_h / (uit.digester.Ka_nh4 * uit.digester.g_mono))"));
  TRACE_POP
}

/*
equation index: 3659
type: SIMPLE_ASSIGN
uit.digester.a_prom.$pDERNLSJac14.dummyVarNLSJac14 = 0.008918929342795433 * uit.digester.S_pro * ((-1.318256738556407e-05) * uit.digester.a_h ^ 2.0 * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + 1.318256738556407e-05 * (2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0) / (uit.digester.a_h ^ 3.0 + 1.318256738556407e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0 + 2.636513477112815e-05 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 / (uit.digester.a_h ^ 3.0 + 1.318256738556407e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3659(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 11;
  const int equationIndexes[2] = {1,3659};
  modelica_real tmp218;
  modelica_real tmp219;
  modelica_real tmp220;
  modelica_real tmp221;
  modelica_real tmp222;
  modelica_real tmp223;
  modelica_real tmp224;
  modelica_real tmp225;
  modelica_real tmp226;
  tmp218 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp219 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp220 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp221 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp222 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp223 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp224 = (tmp222 * tmp222 * tmp222) + (1.318256738556407e-05) * (DIVISION((tmp223 * tmp223),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono"));
  tmp225 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp226 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[11] /* uit.digester.a_prom.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (0.008918929342795433) * (((data->localData[0]->realVars[40] /* uit.digester.S_pro STATE(1) */)) * ((-1.318256738556407e-05) * (((tmp218 * tmp218)) * (DIVISION((3.0) * (((tmp219 * tmp219)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + (1.318256738556407e-05) * (DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp220 * tmp220)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp221 * tmp221),"uit.digester.g_mono ^ 2.0")),(tmp224 * tmp224),"(uit.digester.a_h ^ 3.0 + 1.318256738556407e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0"))) + (2.636513477112815e-05) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (DIVISION(jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */,(tmp225 * tmp225 * tmp225) + (1.318256738556407e-05) * (DIVISION((tmp226 * tmp226),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono")),"uit.digester.a_h ^ 3.0 + 1.318256738556407e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono")))));
  TRACE_POP
}

/*
equation index: 3660
type: SIMPLE_ASSIGN
uit.digester.a_bum.$pDERNLSJac14.dummyVarNLSJac14 = 0.006242905788876279 * uit.digester.S_bu * ((-1.513561248436207e-05) * uit.digester.a_h ^ 2.0 * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + 1.513561248436207e-05 * (2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0) / (uit.digester.a_h ^ 3.0 + 1.513561248436207e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0 + 3.027122496872414e-05 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 / (uit.digester.a_h ^ 3.0 + 1.513561248436207e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3660(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 12;
  const int equationIndexes[2] = {1,3660};
  modelica_real tmp227;
  modelica_real tmp228;
  modelica_real tmp229;
  modelica_real tmp230;
  modelica_real tmp231;
  modelica_real tmp232;
  modelica_real tmp233;
  modelica_real tmp234;
  modelica_real tmp235;
  tmp227 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp228 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp229 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp230 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp231 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp232 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp233 = (tmp231 * tmp231 * tmp231) + (1.513561248436207e-05) * (DIVISION((tmp232 * tmp232),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono"));
  tmp234 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp235 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[12] /* uit.digester.a_bum.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (0.006242905788876279) * (((data->localData[0]->realVars[24] /* uit.digester.S_bu STATE(1) */)) * ((-1.513561248436207e-05) * (((tmp227 * tmp227)) * (DIVISION((3.0) * (((tmp228 * tmp228)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + (1.513561248436207e-05) * (DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp229 * tmp229)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp230 * tmp230),"uit.digester.g_mono ^ 2.0")),(tmp233 * tmp233),"(uit.digester.a_h ^ 3.0 + 1.513561248436207e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0"))) + (3.027122496872414e-05) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (DIVISION(jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */,(tmp234 * tmp234 * tmp234) + (1.513561248436207e-05) * (DIVISION((tmp235 * tmp235),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono")),"uit.digester.a_h ^ 3.0 + 1.513561248436207e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono")))));
  TRACE_POP
}

/*
equation index: 3661
type: SIMPLE_ASSIGN
uit.digester.a_vam.$pDERNLSJac14.dummyVarNLSJac14 = 0.004801572656267654 * uit.digester.S_va * ((-1.380384264602884e-05) * uit.digester.a_h ^ 2.0 * (3.0 * uit.digester.a_h ^ 2.0 * uit.digester.a_h.SeedNLSJac14 + 1.380384264602884e-05 * (2.0 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 * uit.digester.g_mono - uit.digester.a_h ^ 2.0 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0) / (uit.digester.a_h ^ 3.0 + 1.380384264602884e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0 + 2.760768529205768e-05 * uit.digester.a_h * uit.digester.a_h.SeedNLSJac14 / (uit.digester.a_h ^ 3.0 + 1.380384264602884e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3661(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 13;
  const int equationIndexes[2] = {1,3661};
  modelica_real tmp236;
  modelica_real tmp237;
  modelica_real tmp238;
  modelica_real tmp239;
  modelica_real tmp240;
  modelica_real tmp241;
  modelica_real tmp242;
  modelica_real tmp243;
  modelica_real tmp244;
  tmp236 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp237 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp238 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp239 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  tmp240 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp241 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp242 = (tmp240 * tmp240 * tmp240) + (1.380384264602884e-05) * (DIVISION((tmp241 * tmp241),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono"));
  tmp243 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp244 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[13] /* uit.digester.a_vam.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (0.004801572656267654) * (((data->localData[0]->realVars[42] /* uit.digester.S_va STATE(1) */)) * ((-1.380384264602884e-05) * (((tmp236 * tmp236)) * (DIVISION((3.0) * (((tmp237 * tmp237)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)) + (1.380384264602884e-05) * (DIVISION((2.0) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * ((jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)))) - (((tmp238 * tmp238)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp239 * tmp239),"uit.digester.g_mono ^ 2.0")),(tmp242 * tmp242),"(uit.digester.a_h ^ 3.0 + 1.380384264602884e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) ^ 2.0"))) + (2.760768529205768e-05) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (DIVISION(jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */,(tmp243 * tmp243 * tmp243) + (1.380384264602884e-05) * (DIVISION((tmp244 * tmp244),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono")),"uit.digester.a_h ^ 3.0 + 1.380384264602884e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono")))));
  TRACE_POP
}

/*
equation index: 3662
type: SIMPLE_ASSIGN
uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14 = 64.05333333333333 * (uit.digester.a_acm.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono - uit.digester.a_acm * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3662(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 14;
  const int equationIndexes[2] = {1,3662};
  modelica_real tmp245;
  tmp245 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  jacobian->tmpVars[14] /* uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (64.05333333333333) * (DIVISION((jacobian->tmpVars[9] /* uit.digester.a_acm.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[595] /* uit.digester.a_acm variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp245 * tmp245),"uit.digester.g_mono ^ 2.0"));
  TRACE_POP
}

/*
equation index: 3663
type: SIMPLE_ASSIGN
uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 = 112.1210810810811 * (uit.digester.a_prom.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono - uit.digester.a_prom * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3663(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 15;
  const int equationIndexes[2] = {1,3663};
  modelica_real tmp246;
  tmp246 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  jacobian->tmpVars[15] /* uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (112.1210810810811) * (DIVISION((jacobian->tmpVars[11] /* uit.digester.a_prom.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[608] /* uit.digester.a_prom variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp246 * tmp246),"uit.digester.g_mono ^ 2.0"));
  TRACE_POP
}

/*
equation index: 3664
type: SIMPLE_ASSIGN
uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 = 160.1818181818182 * (uit.digester.a_bum.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono - uit.digester.a_bum * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3664(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 16;
  const int equationIndexes[2] = {1,3664};
  modelica_real tmp247;
  tmp247 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  jacobian->tmpVars[16] /* uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (160.1818181818182) * (DIVISION((jacobian->tmpVars[12] /* uit.digester.a_bum.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[596] /* uit.digester.a_bum variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp247 * tmp247),"uit.digester.g_mono ^ 2.0"));
  TRACE_POP
}

/*
equation index: 3665
type: SIMPLE_ASSIGN
uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14 = 208.2650980392157 * (uit.digester.a_vam.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono - uit.digester.a_vam * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3665(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 17;
  const int equationIndexes[2] = {1,3665};
  modelica_real tmp248;
  tmp248 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  jacobian->tmpVars[17] /* uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (208.2650980392157) * (DIVISION((jacobian->tmpVars[13] /* uit.digester.a_vam.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[609] /* uit.digester.a_vam variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp248 * tmp248),"uit.digester.g_mono ^ 2.0"));
  TRACE_POP
}

/*
equation index: 3666
type: SIMPLE_ASSIGN
uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 = (uit.digester.a_hpo4.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_bi - uit.digester.a_hpo4 * uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_bi ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3666(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 18;
  const int equationIndexes[2] = {1,3666};
  modelica_real tmp249;
  tmp249 = (data->localData[0]->realVars[633] /* uit.digester.g_bi variable */);
  jacobian->tmpVars[18] /* uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = DIVISION((jacobian->tmpVars[4] /* uit.digester.a_hpo4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)) - (((data->localData[0]->realVars[603] /* uit.digester.a_hpo4 variable */)) * (jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp249 * tmp249),"uit.digester.g_bi ^ 2.0");
  TRACE_POP
}

/*
equation index: 3667
type: SIMPLE_ASSIGN
uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 = (uit.digester.a_po4.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_tri - uit.digester.a_po4 * uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_tri ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3667(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 19;
  const int equationIndexes[2] = {1,3667};
  modelica_real tmp250;
  tmp250 = (data->localData[0]->realVars[635] /* uit.digester.g_tri variable */);
  jacobian->tmpVars[19] /* uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = DIVISION((jacobian->tmpVars[5] /* uit.digester.a_po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[635] /* uit.digester.g_tri variable */)) - (((data->localData[0]->realVars[607] /* uit.digester.a_po4 variable */)) * (jacobian->tmpVars[2] /* uit.digester.g_tri.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp250 * tmp250),"uit.digester.g_tri ^ 2.0");
  TRACE_POP
}

/*
equation index: 3668
type: SIMPLE_ASSIGN
uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 = (uit.digester.a_nh4.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono - uit.digester.a_nh4 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3668(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 20;
  const int equationIndexes[2] = {1,3668};
  modelica_real tmp251;
  tmp251 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  jacobian->tmpVars[20] /* uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = DIVISION((jacobian->tmpVars[10] /* uit.digester.a_nh4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[605] /* uit.digester.a_nh4 variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp251 * tmp251),"uit.digester.g_mono ^ 2.0");
  TRACE_POP
}

/*
equation index: 3669
type: SIMPLE_ASSIGN
uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 = (uit.digester.a_hco3.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono - uit.digester.a_hco3 * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3669(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 21;
  const int equationIndexes[2] = {1,3669};
  modelica_real tmp252;
  tmp252 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  jacobian->tmpVars[21] /* uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = DIVISION((jacobian->tmpVars[7] /* uit.digester.a_hco3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[602] /* uit.digester.a_hco3 variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp252 * tmp252),"uit.digester.g_mono ^ 2.0");
  TRACE_POP
}

/*
equation index: 3670
type: SIMPLE_ASSIGN
uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 = (uit.digester.a_co3.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_bi - uit.digester.a_co3 * uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_bi ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3670(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 22;
  const int equationIndexes[2] = {1,3670};
  modelica_real tmp253;
  tmp253 = (data->localData[0]->realVars[633] /* uit.digester.g_bi variable */);
  jacobian->tmpVars[22] /* uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = DIVISION((jacobian->tmpVars[8] /* uit.digester.a_co3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)) - (((data->localData[0]->realVars[598] /* uit.digester.a_co3 variable */)) * (jacobian->tmpVars[1] /* uit.digester.g_bi.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp253 * tmp253),"uit.digester.g_bi ^ 2.0");
  TRACE_POP
}

/*
equation index: 3671
type: SIMPLE_ASSIGN
uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 = 2.0 * uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14 - (9.0 * uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 + 4.0 * uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 + 4.0 * uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 + 0.0156119900083264 * uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14 + 0.008918929342795433 * uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 + 0.006242905788876278 * uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 + 0.004801572656267654 * uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3671(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 23;
  const int equationIndexes[2] = {1,3671};
  jacobian->tmpVars[23] /* uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (2.0) * (jacobian->tmpVars[0] /* uit.digester.I.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) - ((9.0) * (jacobian->tmpVars[19] /* uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + jacobian->tmpVars[20] /* uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + (4.0) * (jacobian->tmpVars[18] /* uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + jacobian->tmpVars[21] /* uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + (4.0) * (jacobian->tmpVars[22] /* uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (0.0156119900083264) * (jacobian->tmpVars[14] /* uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (0.008918929342795433) * (jacobian->tmpVars[15] /* uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (0.006242905788876278) * (jacobian->tmpVars[16] /* uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (0.004801572656267654) * (jacobian->tmpVars[17] /* uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */));
  TRACE_POP
}

/*
equation index: 3672
type: SIMPLE_ASSIGN
uit.digester.a_h2o.$pDERNLSJac14.dummyVarNLSJac14 = if noEvent(uit.digester.ideality == true) then 0.0 else (-0.017) * (uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 + 0.004801572656267654 * uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14 + 0.006242905788876279 * uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 + 0.008918929342795433 * uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 + 0.0156119900083264 * uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3672(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 24;
  const int equationIndexes[2] = {1,3672};
  jacobian->tmpVars[24] /* uit.digester.a_h2o.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = (((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1))?0.0:(-0.017) * (jacobian->tmpVars[20] /* uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + jacobian->tmpVars[21] /* uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + jacobian->tmpVars[22] /* uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + jacobian->tmpVars[23] /* uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + jacobian->tmpVars[18] /* uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + jacobian->tmpVars[19] /* uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + (0.004801572656267654) * (jacobian->tmpVars[17] /* uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (0.006242905788876279) * (jacobian->tmpVars[16] /* uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (0.008918929342795433) * (jacobian->tmpVars[15] /* uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (0.0156119900083264) * (jacobian->tmpVars[14] /* uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)));
  TRACE_POP
}

/*
equation index: 3673
type: SIMPLE_ASSIGN
uit.digester.a_oh.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.Ka_h2o * uit.digester.convKa * (uit.digester.a_h2o.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.a_h - uit.digester.a_h2o * uit.digester.a_h.SeedNLSJac14) / uit.digester.a_h ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3673(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 25;
  const int equationIndexes[2] = {1,3673};
  modelica_real tmp255;
  tmp255 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  jacobian->tmpVars[25] /* uit.digester.a_oh.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = ((data->localData[0]->realVars[466] /* uit.digester.Ka_h2o variable */)) * (((data->simulationInfo->realParameter[607] /* uit.digester.convKa PARAM */)) * (DIVISION((jacobian->tmpVars[24] /* uit.digester.a_h2o.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) - (((data->localData[0]->realVars[600] /* uit.digester.a_h2o variable */)) * (jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */)),(tmp255 * tmp255),"uit.digester.a_h ^ 2.0")));
  TRACE_POP
}

/*
equation index: 3674
type: SIMPLE_ASSIGN
uit.digester.S_oh.$pDERNLSJac14.dummyVarNLSJac14 = (uit.digester.a_oh.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono - uit.digester.a_oh * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14) / uit.digester.g_mono ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3674(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 26;
  const int equationIndexes[2] = {1,3674};
  modelica_real tmp256;
  tmp256 = (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */);
  jacobian->tmpVars[26] /* uit.digester.S_oh.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = DIVISION((jacobian->tmpVars[25] /* uit.digester.a_oh.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) - (((data->localData[0]->realVars[606] /* uit.digester.a_oh variable */)) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */)),(tmp256 * tmp256),"uit.digester.g_mono ^ 2.0");
  TRACE_POP
}

/*
equation index: 3675
type: SIMPLE_ASSIGN
uit.digester.S_h.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 - (uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 + (-2.0) * uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 + (-3.0) * uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 + (-2.0) * uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 + (-0.0156119900083264) * uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14 + (-0.008918929342795433) * uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 + (-0.006242905788876278) * uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 + (-0.004801572656267654) * uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14 - uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 - uit.digester.S_oh.$pDERNLSJac14.dummyVarNLSJac14)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3675(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 27;
  const int equationIndexes[2] = {1,3675};
  jacobian->tmpVars[27] /* uit.digester.S_h.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ = jacobian->tmpVars[21] /* uit.digester.S_hco3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ - (jacobian->tmpVars[20] /* uit.digester.S_nh4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + (-2.0) * (jacobian->tmpVars[18] /* uit.digester.S_hpo4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (-3.0) * (jacobian->tmpVars[19] /* uit.digester.S_po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (-2.0) * (jacobian->tmpVars[22] /* uit.digester.S_co3.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (-0.0156119900083264) * (jacobian->tmpVars[14] /* uit.digester.S_acm.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (-0.008918929342795433) * (jacobian->tmpVars[15] /* uit.digester.S_prom.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (-0.006242905788876278) * (jacobian->tmpVars[16] /* uit.digester.S_bum.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (-0.004801572656267654) * (jacobian->tmpVars[17] /* uit.digester.S_vam.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) - jacobian->tmpVars[23] /* uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ - jacobian->tmpVars[26] /* uit.digester.S_oh.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */);
  TRACE_POP
}

/*
equation index: 3676
type: SIMPLE_ASSIGN
$res_NLSJac14_1.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.g_mono * uit.digester.S_h.$pDERNLSJac14.dummyVarNLSJac14 + uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.S_h - uit.digester.a_h.SeedNLSJac14
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3676(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 28;
  const int equationIndexes[2] = {1,3676};
  jacobian->resultVars[0] /* $res_NLSJac14_1.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_VAR */ = ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) * (jacobian->tmpVars[27] /* uit.digester.S_h.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) + (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[536] /* uit.digester.S_h variable */)) - jacobian->seedVars[0] /* uit.digester.a_h.SeedNLSJac14 SEED_VAR */;
  TRACE_POP
}

/*
equation index: 3677
type: SIMPLE_ASSIGN
$res_NLSJac14_2.$pDERNLSJac14.dummyVarNLSJac14 = uit.digester.a_h2po4.$pDERNLSJac14.dummyVarNLSJac14 + (-uit.digester.S_h2po4) * uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 - uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 * uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3677(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 29;
  const int equationIndexes[2] = {1,3677};
  jacobian->resultVars[1] /* $res_NLSJac14_2.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_VAR */ = jacobian->tmpVars[6] /* uit.digester.a_h2po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */ + ((-(data->localData[0]->realVars[538] /* uit.digester.S_h2po4 variable */))) * (jacobian->tmpVars[3] /* uit.digester.g_mono.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) - ((jacobian->tmpVars[23] /* uit.digester.S_h2po4.$pDERNLSJac14.dummyVarNLSJac14 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)));
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac14_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac14;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac14_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac14;
  ADM1_P_UIT_real_R2_copia_eqFunction_3648(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3649(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3650(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3651(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3652(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3653(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3654(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3655(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3656(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3657(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3658(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3659(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3660(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3661(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3662(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3663(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3664(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3665(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3666(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3667(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3668(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3669(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3670(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3671(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3672(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3673(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3674(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3675(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3676(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3677(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 3910
type: SIMPLE_ASSIGN
uit.slurry.S_co3.$pDERNLSJac16.dummyVarNLSJac16 = uit.slurry.outlet.S_ic.SeedNLSJac16 * uit.slurry.Ka_hco3 / (uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3910(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,3910};
  modelica_real tmp257;
  tmp257 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */);
  jacobian->tmpVars[0] /* uit.slurry.S_co3.$pDERNLSJac16.dummyVarNLSJac16 JACOBIAN_DIFF_VAR */ = (jacobian->seedVars[0] /* uit.slurry.outlet.S_ic.SeedNLSJac16 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),DIVISION((tmp257 * tmp257),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2") + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),"uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 3911
type: SIMPLE_ASSIGN
uit.slurry.S_hco3.$pDERNLSJac16.dummyVarNLSJac16 = if noEvent(0.0 > (if uit.slurry.liquid == false then uit.slurry.outlet.S_ic * uit.slurry.Ka_co2 / (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) else uit.slurry.Alk_mol - (uit.slurry.S_acm + uit.slurry.S_prom + uit.slurry.S_bum + uit.slurry.S_vam) - uit.slurry.S_oh - uit.slurry.S_nh3 + uit.slurry.S_h - uit.slurry.S_hpo4 - 2.0 * uit.slurry.S_po4 + uit.slurry.S_h3po4 - 2.0 * uit.slurry.S_co3)) then 0.0 else if uit.slurry.liquid == false then uit.slurry.outlet.S_ic.SeedNLSJac16 * uit.slurry.Ka_co2 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) / (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) ^ 2.0 else (-2.0) * uit.slurry.S_co3.$pDERNLSJac16.dummyVarNLSJac16
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3911(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,3911};
  modelica_boolean tmp259;
  modelica_real tmp261;
  modelica_boolean tmp262;
  modelica_real tmp263;
  modelica_boolean tmp264;
  modelica_real tmp265;
  tmp259 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h"),"uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h"):(data->localData[0]->realVars[1328] /* uit.slurry.Alk_mol variable */) - ((data->localData[0]->realVars[1422] /* uit.slurry.S_acm variable */) + (data->localData[0]->realVars[1435] /* uit.slurry.S_prom variable */) + (data->localData[0]->realVars[1423] /* uit.slurry.S_bum variable */) + (data->localData[0]->realVars[1436] /* uit.slurry.S_vam variable */)) - (data->localData[0]->realVars[1433] /* uit.slurry.S_oh variable */) - (data->localData[0]->realVars[1431] /* uit.slurry.S_nh3 variable */) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) - (data->localData[0]->realVars[1430] /* uit.slurry.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1434] /* uit.slurry.S_po4 variable */))) + (data->localData[0]->realVars[1428] /* uit.slurry.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */)))));
  tmp264 = (modelica_boolean)tmp259;
  if(tmp264)
  {
    tmp265 = 0.0;
  }
  else
  {
    tmp262 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0));
    if(tmp262)
    {
      tmp261 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h");
      tmp263 = DIVISION(((jacobian->seedVars[0] /* uit.slurry.outlet.S_ic.SeedNLSJac16 SEED_VAR */) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */))) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h")),(tmp261 * tmp261),"(uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) ^ 2.0");
    }
    else
    {
      tmp263 = (-2.0) * (jacobian->tmpVars[0] /* uit.slurry.S_co3.$pDERNLSJac16.dummyVarNLSJac16 JACOBIAN_DIFF_VAR */);
    }
    tmp265 = tmp263;
  }
  jacobian->tmpVars[1] /* uit.slurry.S_hco3.$pDERNLSJac16.dummyVarNLSJac16 JACOBIAN_DIFF_VAR */ = tmp265;
  TRACE_POP
}

/*
equation index: 3912
type: SIMPLE_ASSIGN
$res_NLSJac16_1.$pDERNLSJac16.dummyVarNLSJac16 = (if uit.slurry.liquid == false then 0.0 else uit.slurry.S_hco3.$pDERNLSJac16.dummyVarNLSJac16 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) * uit.slurry.Ka_co2 / uit.slurry.Ka_co2 ^ 2.0) - uit.slurry.outlet.S_ic.SeedNLSJac16
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3912(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,3912};
  modelica_real tmp267;
  modelica_boolean tmp268;
  modelica_real tmp269;
  tmp268 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0));
  if(tmp268)
  {
    tmp269 = 0.0;
  }
  else
  {
    tmp267 = (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */);
    tmp269 = DIVISION(((jacobian->tmpVars[1] /* uit.slurry.S_hco3.$pDERNLSJac16.dummyVarNLSJac16 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h"))) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(tmp267 * tmp267),"uit.slurry.Ka_co2 ^ 2.0");
  }
  jacobian->resultVars[0] /* $res_NLSJac16_1.$pDERNLSJac16.dummyVarNLSJac16 JACOBIAN_VAR */ = tmp269 - jacobian->seedVars[0] /* uit.slurry.outlet.S_ic.SeedNLSJac16 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac16_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac16;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac16_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac16;
  ADM1_P_UIT_real_R2_copia_eqFunction_3910(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3911(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_3912(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 4035
type: SIMPLE_ASSIGN
uit.semolina.S_co3.$pDERNLSJac17.dummyVarNLSJac17 = uit.semolina.outlet.S_ic.SeedNLSJac17 * uit.semolina.Ka_hco3 / (uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4035(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,4035};
  modelica_real tmp270;
  tmp270 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */);
  jacobian->tmpVars[0] /* uit.semolina.S_co3.$pDERNLSJac17.dummyVarNLSJac17 JACOBIAN_DIFF_VAR */ = (jacobian->seedVars[0] /* uit.semolina.outlet.S_ic.SeedNLSJac17 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),DIVISION((tmp270 * tmp270),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2") + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),"uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 4036
type: SIMPLE_ASSIGN
uit.semolina.S_hco3.$pDERNLSJac17.dummyVarNLSJac17 = if noEvent(0.0 > (if uit.semolina.liquid == false then uit.semolina.outlet.S_ic * uit.semolina.Ka_co2 / (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) else uit.semolina.Alk_mol - (uit.semolina.S_acm + uit.semolina.S_prom + uit.semolina.S_bum + uit.semolina.S_vam) - uit.semolina.S_oh - uit.semolina.S_nh3 + uit.semolina.S_h - uit.semolina.S_hpo4 - 2.0 * uit.semolina.S_po4 + uit.semolina.S_h3po4 - 2.0 * uit.semolina.S_co3)) then 0.0 else if uit.semolina.liquid == false then uit.semolina.outlet.S_ic.SeedNLSJac17 * uit.semolina.Ka_co2 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) / (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) ^ 2.0 else (-2.0) * uit.semolina.S_co3.$pDERNLSJac17.dummyVarNLSJac17
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4036(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,4036};
  modelica_boolean tmp272;
  modelica_real tmp274;
  modelica_boolean tmp275;
  modelica_real tmp276;
  modelica_boolean tmp277;
  modelica_real tmp278;
  tmp272 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h"),"uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h"):(data->localData[0]->realVars[1150] /* uit.semolina.Alk_mol variable */) - ((data->localData[0]->realVars[1244] /* uit.semolina.S_acm variable */) + (data->localData[0]->realVars[1257] /* uit.semolina.S_prom variable */) + (data->localData[0]->realVars[1245] /* uit.semolina.S_bum variable */) + (data->localData[0]->realVars[1258] /* uit.semolina.S_vam variable */)) - (data->localData[0]->realVars[1255] /* uit.semolina.S_oh variable */) - (data->localData[0]->realVars[1253] /* uit.semolina.S_nh3 variable */) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) - (data->localData[0]->realVars[1252] /* uit.semolina.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1256] /* uit.semolina.S_po4 variable */))) + (data->localData[0]->realVars[1250] /* uit.semolina.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */)))));
  tmp277 = (modelica_boolean)tmp272;
  if(tmp277)
  {
    tmp278 = 0.0;
  }
  else
  {
    tmp275 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0));
    if(tmp275)
    {
      tmp274 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h");
      tmp276 = DIVISION(((jacobian->seedVars[0] /* uit.semolina.outlet.S_ic.SeedNLSJac17 SEED_VAR */) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */))) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h")),(tmp274 * tmp274),"(uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) ^ 2.0");
    }
    else
    {
      tmp276 = (-2.0) * (jacobian->tmpVars[0] /* uit.semolina.S_co3.$pDERNLSJac17.dummyVarNLSJac17 JACOBIAN_DIFF_VAR */);
    }
    tmp278 = tmp276;
  }
  jacobian->tmpVars[1] /* uit.semolina.S_hco3.$pDERNLSJac17.dummyVarNLSJac17 JACOBIAN_DIFF_VAR */ = tmp278;
  TRACE_POP
}

/*
equation index: 4037
type: SIMPLE_ASSIGN
$res_NLSJac17_1.$pDERNLSJac17.dummyVarNLSJac17 = (if uit.semolina.liquid == false then 0.0 else uit.semolina.S_hco3.$pDERNLSJac17.dummyVarNLSJac17 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) * uit.semolina.Ka_co2 / uit.semolina.Ka_co2 ^ 2.0) - uit.semolina.outlet.S_ic.SeedNLSJac17
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4037(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,4037};
  modelica_real tmp280;
  modelica_boolean tmp281;
  modelica_real tmp282;
  tmp281 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0));
  if(tmp281)
  {
    tmp282 = 0.0;
  }
  else
  {
    tmp280 = (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */);
    tmp282 = DIVISION(((jacobian->tmpVars[1] /* uit.semolina.S_hco3.$pDERNLSJac17.dummyVarNLSJac17 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h"))) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(tmp280 * tmp280),"uit.semolina.Ka_co2 ^ 2.0");
  }
  jacobian->resultVars[0] /* $res_NLSJac17_1.$pDERNLSJac17.dummyVarNLSJac17 JACOBIAN_VAR */ = tmp282 - jacobian->seedVars[0] /* uit.semolina.outlet.S_ic.SeedNLSJac17 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac17_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac17;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac17_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac17;
  ADM1_P_UIT_real_R2_copia_eqFunction_4035(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4036(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4037(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 4160
type: SIMPLE_ASSIGN
uit.eggpasta.S_co3.$pDERNLSJac18.dummyVarNLSJac18 = uit.eggpasta.outlet.S_ic.SeedNLSJac18 * uit.eggpasta.Ka_hco3 / (uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4160(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,4160};
  modelica_real tmp283;
  tmp283 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */);
  jacobian->tmpVars[0] /* uit.eggpasta.S_co3.$pDERNLSJac18.dummyVarNLSJac18 JACOBIAN_DIFF_VAR */ = (jacobian->seedVars[0] /* uit.eggpasta.outlet.S_ic.SeedNLSJac18 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),DIVISION((tmp283 * tmp283),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2") + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),"uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 4161
type: SIMPLE_ASSIGN
uit.eggpasta.S_hco3.$pDERNLSJac18.dummyVarNLSJac18 = if noEvent(0.0 > (if uit.eggpasta.liquid == false then uit.eggpasta.outlet.S_ic * uit.eggpasta.Ka_co2 / (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) else uit.eggpasta.Alk_mol - (uit.eggpasta.S_acm + uit.eggpasta.S_prom + uit.eggpasta.S_bum + uit.eggpasta.S_vam) - uit.eggpasta.S_oh - uit.eggpasta.S_nh3 + uit.eggpasta.S_h - uit.eggpasta.S_hpo4 - 2.0 * uit.eggpasta.S_po4 + uit.eggpasta.S_h3po4 - 2.0 * uit.eggpasta.S_co3)) then 0.0 else if uit.eggpasta.liquid == false then uit.eggpasta.outlet.S_ic.SeedNLSJac18 * uit.eggpasta.Ka_co2 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) / (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) ^ 2.0 else (-2.0) * uit.eggpasta.S_co3.$pDERNLSJac18.dummyVarNLSJac18
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4161(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,4161};
  modelica_boolean tmp285;
  modelica_real tmp287;
  modelica_boolean tmp288;
  modelica_real tmp289;
  modelica_boolean tmp290;
  modelica_real tmp291;
  tmp285 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h"),"uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h"):(data->localData[0]->realVars[742] /* uit.eggpasta.Alk_mol variable */) - ((data->localData[0]->realVars[836] /* uit.eggpasta.S_acm variable */) + (data->localData[0]->realVars[849] /* uit.eggpasta.S_prom variable */) + (data->localData[0]->realVars[837] /* uit.eggpasta.S_bum variable */) + (data->localData[0]->realVars[850] /* uit.eggpasta.S_vam variable */)) - (data->localData[0]->realVars[847] /* uit.eggpasta.S_oh variable */) - (data->localData[0]->realVars[845] /* uit.eggpasta.S_nh3 variable */) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) - (data->localData[0]->realVars[844] /* uit.eggpasta.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[848] /* uit.eggpasta.S_po4 variable */))) + (data->localData[0]->realVars[842] /* uit.eggpasta.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */)))));
  tmp290 = (modelica_boolean)tmp285;
  if(tmp290)
  {
    tmp291 = 0.0;
  }
  else
  {
    tmp288 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0));
    if(tmp288)
    {
      tmp287 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h");
      tmp289 = DIVISION(((jacobian->seedVars[0] /* uit.eggpasta.outlet.S_ic.SeedNLSJac18 SEED_VAR */) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */))) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h")),(tmp287 * tmp287),"(uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) ^ 2.0");
    }
    else
    {
      tmp289 = (-2.0) * (jacobian->tmpVars[0] /* uit.eggpasta.S_co3.$pDERNLSJac18.dummyVarNLSJac18 JACOBIAN_DIFF_VAR */);
    }
    tmp291 = tmp289;
  }
  jacobian->tmpVars[1] /* uit.eggpasta.S_hco3.$pDERNLSJac18.dummyVarNLSJac18 JACOBIAN_DIFF_VAR */ = tmp291;
  TRACE_POP
}

/*
equation index: 4162
type: SIMPLE_ASSIGN
$res_NLSJac18_1.$pDERNLSJac18.dummyVarNLSJac18 = (if uit.eggpasta.liquid == false then 0.0 else uit.eggpasta.S_hco3.$pDERNLSJac18.dummyVarNLSJac18 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) * uit.eggpasta.Ka_co2 / uit.eggpasta.Ka_co2 ^ 2.0) - uit.eggpasta.outlet.S_ic.SeedNLSJac18
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4162(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,4162};
  modelica_real tmp293;
  modelica_boolean tmp294;
  modelica_real tmp295;
  tmp294 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0));
  if(tmp294)
  {
    tmp295 = 0.0;
  }
  else
  {
    tmp293 = (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */);
    tmp295 = DIVISION(((jacobian->tmpVars[1] /* uit.eggpasta.S_hco3.$pDERNLSJac18.dummyVarNLSJac18 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h"))) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(tmp293 * tmp293),"uit.eggpasta.Ka_co2 ^ 2.0");
  }
  jacobian->resultVars[0] /* $res_NLSJac18_1.$pDERNLSJac18.dummyVarNLSJac18 JACOBIAN_VAR */ = tmp295 - jacobian->seedVars[0] /* uit.eggpasta.outlet.S_ic.SeedNLSJac18 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac18_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac18;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac18_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac18;
  ADM1_P_UIT_real_R2_copia_eqFunction_4160(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4161(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4162(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 4285
type: SIMPLE_ASSIGN
uit.tomatosouce.S_co3.$pDERNLSJac19.dummyVarNLSJac19 = uit.tomatosouce.outlet.S_ic.SeedNLSJac19 * uit.tomatosouce.Ka_hco3 / (uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4285(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,4285};
  modelica_real tmp296;
  tmp296 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */);
  jacobian->tmpVars[0] /* uit.tomatosouce.S_co3.$pDERNLSJac19.dummyVarNLSJac19 JACOBIAN_DIFF_VAR */ = (jacobian->seedVars[0] /* uit.tomatosouce.outlet.S_ic.SeedNLSJac19 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),DIVISION((tmp296 * tmp296),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2") + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),"uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 4286
type: SIMPLE_ASSIGN
uit.tomatosouce.S_hco3.$pDERNLSJac19.dummyVarNLSJac19 = if noEvent(0.0 > (if uit.tomatosouce.liquid == false then uit.tomatosouce.outlet.S_ic * uit.tomatosouce.Ka_co2 / (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) else uit.tomatosouce.Alk_mol - (uit.tomatosouce.S_acm + uit.tomatosouce.S_prom + uit.tomatosouce.S_bum + uit.tomatosouce.S_vam) - uit.tomatosouce.S_oh - uit.tomatosouce.S_nh3 + uit.tomatosouce.S_h - uit.tomatosouce.S_hpo4 - 2.0 * uit.tomatosouce.S_po4 + uit.tomatosouce.S_h3po4 - 2.0 * uit.tomatosouce.S_co3)) then 0.0 else if uit.tomatosouce.liquid == false then uit.tomatosouce.outlet.S_ic.SeedNLSJac19 * uit.tomatosouce.Ka_co2 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) / (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) ^ 2.0 else (-2.0) * uit.tomatosouce.S_co3.$pDERNLSJac19.dummyVarNLSJac19
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4286(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,4286};
  modelica_boolean tmp298;
  modelica_real tmp300;
  modelica_boolean tmp301;
  modelica_real tmp302;
  modelica_boolean tmp303;
  modelica_real tmp304;
  tmp298 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h"),"uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h"):(data->localData[0]->realVars[1506] /* uit.tomatosouce.Alk_mol variable */) - ((data->localData[0]->realVars[1600] /* uit.tomatosouce.S_acm variable */) + (data->localData[0]->realVars[1613] /* uit.tomatosouce.S_prom variable */) + (data->localData[0]->realVars[1601] /* uit.tomatosouce.S_bum variable */) + (data->localData[0]->realVars[1614] /* uit.tomatosouce.S_vam variable */)) - (data->localData[0]->realVars[1611] /* uit.tomatosouce.S_oh variable */) - (data->localData[0]->realVars[1609] /* uit.tomatosouce.S_nh3 variable */) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) - (data->localData[0]->realVars[1608] /* uit.tomatosouce.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1612] /* uit.tomatosouce.S_po4 variable */))) + (data->localData[0]->realVars[1606] /* uit.tomatosouce.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */)))));
  tmp303 = (modelica_boolean)tmp298;
  if(tmp303)
  {
    tmp304 = 0.0;
  }
  else
  {
    tmp301 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0));
    if(tmp301)
    {
      tmp300 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h");
      tmp302 = DIVISION(((jacobian->seedVars[0] /* uit.tomatosouce.outlet.S_ic.SeedNLSJac19 SEED_VAR */) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */))) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h")),(tmp300 * tmp300),"(uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) ^ 2.0");
    }
    else
    {
      tmp302 = (-2.0) * (jacobian->tmpVars[0] /* uit.tomatosouce.S_co3.$pDERNLSJac19.dummyVarNLSJac19 JACOBIAN_DIFF_VAR */);
    }
    tmp304 = tmp302;
  }
  jacobian->tmpVars[1] /* uit.tomatosouce.S_hco3.$pDERNLSJac19.dummyVarNLSJac19 JACOBIAN_DIFF_VAR */ = tmp304;
  TRACE_POP
}

/*
equation index: 4287
type: SIMPLE_ASSIGN
$res_NLSJac19_1.$pDERNLSJac19.dummyVarNLSJac19 = (if uit.tomatosouce.liquid == false then 0.0 else uit.tomatosouce.S_hco3.$pDERNLSJac19.dummyVarNLSJac19 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) * uit.tomatosouce.Ka_co2 / uit.tomatosouce.Ka_co2 ^ 2.0) - uit.tomatosouce.outlet.S_ic.SeedNLSJac19
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4287(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,4287};
  modelica_real tmp306;
  modelica_boolean tmp307;
  modelica_real tmp308;
  tmp307 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0));
  if(tmp307)
  {
    tmp308 = 0.0;
  }
  else
  {
    tmp306 = (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */);
    tmp308 = DIVISION(((jacobian->tmpVars[1] /* uit.tomatosouce.S_hco3.$pDERNLSJac19.dummyVarNLSJac19 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h"))) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(tmp306 * tmp306),"uit.tomatosouce.Ka_co2 ^ 2.0");
  }
  jacobian->resultVars[0] /* $res_NLSJac19_1.$pDERNLSJac19.dummyVarNLSJac19 JACOBIAN_VAR */ = tmp308 - jacobian->seedVars[0] /* uit.tomatosouce.outlet.S_ic.SeedNLSJac19 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac19_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac19;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac19_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac19;
  ADM1_P_UIT_real_R2_copia_eqFunction_4285(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4286(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4287(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

/*
equation index: 4424
type: SIMPLE_ASSIGN
uit.maize.S_co3.$pDERNLSJac20.dummyVarNLSJac20 = uit.maize.outlet.S_ic.SeedNLSJac20 * uit.maize.Ka_hco3 / (uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4424(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 0;
  const int equationIndexes[2] = {1,4424};
  modelica_real tmp309;
  tmp309 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */);
  jacobian->tmpVars[0] /* uit.maize.S_co3.$pDERNLSJac20.dummyVarNLSJac20 JACOBIAN_DIFF_VAR */ = (jacobian->seedVars[0] /* uit.maize.outlet.S_ic.SeedNLSJac20 SEED_VAR */) * (DIVISION((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),DIVISION((tmp309 * tmp309),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2") + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),"uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3"));
  TRACE_POP
}

/*
equation index: 4425
type: SIMPLE_ASSIGN
uit.maize.S_hco3.$pDERNLSJac20.dummyVarNLSJac20 = if noEvent(0.0 > (if uit.maize.liquid == false then uit.maize.outlet.S_ic * uit.maize.Ka_co2 / (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) else uit.maize.Alk_mol - (uit.maize.S_acm + uit.maize.S_prom + uit.maize.S_bum + uit.maize.S_vam) - uit.maize.S_oh - uit.maize.S_nh3 + uit.maize.S_h - uit.maize.S_hpo4 - 2.0 * uit.maize.S_po4 + uit.maize.S_h3po4 - 2.0 * uit.maize.S_co3)) then 0.0 else if uit.maize.liquid == false then uit.maize.outlet.S_ic.SeedNLSJac20 * uit.maize.Ka_co2 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) / (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) ^ 2.0 else (-2.0) * uit.maize.S_co3.$pDERNLSJac20.dummyVarNLSJac20
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4425(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 1;
  const int equationIndexes[2] = {1,4425};
  modelica_boolean tmp311;
  modelica_real tmp313;
  modelica_boolean tmp314;
  modelica_real tmp315;
  modelica_boolean tmp316;
  modelica_real tmp317;
  tmp311 = Greater(0.0,(((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION(((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h"),"uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h"):(data->localData[0]->realVars[962] /* uit.maize.Alk_mol variable */) - ((data->localData[0]->realVars[1056] /* uit.maize.S_acm variable */) + (data->localData[0]->realVars[1069] /* uit.maize.S_prom variable */) + (data->localData[0]->realVars[1057] /* uit.maize.S_bum variable */) + (data->localData[0]->realVars[1070] /* uit.maize.S_vam variable */)) - (data->localData[0]->realVars[1067] /* uit.maize.S_oh variable */) - (data->localData[0]->realVars[1065] /* uit.maize.S_nh3 variable */) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) - (data->localData[0]->realVars[1064] /* uit.maize.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1068] /* uit.maize.S_po4 variable */))) + (data->localData[0]->realVars[1062] /* uit.maize.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */)))));
  tmp316 = (modelica_boolean)tmp311;
  if(tmp316)
  {
    tmp317 = 0.0;
  }
  else
  {
    tmp314 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0));
    if(tmp314)
    {
      tmp313 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h");
      tmp315 = DIVISION(((jacobian->seedVars[0] /* uit.maize.outlet.S_ic.SeedNLSJac20 SEED_VAR */) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */))) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h")),(tmp313 * tmp313),"(uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) ^ 2.0");
    }
    else
    {
      tmp315 = (-2.0) * (jacobian->tmpVars[0] /* uit.maize.S_co3.$pDERNLSJac20.dummyVarNLSJac20 JACOBIAN_DIFF_VAR */);
    }
    tmp317 = tmp315;
  }
  jacobian->tmpVars[1] /* uit.maize.S_hco3.$pDERNLSJac20.dummyVarNLSJac20 JACOBIAN_DIFF_VAR */ = tmp317;
  TRACE_POP
}

/*
equation index: 4426
type: SIMPLE_ASSIGN
$res_NLSJac20_1.$pDERNLSJac20.dummyVarNLSJac20 = (if uit.maize.liquid == false then 0.0 else uit.maize.S_hco3.$pDERNLSJac20.dummyVarNLSJac20 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) * uit.maize.Ka_co2 / uit.maize.Ka_co2 ^ 2.0) - uit.maize.outlet.S_ic.SeedNLSJac20
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4426(DATA *data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  const int baseClockIndex = 0;
  const int subClockIndex = 2;
  const int equationIndexes[2] = {1,4426};
  modelica_real tmp319;
  modelica_boolean tmp320;
  modelica_real tmp321;
  tmp320 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0));
  if(tmp320)
  {
    tmp321 = 0.0;
  }
  else
  {
    tmp319 = (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */);
    tmp321 = DIVISION(((jacobian->tmpVars[1] /* uit.maize.S_hco3.$pDERNLSJac20.dummyVarNLSJac20 JACOBIAN_DIFF_VAR */) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h"))) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(tmp319 * tmp319),"uit.maize.Ka_co2 ^ 2.0");
  }
  jacobian->resultVars[0] /* $res_NLSJac20_1.$pDERNLSJac20.dummyVarNLSJac20 JACOBIAN_VAR */ = tmp321 - jacobian->seedVars[0] /* uit.maize.outlet.S_ic.SeedNLSJac20 SEED_VAR */;
  TRACE_POP
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacNLSJac20_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac20;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacNLSJac20_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_NLSJac20;
  ADM1_P_UIT_real_R2_copia_eqFunction_4424(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4425(data, threadData, jacobian, parentJacobian);
  ADM1_P_UIT_real_R2_copia_eqFunction_4426(data, threadData, jacobian, parentJacobian);
  TRACE_POP
  return 0;
}
int ADM1_P_UIT_real_R2_copia_functionJacH_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int ADM1_P_UIT_real_R2_copia_functionJacF_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int ADM1_P_UIT_real_R2_copia_functionJacD_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int ADM1_P_UIT_real_R2_copia_functionJacC_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
int ADM1_P_UIT_real_R2_copia_functionJacB_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH
  TRACE_POP
  return 0;
}
/* constant equations */
/* dynamic equations */

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_functionJacA_constantEqns(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_A;
  
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_functionJacA_column(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian, ANALYTIC_JACOBIAN *parentJacobian)
{
  TRACE_PUSH

  int index = ADM1_P_UIT_real_R2_copia_INDEX_JAC_A;
  TRACE_POP
  return 0;
}

OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac2(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac2.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac3(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac3.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac4(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac4.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac5(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac5.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac6(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac6.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac9(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac9.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac10(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac10.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac11(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac11.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac12(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac12.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac13(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac13.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac14(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac14.bin");
  
  initAnalyticJacobian(jacobian, 2, 2, 30, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(2, 4, 2);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 2+1, pFile, FALSE);
  if (count != 2+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 2+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 4, pFile, FALSE);
  if (count != 4) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 2+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac16(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac16.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac17(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac17.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac18(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac18.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac19(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac19.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac20(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacNLSJac20.bin");
  
  initAnalyticJacobian(jacobian, 1, 1, 3, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(1, 1, 1);
  jacobian->availability = JACOBIAN_AVAILABLE;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 1+1, pFile, FALSE);
  if (count != 1+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 1, pFile, FALSE);
  if (count != 1) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 1+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianH(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianF(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianD(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianC(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianB(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  TRACE_POP
  jacobian->availability = JACOBIAN_NOT_AVAILABLE;
  return 1;
}
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianA(DATA* data, threadData_t *threadData, ANALYTIC_JACOBIAN *jacobian)
{
  TRACE_PUSH
  size_t count;

  FILE* pFile = openSparsePatternFile(data, threadData, "ADM1_P.UIT_real_R2_copia_JacA.bin");
  
  initAnalyticJacobian(jacobian, 77, 77, 0, NULL, jacobian->sparsePattern);
  jacobian->sparsePattern = allocSparsePattern(77, 753, 34);
  jacobian->availability = JACOBIAN_ONLY_SPARSITY;
  
  /* read lead index of compressed sparse column */
  count = omc_fread(jacobian->sparsePattern->leadindex, sizeof(unsigned int), 77+1, pFile, FALSE);
  if (count != 77+1) {
    throwStreamPrint(threadData, "Error while reading lead index list of sparsity pattern. Expected %d, got %ld", 77+1, count);
  }
  
  /* read sparse index */
  count = omc_fread(jacobian->sparsePattern->index, sizeof(unsigned int), 753, pFile, FALSE);
  if (count != 753) {
    throwStreamPrint(threadData, "Error while reading row index list of sparsity pattern. Expected %d, got %ld", 77+1, count);
  }
  
  /* write color array */
  /* color 1 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 1, 1);
  /* color 2 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 2, 1);
  /* color 3 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 3, 1);
  /* color 4 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 4, 1);
  /* color 5 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 5, 1);
  /* color 6 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 6, 1);
  /* color 7 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 7, 2);
  /* color 8 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 8, 1);
  /* color 9 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 9, 1);
  /* color 10 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 10, 1);
  /* color 11 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 11, 1);
  /* color 12 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 12, 1);
  /* color 13 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 13, 1);
  /* color 14 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 14, 1);
  /* color 15 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 15, 1);
  /* color 16 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 16, 1);
  /* color 17 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 17, 1);
  /* color 18 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 18, 2);
  /* color 19 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 19, 2);
  /* color 20 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 20, 1);
  /* color 21 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 21, 1);
  /* color 22 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 22, 2);
  /* color 23 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 23, 1);
  /* color 24 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 24, 2);
  /* color 25 with 3 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 25, 3);
  /* color 26 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 26, 2);
  /* color 27 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 27, 1);
  /* color 28 with 1 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 28, 1);
  /* color 29 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 29, 2);
  /* color 30 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 30, 2);
  /* color 31 with 6 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 31, 6);
  /* color 32 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 32, 2);
  /* color 33 with 2 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 33, 2);
  /* color 34 with 27 columns */
  readSparsePatternColor(threadData, pFile, jacobian->sparsePattern->colorCols, 34, 27);
  
  omc_fclose(pFile);
  
  TRACE_POP
  return 0;
}



