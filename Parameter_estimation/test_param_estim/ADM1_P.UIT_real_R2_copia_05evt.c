/* Events: Sample, Zero Crossings, Relations, Discrete Changes */
#include "ADM1_P.UIT_real_R2_copia_model.h"
#if defined(__cplusplus)
extern "C" {
#endif

/* Initializes the raw time events of the simulation using the now
   calcualted parameters. */
void ADM1_P_UIT_real_R2_copia_function_initSample(DATA *data, threadData_t *threadData)
{
  long i=0;
  /* sample 1 */
  data->modelData->samplesInfo[i].index = 1;
  data->modelData->samplesInfo[i].start = 0.0;
  data->modelData->samplesInfo[i].interval = 86400.0 /* (max int for single time events) */;
  i++;
}

const char *ADM1_P_UIT_real_R2_copia_zeroCrossingDescription(int i, int **out_EquationIndexes)
{
  static const char *res[] = {"time >= pre(Manual_flowrates.nextTimeEvent)",
  "time >= pre(uit.comp_maize.nextTimeEvent)",
  "time >= pre(uit.comp_tomatosouce.nextTimeEvent)",
  "time >= pre(uit.comp_eggpasta.nextTimeEvent)",
  "time >= pre(uit.comp_semolina.nextTimeEvent)",
  "time >= pre(uit.comp_slurry_real.nextTimeEvent)",
  "time >= pre(Manual_flowrates_real.nextTimeEvent)",
  "time >= pre(Tomato_flowrate_real.nextTimeEvent)",
  "time >= pre(v_liq.nextTimeEvent)",
  "time > 1000000.0",
  "time < 1000000.0",
  "time > pre(pump_onoff.tfr_pump) + $cse10",
  "time - pump_onoff.tfr_pump < 60.0 and impulse",
  "time >= pre(uit.comp_slurry.nextTimeEvent)",
  "time < ramp_maize.startTime",
  "time < ramp_maize.startTime + ramp_maize.duration",
  "time < ramp_slurry.startTime",
  "time < ramp_slurry.startTime + ramp_slurry.duration",
  "time < ramp_tomato.startTime",
  "time < ramp_tomato.startTime + ramp_tomato.duration"};
  static const int occurEqs0[] = {1,3532};
  static const int occurEqs1[] = {1,3534};
  static const int occurEqs2[] = {1,3538};
  static const int occurEqs3[] = {1,3532};
  static const int occurEqs4[] = {1,3985};
  static const int occurEqs5[] = {1,3860};
  static const int occurEqs6[] = {1,3802};
  static const int occurEqs7[] = {1,3789};
  static const int occurEqs8[] = {1,3780};
  static const int occurEqs9[] = {1,3792};
  static const int occurEqs10[] = {1,3792};
  static const int occurEqs11[] = {1,3796};
  static const int occurEqs12[] = {1,3798};
  static const int occurEqs13[] = {1,3776};
  static const int occurEqs14[] = {1,3527};
  static const int occurEqs15[] = {1,3527};
  static const int occurEqs16[] = {1,3527};
  static const int occurEqs17[] = {1,3527};
  static const int occurEqs18[] = {1,3527};
  static const int occurEqs19[] = {1,3527};
  static const int *occurEqs[] = {occurEqs0,occurEqs1,occurEqs2,occurEqs3,occurEqs4,occurEqs5,occurEqs6,occurEqs7,occurEqs8,occurEqs9,occurEqs10,occurEqs11,occurEqs12,occurEqs13,occurEqs14,occurEqs15,occurEqs16,occurEqs17,occurEqs18,occurEqs19};
  *out_EquationIndexes = (int*) occurEqs[i];
  return res[i];
}

/* forwarded equations */
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3778(DATA* data, threadData_t *threadData);
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3789(DATA* data, threadData_t *threadData);
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3791(DATA* data, threadData_t *threadData);
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3792(DATA* data, threadData_t *threadData);
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3793(DATA* data, threadData_t *threadData);
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3794(DATA* data, threadData_t *threadData);
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3795(DATA* data, threadData_t *threadData);
extern void ADM1_P_UIT_real_R2_copia_eqFunction_3796(DATA* data, threadData_t *threadData);

int ADM1_P_UIT_real_R2_copia_function_ZeroCrossingsEquations(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  data->simulationInfo->callStatistics.functionZeroCrossingsEquations++;

  ADM1_P_UIT_real_R2_copia_eqFunction_3778(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_3789(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_3791(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_3792(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_3793(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_3794(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_3795(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_3796(data, threadData);
  
  TRACE_POP
  return 0;
}

int ADM1_P_UIT_real_R2_copia_function_ZeroCrossings(DATA *data, threadData_t *threadData, double *gout)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;

  modelica_boolean tmp85;
  modelica_boolean tmp86;
  modelica_boolean tmp87;
  modelica_boolean tmp88;
  modelica_boolean tmp89;
  modelica_boolean tmp90;
  modelica_boolean tmp91;
  modelica_boolean tmp92;
  modelica_boolean tmp93;
  modelica_boolean tmp94;
  modelica_boolean tmp95;
  modelica_boolean tmp96;
  modelica_boolean tmp97;
  modelica_boolean tmp98;
  modelica_boolean tmp99;
  modelica_boolean tmp100;
  modelica_boolean tmp101;
  modelica_boolean tmp102;
  modelica_boolean tmp103;
  modelica_boolean tmp104;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_ZC);
#endif
  data->simulationInfo->callStatistics.functionZeroCrossings++;

  tmp85 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1696] /* Manual_flowrates.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[0]);
  gout[0] = (tmp85) ? 1 : -1;

  tmp86 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1706] /* uit.comp_maize.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[1]);
  gout[1] = (tmp86) ? 1 : -1;

  tmp87 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1714] /* uit.comp_tomatosouce.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[2]);
  gout[2] = (tmp87) ? 1 : -1;

  tmp88 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1704] /* uit.comp_eggpasta.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[3]);
  gout[3] = (tmp88) ? 1 : -1;

  tmp89 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1708] /* uit.comp_semolina.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[4]);
  gout[4] = (tmp89) ? 1 : -1;

  tmp90 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1712] /* uit.comp_slurry_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[5]);
  gout[5] = (tmp90) ? 1 : -1;

  tmp91 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1698] /* Manual_flowrates_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[6]);
  gout[6] = (tmp91) ? 1 : -1;

  tmp92 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1700] /* Tomato_flowrate_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[7]);
  gout[7] = (tmp92) ? 1 : -1;

  tmp93 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1716] /* v_liq.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[8]);
  gout[8] = (tmp93) ? 1 : -1;

  tmp94 = GreaterZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[9]);
  gout[9] = (tmp94) ? 1 : -1;

  tmp95 = LessZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[10]);
  gout[10] = (tmp95) ? 1 : -1;

  tmp96 = GreaterZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1702] /* pump_onoff.tfr_pump DISCRETE */) + (data->localData[0]->realVars[157] /* $cse10 variable */), data->simulationInfo->storedRelations[11]);
  gout[11] = (tmp96) ? 1 : -1;

  tmp97 = LessZC(data->localData[0]->timeValue - (data->localData[0]->realVars[1702] /* pump_onoff.tfr_pump DISCRETE */), 60.0, data->simulationInfo->storedRelations[12]);
  gout[12] = ((tmp97 && (data->simulationInfo->booleanParameter[9] /* impulse PARAM */))) ? 1 : -1;

  tmp98 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1710] /* uit.comp_slurry.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[13]);
  gout[13] = (tmp98) ? 1 : -1;

  tmp99 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */), data->simulationInfo->storedRelations[14]);
  gout[14] = (tmp99) ? 1 : -1;

  tmp100 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */) + (data->simulationInfo->realParameter[153] /* ramp_maize.duration PARAM */), data->simulationInfo->storedRelations[15]);
  gout[15] = (tmp100) ? 1 : -1;

  tmp101 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */), data->simulationInfo->storedRelations[16]);
  gout[16] = (tmp101) ? 1 : -1;

  tmp102 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */) + (data->simulationInfo->realParameter[157] /* ramp_slurry.duration PARAM */), data->simulationInfo->storedRelations[17]);
  gout[17] = (tmp102) ? 1 : -1;

  tmp103 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */), data->simulationInfo->storedRelations[18]);
  gout[18] = (tmp103) ? 1 : -1;

  tmp104 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */) + (data->simulationInfo->realParameter[161] /* ramp_tomato.duration PARAM */), data->simulationInfo->storedRelations[19]);
  gout[19] = (tmp104) ? 1 : -1;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_accumulate(SIM_TIMER_ZC);
#endif

  TRACE_POP
  return 0;
}

const char *ADM1_P_UIT_real_R2_copia_relationDescription(int i)
{
  const char *res[] = {"time >= pre(Manual_flowrates.nextTimeEvent)",
  "time >= pre(uit.comp_maize.nextTimeEvent)",
  "time >= pre(uit.comp_tomatosouce.nextTimeEvent)",
  "time >= pre(uit.comp_eggpasta.nextTimeEvent)",
  "time >= pre(uit.comp_semolina.nextTimeEvent)",
  "time >= pre(uit.comp_slurry_real.nextTimeEvent)",
  "time >= pre(Manual_flowrates_real.nextTimeEvent)",
  "time >= pre(Tomato_flowrate_real.nextTimeEvent)",
  "time >= pre(v_liq.nextTimeEvent)",
  "time > 1000000.0",
  "time < 1000000.0",
  "time > pre(pump_onoff.tfr_pump) + $cse10",
  "time - pump_onoff.tfr_pump < 60.0",
  "time >= pre(uit.comp_slurry.nextTimeEvent)",
  "time < ramp_maize.startTime",
  "time < ramp_maize.startTime + ramp_maize.duration",
  "time < ramp_slurry.startTime",
  "time < ramp_slurry.startTime + ramp_slurry.duration",
  "time < ramp_tomato.startTime",
  "time < ramp_tomato.startTime + ramp_tomato.duration"};
  return res[i];
}

int ADM1_P_UIT_real_R2_copia_function_updateRelations(DATA *data, threadData_t *threadData, int evalforZeroCross)
{
  TRACE_PUSH
  const int *equationIndexes = NULL;

  modelica_boolean tmp105;
  modelica_boolean tmp106;
  modelica_boolean tmp107;
  modelica_boolean tmp108;
  modelica_boolean tmp109;
  modelica_boolean tmp110;
  modelica_boolean tmp111;
  modelica_boolean tmp112;
  modelica_boolean tmp113;
  modelica_boolean tmp114;
  modelica_boolean tmp115;
  modelica_boolean tmp116;
  modelica_boolean tmp117;
  modelica_boolean tmp118;
  modelica_boolean tmp119;
  modelica_boolean tmp120;
  modelica_boolean tmp121;
  modelica_boolean tmp122;
  modelica_boolean tmp123;
  modelica_boolean tmp124;
  
  if(evalforZeroCross) {
    tmp105 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1696] /* Manual_flowrates.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[0]);
    data->simulationInfo->relations[0] = tmp105;

    tmp106 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1706] /* uit.comp_maize.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[1]);
    data->simulationInfo->relations[1] = tmp106;

    tmp107 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1714] /* uit.comp_tomatosouce.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[2]);
    data->simulationInfo->relations[2] = tmp107;

    tmp108 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1704] /* uit.comp_eggpasta.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[3]);
    data->simulationInfo->relations[3] = tmp108;

    tmp109 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1708] /* uit.comp_semolina.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[4]);
    data->simulationInfo->relations[4] = tmp109;

    tmp110 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1712] /* uit.comp_slurry_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[5]);
    data->simulationInfo->relations[5] = tmp110;

    tmp111 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1698] /* Manual_flowrates_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[6]);
    data->simulationInfo->relations[6] = tmp111;

    tmp112 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1700] /* Tomato_flowrate_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[7]);
    data->simulationInfo->relations[7] = tmp112;

    tmp113 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1716] /* v_liq.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[8]);
    data->simulationInfo->relations[8] = tmp113;

    tmp114 = GreaterZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[9]);
    data->simulationInfo->relations[9] = tmp114;

    tmp115 = LessZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[10]);
    data->simulationInfo->relations[10] = tmp115;

    tmp116 = GreaterZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1702] /* pump_onoff.tfr_pump DISCRETE */) + (data->localData[0]->realVars[157] /* $cse10 variable */), data->simulationInfo->storedRelations[11]);
    data->simulationInfo->relations[11] = tmp116;

    tmp117 = LessZC(data->localData[0]->timeValue - (data->localData[0]->realVars[1702] /* pump_onoff.tfr_pump DISCRETE */), 60.0, data->simulationInfo->storedRelations[12]);
    data->simulationInfo->relations[12] = tmp117;

    tmp118 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1710] /* uit.comp_slurry.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[13]);
    data->simulationInfo->relations[13] = tmp118;

    tmp119 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */), data->simulationInfo->storedRelations[14]);
    data->simulationInfo->relations[14] = tmp119;

    tmp120 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */) + (data->simulationInfo->realParameter[153] /* ramp_maize.duration PARAM */), data->simulationInfo->storedRelations[15]);
    data->simulationInfo->relations[15] = tmp120;

    tmp121 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */), data->simulationInfo->storedRelations[16]);
    data->simulationInfo->relations[16] = tmp121;

    tmp122 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */) + (data->simulationInfo->realParameter[157] /* ramp_slurry.duration PARAM */), data->simulationInfo->storedRelations[17]);
    data->simulationInfo->relations[17] = tmp122;

    tmp123 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */), data->simulationInfo->storedRelations[18]);
    data->simulationInfo->relations[18] = tmp123;

    tmp124 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */) + (data->simulationInfo->realParameter[161] /* ramp_tomato.duration PARAM */), data->simulationInfo->storedRelations[19]);
    data->simulationInfo->relations[19] = tmp124;
  } else {
    data->simulationInfo->relations[0] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1696] /* Manual_flowrates.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[1] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1706] /* uit.comp_maize.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[2] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1714] /* uit.comp_tomatosouce.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[3] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1704] /* uit.comp_eggpasta.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[4] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1708] /* uit.comp_semolina.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[5] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1712] /* uit.comp_slurry_real.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[6] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1698] /* Manual_flowrates_real.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[7] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1700] /* Tomato_flowrate_real.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[8] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1716] /* v_liq.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[9] = (data->localData[0]->timeValue > 1000000.0);

    data->simulationInfo->relations[10] = (data->localData[0]->timeValue < 1000000.0);

    data->simulationInfo->relations[11] = (data->localData[0]->timeValue > (data->simulationInfo->realVarsPre[1702] /* pump_onoff.tfr_pump DISCRETE */) + (data->localData[0]->realVars[157] /* $cse10 variable */));

    data->simulationInfo->relations[12] = (data->localData[0]->timeValue - (data->localData[0]->realVars[1702] /* pump_onoff.tfr_pump DISCRETE */) < 60.0);

    data->simulationInfo->relations[13] = (data->localData[0]->timeValue >= (data->simulationInfo->realVarsPre[1710] /* uit.comp_slurry.nextTimeEvent DISCRETE */));

    data->simulationInfo->relations[14] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */));

    data->simulationInfo->relations[15] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */) + (data->simulationInfo->realParameter[153] /* ramp_maize.duration PARAM */));

    data->simulationInfo->relations[16] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */));

    data->simulationInfo->relations[17] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */) + (data->simulationInfo->realParameter[157] /* ramp_slurry.duration PARAM */));

    data->simulationInfo->relations[18] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */));

    data->simulationInfo->relations[19] = (data->localData[0]->timeValue < (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */) + (data->simulationInfo->realParameter[161] /* ramp_tomato.duration PARAM */));
  }
  
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

