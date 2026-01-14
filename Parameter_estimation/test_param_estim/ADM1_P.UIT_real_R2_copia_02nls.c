/* Non Linear Systems */
#include "ADM1_P.UIT_real_R2_copia_model.h"
#include "ADM1_P.UIT_real_R2_copia_12jac.h"
#include "simulation/jacobian_util.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* inner equations */

void residualFunc320(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,320};
  int i,j;
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc320: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc320 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* body */
  tmp0 = 10.0;
  tmp1 = (-(data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */));
  if(tmp0 < 0.0 && tmp1 != 0.0)
  {
    tmp3 = modf(tmp1, &tmp4);
    
    if(tmp3 > 0.5)
    {
      tmp3 -= 1.0;
      tmp4 += 1.0;
    }
    else if(tmp3 < -0.5)
    {
      tmp3 += 1.0;
      tmp4 -= 1.0;
    }
    
    if(fabs(tmp3) < 1e-10)
      tmp2 = pow(tmp0, tmp4);
    else
    {
      tmp6 = modf(1.0/tmp1, &tmp5);
      if(tmp6 > 0.5)
      {
        tmp6 -= 1.0;
        tmp5 += 1.0;
      }
      else if(tmp6 < -0.5)
      {
        tmp6 += 1.0;
        tmp5 -= 1.0;
      }
      if(fabs(tmp6) < 1e-10 && ((unsigned long)tmp5 & 1))
      {
        tmp2 = -pow(-tmp0, tmp3)*pow(tmp0, tmp4);
      }
      else
      {
        throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp0, tmp1);
      }
    }
  }
  else
  {
    tmp2 = pow(tmp0, tmp1);
  }
  if(isnan(tmp2) || isinf(tmp2))
  {
    throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp0, tmp1);
  }res[0] = tmp2 - (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  /* restore known outputs */
  TRACE_POP
}
void initializeSparsePatternNLS320(NONLINEAR_SYSTEM_DATA* inSysData)
{
  /* no sparsity pattern available */
  inSysData->isPatternAvailable = FALSE;
}
void initializeNonlinearPatternNLS320(NONLINEAR_SYSTEM_DATA* inSysData)
{
  /* no nonlinear pattern available */
}

OMC_DISABLE_OPT
void initializeStaticDataNLS320(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.y_dig[1] */
  sysData->nominal[i] = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS320(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS320(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS320(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */);
}


/* inner equations */

/*
equation index: 459
type: SIMPLE_ASSIGN
uit.maize.outlet.S_ic = if uit.maize.liquid == false then uit.maize.tic / 12000.0 else uit.maize.S_hco3 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) / uit.maize.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_459(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,459};
  (data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1179] /* uit.maize.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */)) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h",equationIndexes)),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 460
type: SIMPLE_ASSIGN
uit.maize.S_co3 = uit.maize.outlet.S_ic * uit.maize.Ka_hco3 / (uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_460(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,460};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */);
  (data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */) = ((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),"uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc465(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,465};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc465: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc465 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_459(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_460(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h",equationIndexes),"uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h",equationIndexes):(data->localData[0]->realVars[962] /* uit.maize.Alk_mol variable */) - ((data->localData[0]->realVars[1056] /* uit.maize.S_acm variable */) + (data->localData[0]->realVars[1069] /* uit.maize.S_prom variable */) + (data->localData[0]->realVars[1057] /* uit.maize.S_bum variable */) + (data->localData[0]->realVars[1070] /* uit.maize.S_vam variable */)) - (data->localData[0]->realVars[1067] /* uit.maize.S_oh variable */) - (data->localData[0]->realVars[1065] /* uit.maize.S_nh3 variable */) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) - (data->localData[0]->realVars[1064] /* uit.maize.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1068] /* uit.maize.S_po4 variable */))) + (data->localData[0]->realVars[1062] /* uit.maize.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */))))) - (data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS465(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS465(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS465(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.maize.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1063].attribute /* uit.maize.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1063].attribute /* uit.maize.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1063].attribute /* uit.maize.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS465(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS465(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS465(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 582
type: SIMPLE_ASSIGN
uit.tomatosouce.outlet.S_ic = if uit.tomatosouce.liquid == false then uit.tomatosouce.tic / 12000.0 else uit.tomatosouce.S_hco3 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) / uit.tomatosouce.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_582(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,582};
  (data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1789] /* uit.tomatosouce.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */)) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h",equationIndexes)),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 583
type: SIMPLE_ASSIGN
uit.tomatosouce.S_co3 = uit.tomatosouce.outlet.S_ic * uit.tomatosouce.Ka_hco3 / (uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_583(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,583};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */);
  (data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */) = ((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),"uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc588(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,588};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc588: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc588 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_582(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_583(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h",equationIndexes),"uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h",equationIndexes):(data->localData[0]->realVars[1506] /* uit.tomatosouce.Alk_mol variable */) - ((data->localData[0]->realVars[1600] /* uit.tomatosouce.S_acm variable */) + (data->localData[0]->realVars[1613] /* uit.tomatosouce.S_prom variable */) + (data->localData[0]->realVars[1601] /* uit.tomatosouce.S_bum variable */) + (data->localData[0]->realVars[1614] /* uit.tomatosouce.S_vam variable */)) - (data->localData[0]->realVars[1611] /* uit.tomatosouce.S_oh variable */) - (data->localData[0]->realVars[1609] /* uit.tomatosouce.S_nh3 variable */) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) - (data->localData[0]->realVars[1608] /* uit.tomatosouce.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1612] /* uit.tomatosouce.S_po4 variable */))) + (data->localData[0]->realVars[1606] /* uit.tomatosouce.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */))))) - (data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS588(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS588(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS588(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.tomatosouce.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1607].attribute /* uit.tomatosouce.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1607].attribute /* uit.tomatosouce.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1607].attribute /* uit.tomatosouce.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS588(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS588(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS588(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 705
type: SIMPLE_ASSIGN
uit.eggpasta.outlet.S_ic = if uit.eggpasta.liquid == false then uit.eggpasta.tic / 12000.0 else uit.eggpasta.S_hco3 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) / uit.eggpasta.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_705(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,705};
  (data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[918] /* uit.eggpasta.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */)) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h",equationIndexes)),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 706
type: SIMPLE_ASSIGN
uit.eggpasta.S_co3 = uit.eggpasta.outlet.S_ic * uit.eggpasta.Ka_hco3 / (uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_706(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,706};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */);
  (data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */) = ((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2",equationIndexes) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),"uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc711(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,711};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc711: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc711 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_705(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_706(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h",equationIndexes),"uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h",equationIndexes):(data->localData[0]->realVars[742] /* uit.eggpasta.Alk_mol variable */) - ((data->localData[0]->realVars[836] /* uit.eggpasta.S_acm variable */) + (data->localData[0]->realVars[849] /* uit.eggpasta.S_prom variable */) + (data->localData[0]->realVars[837] /* uit.eggpasta.S_bum variable */) + (data->localData[0]->realVars[850] /* uit.eggpasta.S_vam variable */)) - (data->localData[0]->realVars[847] /* uit.eggpasta.S_oh variable */) - (data->localData[0]->realVars[845] /* uit.eggpasta.S_nh3 variable */) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) - (data->localData[0]->realVars[844] /* uit.eggpasta.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[848] /* uit.eggpasta.S_po4 variable */))) + (data->localData[0]->realVars[842] /* uit.eggpasta.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */))))) - (data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS711(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS711(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS711(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.eggpasta.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[843].attribute /* uit.eggpasta.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[843].attribute /* uit.eggpasta.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[843].attribute /* uit.eggpasta.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS711(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS711(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS711(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 828
type: SIMPLE_ASSIGN
uit.semolina.outlet.S_ic = if uit.semolina.liquid == false then uit.semolina.tic / 12000.0 else uit.semolina.S_hco3 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) / uit.semolina.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_828(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,828};
  (data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1381] /* uit.semolina.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */)) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h",equationIndexes)),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 829
type: SIMPLE_ASSIGN
uit.semolina.S_co3 = uit.semolina.outlet.S_ic * uit.semolina.Ka_hco3 / (uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_829(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,829};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */);
  (data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */) = ((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),"uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc834(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,834};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc834: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc834 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_828(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_829(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h",equationIndexes),"uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h",equationIndexes):(data->localData[0]->realVars[1150] /* uit.semolina.Alk_mol variable */) - ((data->localData[0]->realVars[1244] /* uit.semolina.S_acm variable */) + (data->localData[0]->realVars[1257] /* uit.semolina.S_prom variable */) + (data->localData[0]->realVars[1245] /* uit.semolina.S_bum variable */) + (data->localData[0]->realVars[1258] /* uit.semolina.S_vam variable */)) - (data->localData[0]->realVars[1255] /* uit.semolina.S_oh variable */) - (data->localData[0]->realVars[1253] /* uit.semolina.S_nh3 variable */) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) - (data->localData[0]->realVars[1252] /* uit.semolina.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1256] /* uit.semolina.S_po4 variable */))) + (data->localData[0]->realVars[1250] /* uit.semolina.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */))))) - (data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS834(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS834(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS834(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.semolina.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1251].attribute /* uit.semolina.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1251].attribute /* uit.semolina.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1251].attribute /* uit.semolina.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS834(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS834(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS834(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 951
type: SIMPLE_ASSIGN
uit.slurry.outlet.S_ic = if uit.slurry.liquid == false then uit.slurry.tic / 12000.0 else uit.slurry.S_hco3 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) / uit.slurry.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_951(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,951};
  (data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1583] /* uit.slurry.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */)) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h",equationIndexes)),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 952
type: SIMPLE_ASSIGN
uit.slurry.S_co3 = uit.slurry.outlet.S_ic * uit.slurry.Ka_hco3 / (uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_952(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,952};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */);
  (data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */) = ((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),"uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc957(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,957};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc957: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc957 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_951(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_952(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h",equationIndexes),"uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h",equationIndexes):(data->localData[0]->realVars[1328] /* uit.slurry.Alk_mol variable */) - ((data->localData[0]->realVars[1422] /* uit.slurry.S_acm variable */) + (data->localData[0]->realVars[1435] /* uit.slurry.S_prom variable */) + (data->localData[0]->realVars[1423] /* uit.slurry.S_bum variable */) + (data->localData[0]->realVars[1436] /* uit.slurry.S_vam variable */)) - (data->localData[0]->realVars[1433] /* uit.slurry.S_oh variable */) - (data->localData[0]->realVars[1431] /* uit.slurry.S_nh3 variable */) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) - (data->localData[0]->realVars[1430] /* uit.slurry.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1434] /* uit.slurry.S_po4 variable */))) + (data->localData[0]->realVars[1428] /* uit.slurry.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */))))) - (data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS957(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS957(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS957(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.slurry.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1429].attribute /* uit.slurry.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1429].attribute /* uit.slurry.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1429].attribute /* uit.slurry.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS957(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS957(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS957(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */);
}


/* inner equations */

void residualFunc2091(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,2091};
  int i,j;
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc2091: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc2091 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* body */
  tmp0 = 10.0;
  tmp1 = (-(data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */));
  if(tmp0 < 0.0 && tmp1 != 0.0)
  {
    tmp3 = modf(tmp1, &tmp4);
    
    if(tmp3 > 0.5)
    {
      tmp3 -= 1.0;
      tmp4 += 1.0;
    }
    else if(tmp3 < -0.5)
    {
      tmp3 += 1.0;
      tmp4 -= 1.0;
    }
    
    if(fabs(tmp3) < 1e-10)
      tmp2 = pow(tmp0, tmp4);
    else
    {
      tmp6 = modf(1.0/tmp1, &tmp5);
      if(tmp6 > 0.5)
      {
        tmp6 -= 1.0;
        tmp5 += 1.0;
      }
      else if(tmp6 < -0.5)
      {
        tmp6 += 1.0;
        tmp5 -= 1.0;
      }
      if(fabs(tmp6) < 1e-10 && ((unsigned long)tmp5 & 1))
      {
        tmp2 = -pow(-tmp0, tmp3)*pow(tmp0, tmp4);
      }
      else
      {
        throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp0, tmp1);
      }
    }
  }
  else
  {
    tmp2 = pow(tmp0, tmp1);
  }
  if(isnan(tmp2) || isinf(tmp2))
  {
    throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp0, tmp1);
  }res[0] = tmp2 - (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  /* restore known outputs */
  TRACE_POP
}
void initializeSparsePatternNLS2091(NONLINEAR_SYSTEM_DATA* inSysData)
{
  /* no sparsity pattern available */
  inSysData->isPatternAvailable = FALSE;
}
void initializeNonlinearPatternNLS2091(NONLINEAR_SYSTEM_DATA* inSysData)
{
  /* no nonlinear pattern available */
}

OMC_DISABLE_OPT
void initializeStaticDataNLS2091(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.y_dig[1] */
  sysData->nominal[i] = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS2091(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS2091(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS2091(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */);
}


/* inner equations */

/*
equation index: 2230
type: SIMPLE_ASSIGN
uit.maize.outlet.S_ic = if uit.maize.liquid == false then uit.maize.tic / 12000.0 else uit.maize.S_hco3 * (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) / uit.maize.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2230(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2230};
  (data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1179] /* uit.maize.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */)) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h",equationIndexes)),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 2231
type: SIMPLE_ASSIGN
uit.maize.S_co3 = uit.maize.outlet.S_ic * uit.maize.Ka_hco3 / (uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2231(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2231};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */);
  (data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */) = ((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),"uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc2236(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,2236};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc2236: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc2236 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2230(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2231(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h",equationIndexes),"uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h",equationIndexes):(data->localData[0]->realVars[962] /* uit.maize.Alk_mol variable */) - ((data->localData[0]->realVars[1056] /* uit.maize.S_acm variable */) + (data->localData[0]->realVars[1069] /* uit.maize.S_prom variable */) + (data->localData[0]->realVars[1057] /* uit.maize.S_bum variable */) + (data->localData[0]->realVars[1070] /* uit.maize.S_vam variable */)) - (data->localData[0]->realVars[1067] /* uit.maize.S_oh variable */) - (data->localData[0]->realVars[1065] /* uit.maize.S_nh3 variable */) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) - (data->localData[0]->realVars[1064] /* uit.maize.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1068] /* uit.maize.S_po4 variable */))) + (data->localData[0]->realVars[1062] /* uit.maize.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */))))) - (data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS2236(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS2236(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS2236(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.maize.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1063].attribute /* uit.maize.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1063].attribute /* uit.maize.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1063].attribute /* uit.maize.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS2236(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS2236(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS2236(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 2353
type: SIMPLE_ASSIGN
uit.tomatosouce.outlet.S_ic = if uit.tomatosouce.liquid == false then uit.tomatosouce.tic / 12000.0 else uit.tomatosouce.S_hco3 * (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) / uit.tomatosouce.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2353(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2353};
  (data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1789] /* uit.tomatosouce.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */)) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h",equationIndexes)),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 2354
type: SIMPLE_ASSIGN
uit.tomatosouce.S_co3 = uit.tomatosouce.outlet.S_ic * uit.tomatosouce.Ka_hco3 / (uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2354(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2354};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */);
  (data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */) = ((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),"uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc2359(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,2359};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc2359: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc2359 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2353(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2354(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h",equationIndexes),"uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h",equationIndexes):(data->localData[0]->realVars[1506] /* uit.tomatosouce.Alk_mol variable */) - ((data->localData[0]->realVars[1600] /* uit.tomatosouce.S_acm variable */) + (data->localData[0]->realVars[1613] /* uit.tomatosouce.S_prom variable */) + (data->localData[0]->realVars[1601] /* uit.tomatosouce.S_bum variable */) + (data->localData[0]->realVars[1614] /* uit.tomatosouce.S_vam variable */)) - (data->localData[0]->realVars[1611] /* uit.tomatosouce.S_oh variable */) - (data->localData[0]->realVars[1609] /* uit.tomatosouce.S_nh3 variable */) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) - (data->localData[0]->realVars[1608] /* uit.tomatosouce.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1612] /* uit.tomatosouce.S_po4 variable */))) + (data->localData[0]->realVars[1606] /* uit.tomatosouce.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */))))) - (data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS2359(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS2359(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS2359(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.tomatosouce.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1607].attribute /* uit.tomatosouce.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1607].attribute /* uit.tomatosouce.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1607].attribute /* uit.tomatosouce.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS2359(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS2359(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS2359(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 2476
type: SIMPLE_ASSIGN
uit.eggpasta.outlet.S_ic = if uit.eggpasta.liquid == false then uit.eggpasta.tic / 12000.0 else uit.eggpasta.S_hco3 * (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) / uit.eggpasta.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2476(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2476};
  (data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[918] /* uit.eggpasta.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */)) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h",equationIndexes)),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 2477
type: SIMPLE_ASSIGN
uit.eggpasta.S_co3 = uit.eggpasta.outlet.S_ic * uit.eggpasta.Ka_hco3 / (uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2477(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2477};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */);
  (data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */) = ((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2",equationIndexes) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),"uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc2482(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,2482};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc2482: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc2482 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2476(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2477(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h",equationIndexes),"uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h",equationIndexes):(data->localData[0]->realVars[742] /* uit.eggpasta.Alk_mol variable */) - ((data->localData[0]->realVars[836] /* uit.eggpasta.S_acm variable */) + (data->localData[0]->realVars[849] /* uit.eggpasta.S_prom variable */) + (data->localData[0]->realVars[837] /* uit.eggpasta.S_bum variable */) + (data->localData[0]->realVars[850] /* uit.eggpasta.S_vam variable */)) - (data->localData[0]->realVars[847] /* uit.eggpasta.S_oh variable */) - (data->localData[0]->realVars[845] /* uit.eggpasta.S_nh3 variable */) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) - (data->localData[0]->realVars[844] /* uit.eggpasta.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[848] /* uit.eggpasta.S_po4 variable */))) + (data->localData[0]->realVars[842] /* uit.eggpasta.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */))))) - (data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS2482(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS2482(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS2482(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.eggpasta.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[843].attribute /* uit.eggpasta.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[843].attribute /* uit.eggpasta.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[843].attribute /* uit.eggpasta.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS2482(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS2482(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS2482(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 2599
type: SIMPLE_ASSIGN
uit.semolina.outlet.S_ic = if uit.semolina.liquid == false then uit.semolina.tic / 12000.0 else uit.semolina.S_hco3 * (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) / uit.semolina.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2599(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2599};
  (data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1381] /* uit.semolina.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */)) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h",equationIndexes)),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 2600
type: SIMPLE_ASSIGN
uit.semolina.S_co3 = uit.semolina.outlet.S_ic * uit.semolina.Ka_hco3 / (uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2600(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2600};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */);
  (data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */) = ((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),"uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc2605(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,2605};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc2605: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc2605 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2599(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2600(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h",equationIndexes),"uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h",equationIndexes):(data->localData[0]->realVars[1150] /* uit.semolina.Alk_mol variable */) - ((data->localData[0]->realVars[1244] /* uit.semolina.S_acm variable */) + (data->localData[0]->realVars[1257] /* uit.semolina.S_prom variable */) + (data->localData[0]->realVars[1245] /* uit.semolina.S_bum variable */) + (data->localData[0]->realVars[1258] /* uit.semolina.S_vam variable */)) - (data->localData[0]->realVars[1255] /* uit.semolina.S_oh variable */) - (data->localData[0]->realVars[1253] /* uit.semolina.S_nh3 variable */) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) - (data->localData[0]->realVars[1252] /* uit.semolina.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1256] /* uit.semolina.S_po4 variable */))) + (data->localData[0]->realVars[1250] /* uit.semolina.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */))))) - (data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS2605(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS2605(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS2605(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.semolina.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1251].attribute /* uit.semolina.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1251].attribute /* uit.semolina.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1251].attribute /* uit.semolina.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS2605(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS2605(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS2605(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 2722
type: SIMPLE_ASSIGN
uit.slurry.outlet.S_ic = if uit.slurry.liquid == false then uit.slurry.tic / 12000.0 else uit.slurry.S_hco3 * (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) / uit.slurry.Ka_co2
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2722(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2722};
  (data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */) = (((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1583] /* uit.slurry.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */)) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h",equationIndexes)),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2",equationIndexes));
  TRACE_POP
}
/*
equation index: 2723
type: SIMPLE_ASSIGN
uit.slurry.S_co3 = uit.slurry.outlet.S_ic * uit.slurry.Ka_hco3 / (uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_2723(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,2723};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */);
  (data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */) = ((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),"uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3",equationIndexes));
  TRACE_POP
}

void residualFunc2728(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,2728};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc2728: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc2728 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2722(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_2723(data, threadData);
  /* body */
  res[0] = fmax(0.0,(((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h",equationIndexes),"uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h",equationIndexes):(data->localData[0]->realVars[1328] /* uit.slurry.Alk_mol variable */) - ((data->localData[0]->realVars[1422] /* uit.slurry.S_acm variable */) + (data->localData[0]->realVars[1435] /* uit.slurry.S_prom variable */) + (data->localData[0]->realVars[1423] /* uit.slurry.S_bum variable */) + (data->localData[0]->realVars[1436] /* uit.slurry.S_vam variable */)) - (data->localData[0]->realVars[1433] /* uit.slurry.S_oh variable */) - (data->localData[0]->realVars[1431] /* uit.slurry.S_nh3 variable */) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) - (data->localData[0]->realVars[1430] /* uit.slurry.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1434] /* uit.slurry.S_po4 variable */))) + (data->localData[0]->realVars[1428] /* uit.slurry.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */))))) - (data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS2728(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS2728(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 0;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(0*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(0*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,0};
  const int index_eqn[1+1] = {0,0};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[0] = {};
  const int rows[0] = {};
  memcpy(inSysData->nonlinearPattern->columns, columns, 0*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 0*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS2728(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.slurry.S_hco3 */
  sysData->nominal[i] = data->modelData->realVarsData[1429].attribute /* uit.slurry.S_hco3 */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1429].attribute /* uit.slurry.S_hco3 */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1429].attribute /* uit.slurry.S_hco3 */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS2728(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS2728(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS2728(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */);
}


/* inner equations */

/*
equation index: 3618
type: SIMPLE_ASSIGN
uit.digester.I = uit.digester.z ^ 2.0
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3618(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3618};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[739] /* uit.digester.z variable */);
  (data->localData[0]->realVars[433] /* uit.digester.I variable */) = (tmp0 * tmp0);
  TRACE_POP
}
/*
equation index: 3619
type: SIMPLE_ASSIGN
uit.digester.g_bi = if noEvent(uit.digester.ideality == true) then 1.0 else 10.0 ^ ((-2.04) * (uit.digester.z / (1.0 + uit.digester.z) - 0.24 * uit.digester.I))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3619(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3619};
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  modelica_real tmp7;
  modelica_boolean tmp8;
  modelica_real tmp9;
  tmp8 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1));
  if(tmp8)
  {
    tmp9 = 1.0;
  }
  else
  {
    tmp1 = 10.0;
    tmp2 = (-2.04) * (DIVISION_SIM((data->localData[0]->realVars[739] /* uit.digester.z variable */),1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */),"1.0 + uit.digester.z",equationIndexes) - ((0.24) * ((data->localData[0]->realVars[433] /* uit.digester.I variable */))));
    if(tmp1 < 0.0 && tmp2 != 0.0)
    {
      tmp4 = modf(tmp2, &tmp5);
      
      if(tmp4 > 0.5)
      {
        tmp4 -= 1.0;
        tmp5 += 1.0;
      }
      else if(tmp4 < -0.5)
      {
        tmp4 += 1.0;
        tmp5 -= 1.0;
      }
      
      if(fabs(tmp4) < 1e-10)
        tmp3 = pow(tmp1, tmp5);
      else
      {
        tmp7 = modf(1.0/tmp2, &tmp6);
        if(tmp7 > 0.5)
        {
          tmp7 -= 1.0;
          tmp6 += 1.0;
        }
        else if(tmp7 < -0.5)
        {
          tmp7 += 1.0;
          tmp6 -= 1.0;
        }
        if(fabs(tmp7) < 1e-10 && ((unsigned long)tmp6 & 1))
        {
          tmp3 = -pow(-tmp1, tmp4)*pow(tmp1, tmp5);
        }
        else
        {
          throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp1, tmp2);
        }
      }
    }
    else
    {
      tmp3 = pow(tmp1, tmp2);
    }
    if(isnan(tmp3) || isinf(tmp3))
    {
      throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp1, tmp2);
    }
    tmp9 = tmp3;
  }
  (data->localData[0]->realVars[633] /* uit.digester.g_bi variable */) = tmp9;
  TRACE_POP
}
/*
equation index: 3620
type: SIMPLE_ASSIGN
uit.digester.g_tri = if noEvent(uit.digester.ideality == true) then 1.0 else 10.0 ^ ((-4.59) * (uit.digester.z / (1.0 + uit.digester.z) - 0.24 * uit.digester.I))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3620(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3620};
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  modelica_real tmp7;
  modelica_boolean tmp8;
  modelica_real tmp9;
  tmp8 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1));
  if(tmp8)
  {
    tmp9 = 1.0;
  }
  else
  {
    tmp1 = 10.0;
    tmp2 = (-4.59) * (DIVISION_SIM((data->localData[0]->realVars[739] /* uit.digester.z variable */),1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */),"1.0 + uit.digester.z",equationIndexes) - ((0.24) * ((data->localData[0]->realVars[433] /* uit.digester.I variable */))));
    if(tmp1 < 0.0 && tmp2 != 0.0)
    {
      tmp4 = modf(tmp2, &tmp5);
      
      if(tmp4 > 0.5)
      {
        tmp4 -= 1.0;
        tmp5 += 1.0;
      }
      else if(tmp4 < -0.5)
      {
        tmp4 += 1.0;
        tmp5 -= 1.0;
      }
      
      if(fabs(tmp4) < 1e-10)
        tmp3 = pow(tmp1, tmp5);
      else
      {
        tmp7 = modf(1.0/tmp2, &tmp6);
        if(tmp7 > 0.5)
        {
          tmp7 -= 1.0;
          tmp6 += 1.0;
        }
        else if(tmp7 < -0.5)
        {
          tmp7 += 1.0;
          tmp6 -= 1.0;
        }
        if(fabs(tmp7) < 1e-10 && ((unsigned long)tmp6 & 1))
        {
          tmp3 = -pow(-tmp1, tmp4)*pow(tmp1, tmp5);
        }
        else
        {
          throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp1, tmp2);
        }
      }
    }
    else
    {
      tmp3 = pow(tmp1, tmp2);
    }
    if(isnan(tmp3) || isinf(tmp3))
    {
      throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp1, tmp2);
    }
    tmp9 = tmp3;
  }
  (data->localData[0]->realVars[635] /* uit.digester.g_tri variable */) = tmp9;
  TRACE_POP
}
/*
equation index: 3621
type: SIMPLE_ASSIGN
uit.digester.g_mono = if noEvent(uit.digester.ideality == true) then 1.0 else 10.0 ^ ((-0.51) * (uit.digester.z / (1.0 + uit.digester.z) - 0.24 * uit.digester.I))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3621(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3621};
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  modelica_real tmp7;
  modelica_boolean tmp8;
  modelica_real tmp9;
  tmp8 = (modelica_boolean)((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1));
  if(tmp8)
  {
    tmp9 = 1.0;
  }
  else
  {
    tmp1 = 10.0;
    tmp2 = (-0.51) * (DIVISION_SIM((data->localData[0]->realVars[739] /* uit.digester.z variable */),1.0 + (data->localData[0]->realVars[739] /* uit.digester.z variable */),"1.0 + uit.digester.z",equationIndexes) - ((0.24) * ((data->localData[0]->realVars[433] /* uit.digester.I variable */))));
    if(tmp1 < 0.0 && tmp2 != 0.0)
    {
      tmp4 = modf(tmp2, &tmp5);
      
      if(tmp4 > 0.5)
      {
        tmp4 -= 1.0;
        tmp5 += 1.0;
      }
      else if(tmp4 < -0.5)
      {
        tmp4 += 1.0;
        tmp5 -= 1.0;
      }
      
      if(fabs(tmp4) < 1e-10)
        tmp3 = pow(tmp1, tmp5);
      else
      {
        tmp7 = modf(1.0/tmp2, &tmp6);
        if(tmp7 > 0.5)
        {
          tmp7 -= 1.0;
          tmp6 += 1.0;
        }
        else if(tmp7 < -0.5)
        {
          tmp7 += 1.0;
          tmp6 -= 1.0;
        }
        if(fabs(tmp7) < 1e-10 && ((unsigned long)tmp6 & 1))
        {
          tmp3 = -pow(-tmp1, tmp4)*pow(tmp1, tmp5);
        }
        else
        {
          throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp1, tmp2);
        }
      }
    }
    else
    {
      tmp3 = pow(tmp1, tmp2);
    }
    if(isnan(tmp3) || isinf(tmp3))
    {
      throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp1, tmp2);
    }
    tmp9 = tmp3;
  }
  (data->localData[0]->realVars[634] /* uit.digester.g_mono variable */) = tmp9;
  TRACE_POP
}
/*
equation index: 3622
type: SIMPLE_ASSIGN
uit.digester.a_hpo4 = uit.digester.S_ip * uit.digester.a_h * uit.digester.Ka_h3po4 * uit.digester.Ka_h2po4 / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri)))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3622(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3622};
  modelica_real tmp0;
  modelica_real tmp1;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[603] /* uit.digester.a_hpo4 variable */) = ((data->localData[0]->realVars[38] /* uit.digester.S_ip STATE(1) */)) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */),(tmp0 * tmp0 * tmp0) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION_SIM((tmp1 * tmp1),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes) + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi",equationIndexes) + DIVISION_SIM((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri",equationIndexes))),"uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))",equationIndexes))));
  TRACE_POP
}
/*
equation index: 3623
type: SIMPLE_ASSIGN
uit.digester.a_po4 = uit.digester.S_ip * uit.digester.Ka_h3po4 * uit.digester.Ka_h2po4 * uit.digester.Ka_hpo4 / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri)))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3623(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3623};
  modelica_real tmp0;
  modelica_real tmp1;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[607] /* uit.digester.a_po4 variable */) = ((data->localData[0]->realVars[38] /* uit.digester.S_ip STATE(1) */)) * (((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(tmp0 * tmp0 * tmp0) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION_SIM((tmp1 * tmp1),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes) + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi",equationIndexes) + DIVISION_SIM((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri",equationIndexes))),"uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))",equationIndexes))));
  TRACE_POP
}
/*
equation index: 3624
type: SIMPLE_ASSIGN
uit.digester.a_h2po4 = uit.digester.S_ip * uit.digester.a_h ^ 2.0 * uit.digester.Ka_h3po4 / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri)))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3624(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3624};
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp2 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[601] /* uit.digester.a_h2po4 variable */) = ((data->localData[0]->realVars[38] /* uit.digester.S_ip STATE(1) */)) * (((tmp0 * tmp0)) * (DIVISION_SIM((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */),(tmp1 * tmp1 * tmp1) + ((data->localData[0]->realVars[468] /* uit.digester.Ka_h3po4 variable */)) * (DIVISION_SIM((tmp2 * tmp2),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes) + ((data->localData[0]->realVars[467] /* uit.digester.Ka_h2po4 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi",equationIndexes) + DIVISION_SIM((data->localData[0]->realVars[470] /* uit.digester.Ka_hpo4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri",equationIndexes))),"uit.digester.a_h ^ 3.0 + uit.digester.Ka_h3po4 * (uit.digester.a_h ^ 2.0 / uit.digester.g_mono + uit.digester.Ka_h2po4 * (uit.digester.a_h / uit.digester.g_bi + uit.digester.Ka_hpo4 / uit.digester.g_tri))",equationIndexes)));
  TRACE_POP
}
/*
equation index: 3625
type: SIMPLE_ASSIGN
uit.digester.a_hco3 = uit.digester.Ka_co2 * uit.digester.S_ic / ((1.0 + (1.0 / (uit.digester.g_mono * uit.digester.a_h) + uit.digester.Ka_hco3 / (uit.digester.a_h ^ 2.0 * uit.digester.g_bi)) * uit.digester.Ka_co2) * uit.digester.a_h)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3625(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3625};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[602] /* uit.digester.a_hco3 variable */) = ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[36] /* uit.digester.S_ic STATE(1) */),(1.0 + (DIVISION_SIM(1.0,((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) * ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)),"uit.digester.g_mono * uit.digester.a_h",equationIndexes) + DIVISION_SIM((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */),((tmp0 * tmp0)) * ((data->localData[0]->realVars[633] /* uit.digester.g_bi variable */)),"uit.digester.a_h ^ 2.0 * uit.digester.g_bi",equationIndexes)) * ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */))) * ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)),"(1.0 + (1.0 / (uit.digester.g_mono * uit.digester.a_h) + uit.digester.Ka_hco3 / (uit.digester.a_h ^ 2.0 * uit.digester.g_bi)) * uit.digester.Ka_co2) * uit.digester.a_h",equationIndexes));
  TRACE_POP
}
/*
equation index: 3626
type: SIMPLE_ASSIGN
uit.digester.a_co3 = uit.digester.S_ic * uit.digester.a_h * uit.digester.Ka_co2 * uit.digester.Ka_hco3 / (uit.digester.a_h ^ 3.0 + uit.digester.Ka_co2 * (uit.digester.Ka_hco3 * uit.digester.a_h / uit.digester.g_bi + uit.digester.a_h ^ 2.0 / uit.digester.g_mono))
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3626(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3626};
  modelica_real tmp0;
  modelica_real tmp1;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[598] /* uit.digester.a_co3 variable */) = ((data->localData[0]->realVars[36] /* uit.digester.S_ic STATE(1) */)) * (((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */),(tmp0 * tmp0 * tmp0) + ((data->localData[0]->realVars[465] /* uit.digester.Ka_co2 variable */)) * (((data->localData[0]->realVars[469] /* uit.digester.Ka_hco3 variable */)) * (DIVISION_SIM((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi",equationIndexes)) + DIVISION_SIM((tmp1 * tmp1),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes)),"uit.digester.a_h ^ 3.0 + uit.digester.Ka_co2 * (uit.digester.Ka_hco3 * uit.digester.a_h / uit.digester.g_bi + uit.digester.a_h ^ 2.0 / uit.digester.g_mono)",equationIndexes))));
  TRACE_POP
}
/*
equation index: 3627
type: SIMPLE_ASSIGN
uit.digester.a_acm = uit.digester.S_ac * uit.digester.a_h ^ 2.0 * 1.737800828749376e-05 / (uit.digester.a_h ^ 3.0 + 1.737800828749376e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) / 64.05333333333333
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3627(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3627};
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp2 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[595] /* uit.digester.a_acm variable */) = ((data->localData[0]->realVars[22] /* uit.digester.S_ac STATE(1) */)) * (DIVISION_SIM(((tmp0 * tmp0)) * (DIVISION_SIM(1.737800828749376e-05,(tmp1 * tmp1 * tmp1) + (1.737800828749376e-05) * (DIVISION_SIM((tmp2 * tmp2),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes)),"uit.digester.a_h ^ 3.0 + 1.737800828749376e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono",equationIndexes)),64.05333333333333,"64.05333333333333",equationIndexes));
  TRACE_POP
}
/*
equation index: 3628
type: SIMPLE_ASSIGN
uit.digester.a_nh4 = uit.digester.a_h * uit.digester.S_in / ((1.0 + uit.digester.a_h / (uit.digester.Ka_nh4 * uit.digester.g_mono)) * uit.digester.Ka_nh4)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3628(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3628};
  (data->localData[0]->realVars[605] /* uit.digester.a_nh4 variable */) = ((data->localData[0]->realVars[599] /* uit.digester.a_h variable */)) * (DIVISION_SIM((data->localData[0]->realVars[37] /* uit.digester.S_in STATE(1) */),(1.0 + DIVISION_SIM((data->localData[0]->realVars[599] /* uit.digester.a_h variable */),((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */)) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)),"uit.digester.Ka_nh4 * uit.digester.g_mono",equationIndexes)) * ((data->localData[0]->realVars[471] /* uit.digester.Ka_nh4 variable */)),"(1.0 + uit.digester.a_h / (uit.digester.Ka_nh4 * uit.digester.g_mono)) * uit.digester.Ka_nh4",equationIndexes));
  TRACE_POP
}
/*
equation index: 3629
type: SIMPLE_ASSIGN
uit.digester.a_prom = uit.digester.S_pro * uit.digester.a_h ^ 2.0 * 1.318256738556407e-05 / (uit.digester.a_h ^ 3.0 + 1.318256738556407e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) / 112.1210810810811
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3629(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3629};
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp2 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[608] /* uit.digester.a_prom variable */) = ((data->localData[0]->realVars[40] /* uit.digester.S_pro STATE(1) */)) * (DIVISION_SIM(((tmp0 * tmp0)) * (DIVISION_SIM(1.318256738556407e-05,(tmp1 * tmp1 * tmp1) + (1.318256738556407e-05) * (DIVISION_SIM((tmp2 * tmp2),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes)),"uit.digester.a_h ^ 3.0 + 1.318256738556407e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono",equationIndexes)),112.1210810810811,"112.1210810810811",equationIndexes));
  TRACE_POP
}
/*
equation index: 3630
type: SIMPLE_ASSIGN
uit.digester.a_bum = uit.digester.S_bu * uit.digester.a_h ^ 2.0 * 1.513561248436207e-05 / (uit.digester.a_h ^ 3.0 + 1.513561248436207e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) / 160.1818181818182
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3630(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3630};
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp2 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[596] /* uit.digester.a_bum variable */) = ((data->localData[0]->realVars[24] /* uit.digester.S_bu STATE(1) */)) * (DIVISION_SIM(((tmp0 * tmp0)) * (DIVISION_SIM(1.513561248436207e-05,(tmp1 * tmp1 * tmp1) + (1.513561248436207e-05) * (DIVISION_SIM((tmp2 * tmp2),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes)),"uit.digester.a_h ^ 3.0 + 1.513561248436207e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono",equationIndexes)),160.1818181818182,"160.1818181818182",equationIndexes));
  TRACE_POP
}
/*
equation index: 3631
type: SIMPLE_ASSIGN
uit.digester.a_vam = uit.digester.S_va * uit.digester.a_h ^ 2.0 * 1.380384264602884e-05 / (uit.digester.a_h ^ 3.0 + 1.380384264602884e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono) / 208.2650980392157
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3631(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3631};
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  tmp0 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp1 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  tmp2 = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  (data->localData[0]->realVars[609] /* uit.digester.a_vam variable */) = ((data->localData[0]->realVars[42] /* uit.digester.S_va STATE(1) */)) * (DIVISION_SIM(((tmp0 * tmp0)) * (DIVISION_SIM(1.380384264602884e-05,(tmp1 * tmp1 * tmp1) + (1.380384264602884e-05) * (DIVISION_SIM((tmp2 * tmp2),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes)),"uit.digester.a_h ^ 3.0 + 1.380384264602884e-05 * uit.digester.a_h ^ 2.0 / uit.digester.g_mono",equationIndexes)),208.2650980392157,"208.2650980392157",equationIndexes));
  TRACE_POP
}
/*
equation index: 3632
type: SIMPLE_ASSIGN
uit.digester.S_acm = 64.05333333333333 * uit.digester.a_acm / uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3632(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3632};
  (data->localData[0]->realVars[527] /* uit.digester.S_acm variable */) = (64.05333333333333) * (DIVISION_SIM((data->localData[0]->realVars[595] /* uit.digester.a_acm variable */),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes));
  TRACE_POP
}
/*
equation index: 3633
type: SIMPLE_ASSIGN
uit.digester.S_prom = 112.1210810810811 * uit.digester.a_prom / uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3633(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3633};
  (data->localData[0]->realVars[555] /* uit.digester.S_prom variable */) = (112.1210810810811) * (DIVISION_SIM((data->localData[0]->realVars[608] /* uit.digester.a_prom variable */),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes));
  TRACE_POP
}
/*
equation index: 3634
type: SIMPLE_ASSIGN
uit.digester.S_bum = 160.1818181818182 * uit.digester.a_bum / uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3634(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3634};
  (data->localData[0]->realVars[530] /* uit.digester.S_bum variable */) = (160.1818181818182) * (DIVISION_SIM((data->localData[0]->realVars[596] /* uit.digester.a_bum variable */),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes));
  TRACE_POP
}
/*
equation index: 3635
type: SIMPLE_ASSIGN
uit.digester.S_vam = 208.2650980392157 * uit.digester.a_vam / uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3635(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3635};
  (data->localData[0]->realVars[558] /* uit.digester.S_vam variable */) = (208.2650980392157) * (DIVISION_SIM((data->localData[0]->realVars[609] /* uit.digester.a_vam variable */),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes));
  TRACE_POP
}
/*
equation index: 3636
type: SIMPLE_ASSIGN
uit.digester.S_hpo4 = uit.digester.a_hpo4 / uit.digester.g_bi
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3636(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3636};
  (data->localData[0]->realVars[541] /* uit.digester.S_hpo4 variable */) = DIVISION_SIM((data->localData[0]->realVars[603] /* uit.digester.a_hpo4 variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi",equationIndexes);
  TRACE_POP
}
/*
equation index: 3637
type: SIMPLE_ASSIGN
uit.digester.S_po4 = uit.digester.a_po4 / uit.digester.g_tri
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3637(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3637};
  (data->localData[0]->realVars[553] /* uit.digester.S_po4 variable */) = DIVISION_SIM((data->localData[0]->realVars[607] /* uit.digester.a_po4 variable */),(data->localData[0]->realVars[635] /* uit.digester.g_tri variable */),"uit.digester.g_tri",equationIndexes);
  TRACE_POP
}
/*
equation index: 3638
type: SIMPLE_ASSIGN
uit.digester.S_nh4 = uit.digester.a_nh4 / uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3638(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3638};
  (data->localData[0]->realVars[551] /* uit.digester.S_nh4 variable */) = DIVISION_SIM((data->localData[0]->realVars[605] /* uit.digester.a_nh4 variable */),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes);
  TRACE_POP
}
/*
equation index: 3639
type: SIMPLE_ASSIGN
uit.digester.S_hco3 = uit.digester.a_hco3 / uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3639(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3639};
  (data->localData[0]->realVars[540] /* uit.digester.S_hco3 variable */) = DIVISION_SIM((data->localData[0]->realVars[602] /* uit.digester.a_hco3 variable */),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes);
  TRACE_POP
}
/*
equation index: 3640
type: SIMPLE_ASSIGN
uit.digester.S_co3 = uit.digester.a_co3 / uit.digester.g_bi
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3640(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3640};
  (data->localData[0]->realVars[535] /* uit.digester.S_co3 variable */) = DIVISION_SIM((data->localData[0]->realVars[598] /* uit.digester.a_co3 variable */),(data->localData[0]->realVars[633] /* uit.digester.g_bi variable */),"uit.digester.g_bi",equationIndexes);
  TRACE_POP
}
/*
equation index: 3641
type: SIMPLE_ASSIGN
uit.digester.S_h2po4 = (-2.0) * uit.digester.ionic_force - ((-2.0) * uit.digester.I + 4.0 * uit.digester.S_ca + 9.0 * uit.digester.S_po4 + uit.digester.S_nh4 + 4.0 * uit.digester.S_mg + 4.0 * uit.digester.S_hpo4 + uit.digester.S_hco3 + uit.digester.S_cat + uit.digester.S_an + 4.0 * uit.digester.S_co3 + 0.0156119900083264 * uit.digester.S_acm + 0.008918929342795433 * uit.digester.S_prom + 0.006242905788876278 * uit.digester.S_bum + 0.004801572656267654 * uit.digester.S_vam)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3641(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3641};
  (data->localData[0]->realVars[538] /* uit.digester.S_h2po4 variable */) = (-2.0) * ((data->localData[0]->realVars[69] /* uit.digester.ionic_force STATE(1) */)) - ((-2.0) * ((data->localData[0]->realVars[433] /* uit.digester.I variable */)) + (4.0) * ((data->localData[0]->realVars[25] /* uit.digester.S_ca STATE(1) */)) + (9.0) * ((data->localData[0]->realVars[553] /* uit.digester.S_po4 variable */)) + (data->localData[0]->realVars[551] /* uit.digester.S_nh4 variable */) + (4.0) * ((data->localData[0]->realVars[39] /* uit.digester.S_mg STATE(1) */)) + (4.0) * ((data->localData[0]->realVars[541] /* uit.digester.S_hpo4 variable */)) + (data->localData[0]->realVars[540] /* uit.digester.S_hco3 variable */) + (data->localData[0]->realVars[26] /* uit.digester.S_cat STATE(1) */) + (data->localData[0]->realVars[23] /* uit.digester.S_an STATE(1) */) + (4.0) * ((data->localData[0]->realVars[535] /* uit.digester.S_co3 variable */)) + (0.0156119900083264) * ((data->localData[0]->realVars[527] /* uit.digester.S_acm variable */)) + (0.008918929342795433) * ((data->localData[0]->realVars[555] /* uit.digester.S_prom variable */)) + (0.006242905788876278) * ((data->localData[0]->realVars[530] /* uit.digester.S_bum variable */)) + (0.004801572656267654) * ((data->localData[0]->realVars[558] /* uit.digester.S_vam variable */)));
  TRACE_POP
}
/*
equation index: 3642
type: SIMPLE_ASSIGN
uit.digester.a_h2o = if noEvent(uit.digester.ideality == true) then 1.0 else 1.0 - 0.017 * (uit.digester.S_nh4 + uit.digester.S_hco3 + uit.digester.S_co3 + uit.digester.S_h2po4 + uit.digester.S_hpo4 + uit.digester.S_po4 + uit.digester.S_vam / 208.2650980392157 + uit.digester.S_bum / 160.1818181818182 + uit.digester.S_prom / 112.1210810810811 + uit.digester.S_acm / 64.05333333333333 + uit.digester.S_ca + uit.digester.S_mg + uit.digester.S_cat + uit.digester.S_an)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3642(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3642};
  (data->localData[0]->realVars[600] /* uit.digester.a_h2o variable */) = (((!(data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && !1) || ((data->simulationInfo->booleanParameter[36] /* uit.digester.ideality PARAM */) && 1))?1.0:1.0 - ((0.017) * ((data->localData[0]->realVars[551] /* uit.digester.S_nh4 variable */) + (data->localData[0]->realVars[540] /* uit.digester.S_hco3 variable */) + (data->localData[0]->realVars[535] /* uit.digester.S_co3 variable */) + (data->localData[0]->realVars[538] /* uit.digester.S_h2po4 variable */) + (data->localData[0]->realVars[541] /* uit.digester.S_hpo4 variable */) + (data->localData[0]->realVars[553] /* uit.digester.S_po4 variable */) + DIVISION_SIM((data->localData[0]->realVars[558] /* uit.digester.S_vam variable */),208.2650980392157,"208.2650980392157",equationIndexes) + DIVISION_SIM((data->localData[0]->realVars[530] /* uit.digester.S_bum variable */),160.1818181818182,"160.1818181818182",equationIndexes) + DIVISION_SIM((data->localData[0]->realVars[555] /* uit.digester.S_prom variable */),112.1210810810811,"112.1210810810811",equationIndexes) + DIVISION_SIM((data->localData[0]->realVars[527] /* uit.digester.S_acm variable */),64.05333333333333,"64.05333333333333",equationIndexes) + (data->localData[0]->realVars[25] /* uit.digester.S_ca STATE(1) */) + (data->localData[0]->realVars[39] /* uit.digester.S_mg STATE(1) */) + (data->localData[0]->realVars[26] /* uit.digester.S_cat STATE(1) */) + (data->localData[0]->realVars[23] /* uit.digester.S_an STATE(1) */))));
  TRACE_POP
}
/*
equation index: 3643
type: SIMPLE_ASSIGN
uit.digester.a_oh = uit.digester.Ka_h2o * uit.digester.convKa * uit.digester.a_h2o / uit.digester.a_h
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3643(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3643};
  (data->localData[0]->realVars[606] /* uit.digester.a_oh variable */) = ((data->localData[0]->realVars[466] /* uit.digester.Ka_h2o variable */)) * (((data->simulationInfo->realParameter[607] /* uit.digester.convKa PARAM */)) * (DIVISION_SIM((data->localData[0]->realVars[600] /* uit.digester.a_h2o variable */),(data->localData[0]->realVars[599] /* uit.digester.a_h variable */),"uit.digester.a_h",equationIndexes)));
  TRACE_POP
}
/*
equation index: 3644
type: SIMPLE_ASSIGN
uit.digester.S_oh = uit.digester.a_oh / uit.digester.g_mono
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3644(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3644};
  (data->localData[0]->realVars[552] /* uit.digester.S_oh variable */) = DIVISION_SIM((data->localData[0]->realVars[606] /* uit.digester.a_oh variable */),(data->localData[0]->realVars[634] /* uit.digester.g_mono variable */),"uit.digester.g_mono",equationIndexes);
  TRACE_POP
}
/*
equation index: 3645
type: SIMPLE_ASSIGN
uit.digester.S_h = uit.digester.charge - (uit.digester.S_cat + uit.digester.S_nh4 + 2.0 * uit.digester.S_ca + 2.0 * uit.digester.S_mg + (-2.0) * uit.digester.S_hpo4 + (-3.0) * uit.digester.S_po4 + (-2.0) * uit.digester.S_co3 + (-0.0156119900083264) * uit.digester.S_acm - uit.digester.S_hco3 + (-0.008918929342795433) * uit.digester.S_prom + (-0.006242905788876278) * uit.digester.S_bum + (-0.004801572656267654) * uit.digester.S_vam - uit.digester.S_an - uit.digester.S_h2po4 - uit.digester.S_oh)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3645(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3645};
  (data->localData[0]->realVars[536] /* uit.digester.S_h variable */) = (data->localData[0]->realVars[68] /* uit.digester.charge STATE(1) */) - ((data->localData[0]->realVars[26] /* uit.digester.S_cat STATE(1) */) + (data->localData[0]->realVars[551] /* uit.digester.S_nh4 variable */) + (2.0) * ((data->localData[0]->realVars[25] /* uit.digester.S_ca STATE(1) */)) + (2.0) * ((data->localData[0]->realVars[39] /* uit.digester.S_mg STATE(1) */)) + (-2.0) * ((data->localData[0]->realVars[541] /* uit.digester.S_hpo4 variable */)) + (-3.0) * ((data->localData[0]->realVars[553] /* uit.digester.S_po4 variable */)) + (-2.0) * ((data->localData[0]->realVars[535] /* uit.digester.S_co3 variable */)) + (-0.0156119900083264) * ((data->localData[0]->realVars[527] /* uit.digester.S_acm variable */)) - (data->localData[0]->realVars[540] /* uit.digester.S_hco3 variable */) + (-0.008918929342795433) * ((data->localData[0]->realVars[555] /* uit.digester.S_prom variable */)) + (-0.006242905788876278) * ((data->localData[0]->realVars[530] /* uit.digester.S_bum variable */)) + (-0.004801572656267654) * ((data->localData[0]->realVars[558] /* uit.digester.S_vam variable */)) - (data->localData[0]->realVars[23] /* uit.digester.S_an STATE(1) */) - (data->localData[0]->realVars[538] /* uit.digester.S_h2po4 variable */) - (data->localData[0]->realVars[552] /* uit.digester.S_oh variable */));
  TRACE_POP
}

void residualFunc3678(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,3678};
  int i,j;
  /* iteration variables */
  for (i=0; i<2; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc3678: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<2; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc3678 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[599] /* uit.digester.a_h variable */) = xloc[0];
  (data->localData[0]->realVars[739] /* uit.digester.z variable */) = xloc[1];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3618(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3619(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3620(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3621(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3622(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3623(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3624(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3625(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3626(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3627(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3628(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3629(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3630(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3631(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3632(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3633(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3634(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3635(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3636(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3637(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3638(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3639(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3640(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3641(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3642(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3643(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3644(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3645(data, threadData);
  /* body */
  res[0] = ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)) * ((data->localData[0]->realVars[536] /* uit.digester.S_h variable */)) - (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);

  res[1] = (data->localData[0]->realVars[601] /* uit.digester.a_h2po4 variable */) - (((data->localData[0]->realVars[538] /* uit.digester.S_h2po4 variable */)) * ((data->localData[0]->realVars[634] /* uit.digester.g_mono variable */)));
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS3678(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+2] = {0,2,2};
  const int rowIndex[4] = {0,1,0,1};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(2, 4, 2);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (2+1)*sizeof(unsigned int));
  
  for(i=2;i<2+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 4*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {1};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
  
  /* color 2 with 1 columns */
  const int indices_2[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_2[i]] = 2;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS3678(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 2;
  inSysData->nonlinearPattern->numberOfEqns = 2;
  inSysData->nonlinearPattern->numberOfNonlinear = 4;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((2+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((2+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(4*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(4*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+2] = {0,2,2};
  const int index_eqn[1+2] = {0,2,2};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (2+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (2+1)*sizeof(unsigned int));
  for(i=2;i<2+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<2+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[4] = {0,1,0,1};
  const int rows[4] = {0,1,0,1};
  memcpy(inSysData->nonlinearPattern->columns, columns, 4*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 4*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS3678(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.digester.a_h */
  sysData->nominal[i] = data->modelData->realVarsData[599].attribute /* uit.digester.a_h */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[599].attribute /* uit.digester.a_h */.min;
  sysData->max[i++]   = data->modelData->realVarsData[599].attribute /* uit.digester.a_h */.max;
  /* static nls data for uit.digester.z */
  sysData->nominal[i] = data->modelData->realVarsData[739].attribute /* uit.digester.z */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[739].attribute /* uit.digester.z */.min;
  sysData->max[i++]   = data->modelData->realVarsData[739].attribute /* uit.digester.z */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS3678(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS3678(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS3678(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  array[1] = (data->localData[0]->realVars[739] /* uit.digester.z variable */);
}


/* inner equations */

void residualFunc3685(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,3685};
  int i,j;
  modelica_real tmp0;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc3685: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc3685 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* body */
  tmp0 = 10.0;
  tmp1 = (-(data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */));
  if(tmp0 < 0.0 && tmp1 != 0.0)
  {
    tmp3 = modf(tmp1, &tmp4);
    
    if(tmp3 > 0.5)
    {
      tmp3 -= 1.0;
      tmp4 += 1.0;
    }
    else if(tmp3 < -0.5)
    {
      tmp3 += 1.0;
      tmp4 -= 1.0;
    }
    
    if(fabs(tmp3) < 1e-10)
      tmp2 = pow(tmp0, tmp4);
    else
    {
      tmp6 = modf(1.0/tmp1, &tmp5);
      if(tmp6 > 0.5)
      {
        tmp6 -= 1.0;
        tmp5 += 1.0;
      }
      else if(tmp6 < -0.5)
      {
        tmp6 += 1.0;
        tmp5 -= 1.0;
      }
      if(fabs(tmp6) < 1e-10 && ((unsigned long)tmp5 & 1))
      {
        tmp2 = -pow(-tmp0, tmp3)*pow(tmp0, tmp4);
      }
      else
      {
        throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp0, tmp1);
      }
    }
  }
  else
  {
    tmp2 = pow(tmp0, tmp1);
  }
  if(isnan(tmp2) || isinf(tmp2))
  {
    throwStreamPrint(threadData, "%s:%d: Invalid root: (%g)^(%g)", __FILE__, __LINE__, tmp0, tmp1);
  }res[0] = tmp2 - (data->localData[0]->realVars[599] /* uit.digester.a_h variable */);
  /* restore known outputs */
  TRACE_POP
}
void initializeSparsePatternNLS3685(NONLINEAR_SYSTEM_DATA* inSysData)
{
  /* no sparsity pattern available */
  inSysData->isPatternAvailable = FALSE;
}
void initializeNonlinearPatternNLS3685(NONLINEAR_SYSTEM_DATA* inSysData)
{
  /* no nonlinear pattern available */
}

OMC_DISABLE_OPT
void initializeStaticDataNLS3685(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.y_dig[1] */
  sysData->nominal[i] = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1682].attribute /* uit.y_dig[1] */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS3685(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS3685(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS3685(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1682] /* uit.y_dig[1] variable */);
}


/* inner equations */

/*
equation index: 3907
type: SIMPLE_ASSIGN
uit.slurry.S_co3 = uit.slurry.outlet.S_ic * uit.slurry.Ka_hco3 / (uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3907(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3907};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */);
  (data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */) = ((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */),"uit.slurry.S_h ^ 2.0 / uit.slurry.Ka_co2 + uit.slurry.S_h + uit.slurry.Ka_hco3",equationIndexes));
  TRACE_POP
}
/*
equation index: 3908
type: SIMPLE_ASSIGN
uit.slurry.S_hco3 = max(0.0, if uit.slurry.liquid == false then uit.slurry.outlet.S_ic * uit.slurry.Ka_co2 / (uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h) else uit.slurry.Alk_mol - (uit.slurry.S_acm + uit.slurry.S_prom + uit.slurry.S_bum + uit.slurry.S_vam) - uit.slurry.S_oh - uit.slurry.S_nh3 + uit.slurry.S_h - uit.slurry.S_hpo4 - 2.0 * uit.slurry.S_po4 + uit.slurry.S_h3po4 - 2.0 * uit.slurry.S_co3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_3908(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,3908};
  (data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */) = fmax(0.0,(((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h",equationIndexes),"uit.slurry.S_h + uit.slurry.Ka_co2 + uit.slurry.Ka_hco3 * uit.slurry.Ka_co2 / uit.slurry.S_h",equationIndexes):(data->localData[0]->realVars[1328] /* uit.slurry.Alk_mol variable */) - ((data->localData[0]->realVars[1422] /* uit.slurry.S_acm variable */) + (data->localData[0]->realVars[1435] /* uit.slurry.S_prom variable */) + (data->localData[0]->realVars[1423] /* uit.slurry.S_bum variable */) + (data->localData[0]->realVars[1436] /* uit.slurry.S_vam variable */)) - (data->localData[0]->realVars[1433] /* uit.slurry.S_oh variable */) - (data->localData[0]->realVars[1431] /* uit.slurry.S_nh3 variable */) + (data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) - (data->localData[0]->realVars[1430] /* uit.slurry.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1434] /* uit.slurry.S_po4 variable */))) + (data->localData[0]->realVars[1428] /* uit.slurry.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1425] /* uit.slurry.S_co3 variable */)))));
  TRACE_POP
}

void residualFunc3913(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,3913};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc3913: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc3913 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3907(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_3908(data, threadData);
  /* body */
  res[0] = (((!(data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[55] /* uit.slurry.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1583] /* uit.slurry.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1429] /* uit.slurry.S_hco3 variable */)) * ((data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */) + (data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1381] /* uit.slurry.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */)),(data->localData[0]->realVars[1426] /* uit.slurry.S_h variable */),"uit.slurry.S_h",equationIndexes)),(data->localData[0]->realVars[1377] /* uit.slurry.Ka_co2 variable */),"uit.slurry.Ka_co2",equationIndexes)) - (data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS3913(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS3913(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 1;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(1*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(1*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,1};
  const int index_eqn[1+1] = {0,1};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[1] = {0};
  const int rows[1] = {0};
  memcpy(inSysData->nonlinearPattern->columns, columns, 1*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 1*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS3913(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.slurry.outlet.S_ic */
  sysData->nominal[i] = data->modelData->realVarsData[1468].attribute /* uit.slurry.outlet.S_ic */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1468].attribute /* uit.slurry.outlet.S_ic */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1468].attribute /* uit.slurry.outlet.S_ic */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS3913(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS3913(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS3913(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1468] /* uit.slurry.outlet.S_ic variable */);
}


/* inner equations */

/*
equation index: 4032
type: SIMPLE_ASSIGN
uit.semolina.S_co3 = uit.semolina.outlet.S_ic * uit.semolina.Ka_hco3 / (uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4032(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4032};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */);
  (data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */) = ((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */),"uit.semolina.S_h ^ 2.0 / uit.semolina.Ka_co2 + uit.semolina.S_h + uit.semolina.Ka_hco3",equationIndexes));
  TRACE_POP
}
/*
equation index: 4033
type: SIMPLE_ASSIGN
uit.semolina.S_hco3 = max(0.0, if uit.semolina.liquid == false then uit.semolina.outlet.S_ic * uit.semolina.Ka_co2 / (uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h) else uit.semolina.Alk_mol - (uit.semolina.S_acm + uit.semolina.S_prom + uit.semolina.S_bum + uit.semolina.S_vam) - uit.semolina.S_oh - uit.semolina.S_nh3 + uit.semolina.S_h - uit.semolina.S_hpo4 - 2.0 * uit.semolina.S_po4 + uit.semolina.S_h3po4 - 2.0 * uit.semolina.S_co3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4033(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4033};
  (data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */) = fmax(0.0,(((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h",equationIndexes),"uit.semolina.S_h + uit.semolina.Ka_co2 + uit.semolina.Ka_hco3 * uit.semolina.Ka_co2 / uit.semolina.S_h",equationIndexes):(data->localData[0]->realVars[1150] /* uit.semolina.Alk_mol variable */) - ((data->localData[0]->realVars[1244] /* uit.semolina.S_acm variable */) + (data->localData[0]->realVars[1257] /* uit.semolina.S_prom variable */) + (data->localData[0]->realVars[1245] /* uit.semolina.S_bum variable */) + (data->localData[0]->realVars[1258] /* uit.semolina.S_vam variable */)) - (data->localData[0]->realVars[1255] /* uit.semolina.S_oh variable */) - (data->localData[0]->realVars[1253] /* uit.semolina.S_nh3 variable */) + (data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) - (data->localData[0]->realVars[1252] /* uit.semolina.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1256] /* uit.semolina.S_po4 variable */))) + (data->localData[0]->realVars[1250] /* uit.semolina.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1247] /* uit.semolina.S_co3 variable */)))));
  TRACE_POP
}

void residualFunc4038(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,4038};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc4038: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc4038 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4032(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4033(data, threadData);
  /* body */
  res[0] = (((!(data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[53] /* uit.semolina.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1381] /* uit.semolina.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1251] /* uit.semolina.S_hco3 variable */)) * ((data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */) + (data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1203] /* uit.semolina.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */)),(data->localData[0]->realVars[1248] /* uit.semolina.S_h variable */),"uit.semolina.S_h",equationIndexes)),(data->localData[0]->realVars[1199] /* uit.semolina.Ka_co2 variable */),"uit.semolina.Ka_co2",equationIndexes)) - (data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS4038(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS4038(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 1;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(1*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(1*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,1};
  const int index_eqn[1+1] = {0,1};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[1] = {0};
  const int rows[1] = {0};
  memcpy(inSysData->nonlinearPattern->columns, columns, 1*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 1*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS4038(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.semolina.outlet.S_ic */
  sysData->nominal[i] = data->modelData->realVarsData[1290].attribute /* uit.semolina.outlet.S_ic */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1290].attribute /* uit.semolina.outlet.S_ic */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1290].attribute /* uit.semolina.outlet.S_ic */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS4038(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS4038(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS4038(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1290] /* uit.semolina.outlet.S_ic variable */);
}


/* inner equations */

/*
equation index: 4157
type: SIMPLE_ASSIGN
uit.eggpasta.S_co3 = uit.eggpasta.outlet.S_ic * uit.eggpasta.Ka_hco3 / (uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4157(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4157};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */);
  (data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */) = ((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2",equationIndexes) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */),"uit.eggpasta.S_h ^ 2.0 / uit.eggpasta.Ka_co2 + uit.eggpasta.S_h + uit.eggpasta.Ka_hco3",equationIndexes));
  TRACE_POP
}
/*
equation index: 4158
type: SIMPLE_ASSIGN
uit.eggpasta.S_hco3 = max(0.0, if uit.eggpasta.liquid == false then uit.eggpasta.outlet.S_ic * uit.eggpasta.Ka_co2 / (uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h) else uit.eggpasta.Alk_mol - (uit.eggpasta.S_acm + uit.eggpasta.S_prom + uit.eggpasta.S_bum + uit.eggpasta.S_vam) - uit.eggpasta.S_oh - uit.eggpasta.S_nh3 + uit.eggpasta.S_h - uit.eggpasta.S_hpo4 - 2.0 * uit.eggpasta.S_po4 + uit.eggpasta.S_h3po4 - 2.0 * uit.eggpasta.S_co3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4158(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4158};
  (data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */) = fmax(0.0,(((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h",equationIndexes),"uit.eggpasta.S_h + uit.eggpasta.Ka_co2 + uit.eggpasta.Ka_hco3 * uit.eggpasta.Ka_co2 / uit.eggpasta.S_h",equationIndexes):(data->localData[0]->realVars[742] /* uit.eggpasta.Alk_mol variable */) - ((data->localData[0]->realVars[836] /* uit.eggpasta.S_acm variable */) + (data->localData[0]->realVars[849] /* uit.eggpasta.S_prom variable */) + (data->localData[0]->realVars[837] /* uit.eggpasta.S_bum variable */) + (data->localData[0]->realVars[850] /* uit.eggpasta.S_vam variable */)) - (data->localData[0]->realVars[847] /* uit.eggpasta.S_oh variable */) - (data->localData[0]->realVars[845] /* uit.eggpasta.S_nh3 variable */) + (data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) - (data->localData[0]->realVars[844] /* uit.eggpasta.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[848] /* uit.eggpasta.S_po4 variable */))) + (data->localData[0]->realVars[842] /* uit.eggpasta.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[839] /* uit.eggpasta.S_co3 variable */)))));
  TRACE_POP
}

void residualFunc4163(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,4163};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc4163: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc4163 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4157(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4158(data, threadData);
  /* body */
  res[0] = (((!(data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[40] /* uit.eggpasta.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[918] /* uit.eggpasta.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[843] /* uit.eggpasta.S_hco3 variable */)) * ((data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */) + (data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[795] /* uit.eggpasta.Ka_hco3 variable */)) * ((data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */)),(data->localData[0]->realVars[840] /* uit.eggpasta.S_h variable */),"uit.eggpasta.S_h",equationIndexes)),(data->localData[0]->realVars[791] /* uit.eggpasta.Ka_co2 variable */),"uit.eggpasta.Ka_co2",equationIndexes)) - (data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS4163(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS4163(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 1;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(1*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(1*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,1};
  const int index_eqn[1+1] = {0,1};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[1] = {0};
  const int rows[1] = {0};
  memcpy(inSysData->nonlinearPattern->columns, columns, 1*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 1*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS4163(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.eggpasta.outlet.S_ic */
  sysData->nominal[i] = data->modelData->realVarsData[882].attribute /* uit.eggpasta.outlet.S_ic */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[882].attribute /* uit.eggpasta.outlet.S_ic */.min;
  sysData->max[i++]   = data->modelData->realVarsData[882].attribute /* uit.eggpasta.outlet.S_ic */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS4163(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS4163(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS4163(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[882] /* uit.eggpasta.outlet.S_ic variable */);
}


/* inner equations */

/*
equation index: 4282
type: SIMPLE_ASSIGN
uit.tomatosouce.S_co3 = uit.tomatosouce.outlet.S_ic * uit.tomatosouce.Ka_hco3 / (uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4282(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4282};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */);
  (data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */) = ((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */),"uit.tomatosouce.S_h ^ 2.0 / uit.tomatosouce.Ka_co2 + uit.tomatosouce.S_h + uit.tomatosouce.Ka_hco3",equationIndexes));
  TRACE_POP
}
/*
equation index: 4283
type: SIMPLE_ASSIGN
uit.tomatosouce.S_hco3 = max(0.0, if uit.tomatosouce.liquid == false then uit.tomatosouce.outlet.S_ic * uit.tomatosouce.Ka_co2 / (uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h) else uit.tomatosouce.Alk_mol - (uit.tomatosouce.S_acm + uit.tomatosouce.S_prom + uit.tomatosouce.S_bum + uit.tomatosouce.S_vam) - uit.tomatosouce.S_oh - uit.tomatosouce.S_nh3 + uit.tomatosouce.S_h - uit.tomatosouce.S_hpo4 - 2.0 * uit.tomatosouce.S_po4 + uit.tomatosouce.S_h3po4 - 2.0 * uit.tomatosouce.S_co3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4283(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4283};
  (data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */) = fmax(0.0,(((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h",equationIndexes),"uit.tomatosouce.S_h + uit.tomatosouce.Ka_co2 + uit.tomatosouce.Ka_hco3 * uit.tomatosouce.Ka_co2 / uit.tomatosouce.S_h",equationIndexes):(data->localData[0]->realVars[1506] /* uit.tomatosouce.Alk_mol variable */) - ((data->localData[0]->realVars[1600] /* uit.tomatosouce.S_acm variable */) + (data->localData[0]->realVars[1613] /* uit.tomatosouce.S_prom variable */) + (data->localData[0]->realVars[1601] /* uit.tomatosouce.S_bum variable */) + (data->localData[0]->realVars[1614] /* uit.tomatosouce.S_vam variable */)) - (data->localData[0]->realVars[1611] /* uit.tomatosouce.S_oh variable */) - (data->localData[0]->realVars[1609] /* uit.tomatosouce.S_nh3 variable */) + (data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) - (data->localData[0]->realVars[1608] /* uit.tomatosouce.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1612] /* uit.tomatosouce.S_po4 variable */))) + (data->localData[0]->realVars[1606] /* uit.tomatosouce.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1603] /* uit.tomatosouce.S_co3 variable */)))));
  TRACE_POP
}

void residualFunc4288(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,4288};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc4288: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc4288 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4282(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4283(data, threadData);
  /* body */
  res[0] = (((!(data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[57] /* uit.tomatosouce.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1789] /* uit.tomatosouce.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1607] /* uit.tomatosouce.S_hco3 variable */)) * ((data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */) + (data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1559] /* uit.tomatosouce.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */)),(data->localData[0]->realVars[1604] /* uit.tomatosouce.S_h variable */),"uit.tomatosouce.S_h",equationIndexes)),(data->localData[0]->realVars[1555] /* uit.tomatosouce.Ka_co2 variable */),"uit.tomatosouce.Ka_co2",equationIndexes)) - (data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS4288(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS4288(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 1;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(1*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(1*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,1};
  const int index_eqn[1+1] = {0,1};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[1] = {0};
  const int rows[1] = {0};
  memcpy(inSysData->nonlinearPattern->columns, columns, 1*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 1*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS4288(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.tomatosouce.outlet.S_ic */
  sysData->nominal[i] = data->modelData->realVarsData[1646].attribute /* uit.tomatosouce.outlet.S_ic */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1646].attribute /* uit.tomatosouce.outlet.S_ic */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1646].attribute /* uit.tomatosouce.outlet.S_ic */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS4288(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS4288(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS4288(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1646] /* uit.tomatosouce.outlet.S_ic variable */);
}


/* inner equations */

/*
equation index: 4421
type: SIMPLE_ASSIGN
uit.maize.S_co3 = uit.maize.outlet.S_ic * uit.maize.Ka_hco3 / (uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4421(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4421};
  modelica_real tmp0;
  tmp0 = (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */);
  (data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */) = ((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * (DIVISION_SIM((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),DIVISION_SIM((tmp0 * tmp0),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2",equationIndexes) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */),"uit.maize.S_h ^ 2.0 / uit.maize.Ka_co2 + uit.maize.S_h + uit.maize.Ka_hco3",equationIndexes));
  TRACE_POP
}
/*
equation index: 4422
type: SIMPLE_ASSIGN
uit.maize.S_hco3 = max(0.0, if uit.maize.liquid == false then uit.maize.outlet.S_ic * uit.maize.Ka_co2 / (uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h) else uit.maize.Alk_mol - (uit.maize.S_acm + uit.maize.S_prom + uit.maize.S_bum + uit.maize.S_vam) - uit.maize.S_oh - uit.maize.S_nh3 + uit.maize.S_h - uit.maize.S_hpo4 - 2.0 * uit.maize.S_po4 + uit.maize.S_h3po4 - 2.0 * uit.maize.S_co3)
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_4422(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,4422};
  (data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */) = fmax(0.0,(((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION_SIM(((data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h",equationIndexes),"uit.maize.S_h + uit.maize.Ka_co2 + uit.maize.Ka_hco3 * uit.maize.Ka_co2 / uit.maize.S_h",equationIndexes):(data->localData[0]->realVars[962] /* uit.maize.Alk_mol variable */) - ((data->localData[0]->realVars[1056] /* uit.maize.S_acm variable */) + (data->localData[0]->realVars[1069] /* uit.maize.S_prom variable */) + (data->localData[0]->realVars[1057] /* uit.maize.S_bum variable */) + (data->localData[0]->realVars[1070] /* uit.maize.S_vam variable */)) - (data->localData[0]->realVars[1067] /* uit.maize.S_oh variable */) - (data->localData[0]->realVars[1065] /* uit.maize.S_nh3 variable */) + (data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) - (data->localData[0]->realVars[1064] /* uit.maize.S_hpo4 variable */) - ((2.0) * ((data->localData[0]->realVars[1068] /* uit.maize.S_po4 variable */))) + (data->localData[0]->realVars[1062] /* uit.maize.S_h3po4 variable */) - ((2.0) * ((data->localData[0]->realVars[1059] /* uit.maize.S_co3 variable */)))));
  TRACE_POP
}

void residualFunc4427(RESIDUAL_USERDATA* userData, const double* xloc, double* res, const int* iflag)
{
  TRACE_PUSH
  DATA *data = userData->data;
  threadData_t *threadData = userData->threadData;
  const int equationIndexes[2] = {1,4427};
  int i,j;
  /* iteration variables */
  for (i=0; i<1; i++) {
    if (isinf(xloc[i]) || isnan(xloc[i])) {
      errorStreamPrint(LOG_NLS, 0, "residualFunc4427: Iteration variable xloc[%i] is nan.", i);
      for (j=0; j<1; j++) {
        res[j] = NAN;
      }
      throwStreamPrintWithEquationIndexes(threadData, omc_dummyFileInfo, equationIndexes, "residualFunc4427 failed at time=%.15g.\nFor more information please use -lv LOG_NLS.", data->localData[0]->timeValue);
      return;
    }
  }
  (data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */) = xloc[0];
  /* backup outputs */
  /* pre body */
  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4421(data, threadData);

  /* local constraints */
  ADM1_P_UIT_real_R2_copia_eqFunction_4422(data, threadData);
  /* body */
  res[0] = (((!(data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && !0) || ((data->simulationInfo->booleanParameter[49] /* uit.maize.liquid PARAM */) && 0))?DIVISION_SIM((data->simulationInfo->realParameter[1179] /* uit.maize.tic PARAM */),12000.0,"12000.0",equationIndexes):DIVISION_SIM(((data->localData[0]->realVars[1063] /* uit.maize.S_hco3 variable */)) * ((data->localData[0]->realVars[1060] /* uit.maize.S_h variable */) + (data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */) + DIVISION_SIM(((data->localData[0]->realVars[1015] /* uit.maize.Ka_hco3 variable */)) * ((data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */)),(data->localData[0]->realVars[1060] /* uit.maize.S_h variable */),"uit.maize.S_h",equationIndexes)),(data->localData[0]->realVars[1011] /* uit.maize.Ka_co2 variable */),"uit.maize.Ka_co2",equationIndexes)) - (data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */);
  /* restore known outputs */
  TRACE_POP
}

OMC_DISABLE_OPT
void initializeSparsePatternNLS4427(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  const int colPtrIndex[1+1] = {0,1};
  const int rowIndex[1] = {0};
  /* sparsity pattern available */
  inSysData->isPatternAvailable = TRUE;
  inSysData->sparsePattern = allocSparsePattern(1, 1, 1);
  
  /* write lead index of compressed sparse column */
  memcpy(inSysData->sparsePattern->leadindex, colPtrIndex, (1+1)*sizeof(unsigned int));
  
  for(i=2;i<1+1;++i)
    inSysData->sparsePattern->leadindex[i] += inSysData->sparsePattern->leadindex[i-1];
  
  /* call sparse index */
  memcpy(inSysData->sparsePattern->index, rowIndex, 1*sizeof(unsigned int));
  
  /* write color array */
  /* color 1 with 1 columns */
  const int indices_1[1] = {0};
  for(i=0; i<1; i++)
    inSysData->sparsePattern->colorCols[indices_1[i]] = 1;
}
OMC_DISABLE_OPT
void initializeNonlinearPatternNLS4427(NONLINEAR_SYSTEM_DATA* inSysData)
{
  int i=0;
  inSysData->nonlinearPattern = (NONLINEAR_PATTERN*) malloc(sizeof(NONLINEAR_PATTERN));
  inSysData->nonlinearPattern->numberOfVars = 1;
  inSysData->nonlinearPattern->numberOfEqns = 1;
  inSysData->nonlinearPattern->numberOfNonlinear = 1;
  inSysData->nonlinearPattern->indexVar = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->indexEqn = (unsigned int*) malloc((1+1)*sizeof(unsigned int));
  inSysData->nonlinearPattern->columns = (unsigned int*) malloc(1*sizeof(unsigned int));
  inSysData->nonlinearPattern->rows = (unsigned int*) malloc(1*sizeof(unsigned int));
  /* initialize and accumulate index vectors */
  const int index_var[1+1] = {0,1};
  const int index_eqn[1+1] = {0,1};
  memcpy(inSysData->nonlinearPattern->indexVar, index_var, (1+1)*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->indexEqn, index_eqn, (1+1)*sizeof(unsigned int));
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexVar[i] += inSysData->nonlinearPattern->indexVar[i-1];
  for(i=2;i<1+1;++i)
    inSysData->nonlinearPattern->indexEqn[i] += inSysData->nonlinearPattern->indexEqn[i-1];
  /* initialize columns and rows */
  const int columns[1] = {0};
  const int rows[1] = {0};
  memcpy(inSysData->nonlinearPattern->columns, columns, 1*sizeof(unsigned int));
  memcpy(inSysData->nonlinearPattern->rows, rows, 1*sizeof(unsigned int));
}

OMC_DISABLE_OPT
void initializeStaticDataNLS4427(DATA* data, threadData_t *threadData, NONLINEAR_SYSTEM_DATA *sysData, modelica_boolean initSparsePattern, modelica_boolean initNonlinearPattern)
{
  int i=0;
  /* static nls data for uit.maize.outlet.S_ic */
  sysData->nominal[i] = data->modelData->realVarsData[1102].attribute /* uit.maize.outlet.S_ic */.nominal;
  sysData->min[i]     = data->modelData->realVarsData[1102].attribute /* uit.maize.outlet.S_ic */.min;
  sysData->max[i++]   = data->modelData->realVarsData[1102].attribute /* uit.maize.outlet.S_ic */.max;
  /* initial sparse pattern */
  if (initSparsePattern) {
    initializeSparsePatternNLS4427(sysData);
  }
  if (initNonlinearPattern) {
    initializeNonlinearPatternNLS4427(sysData);
  }
}

OMC_DISABLE_OPT
void getIterationVarsNLS4427(DATA* data, double *array)
{
  array[0] = (data->localData[0]->realVars[1102] /* uit.maize.outlet.S_ic variable */);
}

/* Prototypes for the strict sets (Dynamic Tearing) */

/* Global constraints for the casual sets */
/* function initialize non-linear systems */
void ADM1_P_UIT_real_R2_copia_initialNonLinearSystem(int nNonLinearSystems, NONLINEAR_SYSTEM_DATA* nonLinearSystemData)
{
  
  nonLinearSystemData[18].equationIndex = 4427;
  nonLinearSystemData[18].size = 1;
  nonLinearSystemData[18].homotopySupport = 0;
  nonLinearSystemData[18].mixedSystem = 0;
  nonLinearSystemData[18].residualFunc = residualFunc4427;
  nonLinearSystemData[18].strictTearingFunctionCall = NULL;
  nonLinearSystemData[18].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac20_column;
  nonLinearSystemData[18].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac20;
  nonLinearSystemData[18].jacobianIndex = 15 /*jacInx*/;
  nonLinearSystemData[18].initializeStaticNLSData = initializeStaticDataNLS4427;
  nonLinearSystemData[18].getIterationVars = getIterationVarsNLS4427;
  nonLinearSystemData[18].checkConstraints = NULL;
  
  
  nonLinearSystemData[17].equationIndex = 4288;
  nonLinearSystemData[17].size = 1;
  nonLinearSystemData[17].homotopySupport = 0;
  nonLinearSystemData[17].mixedSystem = 0;
  nonLinearSystemData[17].residualFunc = residualFunc4288;
  nonLinearSystemData[17].strictTearingFunctionCall = NULL;
  nonLinearSystemData[17].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac19_column;
  nonLinearSystemData[17].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac19;
  nonLinearSystemData[17].jacobianIndex = 14 /*jacInx*/;
  nonLinearSystemData[17].initializeStaticNLSData = initializeStaticDataNLS4288;
  nonLinearSystemData[17].getIterationVars = getIterationVarsNLS4288;
  nonLinearSystemData[17].checkConstraints = NULL;
  
  
  nonLinearSystemData[16].equationIndex = 4163;
  nonLinearSystemData[16].size = 1;
  nonLinearSystemData[16].homotopySupport = 0;
  nonLinearSystemData[16].mixedSystem = 0;
  nonLinearSystemData[16].residualFunc = residualFunc4163;
  nonLinearSystemData[16].strictTearingFunctionCall = NULL;
  nonLinearSystemData[16].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac18_column;
  nonLinearSystemData[16].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac18;
  nonLinearSystemData[16].jacobianIndex = 13 /*jacInx*/;
  nonLinearSystemData[16].initializeStaticNLSData = initializeStaticDataNLS4163;
  nonLinearSystemData[16].getIterationVars = getIterationVarsNLS4163;
  nonLinearSystemData[16].checkConstraints = NULL;
  
  
  nonLinearSystemData[15].equationIndex = 4038;
  nonLinearSystemData[15].size = 1;
  nonLinearSystemData[15].homotopySupport = 0;
  nonLinearSystemData[15].mixedSystem = 0;
  nonLinearSystemData[15].residualFunc = residualFunc4038;
  nonLinearSystemData[15].strictTearingFunctionCall = NULL;
  nonLinearSystemData[15].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac17_column;
  nonLinearSystemData[15].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac17;
  nonLinearSystemData[15].jacobianIndex = 12 /*jacInx*/;
  nonLinearSystemData[15].initializeStaticNLSData = initializeStaticDataNLS4038;
  nonLinearSystemData[15].getIterationVars = getIterationVarsNLS4038;
  nonLinearSystemData[15].checkConstraints = NULL;
  
  
  nonLinearSystemData[14].equationIndex = 3913;
  nonLinearSystemData[14].size = 1;
  nonLinearSystemData[14].homotopySupport = 0;
  nonLinearSystemData[14].mixedSystem = 0;
  nonLinearSystemData[14].residualFunc = residualFunc3913;
  nonLinearSystemData[14].strictTearingFunctionCall = NULL;
  nonLinearSystemData[14].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac16_column;
  nonLinearSystemData[14].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac16;
  nonLinearSystemData[14].jacobianIndex = 11 /*jacInx*/;
  nonLinearSystemData[14].initializeStaticNLSData = initializeStaticDataNLS3913;
  nonLinearSystemData[14].getIterationVars = getIterationVarsNLS3913;
  nonLinearSystemData[14].checkConstraints = NULL;
  
  
  nonLinearSystemData[13].equationIndex = 3685;
  nonLinearSystemData[13].size = 1;
  nonLinearSystemData[13].homotopySupport = 0;
  nonLinearSystemData[13].mixedSystem = 0;
  nonLinearSystemData[13].residualFunc = residualFunc3685;
  nonLinearSystemData[13].strictTearingFunctionCall = NULL;
  nonLinearSystemData[13].analyticalJacobianColumn = NULL;
  nonLinearSystemData[13].initialAnalyticalJacobian = NULL;
  nonLinearSystemData[13].jacobianIndex = -1;
  nonLinearSystemData[13].initializeStaticNLSData = initializeStaticDataNLS3685;
  nonLinearSystemData[13].getIterationVars = getIterationVarsNLS3685;
  nonLinearSystemData[13].checkConstraints = NULL;
  
  
  nonLinearSystemData[12].equationIndex = 3678;
  nonLinearSystemData[12].size = 2;
  nonLinearSystemData[12].homotopySupport = 0;
  nonLinearSystemData[12].mixedSystem = 0;
  nonLinearSystemData[12].residualFunc = residualFunc3678;
  nonLinearSystemData[12].strictTearingFunctionCall = NULL;
  nonLinearSystemData[12].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac14_column;
  nonLinearSystemData[12].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac14;
  nonLinearSystemData[12].jacobianIndex = 10 /*jacInx*/;
  nonLinearSystemData[12].initializeStaticNLSData = initializeStaticDataNLS3678;
  nonLinearSystemData[12].getIterationVars = getIterationVarsNLS3678;
  nonLinearSystemData[12].checkConstraints = NULL;
  
  
  nonLinearSystemData[11].equationIndex = 2728;
  nonLinearSystemData[11].size = 1;
  nonLinearSystemData[11].homotopySupport = 0;
  nonLinearSystemData[11].mixedSystem = 0;
  nonLinearSystemData[11].residualFunc = residualFunc2728;
  nonLinearSystemData[11].strictTearingFunctionCall = NULL;
  nonLinearSystemData[11].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac13_column;
  nonLinearSystemData[11].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac13;
  nonLinearSystemData[11].jacobianIndex = 9 /*jacInx*/;
  nonLinearSystemData[11].initializeStaticNLSData = initializeStaticDataNLS2728;
  nonLinearSystemData[11].getIterationVars = getIterationVarsNLS2728;
  nonLinearSystemData[11].checkConstraints = NULL;
  
  
  nonLinearSystemData[10].equationIndex = 2605;
  nonLinearSystemData[10].size = 1;
  nonLinearSystemData[10].homotopySupport = 0;
  nonLinearSystemData[10].mixedSystem = 0;
  nonLinearSystemData[10].residualFunc = residualFunc2605;
  nonLinearSystemData[10].strictTearingFunctionCall = NULL;
  nonLinearSystemData[10].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac12_column;
  nonLinearSystemData[10].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac12;
  nonLinearSystemData[10].jacobianIndex = 8 /*jacInx*/;
  nonLinearSystemData[10].initializeStaticNLSData = initializeStaticDataNLS2605;
  nonLinearSystemData[10].getIterationVars = getIterationVarsNLS2605;
  nonLinearSystemData[10].checkConstraints = NULL;
  
  
  nonLinearSystemData[9].equationIndex = 2482;
  nonLinearSystemData[9].size = 1;
  nonLinearSystemData[9].homotopySupport = 0;
  nonLinearSystemData[9].mixedSystem = 0;
  nonLinearSystemData[9].residualFunc = residualFunc2482;
  nonLinearSystemData[9].strictTearingFunctionCall = NULL;
  nonLinearSystemData[9].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac11_column;
  nonLinearSystemData[9].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac11;
  nonLinearSystemData[9].jacobianIndex = 7 /*jacInx*/;
  nonLinearSystemData[9].initializeStaticNLSData = initializeStaticDataNLS2482;
  nonLinearSystemData[9].getIterationVars = getIterationVarsNLS2482;
  nonLinearSystemData[9].checkConstraints = NULL;
  
  
  nonLinearSystemData[8].equationIndex = 2359;
  nonLinearSystemData[8].size = 1;
  nonLinearSystemData[8].homotopySupport = 0;
  nonLinearSystemData[8].mixedSystem = 0;
  nonLinearSystemData[8].residualFunc = residualFunc2359;
  nonLinearSystemData[8].strictTearingFunctionCall = NULL;
  nonLinearSystemData[8].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac10_column;
  nonLinearSystemData[8].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac10;
  nonLinearSystemData[8].jacobianIndex = 6 /*jacInx*/;
  nonLinearSystemData[8].initializeStaticNLSData = initializeStaticDataNLS2359;
  nonLinearSystemData[8].getIterationVars = getIterationVarsNLS2359;
  nonLinearSystemData[8].checkConstraints = NULL;
  
  
  nonLinearSystemData[7].equationIndex = 2236;
  nonLinearSystemData[7].size = 1;
  nonLinearSystemData[7].homotopySupport = 0;
  nonLinearSystemData[7].mixedSystem = 0;
  nonLinearSystemData[7].residualFunc = residualFunc2236;
  nonLinearSystemData[7].strictTearingFunctionCall = NULL;
  nonLinearSystemData[7].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac9_column;
  nonLinearSystemData[7].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac9;
  nonLinearSystemData[7].jacobianIndex = 5 /*jacInx*/;
  nonLinearSystemData[7].initializeStaticNLSData = initializeStaticDataNLS2236;
  nonLinearSystemData[7].getIterationVars = getIterationVarsNLS2236;
  nonLinearSystemData[7].checkConstraints = NULL;
  
  
  nonLinearSystemData[6].equationIndex = 2091;
  nonLinearSystemData[6].size = 1;
  nonLinearSystemData[6].homotopySupport = 0;
  nonLinearSystemData[6].mixedSystem = 0;
  nonLinearSystemData[6].residualFunc = residualFunc2091;
  nonLinearSystemData[6].strictTearingFunctionCall = NULL;
  nonLinearSystemData[6].analyticalJacobianColumn = NULL;
  nonLinearSystemData[6].initialAnalyticalJacobian = NULL;
  nonLinearSystemData[6].jacobianIndex = -1;
  nonLinearSystemData[6].initializeStaticNLSData = initializeStaticDataNLS2091;
  nonLinearSystemData[6].getIterationVars = getIterationVarsNLS2091;
  nonLinearSystemData[6].checkConstraints = NULL;
  
  
  nonLinearSystemData[5].equationIndex = 957;
  nonLinearSystemData[5].size = 1;
  nonLinearSystemData[5].homotopySupport = 0;
  nonLinearSystemData[5].mixedSystem = 0;
  nonLinearSystemData[5].residualFunc = residualFunc957;
  nonLinearSystemData[5].strictTearingFunctionCall = NULL;
  nonLinearSystemData[5].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac6_column;
  nonLinearSystemData[5].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac6;
  nonLinearSystemData[5].jacobianIndex = 4 /*jacInx*/;
  nonLinearSystemData[5].initializeStaticNLSData = initializeStaticDataNLS957;
  nonLinearSystemData[5].getIterationVars = getIterationVarsNLS957;
  nonLinearSystemData[5].checkConstraints = NULL;
  
  
  nonLinearSystemData[4].equationIndex = 834;
  nonLinearSystemData[4].size = 1;
  nonLinearSystemData[4].homotopySupport = 0;
  nonLinearSystemData[4].mixedSystem = 0;
  nonLinearSystemData[4].residualFunc = residualFunc834;
  nonLinearSystemData[4].strictTearingFunctionCall = NULL;
  nonLinearSystemData[4].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac5_column;
  nonLinearSystemData[4].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac5;
  nonLinearSystemData[4].jacobianIndex = 3 /*jacInx*/;
  nonLinearSystemData[4].initializeStaticNLSData = initializeStaticDataNLS834;
  nonLinearSystemData[4].getIterationVars = getIterationVarsNLS834;
  nonLinearSystemData[4].checkConstraints = NULL;
  
  
  nonLinearSystemData[3].equationIndex = 711;
  nonLinearSystemData[3].size = 1;
  nonLinearSystemData[3].homotopySupport = 0;
  nonLinearSystemData[3].mixedSystem = 0;
  nonLinearSystemData[3].residualFunc = residualFunc711;
  nonLinearSystemData[3].strictTearingFunctionCall = NULL;
  nonLinearSystemData[3].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac4_column;
  nonLinearSystemData[3].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac4;
  nonLinearSystemData[3].jacobianIndex = 2 /*jacInx*/;
  nonLinearSystemData[3].initializeStaticNLSData = initializeStaticDataNLS711;
  nonLinearSystemData[3].getIterationVars = getIterationVarsNLS711;
  nonLinearSystemData[3].checkConstraints = NULL;
  
  
  nonLinearSystemData[2].equationIndex = 588;
  nonLinearSystemData[2].size = 1;
  nonLinearSystemData[2].homotopySupport = 0;
  nonLinearSystemData[2].mixedSystem = 0;
  nonLinearSystemData[2].residualFunc = residualFunc588;
  nonLinearSystemData[2].strictTearingFunctionCall = NULL;
  nonLinearSystemData[2].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac3_column;
  nonLinearSystemData[2].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac3;
  nonLinearSystemData[2].jacobianIndex = 1 /*jacInx*/;
  nonLinearSystemData[2].initializeStaticNLSData = initializeStaticDataNLS588;
  nonLinearSystemData[2].getIterationVars = getIterationVarsNLS588;
  nonLinearSystemData[2].checkConstraints = NULL;
  
  
  nonLinearSystemData[1].equationIndex = 465;
  nonLinearSystemData[1].size = 1;
  nonLinearSystemData[1].homotopySupport = 0;
  nonLinearSystemData[1].mixedSystem = 0;
  nonLinearSystemData[1].residualFunc = residualFunc465;
  nonLinearSystemData[1].strictTearingFunctionCall = NULL;
  nonLinearSystemData[1].analyticalJacobianColumn = ADM1_P_UIT_real_R2_copia_functionJacNLSJac2_column;
  nonLinearSystemData[1].initialAnalyticalJacobian = ADM1_P_UIT_real_R2_copia_initialAnalyticJacobianNLSJac2;
  nonLinearSystemData[1].jacobianIndex = 0 /*jacInx*/;
  nonLinearSystemData[1].initializeStaticNLSData = initializeStaticDataNLS465;
  nonLinearSystemData[1].getIterationVars = getIterationVarsNLS465;
  nonLinearSystemData[1].checkConstraints = NULL;
  
  
  nonLinearSystemData[0].equationIndex = 320;
  nonLinearSystemData[0].size = 1;
  nonLinearSystemData[0].homotopySupport = 0;
  nonLinearSystemData[0].mixedSystem = 0;
  nonLinearSystemData[0].residualFunc = residualFunc320;
  nonLinearSystemData[0].strictTearingFunctionCall = NULL;
  nonLinearSystemData[0].analyticalJacobianColumn = NULL;
  nonLinearSystemData[0].initialAnalyticalJacobian = NULL;
  nonLinearSystemData[0].jacobianIndex = -1;
  nonLinearSystemData[0].initializeStaticNLSData = initializeStaticDataNLS320;
  nonLinearSystemData[0].getIterationVars = getIterationVarsNLS320;
  nonLinearSystemData[0].checkConstraints = NULL;
}

#if defined(__cplusplus)
}
#endif

