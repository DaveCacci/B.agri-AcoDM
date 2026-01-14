/* Asserts */
#include "ADM1_P.UIT_real_R2_copia_model.h"
#if defined(__cplusplus)
extern "C" {
#endif


/*
equation index: 6840
type: ALGORITHM

  assert(uit.maize.u >= 0.0 and uit.maize.u <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.maize.u <= 1.0, has value: " + String(uit.maize.u, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6840(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6840};
  modelica_boolean tmp0;
  modelica_boolean tmp1;
  static const MMC_DEFSTRINGLIT(tmp2,77,"Variable violating min/max constraint: 0.0 <= uit.maize.u <= 1.0, has value: ");
  modelica_string tmp3;
  modelica_metatype tmpMeta4;
  static int tmp5 = 0;
  if(!tmp5)
  {
    tmp0 = GreaterEq((data->localData[0]->realVars[1135] /* uit.maize.u variable */),0.0);
    tmp1 = LessEq((data->localData[0]->realVars[1135] /* uit.maize.u variable */),1.0);
    if(!(tmp0 && tmp1))
    {
      tmp3 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1135] /* uit.maize.u variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta4 = stringAppend(MMC_REFSTRINGLIT(tmp2),tmp3);
      {
        const char* assert_cond = "(uit.maize.u >= 0.0 and uit.maize.u <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta4));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta4));
        }
      }
      tmp5 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6841
type: ALGORITHM

  assert(uit.maize.v >= 0.0 and uit.maize.v <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.maize.v <= 1.0, has value: " + String(uit.maize.v, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6841(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6841};
  modelica_boolean tmp6;
  modelica_boolean tmp7;
  static const MMC_DEFSTRINGLIT(tmp8,77,"Variable violating min/max constraint: 0.0 <= uit.maize.v <= 1.0, has value: ");
  modelica_string tmp9;
  modelica_metatype tmpMeta10;
  static int tmp11 = 0;
  if(!tmp11)
  {
    tmp6 = GreaterEq((data->localData[0]->realVars[1136] /* uit.maize.v variable */),0.0);
    tmp7 = LessEq((data->localData[0]->realVars[1136] /* uit.maize.v variable */),1.0);
    if(!(tmp6 && tmp7))
    {
      tmp9 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1136] /* uit.maize.v variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta10 = stringAppend(MMC_REFSTRINGLIT(tmp8),tmp9);
      {
        const char* assert_cond = "(uit.maize.v >= 0.0 and uit.maize.v <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta10));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta10));
        }
      }
      tmp11 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6842
type: ALGORITHM

  assert(uit.maize.d >= 0.0, "Variable violating min constraint: 0.0 <= uit.maize.d, has value: " + String(uit.maize.d, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6842(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6842};
  modelica_boolean tmp12;
  static const MMC_DEFSTRINGLIT(tmp13,66,"Variable violating min constraint: 0.0 <= uit.maize.d, has value: ");
  modelica_string tmp14;
  modelica_metatype tmpMeta15;
  static int tmp16 = 0;
  if(!tmp16)
  {
    tmp12 = GreaterEq((data->localData[0]->realVars[1082] /* uit.maize.d variable */),0.0);
    if(!tmp12)
    {
      tmp14 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1082] /* uit.maize.d variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta15 = stringAppend(MMC_REFSTRINGLIT(tmp13),tmp14);
      {
        const char* assert_cond = "(uit.maize.d >= 0.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta15));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta15));
        }
      }
      tmp16 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6843
type: ALGORITHM

  assert(uit.slurry.u >= 0.0 and uit.slurry.u <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.slurry.u <= 1.0, has value: " + String(uit.slurry.u, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6843(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6843};
  modelica_boolean tmp17;
  modelica_boolean tmp18;
  static const MMC_DEFSTRINGLIT(tmp19,78,"Variable violating min/max constraint: 0.0 <= uit.slurry.u <= 1.0, has value: ");
  modelica_string tmp20;
  modelica_metatype tmpMeta21;
  static int tmp22 = 0;
  if(!tmp22)
  {
    tmp17 = GreaterEq((data->localData[0]->realVars[1501] /* uit.slurry.u variable */),0.0);
    tmp18 = LessEq((data->localData[0]->realVars[1501] /* uit.slurry.u variable */),1.0);
    if(!(tmp17 && tmp18))
    {
      tmp20 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1501] /* uit.slurry.u variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta21 = stringAppend(MMC_REFSTRINGLIT(tmp19),tmp20);
      {
        const char* assert_cond = "(uit.slurry.u >= 0.0 and uit.slurry.u <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta21));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta21));
        }
      }
      tmp22 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6844
type: ALGORITHM

  assert(uit.slurry.v >= 0.0 and uit.slurry.v <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.slurry.v <= 1.0, has value: " + String(uit.slurry.v, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6844(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6844};
  modelica_boolean tmp23;
  modelica_boolean tmp24;
  static const MMC_DEFSTRINGLIT(tmp25,78,"Variable violating min/max constraint: 0.0 <= uit.slurry.v <= 1.0, has value: ");
  modelica_string tmp26;
  modelica_metatype tmpMeta27;
  static int tmp28 = 0;
  if(!tmp28)
  {
    tmp23 = GreaterEq((data->localData[0]->realVars[1502] /* uit.slurry.v variable */),0.0);
    tmp24 = LessEq((data->localData[0]->realVars[1502] /* uit.slurry.v variable */),1.0);
    if(!(tmp23 && tmp24))
    {
      tmp26 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1502] /* uit.slurry.v variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta27 = stringAppend(MMC_REFSTRINGLIT(tmp25),tmp26);
      {
        const char* assert_cond = "(uit.slurry.v >= 0.0 and uit.slurry.v <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta27));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta27));
        }
      }
      tmp28 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6845
type: ALGORITHM

  assert(uit.slurry.d >= 0.0, "Variable violating min constraint: 0.0 <= uit.slurry.d, has value: " + String(uit.slurry.d, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6845(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6845};
  modelica_boolean tmp29;
  static const MMC_DEFSTRINGLIT(tmp30,67,"Variable violating min constraint: 0.0 <= uit.slurry.d, has value: ");
  modelica_string tmp31;
  modelica_metatype tmpMeta32;
  static int tmp33 = 0;
  if(!tmp33)
  {
    tmp29 = GreaterEq((data->localData[0]->realVars[1448] /* uit.slurry.d variable */),0.0);
    if(!tmp29)
    {
      tmp31 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1448] /* uit.slurry.d variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta32 = stringAppend(MMC_REFSTRINGLIT(tmp30),tmp31);
      {
        const char* assert_cond = "(uit.slurry.d >= 0.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta32));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta32));
        }
      }
      tmp33 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6846
type: ALGORITHM

  assert(uit.tomatosouce.u >= 0.0 and uit.tomatosouce.u <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.tomatosouce.u <= 1.0, has value: " + String(uit.tomatosouce.u, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6846(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6846};
  modelica_boolean tmp34;
  modelica_boolean tmp35;
  static const MMC_DEFSTRINGLIT(tmp36,83,"Variable violating min/max constraint: 0.0 <= uit.tomatosouce.u <= 1.0, has value: ");
  modelica_string tmp37;
  modelica_metatype tmpMeta38;
  static int tmp39 = 0;
  if(!tmp39)
  {
    tmp34 = GreaterEq((data->localData[0]->realVars[1679] /* uit.tomatosouce.u variable */),0.0);
    tmp35 = LessEq((data->localData[0]->realVars[1679] /* uit.tomatosouce.u variable */),1.0);
    if(!(tmp34 && tmp35))
    {
      tmp37 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1679] /* uit.tomatosouce.u variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta38 = stringAppend(MMC_REFSTRINGLIT(tmp36),tmp37);
      {
        const char* assert_cond = "(uit.tomatosouce.u >= 0.0 and uit.tomatosouce.u <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta38));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta38));
        }
      }
      tmp39 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6847
type: ALGORITHM

  assert(uit.tomatosouce.v >= 0.0 and uit.tomatosouce.v <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.tomatosouce.v <= 1.0, has value: " + String(uit.tomatosouce.v, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6847(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6847};
  modelica_boolean tmp40;
  modelica_boolean tmp41;
  static const MMC_DEFSTRINGLIT(tmp42,83,"Variable violating min/max constraint: 0.0 <= uit.tomatosouce.v <= 1.0, has value: ");
  modelica_string tmp43;
  modelica_metatype tmpMeta44;
  static int tmp45 = 0;
  if(!tmp45)
  {
    tmp40 = GreaterEq((data->localData[0]->realVars[1680] /* uit.tomatosouce.v variable */),0.0);
    tmp41 = LessEq((data->localData[0]->realVars[1680] /* uit.tomatosouce.v variable */),1.0);
    if(!(tmp40 && tmp41))
    {
      tmp43 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1680] /* uit.tomatosouce.v variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta44 = stringAppend(MMC_REFSTRINGLIT(tmp42),tmp43);
      {
        const char* assert_cond = "(uit.tomatosouce.v >= 0.0 and uit.tomatosouce.v <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta44));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta44));
        }
      }
      tmp45 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6848
type: ALGORITHM

  assert(uit.tomatosouce.d >= 0.0, "Variable violating min constraint: 0.0 <= uit.tomatosouce.d, has value: " + String(uit.tomatosouce.d, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6848(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6848};
  modelica_boolean tmp46;
  static const MMC_DEFSTRINGLIT(tmp47,72,"Variable violating min constraint: 0.0 <= uit.tomatosouce.d, has value: ");
  modelica_string tmp48;
  modelica_metatype tmpMeta49;
  static int tmp50 = 0;
  if(!tmp50)
  {
    tmp46 = GreaterEq((data->localData[0]->realVars[1626] /* uit.tomatosouce.d variable */),0.0);
    if(!tmp46)
    {
      tmp48 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1626] /* uit.tomatosouce.d variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta49 = stringAppend(MMC_REFSTRINGLIT(tmp47),tmp48);
      {
        const char* assert_cond = "(uit.tomatosouce.d >= 0.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta49));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta49));
        }
      }
      tmp50 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6849
type: ALGORITHM

  assert(uit.eggpasta.u >= 0.0 and uit.eggpasta.u <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.eggpasta.u <= 1.0, has value: " + String(uit.eggpasta.u, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6849(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6849};
  modelica_boolean tmp51;
  modelica_boolean tmp52;
  static const MMC_DEFSTRINGLIT(tmp53,80,"Variable violating min/max constraint: 0.0 <= uit.eggpasta.u <= 1.0, has value: ");
  modelica_string tmp54;
  modelica_metatype tmpMeta55;
  static int tmp56 = 0;
  if(!tmp56)
  {
    tmp51 = GreaterEq((data->localData[0]->realVars[915] /* uit.eggpasta.u variable */),0.0);
    tmp52 = LessEq((data->localData[0]->realVars[915] /* uit.eggpasta.u variable */),1.0);
    if(!(tmp51 && tmp52))
    {
      tmp54 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[915] /* uit.eggpasta.u variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta55 = stringAppend(MMC_REFSTRINGLIT(tmp53),tmp54);
      {
        const char* assert_cond = "(uit.eggpasta.u >= 0.0 and uit.eggpasta.u <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta55));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta55));
        }
      }
      tmp56 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6850
type: ALGORITHM

  assert(uit.eggpasta.v >= 0.0 and uit.eggpasta.v <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.eggpasta.v <= 1.0, has value: " + String(uit.eggpasta.v, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6850(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6850};
  modelica_boolean tmp57;
  modelica_boolean tmp58;
  static const MMC_DEFSTRINGLIT(tmp59,80,"Variable violating min/max constraint: 0.0 <= uit.eggpasta.v <= 1.0, has value: ");
  modelica_string tmp60;
  modelica_metatype tmpMeta61;
  static int tmp62 = 0;
  if(!tmp62)
  {
    tmp57 = GreaterEq((data->localData[0]->realVars[916] /* uit.eggpasta.v variable */),0.0);
    tmp58 = LessEq((data->localData[0]->realVars[916] /* uit.eggpasta.v variable */),1.0);
    if(!(tmp57 && tmp58))
    {
      tmp60 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[916] /* uit.eggpasta.v variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta61 = stringAppend(MMC_REFSTRINGLIT(tmp59),tmp60);
      {
        const char* assert_cond = "(uit.eggpasta.v >= 0.0 and uit.eggpasta.v <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta61));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta61));
        }
      }
      tmp62 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6851
type: ALGORITHM

  assert(uit.eggpasta.d >= 0.0, "Variable violating min constraint: 0.0 <= uit.eggpasta.d, has value: " + String(uit.eggpasta.d, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6851(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6851};
  modelica_boolean tmp63;
  static const MMC_DEFSTRINGLIT(tmp64,69,"Variable violating min constraint: 0.0 <= uit.eggpasta.d, has value: ");
  modelica_string tmp65;
  modelica_metatype tmpMeta66;
  static int tmp67 = 0;
  if(!tmp67)
  {
    tmp63 = GreaterEq((data->localData[0]->realVars[862] /* uit.eggpasta.d variable */),0.0);
    if(!tmp63)
    {
      tmp65 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[862] /* uit.eggpasta.d variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta66 = stringAppend(MMC_REFSTRINGLIT(tmp64),tmp65);
      {
        const char* assert_cond = "(uit.eggpasta.d >= 0.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta66));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta66));
        }
      }
      tmp67 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6852
type: ALGORITHM

  assert(uit.semolina.u >= 0.0 and uit.semolina.u <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.semolina.u <= 1.0, has value: " + String(uit.semolina.u, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6852(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6852};
  modelica_boolean tmp68;
  modelica_boolean tmp69;
  static const MMC_DEFSTRINGLIT(tmp70,80,"Variable violating min/max constraint: 0.0 <= uit.semolina.u <= 1.0, has value: ");
  modelica_string tmp71;
  modelica_metatype tmpMeta72;
  static int tmp73 = 0;
  if(!tmp73)
  {
    tmp68 = GreaterEq((data->localData[0]->realVars[1323] /* uit.semolina.u variable */),0.0);
    tmp69 = LessEq((data->localData[0]->realVars[1323] /* uit.semolina.u variable */),1.0);
    if(!(tmp68 && tmp69))
    {
      tmp71 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1323] /* uit.semolina.u variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta72 = stringAppend(MMC_REFSTRINGLIT(tmp70),tmp71);
      {
        const char* assert_cond = "(uit.semolina.u >= 0.0 and uit.semolina.u <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta72));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",123,5,123,92,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta72));
        }
      }
      tmp73 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6853
type: ALGORITHM

  assert(uit.semolina.v >= 0.0 and uit.semolina.v <= 1.0, "Variable violating min/max constraint: 0.0 <= uit.semolina.v <= 1.0, has value: " + String(uit.semolina.v, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6853(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6853};
  modelica_boolean tmp74;
  modelica_boolean tmp75;
  static const MMC_DEFSTRINGLIT(tmp76,80,"Variable violating min/max constraint: 0.0 <= uit.semolina.v <= 1.0, has value: ");
  modelica_string tmp77;
  modelica_metatype tmpMeta78;
  static int tmp79 = 0;
  if(!tmp79)
  {
    tmp74 = GreaterEq((data->localData[0]->realVars[1324] /* uit.semolina.v variable */),0.0);
    tmp75 = LessEq((data->localData[0]->realVars[1324] /* uit.semolina.v variable */),1.0);
    if(!(tmp74 && tmp75))
    {
      tmp77 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1324] /* uit.semolina.v variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta78 = stringAppend(MMC_REFSTRINGLIT(tmp76),tmp77);
      {
        const char* assert_cond = "(uit.semolina.v >= 0.0 and uit.semolina.v <= 1.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta78));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",124,5,124,110,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta78));
        }
      }
      tmp79 = 1;
    }
  }
  TRACE_POP
}

/*
equation index: 6854
type: ALGORITHM

  assert(uit.semolina.d >= 0.0, "Variable violating min constraint: 0.0 <= uit.semolina.d, has value: " + String(uit.semolina.d, "g"));
*/
void ADM1_P_UIT_real_R2_copia_eqFunction_6854(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH
  const int equationIndexes[2] = {1,6854};
  modelica_boolean tmp80;
  static const MMC_DEFSTRINGLIT(tmp81,69,"Variable violating min constraint: 0.0 <= uit.semolina.d, has value: ");
  modelica_string tmp82;
  modelica_metatype tmpMeta83;
  static int tmp84 = 0;
  if(!tmp84)
  {
    tmp80 = GreaterEq((data->localData[0]->realVars[1270] /* uit.semolina.d variable */),0.0);
    if(!tmp80)
    {
      tmp82 = modelica_real_to_modelica_string_format((data->localData[0]->realVars[1270] /* uit.semolina.d variable */), (modelica_string) mmc_strings_len1[103]);
      tmpMeta83 = stringAppend(MMC_REFSTRINGLIT(tmp81),tmp82);
      {
        const char* assert_cond = "(uit.semolina.d >= 0.0)";
        if (data->simulationInfo->noThrowAsserts) {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          infoStreamPrintWithEquationIndexes(LOG_ASSERT, info, 0, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta83));
        } else {
          FILE_INFO info = {"C:/Users/lenovo/OneDrive - Politecnico di Milano/Work_cloud/DOTTORATO/Modelling/Pilot_plant/ADM1_X_14_03_2024_batch_GQ - Copia.mo",125,5,125,74,0};
          omc_assert_warning_withEquationIndexes(info, equationIndexes, "The following assertion has been violated %sat time %f\n(%s) --> \"%s\"", initial() ? "during initialization " : "", data->localData[0]->timeValue, assert_cond, MMC_STRINGDATA(tmpMeta83));
        }
      }
      tmp84 = 1;
    }
  }
  TRACE_POP
}
/* function to check assert after a step is done */
OMC_DISABLE_OPT
int ADM1_P_UIT_real_R2_copia_checkForAsserts(DATA *data, threadData_t *threadData)
{
  TRACE_PUSH

  ADM1_P_UIT_real_R2_copia_eqFunction_6840(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6841(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6842(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6843(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6844(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6845(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6846(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6847(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6848(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6849(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6850(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6851(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6852(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6853(data, threadData);

  ADM1_P_UIT_real_R2_copia_eqFunction_6854(data, threadData);
  
  TRACE_POP
  return 0;
}

#if defined(__cplusplus)
}
#endif

