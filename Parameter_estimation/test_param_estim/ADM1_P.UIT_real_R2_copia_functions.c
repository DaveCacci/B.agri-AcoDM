#include "omc_simulation_settings.h"
#include "ADM1_P.UIT_real_R2_copia_functions.h"
#ifdef __cplusplus
extern "C" {
#endif

#include "ADM1_P.UIT_real_R2_copia_includes.h"


DLLExport
modelica_real omc_ADM1__P_Functions_regSign(threadData_t *threadData, modelica_real _u)
{
  modelica_real _y;
  _tailrecursive: OMC_LABEL_UNUSED
  // _y has no default value.
  _y = omc_Modelica_Fluid_Utilities_regStep(threadData, _u, 1.0, -1.0, 1e-05);
  _return: OMC_LABEL_UNUSED
  return _y;
}
modelica_metatype boxptr_ADM1__P_Functions_regSign(threadData_t *threadData, modelica_metatype _u)
{
  modelica_real tmp1;
  modelica_real _y;
  modelica_metatype out_y;
  tmp1 = mmc_unbox_real(_u);
  _y = omc_ADM1__P_Functions_regSign(threadData, tmp1);
  out_y = mmc_mk_rcon(_y);
  return out_y;
}

DLLExport
modelica_real omc_ADM1__P_Functions_round(threadData_t *threadData, modelica_real _x)
{
  modelica_real _result;
  _tailrecursive: OMC_LABEL_UNUSED
  // _result has no default value.
  _result = ((_x - floor(_x) >= 0.5)?ceil(_x):floor(_x));
  _return: OMC_LABEL_UNUSED
  return _result;
}
modelica_metatype boxptr_ADM1__P_Functions_round(threadData_t *threadData, modelica_metatype _x)
{
  modelica_real tmp1;
  modelica_real _result;
  modelica_metatype out_result;
  tmp1 = mmc_unbox_real(_x);
  _result = omc_ADM1__P_Functions_round(threadData, tmp1);
  out_result = mmc_mk_rcon(_result);
  return out_result;
}

modelica_real omc_Modelica_Blocks_Tables_Internal_getNextTimeEvent(threadData_t *threadData, modelica_complex _tableID, modelica_real _timeIn)
{
  void * _tableID_ext;
  double _timeIn_ext;
  double _nextTimeEvent_ext;
  modelica_real _nextTimeEvent;
  // _nextTimeEvent has no default value.
  _tableID_ext = (void *)_tableID;
  _timeIn_ext = (double)_timeIn;
  _nextTimeEvent_ext = ModelicaStandardTables_CombiTimeTable_nextTimeEvent(_tableID_ext, _timeIn_ext);
  _nextTimeEvent = (modelica_real)_nextTimeEvent_ext;
  return _nextTimeEvent;
}
modelica_metatype boxptr_Modelica_Blocks_Tables_Internal_getNextTimeEvent(threadData_t *threadData, modelica_metatype _tableID, modelica_metatype _timeIn)
{
  modelica_real tmp1;
  modelica_real _nextTimeEvent;
  modelica_metatype out_nextTimeEvent;
  tmp1 = mmc_unbox_real(_timeIn);
  _nextTimeEvent = omc_Modelica_Blocks_Tables_Internal_getNextTimeEvent(threadData, _tableID, tmp1);
  out_nextTimeEvent = mmc_mk_rcon(_nextTimeEvent);
  return out_nextTimeEvent;
}

modelica_real omc_Modelica_Blocks_Tables_Internal_getTimeTableTmax(threadData_t *threadData, modelica_complex _tableID)
{
  void * _tableID_ext;
  double _timeMax_ext;
  modelica_real _timeMax;
  // _timeMax has no default value.
  _tableID_ext = (void *)_tableID;
  _timeMax_ext = ModelicaStandardTables_CombiTimeTable_maximumTime(_tableID_ext);
  _timeMax = (modelica_real)_timeMax_ext;
  return _timeMax;
}
modelica_metatype boxptr_Modelica_Blocks_Tables_Internal_getTimeTableTmax(threadData_t *threadData, modelica_metatype _tableID)
{
  modelica_real _timeMax;
  modelica_metatype out_timeMax;
  _timeMax = omc_Modelica_Blocks_Tables_Internal_getTimeTableTmax(threadData, _tableID);
  out_timeMax = mmc_mk_rcon(_timeMax);
  return out_timeMax;
}

modelica_real omc_Modelica_Blocks_Tables_Internal_getTimeTableTmin(threadData_t *threadData, modelica_complex _tableID)
{
  void * _tableID_ext;
  double _timeMin_ext;
  modelica_real _timeMin;
  // _timeMin has no default value.
  _tableID_ext = (void *)_tableID;
  _timeMin_ext = ModelicaStandardTables_CombiTimeTable_minimumTime(_tableID_ext);
  _timeMin = (modelica_real)_timeMin_ext;
  return _timeMin;
}
modelica_metatype boxptr_Modelica_Blocks_Tables_Internal_getTimeTableTmin(threadData_t *threadData, modelica_metatype _tableID)
{
  modelica_real _timeMin;
  modelica_metatype out_timeMin;
  _timeMin = omc_Modelica_Blocks_Tables_Internal_getTimeTableTmin(threadData, _tableID);
  out_timeMin = mmc_mk_rcon(_timeMin);
  return out_timeMin;
}

modelica_real omc_Modelica_Blocks_Tables_Internal_getTimeTableValueNoDer(threadData_t *threadData, modelica_complex _tableID, modelica_integer _icol, modelica_real _timeIn, modelica_real _nextTimeEvent, modelica_real _pre_nextTimeEvent)
{
  void * _tableID_ext;
  int _icol_ext;
  double _timeIn_ext;
  double _nextTimeEvent_ext;
  double _pre_nextTimeEvent_ext;
  double _y_ext;
  modelica_real _y;
  // _y has no default value.
  _tableID_ext = (void *)_tableID;
  _icol_ext = (int)_icol;
  _timeIn_ext = (double)_timeIn;
  _nextTimeEvent_ext = (double)_nextTimeEvent;
  _pre_nextTimeEvent_ext = (double)_pre_nextTimeEvent;
  _y_ext = ModelicaStandardTables_CombiTimeTable_getValue(_tableID_ext, _icol_ext, _timeIn_ext, _nextTimeEvent_ext, _pre_nextTimeEvent_ext);
  _y = (modelica_real)_y_ext;
  return _y;
}
modelica_metatype boxptr_Modelica_Blocks_Tables_Internal_getTimeTableValueNoDer(threadData_t *threadData, modelica_metatype _tableID, modelica_metatype _icol, modelica_metatype _timeIn, modelica_metatype _nextTimeEvent, modelica_metatype _pre_nextTimeEvent)
{
  modelica_integer tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real _y;
  modelica_metatype out_y;
  tmp1 = mmc_unbox_integer(_icol);
  tmp2 = mmc_unbox_real(_timeIn);
  tmp3 = mmc_unbox_real(_nextTimeEvent);
  tmp4 = mmc_unbox_real(_pre_nextTimeEvent);
  _y = omc_Modelica_Blocks_Tables_Internal_getTimeTableValueNoDer(threadData, _tableID, tmp1, tmp2, tmp3, tmp4);
  out_y = mmc_mk_rcon(_y);
  return out_y;
}

modelica_complex omc_Modelica_Blocks_Types_ExternalCombiTimeTable_constructor(threadData_t *threadData, modelica_string _tableName, modelica_string _fileName, real_array _table, modelica_real _startTime, integer_array _columns, modelica_integer _smoothness, modelica_integer _extrapolation, modelica_real _shiftTime, modelica_integer _timeEvents, modelica_boolean _verboseRead)
{
  double _startTime_ext;
  integer_array _columns_packed;
  int _smoothness_ext;
  int _extrapolation_ext;
  double _shiftTime_ext;
  int _timeEvents_ext;
  int _verboseRead_ext;
  void *_table_c89;
  void *_columns_c89;
  void * _externalCombiTimeTable_ext;
  modelica_complex _externalCombiTimeTable;
  // _externalCombiTimeTable has no default value.
  _startTime_ext = (double)_startTime;
  pack_alloc_integer_array(&_columns, &_columns_packed);

  _smoothness_ext = (int)_smoothness;
  _extrapolation_ext = (int)_extrapolation;
  _shiftTime_ext = (double)_shiftTime;
  _timeEvents_ext = (int)_timeEvents;
  _verboseRead_ext = (int)_verboseRead;_table_c89 = (void*) data_of_real_c89_array(_table);
  _columns_c89 = (void*) data_of_integer_c89_array(_columns_packed);
  _externalCombiTimeTable_ext = ModelicaStandardTables_CombiTimeTable_init2(MMC_STRINGDATA(_fileName), MMC_STRINGDATA(_tableName), (const double*) _table_c89, size_of_dimension_base_array(_table, ((modelica_integer) 1)), size_of_dimension_base_array(_table, ((modelica_integer) 2)), _startTime_ext, (const int*) _columns_c89, size_of_dimension_base_array(_columns, ((modelica_integer) 1)), _smoothness_ext, _extrapolation_ext, _shiftTime_ext, _timeEvents_ext, _verboseRead_ext);
  _externalCombiTimeTable = (modelica_complex)_externalCombiTimeTable_ext;
  return _externalCombiTimeTable;
}
modelica_metatype boxptr_Modelica_Blocks_Types_ExternalCombiTimeTable_constructor(threadData_t *threadData, modelica_metatype _tableName, modelica_metatype _fileName, modelica_metatype _table, modelica_metatype _startTime, modelica_metatype _columns, modelica_metatype _smoothness, modelica_metatype _extrapolation, modelica_metatype _shiftTime, modelica_metatype _timeEvents, modelica_metatype _verboseRead)
{
  modelica_real tmp1;
  modelica_integer tmp2;
  modelica_integer tmp3;
  modelica_real tmp4;
  modelica_integer tmp5;
  modelica_integer tmp6;
  modelica_complex _externalCombiTimeTable;
  tmp1 = mmc_unbox_real(_startTime);
  tmp2 = mmc_unbox_integer(_smoothness);
  tmp3 = mmc_unbox_integer(_extrapolation);
  tmp4 = mmc_unbox_real(_shiftTime);
  tmp5 = mmc_unbox_integer(_timeEvents);
  tmp6 = mmc_unbox_integer(_verboseRead);
  _externalCombiTimeTable = omc_Modelica_Blocks_Types_ExternalCombiTimeTable_constructor(threadData, _tableName, _fileName, *((base_array_t*)_table), tmp1, *((base_array_t*)_columns), tmp2, tmp3, tmp4, tmp5, tmp6);
  /* skip box _externalCombiTimeTable; ExternalObject Modelica.Blocks.Types.ExternalCombiTimeTable */
  return _externalCombiTimeTable;
}

void omc_Modelica_Blocks_Types_ExternalCombiTimeTable_destructor(threadData_t *threadData, modelica_complex _externalCombiTimeTable)
{
  void * _externalCombiTimeTable_ext;
  _externalCombiTimeTable_ext = (void *)_externalCombiTimeTable;
  ModelicaStandardTables_CombiTimeTable_close(_externalCombiTimeTable_ext);
  return;
}
void boxptr_Modelica_Blocks_Types_ExternalCombiTimeTable_destructor(threadData_t *threadData, modelica_metatype _externalCombiTimeTable)
{
  omc_Modelica_Blocks_Types_ExternalCombiTimeTable_destructor(threadData, _externalCombiTimeTable);
  return;
}

DLLExport
modelica_real omc_Modelica_Fluid_Utilities_regStep(threadData_t *threadData, modelica_real _x, modelica_real _y1, modelica_real _y2, modelica_real _x_small)
{
  modelica_real _y;
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real tmp5;
  modelica_real tmp6;
  modelica_boolean tmp7;
  modelica_real tmp8;
  modelica_boolean tmp9;
  modelica_real tmp10;
  modelica_boolean tmp11;
  modelica_real tmp12;
  _tailrecursive: OMC_LABEL_UNUSED
  // _y has no default value.
  tmp11 = (modelica_boolean)(_x > _x_small);
  if(tmp11)
  {
    tmp12 = _y1;
  }
  else
  {
    tmp9 = (modelica_boolean)(_x < (-_x_small));
    if(tmp9)
    {
      tmp10 = _y2;
    }
    else
    {
      tmp7 = (modelica_boolean)(_x_small > 0.0);
      if(tmp7)
      {
        tmp1 = _x_small;
        if (tmp1 == 0) {throwStreamPrint(threadData, "Division by zero %s in function context", "x / x_small");}
        tmp2 = _x_small;
        if (tmp2 == 0) {throwStreamPrint(threadData, "Division by zero %s in function context", "x / x_small");}
        tmp3 = (_x) / tmp2;
        tmp4 = 4.0;
        if (tmp4 == 0) {throwStreamPrint(threadData, "Division by zero %s in function context", "x / x_small * ((x / x_small) ^ 2.0 - 3.0) * (y2 - y1) / 4.0");}
        tmp5 = 2.0;
        if (tmp5 == 0) {throwStreamPrint(threadData, "Division by zero %s in function context", "(y1 + y2) / 2.0");}
        tmp8 = ((((_x) / tmp1) * ((tmp3 * tmp3) - 3.0)) * (_y2 - _y1)) / tmp4 + (_y1 + _y2) / tmp5;
      }
      else
      {
        tmp6 = 2.0;
        if (tmp6 == 0) {throwStreamPrint(threadData, "Division by zero %s in function context", "(y1 + y2) / 2.0");}
        tmp8 = (_y1 + _y2) / tmp6;
      }
      tmp10 = tmp8;
    }
    tmp12 = tmp10;
  }
  _y = tmp12;
  _return: OMC_LABEL_UNUSED
  return _y;
}
modelica_metatype boxptr_Modelica_Fluid_Utilities_regStep(threadData_t *threadData, modelica_metatype _x, modelica_metatype _y1, modelica_metatype _y2, modelica_metatype _x_small)
{
  modelica_real tmp1;
  modelica_real tmp2;
  modelica_real tmp3;
  modelica_real tmp4;
  modelica_real _y;
  modelica_metatype out_y;
  tmp1 = mmc_unbox_real(_x);
  tmp2 = mmc_unbox_real(_y1);
  tmp3 = mmc_unbox_real(_y2);
  tmp4 = mmc_unbox_real(_x_small);
  _y = omc_Modelica_Fluid_Utilities_regStep(threadData, tmp1, tmp2, tmp3, tmp4);
  out_y = mmc_mk_rcon(_y);
  return out_y;
}

DLLExport
modelica_boolean omc_Modelica_Utilities_Strings_isEmpty(threadData_t *threadData, modelica_string _string)
{
  modelica_boolean _result;
  modelica_integer _nextIndex;
  modelica_integer _len;
  _tailrecursive: OMC_LABEL_UNUSED
  // _result has no default value.
  // _nextIndex has no default value.
  // _len has no default value.
  _nextIndex = omc_Modelica_Utilities_Strings_Advanced_skipWhiteSpace(threadData, _string, ((modelica_integer) 1));

  _len = omc_Modelica_Utilities_Strings_length(threadData, _string);

  if(((_len < ((modelica_integer) 1)) || (_nextIndex > _len)))
  {
    _result = 1;
  }
  else
  {
    _result = 0;
  }
  _return: OMC_LABEL_UNUSED
  return _result;
}
modelica_metatype boxptr_Modelica_Utilities_Strings_isEmpty(threadData_t *threadData, modelica_metatype _string)
{
  modelica_boolean _result;
  modelica_metatype out_result;
  _result = omc_Modelica_Utilities_Strings_isEmpty(threadData, _string);
  out_result = mmc_mk_icon(_result);
  return out_result;
}

modelica_integer omc_Modelica_Utilities_Strings_length(threadData_t *threadData, modelica_string _string)
{
  int _result_ext;
  modelica_integer _result;
  // _result has no default value.
  _result_ext = ModelicaStrings_length(MMC_STRINGDATA(_string));
  _result = (modelica_integer)_result_ext;
  return _result;
}
modelica_metatype boxptr_Modelica_Utilities_Strings_length(threadData_t *threadData, modelica_metatype _string)
{
  modelica_integer _result;
  modelica_metatype out_result;
  _result = omc_Modelica_Utilities_Strings_length(threadData, _string);
  out_result = mmc_mk_icon(_result);
  return out_result;
}

modelica_integer omc_Modelica_Utilities_Strings_Advanced_skipWhiteSpace(threadData_t *threadData, modelica_string _string, modelica_integer _startIndex)
{
  int _startIndex_ext;
  int _nextIndex_ext;
  modelica_integer _nextIndex;
  // _nextIndex has no default value.
  _startIndex_ext = (int)_startIndex;
  _nextIndex_ext = ModelicaStrings_skipWhiteSpace(MMC_STRINGDATA(_string), _startIndex_ext);
  _nextIndex = (modelica_integer)_nextIndex_ext;
  return _nextIndex;
}
modelica_metatype boxptr_Modelica_Utilities_Strings_Advanced_skipWhiteSpace(threadData_t *threadData, modelica_metatype _string, modelica_metatype _startIndex)
{
  modelica_integer tmp1;
  modelica_integer _nextIndex;
  modelica_metatype out_nextIndex;
  tmp1 = mmc_unbox_integer(_startIndex);
  _nextIndex = omc_Modelica_Utilities_Strings_Advanced_skipWhiteSpace(threadData, _string, tmp1);
  out_nextIndex = mmc_mk_icon(_nextIndex);
  return out_nextIndex;
}

#ifdef __cplusplus
}
#endif
