#if defined(__cplusplus)
  extern "C" {
#endif
  int ADM1_P_UIT_real_R2_copia_mayer(DATA* data, modelica_real** res, short*);
  int ADM1_P_UIT_real_R2_copia_lagrange(DATA* data, modelica_real** res, short *, short *);
  int ADM1_P_UIT_real_R2_copia_pickUpBoundsForInputsInOptimization(DATA* data, modelica_real* min, modelica_real* max, modelica_real*nominal, modelica_boolean *useNominal, char ** name, modelica_real * start, modelica_real * startTimeOpt);
  int ADM1_P_UIT_real_R2_copia_setInputData(DATA *data, const modelica_boolean file);
  int ADM1_P_UIT_real_R2_copia_getTimeGrid(DATA *data, modelica_integer * nsi, modelica_real**t);
#if defined(__cplusplus)
}
#endif