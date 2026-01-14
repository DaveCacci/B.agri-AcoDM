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

  modelica_boolean tmp2;
  modelica_boolean tmp3;
  modelica_boolean tmp4;
  modelica_boolean tmp5;
  modelica_boolean tmp6;
  modelica_boolean tmp7;
  modelica_boolean tmp8;
  modelica_boolean tmp9;
  modelica_boolean tmp10;
  modelica_boolean tmp11;
  modelica_boolean tmp12;
  modelica_boolean tmp13;
  modelica_boolean tmp14;
  modelica_boolean tmp15;
  modelica_boolean tmp16;
  modelica_boolean tmp17;
  modelica_boolean tmp18;
  modelica_boolean tmp19;
  modelica_boolean tmp20;
  modelica_boolean tmp21;

#if !defined(OMC_MINIMAL_RUNTIME)
  if (measure_time_flag) rt_tick(SIM_TIMER_ZC);
#endif
  data->simulationInfo->callStatistics.functionZeroCrossings++;

  tmp2 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1696] /* Manual_flowrates.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[0]);
  gout[0] = (tmp2) ? 1 : -1;

  tmp3 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1706] /* uit.comp_maize.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[1]);
  gout[1] = (tmp3) ? 1 : -1;

  tmp4 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1714] /* uit.comp_tomatosouce.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[2]);
  gout[2] = (tmp4) ? 1 : -1;

  tmp5 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1704] /* uit.comp_eggpasta.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[3]);
  gout[3] = (tmp5) ? 1 : -1;

  tmp6 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1708] /* uit.comp_semolina.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[4]);
  gout[4] = (tmp6) ? 1 : -1;

  tmp7 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1712] /* uit.comp_slurry_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[5]);
  gout[5] = (tmp7) ? 1 : -1;

  tmp8 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1698] /* Manual_flowrates_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[6]);
  gout[6] = (tmp8) ? 1 : -1;

  tmp9 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1700] /* Tomato_flowrate_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[7]);
  gout[7] = (tmp9) ? 1 : -1;

  tmp10 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1716] /* v_liq.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[8]);
  gout[8] = (tmp10) ? 1 : -1;

  tmp11 = GreaterZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[9]);
  gout[9] = (tmp11) ? 1 : -1;

  tmp12 = LessZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[10]);
  gout[10] = (tmp12) ? 1 : -1;

  tmp13 = GreaterZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1702] /* pump_onoff.tfr_pump DISCRETE */) + (data->localData[0]->realVars[157] /* $cse10 variable */), data->simulationInfo->storedRelations[11]);
  gout[11] = (tmp13) ? 1 : -1;

  tmp14 = LessZC(data->localData[0]->timeValue - (data->localData[0]->realVars[1702] /* pump_onoff.tfr_pump DISCRETE */), 60.0, data->simulationInfo->storedRelations[12]);
  gout[12] = ((tmp14 && (data->simulationInfo->booleanParameter[9] /* impulse PARAM */))) ? 1 : -1;

  tmp15 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1710] /* uit.comp_slurry.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[13]);
  gout[13] = (tmp15) ? 1 : -1;

  tmp16 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */), data->simulationInfo->storedRelations[14]);
  gout[14] = (tmp16) ? 1 : -1;

  tmp17 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */) + (data->simulationInfo->realParameter[153] /* ramp_maize.duration PARAM */), data->simulationInfo->storedRelations[15]);
  gout[15] = (tmp17) ? 1 : -1;

  tmp18 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */), data->simulationInfo->storedRelations[16]);
  gout[16] = (tmp18) ? 1 : -1;

  tmp19 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */) + (data->simulationInfo->realParameter[157] /* ramp_slurry.duration PARAM */), data->simulationInfo->storedRelations[17]);
  gout[17] = (tmp19) ? 1 : -1;

  tmp20 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */), data->simulationInfo->storedRelations[18]);
  gout[18] = (tmp20) ? 1 : -1;

  tmp21 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */) + (data->simulationInfo->realParameter[161] /* ramp_tomato.duration PARAM */), data->simulationInfo->storedRelations[19]);
  gout[19] = (tmp21) ? 1 : -1;

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

  modelica_boolean tmp22;
  modelica_boolean tmp23;
  modelica_boolean tmp24;
  modelica_boolean tmp25;
  modelica_boolean tmp26;
  modelica_boolean tmp27;
  modelica_boolean tmp28;
  modelica_boolean tmp29;
  modelica_boolean tmp30;
  modelica_boolean tmp31;
  modelica_boolean tmp32;
  modelica_boolean tmp33;
  modelica_boolean tmp34;
  modelica_boolean tmp35;
  modelica_boolean tmp36;
  modelica_boolean tmp37;
  modelica_boolean tmp38;
  modelica_boolean tmp39;
  modelica_boolean tmp40;
  modelica_boolean tmp41;
  
  if(evalforZeroCross) {
    tmp22 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1696] /* Manual_flowrates.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[0]);
    data->simulationInfo->relations[0] = tmp22;

    tmp23 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1706] /* uit.comp_maize.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[1]);
    data->simulationInfo->relations[1] = tmp23;

    tmp24 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1714] /* uit.comp_tomatosouce.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[2]);
    data->simulationInfo->relations[2] = tmp24;

    tmp25 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1704] /* uit.comp_eggpasta.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[3]);
    data->simulationInfo->relations[3] = tmp25;

    tmp26 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1708] /* uit.comp_semolina.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[4]);
    data->simulationInfo->relations[4] = tmp26;

    tmp27 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1712] /* uit.comp_slurry_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[5]);
    data->simulationInfo->relations[5] = tmp27;

    tmp28 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1698] /* Manual_flowrates_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[6]);
    data->simulationInfo->relations[6] = tmp28;

    tmp29 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1700] /* Tomato_flowrate_real.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[7]);
    data->simulationInfo->relations[7] = tmp29;

    tmp30 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1716] /* v_liq.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[8]);
    data->simulationInfo->relations[8] = tmp30;

    tmp31 = GreaterZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[9]);
    data->simulationInfo->relations[9] = tmp31;

    tmp32 = LessZC(data->localData[0]->timeValue, 1000000.0, data->simulationInfo->storedRelations[10]);
    data->simulationInfo->relations[10] = tmp32;

    tmp33 = GreaterZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1702] /* pump_onoff.tfr_pump DISCRETE */) + (data->localData[0]->realVars[157] /* $cse10 variable */), data->simulationInfo->storedRelations[11]);
    data->simulationInfo->relations[11] = tmp33;

    tmp34 = LessZC(data->localData[0]->timeValue - (data->localData[0]->realVars[1702] /* pump_onoff.tfr_pump DISCRETE */), 60.0, data->simulationInfo->storedRelations[12]);
    data->simulationInfo->relations[12] = tmp34;

    tmp35 = GreaterEqZC(data->localData[0]->timeValue, (data->simulationInfo->realVarsPre[1710] /* uit.comp_slurry.nextTimeEvent DISCRETE */), data->simulationInfo->storedRelations[13]);
    data->simulationInfo->relations[13] = tmp35;

    tmp36 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */), data->simulationInfo->storedRelations[14]);
    data->simulationInfo->relations[14] = tmp36;

    tmp37 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[156] /* ramp_maize.startTime PARAM */) + (data->simulationInfo->realParameter[153] /* ramp_maize.duration PARAM */), data->simulationInfo->storedRelations[15]);
    data->simulationInfo->relations[15] = tmp37;

    tmp38 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */), data->simulationInfo->storedRelations[16]);
    data->simulationInfo->relations[16] = tmp38;

    tmp39 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[160] /* ramp_slurry.startTime PARAM */) + (data->simulationInfo->realParameter[157] /* ramp_slurry.duration PARAM */), data->simulationInfo->storedRelations[17]);
    data->simulationInfo->relations[17] = tmp39;

    tmp40 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */), data->simulationInfo->storedRelations[18]);
    data->simulationInfo->relations[18] = tmp40;

    tmp41 = LessZC(data->localData[0]->timeValue, (data->simulationInfo->realParameter[164] /* ramp_tomato.startTime PARAM */) + (data->simulationInfo->realParameter[161] /* ramp_tomato.duration PARAM */), data->simulationInfo->storedRelations[19]);
    data->simulationInfo->relations[19] = tmp41;
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

