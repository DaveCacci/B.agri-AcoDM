package ADM1_P
  import SI = Modelica.Units.SI;
  import NSI = Modelica.Units.NonSI;
  extends Modelica.Icons.Package;
  constant Types.GasConstant R = 0.083145 "Gas law constant [bar/(kmol/m3)/K]";
  final constant String LibraryPath = Modelica.Utilities.Files.loadResource("modelica://ADM1_P");

  record StateVariablesADM1
    /*Declaration of state variables for Digester model (except for mineral precipitation)*/
    /*Microbial biomasses*/
    SI.MassConcentration X_su(fixed = true, start = X_su_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_aa(fixed = true, start = X_aa_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_fa(fixed = true, start = X_fa_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_c4(fixed = true, start = X_c4_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_pro(fixed = true, start = X_pro_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ac(fixed = true, start = X_ac_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_h2(fixed = true, start = X_h2_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    /*Particulate substrates*/
    SI.MassConcentration X_c(fixed = true, start = X_c_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Complex particulate concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_i(fixed = true, start = X_i_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Particulate inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ch[3](each fixed = true, start = X_ch_start, each stateSelect = StateSelect.always, nominal = {1e-1, 1e-1, 1}, each min = 0) "Particulate carbohydrates concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_pr[2](each fixed = true, start = X_pr_start, each stateSelect = StateSelect.always, each nominal = 1e-1, each min = 0) "Particulate proteins concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_li(fixed = true, start = X_li_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Particulate lipids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_p(fixed = true, start = X_p_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Particulate inert fraction from bacteria decay in digestate [kgCOD/m3]";
    SI.MassConcentration ash(fixed = true, start = ash_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Ash concentration in digestate [kg/m3]";
    SI.MassConcentration X_lig(fixed = true, start = X_lig_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Lignin concentration in digestate [kgCOD/m3]";
    /*Soluble substrates*/
    SI.MassConcentration S_i(fixed = true, start = S_i_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Soluble inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_su(fixed = true, start = S_su_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_aa(fixed = true, start = S_aa_start, stateSelect = StateSelect.always, nominal = 1e-3, min = 0) "Soluble amino acids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_fa(fixed = true, start = S_fa_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_va(fixed = true, start = S_va_start, stateSelect = StateSelect.always, nominal = 1e-3, min = 0) "Valeric acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_bu(fixed = true, start = S_bu_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Butyric concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_pro(fixed = true, start = S_pro_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Propionic acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ac(fixed = true, start = S_ac_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Acetic acid concentration in digestate [kgCOD/m3]";
    /*Inorganic soluble components*/
    SI.MassConcentration S_h2(fixed = true, start = S_h2_start, stateSelect = StateSelect.always, nominal = 1e-7, min = 0) "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ch4(fixed = true, start = S_ch4_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Soluble methane concentration in digestate [kgCOD/m3]";
    /*Ionic total components*/
    Types.MolarDensity_M S_ic(fixed = true, start = S_ic_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in(fixed = true, start = S_in_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip(fixed = true, start = S_ip_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "8/10";
    Types.MolarDensity_M S_cat(fixed = false, start = S_cat_start, stateSelect = StateSelect.always, nominal = 1e-1, min = 0) "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ca(fixed = true, start = S_ca_start, stateSelect = StateSelect.always, nominal = 1e-3, min = 0) "Soluble total calcium concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_mg(fixed = true, start = S_mg_start, stateSelect = StateSelect.always, nominal = 1e-5, min = 0) "Soluble total magnesium concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_an(fixed = false, start = S_an_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Soluble anionic ion concentration in digestate [kmol/m3]";
    /*Gas components*/
    SI.MassConcentration S_gas_h2(fixed = true, start = S_gas_h2_start, stateSelect = StateSelect.always, nominal = 1e-6, min = 0) "Hydrogen concentration in the reactor headspace [kgCOD/m3]";
    SI.MassConcentration S_gas_ch4(fixed = true, start = S_gas_ch4_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Methane concentration in the reactor headspace [kgCOD/m3]";
    Types.MolarDensity_M S_gas_co2(fixed = true, start = S_gas_co2_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Carbon dioxide concentration in the reactor headspace [mol/m3]";
    Types.MolarDensity_M S_gas_nh3(fixed = true, start = S_gas_nh3_start, stateSelect = StateSelect.always, nominal = 1e-6, min = 0) "Ammonia concentration in the reactor headspace [mol/m3]";
    Types.MolarDensity_M S_gas_n2(fixed = true, start = S_gas_n2_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Nitrogen concentration in the reactor headspace [mol/m3]";
    /*Initial conditions*/
    /*Microbial biomasses*/
    parameter SI.MassConcentration X_su_start = 1.77461985774654;
    parameter SI.MassConcentration X_aa_start = 0.384111218318837;
    parameter SI.MassConcentration X_fa_start = 0.250326584013513;
    parameter SI.MassConcentration X_c4_start = 0.346775397420336;
    parameter SI.MassConcentration X_pro_start = 0.245572662200841;
    parameter SI.MassConcentration X_ac_start = 0.915902594834903;
    parameter SI.MassConcentration X_h2_start = 0.459571704546511;
    /*Particulate substrate*/
    parameter SI.MassConcentration X_c_start = 0.0000000001;
    parameter SI.MassConcentration X_i_start = 25.5153612066474;
    parameter SI.MassConcentration X_ch_start[3] = {0.71099378641287, 0.706614741490802, 3.69155701871976};
    parameter SI.MassConcentration X_pr_start[2] = {0.170774950580368, 0.688267698713492};
    parameter SI.MassConcentration X_li_start = 0.718659798284908;
    parameter SI.MassConcentration X_p_start = 0.35213399945437;
    parameter SI.MassConcentration ash_start = 13.3108177897574;
    parameter SI.MassConcentration X_lig_start = 8.2482298152974;
    /*Soluble substrate*/
    parameter SI.MassConcentration S_i_start = 0.0880334998635926;
    parameter SI.MassConcentration S_su_start = 0.0109395637393082;
    parameter SI.MassConcentration S_aa_start = 0.00482747031920373;
    parameter SI.MassConcentration S_fa_start = 0.0561094186678704;
    parameter SI.MassConcentration S_va_start = 0.00660785815779992;
    parameter SI.MassConcentration S_bu_start = 0.0114081153485832;
    parameter SI.MassConcentration S_pro_start = 0.0572380135977455;
    parameter SI.MassConcentration S_ac_start = 0.598492393880898;
    /*Inorganic soluble components*/
    parameter SI.MassConcentration S_h2_start = 7.49657337504142E-07;
    parameter SI.MassConcentration S_ch4_start = 0.241225277537234;
    /*Ionic total components*/
    parameter Types.MolarDensity_M S_ic_start = 0.172826581627553;
    parameter Types.MolarDensity_M S_in_start = 0.0798529241724076;
    parameter Types.MolarDensity_M S_ip_start = 0.00397602607286417;
    parameter Types.MolarDensity_M S_cat_start = 0.117695514785234;
    parameter Types.MolarDensity_M S_ca_start = 6.69153940864905E-05;
    parameter Types.MolarDensity_M S_mg_start = 0.000185586236802848;
    parameter Types.MolarDensity_M S_an_start = 0.0182749326145552;
    /*Gas components*/
    parameter SI.MassConcentration S_gas_h2_start = 6.60580032242798E-06;
    parameter SI.MassConcentration S_gas_ch4_start = 1.26842637738813;
    parameter Types.MolarDensity_M S_gas_co2_start = 0.01656754542200144;
    parameter Types.MolarDensity_M S_gas_nh3_start = 1.18167381554749E-06;
    parameter Types.MolarDensity_M S_gas_n2_start = 0;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1;

  record StateVariablesADM1_mpp
    /*Mineral precipitation submodel*/
    Types.MolarDensity_M X_acp(fixed = true, start = X_acp_start, nominal = 1e-11, stateSelect = StateSelect.always, min = 0) "Amorphous calcium phosphate concentration in digestate [mol/m3]";
    Types.MolarDensity_M X_stru(fixed = true, start = X_stru_start, nominal = 1e-2, stateSelect = StateSelect.always, min = 0) "Struvite concentration in digestate [mol/m3]";
    Types.MolarDensity_M X_ccm(fixed = true, start = X_ccm_start, nominal = 1e-3, stateSelect = StateSelect.always, min = 0) "Calcite concentration in digestate [mol/m3]";
    Types.MolarDensity_M X_mag(fixed = true, start = X_mag_start, nominal = 1e-9, stateSelect = StateSelect.always, min = 0) "Magnesite concentration in digestate [mol/m3]";
    /*Initial conditions*/
    parameter Types.MolarDensity_M X_acp_start = 1.65869412409379E-11;
    parameter Types.MolarDensity_M X_stru_start = 0.0111562988216075;
    parameter Types.MolarDensity_M X_ccm_start = 0.00596673415184001;
    parameter Types.MolarDensity_M X_mag_start = 3.76099655367877E-09;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_mpp;

  record VariablesADM1_mpp
    extends StateVariablesADM1_mpp;
    /* Declaration of algebraic variables of the mineral precipitation submodel*/
    /*Rates*/
    Types.MolConcRate rp1(nominal = 1e-7) "Precipitation of X_acp [mol/L*d]";
    Types.MolConcRate rp2(nominal = 1e-7) "Precipitation of X_stru [mol/L*d]";
    Types.MolConcRate rd1(nominal = 1e-11) "(Re)Dissolution of X_acp [mol/L*d]";
    Types.MolConcRate rd2(nominal = 1e-7) "(Re)Dissolution of X_stru [mol/L*d]";
    Types.MolConcRate rp3(nominal = 1e-7) "Precipitation of X_ccm [mol/L*d]";
    Types.MolConcRate rd3(nominal = 1e-7) "(Re)Dissolution of X_ccm [mol/L*d]";
    Types.MolConcRate rp4(nominal = 1e-7) "Precipitation of X_mag [mol/L*d]";
    Types.MolConcRate rd4(nominal = 1e-11) "(Re)Dissolution of X_mag [mol/L*d]";
    /*Solubility product constants (corrected with temperature)*/
    Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
    Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
    Types.MolarDensity_M_Ksp_squared Ksp_ccm(nominal = 1e-9);
    Types.MolarDensity_M_Ksp_squared Ksp_mag(nominal = 1e-9);
    /*Saturation Indexes*/
    SI.PerUnit SI_stru(nominal = 1);
    SI.PerUnit SI_acp(nominal = 1);
    SI.PerUnit SI_ccm(nominal = 1);
    SI.PerUnit SI_mag(nominal = 1);
    SI.PerUnit arg_log_acp(nominal = 1e-2, min = 0);
    SI.PerUnit arg_log_stru(nominal = 1e-1, min = 0);
    SI.PerUnit arg_log_ccm(nominal = 1e-1, min = 0);
    SI.PerUnit arg_log_mag(nominal = 1e-1, min = 0);
    /*Dummy rates to avoid negative salt concentrations*/
    Types.MolConcRate r_stru;
    Types.MolConcRate r_ccm;
    Types.MolConcRate r_acp;
    Types.MolConcRate r_mag;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end VariablesADM1_mpp;

  record VariablesADM1_pH
    /* Declaration of algebraic variables of the pH submodel*/
    /*Algebraic variables*/
    //([S] and {S} in IWA PCM). Now solved "esplicitly" in the form z[j]=h-1(x,z[i]) with i≠j
    SI.MassConcentration S_vam(fixed = false, start = 0.00658926, stateSelect = StateSelect.never, nominal = 1e-3, min = 0) "Valerate ion concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_bum(fixed = false, start = 0.0113788, stateSelect = StateSelect.never, nominal = 1e-2, min = 0) "Butyrate ion concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_prom(fixed = false, start = 0.0570694, stateSelect = StateSelect.never, nominal = 1e-2, min = 0) "Propionate ion concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_acm(fixed = false, start = 0.597154, stateSelect = StateSelect.never, nominal = 1e-1, min = 0) "Acetate ion concentration in digestate [kgCOD/m3]";
    Types.MolarDensity_M S_hco3(fixed = false, start = 0.159968, nominal = 1e-1, stateSelect = StateSelect.never, min = 0) "HCO3- ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_co3(fixed = false, start = 0.000490367, nominal = 1e-4, stateSelect = StateSelect.never, min = 0) "CO32- ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_nh3(fixed = false, start = 0.00188895, nominal = 1e-3, stateSelect = StateSelect.never, min = 0) "NH3 ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_nh4(fixed = false, start = 0.077964, nominal = 1e-2, stateSelect = StateSelect.never, min = 0) "NH4+ ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_hpo4(fixed = false, start = 0.00302965, nominal = 1e-3, stateSelect = StateSelect.never, min = 0) "HPO42- ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_h2po4(fixed = false, start = 0.000946285, nominal = 1e-4, stateSelect = StateSelect.never, min = 0) "H2PO4- ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_h3po4(fixed = false, start = 1.20928e-08, nominal = 1e-8, stateSelect = StateSelect.never, min = 0) "H3PO4 ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_po4(fixed = false, start = 7.80206e-08, nominal = 1e-8, stateSelect = StateSelect.never, min = 0) "PO43- ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_co2(fixed = false, start = 0.0123684, nominal = 1e-2, stateSelect = StateSelect.never, min = 0) "H2CO3 ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_oh(fixed = false, start = 8.60704e-07, nominal = 1e-7, stateSelect = StateSelect.never, min = 0) "OH- ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M a_ca(fixed = false, start = 1.963762865588564e-05, nominal = 1e-5, stateSelect = StateSelect.never, min = 0) "CA2+ activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_po4(fixed = false, start = 4.945690381366551e-09, nominal = 1e-9, stateSelect = StateSelect.never, min = 0) "PO43- activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_nh4(fixed = false, start = 0.0573832, nominal = 1e-2, stateSelect = StateSelect.never, min = 0) "NH4+ activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_mg(fixed = false, start = 5.446390405460607e-05, nominal = 1e-5, stateSelect = StateSelect.never, min = 0) "MG2+ activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_h(fixed = false, start = 5.29235e-08, nominal = 1e-8, stateSelect = StateSelect.never, min = 0) "H+ activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_hco3(fixed = false, start = 0.11774, nominal = 1e-1, stateSelect = StateSelect.never, min = 0) "HCO3- activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_hpo4(fixed = false, start = 0.000889111, nominal = 1e-4, stateSelect = StateSelect.never, min = 0) "HPO42- activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_h2po4(fixed = false, start = 0.000696487, nominal = 1e-4, stateSelect = StateSelect.never, min = 0) "H2PO4- activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_co3(fixed = false, start = 0.000143908, nominal = 1e-4, stateSelect = StateSelect.never, min = 0) "CO32- activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_acm(fixed = false, start = 0.00686176, nominal = 1e-3, stateSelect = StateSelect.never, min = 0) "Acetate activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_prom(fixed = false, start = 0.000374634, nominal = 1e-4, stateSelect = StateSelect.never, min = 0) "Propionate activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_bum(fixed = false, start = 5.22848e-05, nominal = 1e-5, stateSelect = StateSelect.never, min = 0) "Butyrate activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_vam(fixed = false, start = 2.32869e-05, nominal = 1e-5, stateSelect = StateSelect.never, min = 0) "Valerate activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_h2o(fixed = false, start = 0.993395, nominal = 1e-1, stateSelect = StateSelect.never, min = 0) "H2O activity in digestate [kmol/m3]";
    Types.MolarDensity_M a_oh(fixed = false, start = 6.33497e-07, nominal = 1e-7, stateSelect = StateSelect.never, min = 0) "OH- activity in digestate [kmol/m3]";
    /*Variables that shall be selected for tearing and solved by G(x,z)=0*/
    SI.PerUnit pH(fixed = false, start = 7.27635174309502, nominal = 1, stateSelect = StateSelect.never, min = 0, max = 14) "Digestate pH [-]";
    Types.MolarDensity_M S_h(fixed = true, start = 7.19047298636016E-08, nominal = 1e-8, stateSelect = StateSelect.avoid, min = 0) "Concentration of H+ ions in digestate [mol/L]";
    Types.MolarDensity_M I(fixed = true, start = 0.199936850453829, nominal = 1e-1, stateSelect = StateSelect.avoid, min = 0) "Ionic strength of digestate [mol/L]";
    Real z(fixed = false, start = 0.447143, nominal = 1e-1, stateSelect = StateSelect.avoid, min = 0) "Dummy variable to simplify computation of activity coefficients []";
    /*Algebraic variables that depends only on I (ionic force)*/
    SI.ActivityCoefficient g_mono(fixed = false, stateSelect = StateSelect.never, nominal = 1e-1, start = 0.7, min = 0) "Activity coefficient for mono-protonation chemical species";
    SI.ActivityCoefficient g_bi(fixed = false, stateSelect = StateSelect.never, nominal = 1e-1, start = 0.3, min = 0) "Activity coefficient for double-protonation chemical species";
    SI.ActivityCoefficient g_tri(fixed = false, stateSelect = StateSelect.never, nominal = 1e-1, start = 0.09, min = 0 "Activity coefficient for triple-protonation chemical species");
    /*Additional dummy states to relax G(x,u)=0*/
    Types.MolarDensity_M charge(fixed = false, start = 0, nominal = 1, stateSelect = StateSelect.always);
    Types.MolarDensity_M ionic_force(fixed = false, start = 0, nominal = 1, stateSelect = StateSelect.always);
    /*Algebraic variables that doesn't depend on states nor on other algebraic variables. Depends only on parameters and T [°C]*/
    Types.MolarDensity_M Ka_co2(fixed = false, start = 4.94e-7);
    Types.MolarDensity_M Ka_hco3(fixed = false, start = 6.32e-11);
    Types.MolarDensity_M Ka_nh4(fixed = false, start = 1.11e-9);
    Types.MolarDensity_M Ka_h2o(fixed = false, start = 2.08e-14);
    Types.MolarDensity_M Ka_h2po4(fixed = false, start = 6.20e-8);
    Types.MolarDensity_M Ka_hpo4(fixed = false, start = 2.14e-13);
    Types.MolarDensity_M Ka_h3po4(fixed = false, start = 2.14e-2);
    annotation(
      Documentation(info = "<html><p> This record contains algebraic variables of pH submodel (DAE implementation). The latter is an intermediate level of complexity for physiochemical aqueous system modelling. It includes non-ideality and all multiple chemical species protonation i.e. acid-base reactions, but it does not include ion-pairing reactions. Calcium (S_ca) and magnesium (S_mg) cations are included (for precipitation processes modeled in another block), whereas other unknown cations and ions are lumped in the S_cat and S_an variables, to close the charge balance.
      There are Nc chemical total components (TOT in IWA, now x). These are updated by ODE equations (states) and are given as inputs.
      There are Ns chemical species ([S] in IWA, now z) that are corrected for non-ideality by means of coeffs=f(I(z,x)). The chemical species corrected ({S} in IWA, now z) are found by means of Ns-Nc chemical equilibrium algebraic equations, rewritten by substituion to be dependent only on x and a_h or S_h. There are Nc-1 algebraic equations that are component 'mass balances' i.e. TOT[j] = sum(stechiom[i,j]*species[i,j])
      There are two additional algebraic equations g(x,z) to close the system: the charge balance that shall solve for S_h (or a_h) and the definition of ionic force that shall solve for I.
      Note that the way {S} variables are calculated here by substitution is possible only for acid-base reactions. For ion-pairing reactions, it is not possible. The original chemical equilibrium equations are in the form G(z)=0 </p>
  <p><em> @Davide Carecci, Politecnico di Milano</em></p>
  <p> Last review: <em> April 10, 2026 </em></p></html>"));
  end VariablesADM1_pH;

  record VariablesADM1_bio
    /* Declaration of algebraic variables of the biological submodel*/
    /*Inflow variables*/
    Types.FlowRate_d Q "Overall inflow rate to the reactor [m3/d]";
    //Biomass
    SI.MassConcentration X_su_in "Monosaccharide degrading organisms concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_aa_in "Amino Acid degrading organisms concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_fa_in "Long chain fatty acid degrading organisms concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_c4_in "C4 degrading organisms concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_pro_in "Propionate degrading organisms concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_ac_in "Acetate degrading organisms concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_h2_in "Hydrogen degrading organisms concentration in feed flow [kgCOD/m3]";
    //Particulate substrate
    SI.MassConcentration X_c_in[7] "Complex particulate concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_i_in[4] "Particulate inerts concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_ch_in[3] "Particulate carbohydrates concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_pr_in[2] "Particulate proteins concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_li_in "Particulate lipids concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration X_p_in "Particulate inert fraction from bacteria decay in feed flow [kgCOD/m3]";
    SI.MassConcentration X_lig_in "Particulate inert fraction of lignin in feed flow [kgCOD/m3]";
    //Soluble substrate
    SI.MassConcentration S_i_in[4] "Soluble inerts concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_su_in "Soluble monosaccharides concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_aa_in "Soluble amino acids concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_fa_in "Soluble long chain fatty acids  concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_va_in "Valeric acid concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_bu_in "Butyric concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_pro_in "Propionic acid concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_ac_in "Acetic acid concentration in feed flow [kgCOD/m3]";
    //Inorganic soluble components
    SI.MassConcentration S_h2_in "Soluble hydrogen concentration in feed flow [kgCOD/m3]";
    SI.MassConcentration S_ch4_in "Soluble methane concentration in feed flow [kgCOD/m3]";
    Types.MolarDensity_M S_ic_in "Soluble inorganic carbon concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M S_in_in "Soluble inorganic nitrogen concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M S_ip_in(nominal = 1e-3) "Soluble inorganic phosphorus concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M S_cat_in "Soluble cationic ion concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M S_ca_in(nominal = 1e-4) "Soluble total calcium ion concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M S_mg_in(nominal = 1e-5) "Soluble total magnesium ion concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M S_an_in(nominal = 1e-5) "Soluble anionic ion concentration in feed flow [kmol/m3]";
    //Mineral precipitates
    Types.MolarDensity_M X_stru_in(nominal = 1e-5) "Struvite concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M X_acp_in(nominal = 1e-5) "Amorphous calcium phosphate concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M X_ccm_in(nominal = 1e-5) "Calcite concentration in feed flow [kmol/m3]";
    Types.MolarDensity_M X_mag_in(nominal = 1e-5) "Magnesite concentration in feed flow [kmol/m3]";
    SI.MassConcentration ash_in;
    //Gas components
    Types.Pressure_bar p_gas_h2(fixed = false, start = 0, nominal = 1e-5, min = 0);
    Types.Pressure_bar p_gas_ch4(fixed = false, start = 0, nominal = 1e-1, min = 0);
    Types.Pressure_bar p_gas_co2(fixed = false, start = 0, nominal = 1e-1, min = 0);
    Types.Pressure_bar p_gas_h2o(fixed = false, start = 0, nominal = 1e-1, min = 0);
    Types.Pressure_bar p_gas_nh3(fixed = false, start = 0, nominal = 1e-5, min = 0);
    Types.Pressure_bar p_gas_n2(fixed = false, start = 0, nominal = 1e-5, min = 0);
    Types.MolarDensity_M S_gas_h2o(fixed = false, start = 3.1106518327780534e-05, nominal = 1e-5, min = 0) "Water concentration in the reactor headspace [mol/m3]";
    //Time-varying composition coefficients of composite components
    SI.MassFraction f_xc[6];
    SI.MassFraction f_xi[3];
    SI.MassFraction f_si[3];
    SI.MolarMass i_XI[5] "[kmol_i/kgCOD]";
    SI.MolarMass i_SI[5] "[kmol_i/kgCOD]";
    SI.MolarMass i_XC[5] "[kmol_i/kgCOD]";
    /*Biogas variables*/
    //Real P_gas(fixed = true, start = 1.014) "Note: see 'Digester' model...it is a RealOutput when it is modeled as a controlled variable!";
    Types.FlowRate_d Q_gas(fixed = false, start = 0.01467068765480921, nominal = 1e-2) "Biogas flow rate [m3/d]";
    Types.FlowRate_d Q_gas_N "Biogas flow rate [Nm3/d]";
    /*Temperature dependant parameters*/
    Types.Kinetic_d k_hyd_T[8] "Vector of first-order hydrolysis constants: contains {Xc[2 entries], Xch[3 entries], Xpr[2 entries], Xli}";
    Types.Kinetic_d k_m_su_T;
    Types.Kinetic_d k_m_aa_T;
    Types.Kinetic_d k_m_fa_T;
    Types.Kinetic_d k_m_pro_T;
    //Real k_m_c4_T; not found
    Types.Kinetic_d k_m_ac_T;
    Types.Kinetic_d k_m_h2_T;
    SI.MassConcentration Ks_su_T;
    SI.MassConcentration Ks_aa_T;
    SI.MassConcentration Ks_fa_T;
    SI.MassConcentration Ks_pro_T;
    //Real Ks_c4_T; not found
    SI.MassConcentration Ks_ac_T;
    SI.MassConcentration Ks_h2_T;
    Types.Kinetic_d k_dec_su_T;
    Types.Kinetic_d k_dec_aa_T;
    Types.Kinetic_d k_dec_fa_T;
    Types.Kinetic_d k_dec_pro_T;
    //Real k_dec_c4_T; not found
    Types.Kinetic_d k_dec_ac_T;
    Types.Kinetic_d k_dec_h2_T;
    Types.HenryConstant KH_ch4;
    Types.HenryConstant KH_co2;
    Types.HenryConstant KH_h2;
    Types.HenryConstant KH_nh3;
    /*Process rates*/
    Types.MassConcRate r1(fixed = false, start = 0, nominal = 1) "Hydrolysis of X_c";
    Types.MassConcRate r2[3](each fixed = false, start = {0.550142, 0.250764, 0.0436688}, nominal = {1e-1, 1e4, 1e-1}) "Hydrolysis of X_ch";
    Types.MassConcRate r3[2](each fixed = false, start = {0.141411, 0.162835}, nominal = {1e-1, 1e-2}) "Hydrolysis of X_pr";
    Types.MassConcRate r4(fixed = false, start = 0.255039, nominal = 1e-1) "Hydrolysis of X_li";
    Types.MassConcRate r5(fixed = false, start = 1.12396, nominal = 1) "Uptake of S_su by X_su";
    Types.MassConcRate r6(fixed = false, start = 0.304097, nominal = 1e-1) "Uptake of S_aa by X_aa";
    Types.MassConcRate r7(fixed = false, start = 0.251616, nominal = 1e-1) "Uptake of S_fa by X_fa";
    Types.MassConcRate r8(fixed = false, start = 0.0752062, nominal = 1e-1) "Uptake of S_va by X_c4";
    Types.MassConcRate r9(fixed = false, start = 0.219071, nominal = 1e-1) "Uptake of S_bu by X_c4";
    Types.MassConcRate r10(fixed = false, start = 0.370256, nominal = 1e-1) "Uptake of S_pro by X_pro";
    Types.MassConcRate r11(fixed = false, start = 1.16018, nominal = 1) "Uptake of S_ac by X_ac";
    Types.MassConcRate r12(fixed = false, start = 0.485118, nominal = 1e-1) "Uptake of S_h2 by X_h2";
    Types.MassConcRate r13(fixed = false, start = 0.0575306, nominal = 1e-2) "Decay of X_su";
    Types.MassConcRate r14(fixed = false, start = 0.0124523, nominal = 1e-2) "Decay of X_aa";
    Types.MassConcRate r15(fixed = false, start = 0.00735767, nominal = 1e-3) "Decay of X_fa";
    Types.MassConcRate r16(fixed = false, start = 0.0069355, nominal = 1e-3) "Decay of X_c4";
    Types.MassConcRate r17(fixed = false, start = 0.00721794, nominal = 1e-3) "Decay of X_pro";
    Types.MassConcRate r18(fixed = false, start = 0.0296923, nominal = 1e-2) "Decay of X_ac";
    Types.MassConcRate r19(fixed = false, start = 0.0148987, nominal = 1e-2) "Decay of X_h2";
    Types.MassConcRate rate_overall_Sic(fixed = false) "Additional variable: overall rate r of S_ic dynamics";
    Types.MassConcRate rt8(fixed = false, start = 8.07597e-06, nominal = 1e-6) "Gas-liquid transfer rate of H2";
    Types.MassConcRate rt9(fixed = false, start = 1.55072, nominal = 1) "Gas-liquid transfer rate of CH4";
    Types.MolConcRate rt10(fixed = false, start = 0.0202548, nominal = 1e-2) "Gas-liquid transfer rate of CO2";
    Types.MolConcRate rt12(fixed = false, start = 1.44466e-06, nominal = 1e-6) "Gas-liquid transfer rate of NH3";
    Types.MolConcRate rt_h2o(fixed = false, start = 3.802953320261416e-05, nominal = 1e-5) "Gas-liquid transfer rate of H2O";
    /* Stoichiometric inorganic carbon coefficients on processes*/
    Real v1;
    Real v2;
    Real v3;
    Real v4;
    Real v5;
    Real v6;
    Real v7;
    Real v8;
    Real v9;
    Real v10;
    Real v11;
    Real v12;
    Real v13;
    Real n1, n6, n13 "Additional variables: wrapped stoichiometric coefficients";
    /*Process inhibition*/
    Real I_5(fixed = false, start = 0.993751, nominal = 1e-1);
    Real I_6(fixed = false, start = 0.993751, nominal = 1e-1);
    Real I_7(fixed = false, start = 0.864182, nominal = 1e-1);
    Real I_8(fixed = false, start = 0.924449, nominal = 1e-1);
    Real I_9(fixed = false, start = 0.924449, nominal = 1e-1);
    Real I_10(fixed = false, start = 0.743209, nominal = 1e-1);
    Real I_11(fixed = false, start = 0.407467, nominal = 1e-1);
    Real I_12(fixed = false, start = 0.993751, nominal = 1e-1);
    Real I_pH_aa(fixed = false, start = 1, nominal = 1e-1, min = 0, max = 1) "Microbial growth inhibition from pH of X_aa";
    Real I_pH_ac(fixed = false, start = 0.692653, nominal = 1e-1, min = 0, max = 1) "Microbial growth inhibition from pH of X_ac";
    Real I_pH_h2(fixed = false, start = 1, nominal = 1e-1, min = 0, max = 1) "Microbial growth inhibition from pH of X_h2";
    Real I_in_lim(fixed = false, start = 0.998749, nominal = 1e-1, min = 0, max = 1) "Microbial growth limitation from S_in";
    Real I_ip_lim(fixed = false, start = 0.994995, nominal = 1e-1, min = 0, max = 1) "Microbial growth limitation from S_ip";
    Real I_h2_fa(fixed = false, start = 0.869617, nominal = 1e-1, min = 0, max = 1) "Microbial growth i inhibition from H2 of X_fa";
    Real I_h2_c4(fixed = false, start = 0.930262, nominal = 1e-1, min = 0, max = 1) "Microbial growth inhibition from H2 of X_c4";
    Real I_h2_pro(fixed = false, start = 0.747883, nominal = 1e-1, min = 0, max = 1) "Microbial growth inhibition from H2 of X_pro";
    Real I_nh3(fixed = false, start = 0.59197, nominal = 1e-1, min = 0, max = 1) "Microbial growth inhibition from NH3";
    Real I_hald_ac(fixed = false, nominal = 1e-1, min = 0) "Microbial growth inhibition from S_ac";
    Real I_hald_pro(fixed = false, nominal = 1e-1, min = 0) "Microbial growth inhibition from S_pro";
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end VariablesADM1_bio;

  record OtherVariables_Gas
    /*Declaration of variables for 'Gasbag_p' model*/
    Real x_ch4(fixed = false, start = 0.546472);
    Real x_co2(fixed = false, start = 0.45345);
    Real x_h2(fixed = false, start = 9.1e-6);
    Real x_nh3(fixed = false, start = 9.22531e-5);
    Real x_n2(fixed = false, start = 8.25e-7);
    Types.FlowRate_Ld Q_ch4_N(fixed = false, start = 0) "Methane rate [L/d] at standard conditions";
    Types.FlowRate_Ld Q_co2_N(fixed = false, start = 0) "Carbon dioxide rate [L/d] at standard conditions";
    Types.FlowRate_Ld Q_h2_N(fixed = false, start = 0) "Hydrogen rate [L/d] at standard conditions";
    Types.FlowRate_Ld Q_n2_N(fixed = false, start = 0) "Nitrogen rate [L/d] at standard conditions";
    /*State variables*/
    SI.MassConcentration S_gas_h2(fixed = true, start = S_gas_h2_start, stateSelect = StateSelect.always, nominal = 1e-6, min = 0) "Hydrogen concentration in the reactor headspace [kgCOD/m3]";
    SI.MassConcentration S_gas_ch4(fixed = true, start = S_gas_ch4_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Methane concentration in the reactor headspace [kgCOD/m3]";
    Types.MolarDensity_M S_gas_co2(fixed = true, start = S_gas_co2_start, stateSelect = StateSelect.always, nominal = 1e-2, min = 0) "Carbon dioxide concentration in the reactor headspace [kmol/m3]";
    Types.MolarDensity_M S_gas_nh3(fixed = true, start = S_gas_nh3_start, stateSelect = StateSelect.always, nominal = 1e-6, min = 0) "Ammonia concentration in the reactor headspace [kmol/m3]";
    Types.MolarDensity_M S_gas_n2(fixed = true, start = S_gas_n2_start, stateSelect = StateSelect.always, nominal = 1, min = 0) "Nitrogen concentration in the reactor headspace [kmol/m3]";
    Modelica.Units.SI.Volume V_gasbag(fixed = true, start = 0.003) "Gasbag variable volume [m3]";
    /*Initial conditions*/
    parameter SI.MassConcentration S_gas_h2_start = 1.13668e-05;
    parameter SI.MassConcentration S_gas_ch4_start = 1.40749;
    parameter Types.MolarDensity_M S_gas_co2_start = 0.0143905;
    parameter Types.MolarDensity_M S_gas_nh3_start = 5.06177e-06;
    parameter Types.MolarDensity_M S_gas_n2_start = 3e-8;
    /*Influent algebraic variables*/
    Real x_ch4_in;
    Real x_co2_in;
    Real x_h2_in;
    Real x_nh3_in;
    Real x_n2_in;
    Real S_gas_ch4_in;
    Real S_gas_co2_in;
    Real S_gas_h2_in;
    Real S_gas_nh3_in;
    Real S_gas_n2_in;
    Real p_gas_h2o_in;
    Real p_gas_h2_in;
    Real p_gas_n2_in;
    Real p_gas_ch4_in;
    Real p_gas_co2_in;
    Real p_gas_nh3_in;
  end OtherVariables_Gas;

  record Lumped_variables
    /*Declaration of trivial algebraic variables used only to express outputs as a linear combination of state variables
          or to express outputs in different units of measurement.
          Note: be carefull to dilution and filtration (sample manipulation) when comparing these quantities with data.
          e.g. Sum to Alk and TAN the salt concentrations? Dilution when measuring...*/
    Types.MassConcentration_g Alk(fixed = false, start = 0) "Total alkalinity (TAC) [mgCaCO3/L]";
    SI.MassConcentration TVFA(fixed = false, start = 0) "Total VFAs [mgCH3COOH/L]";
    SI.PerUnit FOS_TAC(fixed = false, start = 0) "Ratio between acidity and alkalinity";
    SI.MassConcentration VS(fixed = false, start = 0) "Volatile Solid content in the digester [gVS/L]...shall consider VFA or not?";
    SI.MassConcentration TAN(fixed = false, start = 0) "Ammonium + Ammonia concentration from kit analysis [mgN/L]";
    SI.MassConcentration COD_tot(fixed = false, start = 0) "Total COD concentration [gCOD/L]";
    SI.MassConcentration COD_sol(fixed = false, start = 0) "Soluble COD concentration [gCOD/L]";
    SI.MassConcentration CH_tot(fixed = false, start = 0) "Total CH concentration [gGlu/L]";
    SI.MassConcentration PR_tot_BCA(fixed = false, start = 0) "Total PR concentration [gBSA/L]";
    SI.MassConcentration PR_tot_TKN(fixed = false, start = 0) "Total PR concentration [gN/L]";
    SI.MassConcentration LI_tot(fixed = false, start = 0) "Total LI concentration [gLI/L]";
    SI.MassConcentration CH_sol(fixed = false, start = 0) "Soluble CH concentration [gGlu/L]";
    SI.MassConcentration PR_sol_BCA(fixed = false, start = 0) "Soluble PR concentration [gBSA/L]";
    SI.MassConcentration PR_sol_TKN(fixed = false, start = 0) "Soluble PR concentration [gN/L]";
    SI.MassConcentration LI_sol(fixed = false, start = 0) "Soluble LI concentration [gLI/L]";
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating output aggregated variables. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2021 </em></p></html>"));
  end Lumped_variables;

  record OtherVariables_MassBalance
    /*Declaration of algebraic and stat variables to check mass balances and compute time-integrated quantities*/
    Real COD_balance_in(fixed = false, start = 0);
    Real COD_balance_out(fixed = false, start = 0);
    Real COD_balance_gas(fixed = false, start = 0);
    Real IC_balance_in(fixed = false, start = 0);
    Real IC_balance_out(fixed = false, start = 0);
    Real IC_balance_gas(fixed = false, start = 0);
    Real IN_balance_in(fixed = false, start = 0);
    Real IN_balance_out(fixed = false, start = 0);
    Real IN_balance_gas(fixed = false, start = 0);
    Real IP_balance_in(fixed = false, start = 0);
    Real IP_balance_out(fixed = false, start = 0);
    // Cumulatives
    Real COD_balance_in_cum(fixed = true, start = 0);
    Real COD_balance_out_cum(fixed = true, start = 0);
    Real COD_balance_gas_cum(fixed = true, start = 0);
    Real IC_balance_in_cum(fixed = true, start = 0);
    Real IC_balance_out_cum(fixed = true, start = 0);
    Real IC_balance_gas_cum(fixed = true, start = 0);
    Real IN_balance_in_cum(fixed = true, start = 0);
    Real IN_balance_out_cum(fixed = true, start = 0);
    Real IN_balance_gas_cum(fixed = true, start = 0);
    Real IP_balance_in_cum(fixed = true, start = 0);
    Real IP_balance_out_cum(fixed = true, start = 0);
    Real Vcum(fixed = true, start = 0);
    Real Vcum_ch4(fixed = true, start = 0);
    Real CH4_cum(fixed = true, start = 0);
    Real V_in_cum(fixed = true, start = 0);
    //Other algebraic variables
    Real COD_S(fixed = false) "Soluble COD concentration in digestate [kgCOD/m3]";
    Real COD_X(fixed = false) "Particulate COD concentration in digestate [kgCOD/m3]";
    Real VS_in(fixed = false) "Concentration of VS in the feed flow [kgVS/m3]";
    Real resBMP_vs(fixed = false) "Residual BMP in digestate";
    Real HRT(fixed = false) "Hydraulic retention time of the reactor [d]";
    Real OLR(fixed = false) "Organic loading rate of the reactor [kgCOD/m3/d]";
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating mass balances. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2021 </em></p></html>"));
  end OtherVariables_MassBalance;

  record ParametersADM1_operational
    /*Declaration of general operating parameters*/
    SI.Volume V_liq = 3000 "Single Digester usefull working volume [m3]";
    SI.Volume V_tot = 3400 "Single Digester total volume [m3]";
    SI.Volume V_gas = V_tot - V_liq "Single Digester headspace as area*height-usefull working volume [m3]";
    parameter SI.Temperature T0 = 298.15 "Reference temperature for normal conditions [K]";
    parameter SI.Temperature T_op_mean = 315.15 "Mean operative temperature [K]";
    parameter NSI.Pressure_bar P_atm = 1.013 "Pressure of atmosphere [bar]";
    parameter Types.Kinetic_d kla = 200 "Volume-specific liquid-gas transfer coefficient [1/d]";
    /*Gas diffusivities*/
    parameter SI.ThermalDiffusivity D_o2 = 2.8e-9 "Oxygen diffusivity [m^2/s]";
    parameter SI.ThermalDiffusivity D_ch4 = 1.57e-9 "Methane diffusivity [m^2/s]";
    parameter SI.ThermalDiffusivity D_h2 = 4.65e-9 "Hydrogen diffusivity [m^2/s]";
    parameter SI.ThermalDiffusivity D_co2 = 1.98e-9 "Carbon dioxide diffusivity [m^2/s]";
    parameter SI.ThermalDiffusivity D_nh3 = 0.000169/86400 "Ammonia diffusivity [m^2/s]";
    parameter SI.ThermalDiffusivity D_n2 = 0.0001536/86400 "Nitrogen diffusivity [m^2/s]";
    Types.Kinetic_d kla_ch4 = kla*(D_ch4/D_o2)^(1/2);
    Types.Kinetic_d kla_h2 = kla*(D_h2/D_o2)^(1/2);
    Types.Kinetic_d kla_co2 = kla*(D_co2/D_o2)^(1/2);
    Types.Kinetic_d kla_nh3 = kla*(D_nh3/D_o2)^(1/2);
    /*Parameter for water partial pressure*/
    final parameter SI.PerUnit coeffph20_T = 5290;
    final parameter SI.PerUnit coeffph20_p = 0.0313;
    annotation(
      Documentation(info = "<html><p> This record contains the operational parameters and constants of the digester. Variable volume possibility: it is modeled as a variable, not as a parameter. </p>
<p><em> @Davide Carecci, Politecnico di Milano</em></p>
<p> Last review: <em> April 10, 2026 </em></p></html>"));
  end ParametersADM1_operational;

  record ParametersADM1_stoichiometric
    /*Declaration of stoichiometric parameters.
          Note: everything is calculated starting from brut formulas {C,H,O,N,P} of components (e.g., Flores-Alsina et al., 2016).
          Note: the molar content of P in LI was computed considering 3% gP/gLI*/
    /*Brut formulas*/
    final parameter Real Protein[5] = {4, 6.1, 1.2, 1, 0};
    final parameter Real Carbohydrate[5] = {6, 10, 5, 0, 0};
    final parameter Real Lipid[5] = {51, 98, 6, 0, 0.804860191792887};
    final parameter Real Biomass[5] = {5, 7, 2, 1, 0.11274};
    final parameter Real Lignin[5] = {3, 10, 3, 0, 0} "Note: for Triolo2011 {C,H,O} are [10,13,3]";
    /*Molecular weights (MW) [kg/kmol]*/
    constant SI.MolarMass MW_i[5] = {12, 1, 16, 14, 31};
    final parameter SI.MolarMass MW_PR = sum(MW_i[i]*Protein[i] for i in 1:5);
    final parameter SI.MolarMass MW_CH = sum(MW_i[i]*Carbohydrate[i] for i in 1:5);
    final parameter SI.MolarMass MW_LI = sum(MW_i[i]*Lipid[i] for i in 1:5);
    final parameter SI.MolarMass MW_BM = sum(MW_i[i]*Biomass[i] for i in 1:5);
    final parameter SI.MolarMass MW_LIG = sum(MW_i[i]*Lignin[i] for i in 1:5);
    /*Mass fractions [kg_i/kg]*/
    final parameter SI.MassFraction y_PR[5] = {MW_i[i]*Protein[i]/MW_PR for i in 1:5};
    final parameter SI.MassFraction y_CH[5] = {MW_i[i]*Carbohydrate[i]/MW_CH for i in 1:5};
    final parameter SI.MassFraction y_LI[5] = {MW_i[i]*Lipid[i]/MW_LI for i in 1:5};
    final parameter SI.MassFraction y_BM[5] = {MW_i[i]*Biomass[i]/MW_BM for i in 1:5};
    final parameter SI.MassFraction y_LIG[5] = {MW_i[i]*Lignin[i]/MW_LIG for i in 1:5};
    /*Elemental composition [kmol_i/kgCOD]*/
    final parameter SI.MolarMass i_CH[5] = {y_CH[i]/MW_i[i]/COD_VS_CH for i in 1:5};
    final parameter SI.MolarMass i_PR[5] = {y_PR[i]/MW_i[i]/COD_VS_PR for i in 1:5};
    final parameter SI.MolarMass i_LI[5] = {y_LI[i]/MW_i[i]/COD_VS_LI for i in 1:5};
    final parameter SI.MolarMass i_BM[5] = {y_BM[i]/MW_i[i]/COD_VS_BM for i in 1:5};
    final parameter SI.MolarMass i_LIG[5] = {y_LIG[i]/MW_i[i]/COD_VS_LIG for i in 1:5};
    final parameter SI.MolarMass i_XP[5] = {0.0301, 0, 0, 0.0043, 0.00021};
    final parameter SI.MolarMass C_su = 0.0313 "Carbon content of sugars [kmolC/kgCOD]";
    final parameter SI.MolarMass C_fa = 0.02174 "Carbon content of long chain fatty acids [kmolC/kgCOD]";
    final parameter SI.MolarMass C_va = 0.024 "Carbon content of valerate [kmolC/kgCOD]";
    final parameter SI.MolarMass C_bu = 0.025 "Carbon content of butyrate [kmolC/kgCOD]";
    final parameter SI.MolarMass C_pro = 0.0268 "Carbon content of propionate [kmolC/kgCOD]";
    final parameter SI.MolarMass C_ac = 0.0313 "Carbon content of acetate [kmolC/kgCOD]";
    final parameter SI.MolarMass C_ch4 = 0.0156 "Carbon content of methane [kmolC/kgCOD]";
    parameter Types.CODContent COD_VS_CH = 32*y_CH[1]/12 + 8*y_CH[2] - 16*y_CH[3]/16 - 24*y_CH[4]/14 + 40*y_CH[5]/31 + 48*0/32 "COD conversion factor for carbohydrates [kgCOD/kgVS]";
    parameter Types.CODContent COD_VS_PR = 32*y_PR[1]/12 + 8*y_PR[2] - 16*y_PR[3]/16 - 24*y_PR[4]/14 + 40*y_PR[5]/31 + 48*0/32 "COD conversion factor for proteins [kgCOD/kgVS]";
    parameter Types.CODContent COD_VS_LI = 32*y_LI[1]/12 + 8*y_LI[2] - 16*y_LI[3]/16 - 24*y_LI[4]/14 + 40*y_LI[5]/31 + 48*0/32 "COD conversion factor for lipids [kgCOD/kgVS]";
    parameter Types.CODContent COD_VS_BM = 32*y_BM[1]/12 + 8*y_BM[2] - 16*y_BM[3]/16 - 24*y_BM[4]/14 + 40*y_BM[5]/31 + 48*0/32 "COD conversion factor for microbial biomass [kgCOD/kgVS]";
    parameter Types.CODContent COD_VS_LIG = 32*y_LIG[1]/12 + 8*y_LIG[2] - 16*y_LIG[3]/16 - 24*y_LIG[4]/14 + 40*y_LIG[5]/31 + 48*0/32 "COD conversion factor for lignin [kgCOD/kgVS]";
    parameter Types.CODContent COD_VS_PR_BCA = 1.58 "COD conversion factor for effluent proteins measured with the BCA method";
    parameter Real N_PR = 7.5 "Conversion factor for effluent proteins to organic nitrogen (check consistency) [kgVS/kgN]";
    /*Fraction of yield coefficients*/
    parameter SI.MassFraction f_fa_li = 0.95 "Yield of long chain fatty acids (as opposed to glycerol) from lipids [kgCOD/kgCOD]";
    parameter SI.MassFraction nu_1_su = 0.495 "Fraction of sucrose that degrades to acetate only [kgCOD/kgCOD]";
    parameter SI.MassFraction nu_2_su = 0.345 "Fraction of sucrose that degrades to acetate and propionate [kgCOD/kgCOD]";
    parameter SI.MassFraction f_h2_su = 0.33*nu_1_su + 0.17*(1 - nu_1_su - nu_2_su) "Yield of hydrogen from monosaccharide degradation [kgCOD/kgCOD]; set using expression in Appendix D, ADM1";
    parameter SI.MassFraction f_bu_su = 0.83*(1 - nu_1_su - nu_2_su) "Yield of butyrate from monosaccharide degradation [kgCOD/kgCOD]; set using expression in Appendix D, ADM1";
    parameter SI.MassFraction f_pro_su = 0.78*nu_2_su "unit = kgCOD/kgCOD - yield of propionate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    parameter SI.MassFraction f_ac_su = 0.67*nu_1_su + 0.22*nu_2_su "Yield of actetate from monosaccharide degradation [kgCOD/kgCOD]; set using expression in Appendix D, ADM1";
    parameter SI.MassFraction f_h2_aa = 0.06 "Yield of hydrogen from amino acid degradation [kgCOD/kgCOD]";
    parameter SI.MassFraction f_va_aa = 0.23 "Yield of valerate from amino acid degradation [kgCOD/kgCOD]";
    parameter SI.MassFraction f_bu_aa = 0.26 "Yield of butyrate from amino acid degradation [kgCOD/kgCOD]";
    parameter SI.MassFraction f_pro_aa = 0.05 "Yield of propionate from amino acid degradation [kgCOD/kgCOD]";
    parameter SI.MassFraction f_ac_aa = 0.4 "Yield of acetate from amino acid degradation [kgCOD/kgCOD]";
    /*Yields of biomass on uptake of substrates*/
    parameter SI.MassFraction Y_su = 0.1 "yield of biomass on uptake of monosaccharides [kgCODx/kgCODs]";
    parameter SI.MassFraction Y_aa = 0.08 "yield of biomass on uptake of amino acids [kgCODx/kgCODs]";
    parameter SI.MassFraction Y_fa = 0.06 "yield of biomass on uptake of long chain fatty acids [kgCODx/kgCODs]";
    parameter SI.MassFraction Y_c4 = 0.06 "yield of biomass on uptake of valerate or butyrate [kgCODx/kgCODs]";
    parameter SI.MassFraction Y_pro = 0.04 "yield of biomass on uptake of propionate [kgCODx/kgCODs]";
    parameter SI.MassFraction Y_ac = 0.05 "0.05 yield of biomass on uptake of acetate [kgCODx/kgCODs]";
    parameter SI.MassFraction Y_h2 = 0.06 "yield of biomass on uptake of elemental hydrogen [kgCODx/kgCODs]";
    /*Fractions decay product_bacterial biomass.
          Note: values taken from Flores-Alsina et al., 2016.*/
    parameter SI.MassFraction f_si_xb = 0.02 "Yield of soluble inerts from disintegration of complex particulates [kgCOD/kgCOD]";
    parameter SI.MassFraction f_P = 0.08 "Yield of particulate inerts from disintegration of complex particulates [kgCOD/kgCOD]; fP from Wett et al., 2006.";
    parameter SI.MassFraction f_ch_xb = 0.275 "Yield of carbohydrates from disintegration of complex particulates [kgCOD/kgCOD]";
    parameter SI.MassFraction f_pr_xb = 0.275 "Yield of proteins from disintegration of complex particulates [kgCOD/kgCOD]";
    parameter SI.MassFraction f_li_xb = 0.350 "Yield of lipids from disintegration of complex particulates [kgCOD/kgCOD]";
    /*Theoretical BMP of components. 
          Note: values taken from Triolo et al., 2011. However, it would be better to calculate it from Buswell formula for higher consistency.*/
    Real tBMPth_pr = 496;
    Real tBMPth_li = 1014;
    Real tBMPth_ch = 415;
    Real tBMPth_su = 415;
    Real tBMPth_lig = 727;
    Real tBMPth_vfa = 373;
    /*Settable composites parameters.
          Note: this parameters are used only in Feed_Source_Direct/Catenacci/Water and Sink_vec. 
          These fractions are on COD basis.*/
    //Xc fractioning
    parameter SI.MassFraction f_xi_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_ch_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_pr_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_li_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_lig_xc(nominal = 1e-1) = 0.1;
    parameter SI.MassFraction f_si_xc(nominal = 1e-1) = 1 - (f_xi_xc + f_pr_xc + f_li_xc + f_ch_xc + f_lig_xc);
    //Xi fractioning (same fractioning between macromolecus of Xi and f_xi*Xc)
    parameter Real f_ch_xi = 0.1 "COD fraction of carbohydrates from particulate inerts Xi [kgCOD/kgCOD]";
    parameter Real f_pr_xi = 0.55 "COD fraction of proteins from particulate inerts Xi [kgCOD/kgCOD]";
    parameter Real f_li_xi = 1 - (f_ch_xi + f_pr_xi);
    //Si fractioning
    parameter Real f_ch_si(unit = "kgCOD/kgCOD") = 0.6 "fraction of carbohydrates in Si";
    parameter Real f_pr_si(unit = "kgCOD/kgCOD") = 0.4 "fraction of proteins Si";
    parameter Real f_li_si(unit = "kgCOD/kgCOD") = 1 - f_ch_si - f_pr_si "fraction of lipids in Si";
    //Composition of bacteria
    parameter Real f_Xbiom_ch(unit = "kgCOD/kgCOD") = 0.195 "Carbohydrates content in biomass";
    parameter Real f_Xbiom_pr(unit = "kgCOD/kgCOD") = 0.8 "Proteins content in biomass";
    parameter Real f_Xbiom_li(unit = "kgCOD/kgCOD") = 1 - f_Xbiom_ch - f_Xbiom_pr "Lipids content in biomass";
    /*Declaration of COD/VS ratios and MW.
          Note: now ordered as: 1=S_su, 2=S_aa, 3=S_fa, 4=S_va, 5=S_bu, 6=S_pro, 7=S_ac, 8=S_h2, 9=S_ch4, 10=S_ic, 11=S_in, 12=S_ip, 13=S_I, 14=X_c, 15=X_ch, 16=X_pr, 17=X_li, 18=X_su, 19=X_aa, 20=X_fa, 21=X_c4, 22=X_pro, 23=X_ac, 24=X_h2, 25=X_I, 26=X_p, 27=X_lig.
          Note: declared as both default parameter values and time-varying variables. The latter used only in "Feed_Source_NIR" at the moment.*/
    parameter Real COD_VS_def[27] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, 1/(f_ch_si/COD_VS_CH + f_li_si/COD_VS_LI + f_pr_si/COD_VS_PR), 1/(f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_ch_xc/COD_VS_CH + f_xi_xc/COD_VS_def[25] + f_si_xc/COD_VS_def[13] + f_lig_xc/COD_VS_LIG), COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, 1/(f_ch_xi/COD_VS_CH + f_pr_xi/COD_VS_PR + f_li_xi/COD_VS_LI), 1.54, COD_VS_LIG} "gCOD/gVS";
    parameter Real MW_def[27] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], (1/COD_VS_def[13])*1/(f_ch_si/COD_VS_CH/MW_CH + f_li_si/COD_VS_LI/MW_LI + f_pr_si/COD_VS_PR/MW_PR), (1/COD_VS_def[14])*1/(f_pr_xc/MW_PR/COD_VS_PR + f_li_xc/MW_LI/COD_VS_LI + f_ch_xc/MW_CH/COD_VS_CH + f_xi_xc/MW_def[25]/COD_VS_def[25] + f_si_xc/MW_def[13]/COD_VS_def[13] + f_lig_xc/MW_LIG/COD_VS_LIG), MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, (1/COD_VS_def[25])*1/(f_ch_xi/MW_CH/COD_VS_CH + f_pr_xi/MW_PR/COD_VS_PR + f_li_xi/MW_LI/COD_VS_LI), 76, MW_LIG} "g/mol";
    Real COD_VS[:](start = COD_VS_def) "gCOD/gVS";
    Real MW[:](start = MW_def) "g/mol";
    annotation(
      Documentation(info = "<html><p> This record contains the stoichiometric coefficients as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_stoichiometric;

  record ParametersADM1_kinetic
    /*Declaration of kinetic parameters.*/
    /*First-order hydrolysis constants*/
    parameter Types.Kinetic_d k_dis = 1.54 "Complex particulate disintegration first order constant [1/d]";
    parameter Types.Kinetic_d k_hyd_xcr = 0.1 "First-order hydrolysis constant of readily biodegradable X_c [1/d]";
    parameter Types.Kinetic_d k_hyd_xcs = 0.01 "First-order hydrolysis constant of slowly biodegradable X_c [1/d]";
    parameter Types.Kinetic_d k_hyd_xchr = 1 "First-order hydrolysis constant of readily biodegradable X_ch [1/d]";
    parameter Types.Kinetic_d k_hyd_xchm = 0.3 "First-order hydrolysis constant of mildly biodegradable X_ch [1/d]";
    parameter Types.Kinetic_d k_hyd_xchs = 0.01 "First-order hydrolysis constant of slowly biodegradable X_ch [1/d]";
    parameter Types.Kinetic_d k_hyd_xprr = 1 "First-order hydrolysis constant of readily biodegradable X_pr [1/d]";
    parameter Types.Kinetic_d k_hyd_xprs = 0.2 "First-order hydrolysis constant of slowly biodegradable X_pr [1/d]";
    parameter Types.Kinetic_d k_hyd_xli = 0.3 "First-order hydrolysis constant of X_li[1/d]";
    final parameter Types.Kinetic_d k_hyd[8] = {k_hyd_xcr, k_hyd_xcs, k_hyd_xchr, k_hyd_xchm, k_hyd_xchs, k_hyd_xprr, k_hyd_xprs, k_hyd_xli};
    /*Maximum uptake rate*/
    parameter Types.Kinetic_d k_m_su = 8 "maximum uptake rate for monosaccharide degrading organisms [kgCODs/kgCODx/d]";
    parameter Types.Kinetic_d k_m_aa = 8 "maximum uptake rate amino acid degrading organisms [kgCODs/kgCODx/d]";
    parameter Types.Kinetic_d k_m_fa = 6 "maximum uptake rate for long chain fatty acid degrading organisms [kgCODs/kgCODx/d]";
    parameter Types.Kinetic_d k_m_c4 = 20 "maximum uptake rate for c4 degrading organisms [kgCODs/kgCODx/d]";
    parameter Types.Kinetic_d k_m_pro = 20 "maximum uptake rate for propionate degrading organisms [kgCODs/kgCODx/d]";
    parameter Types.Kinetic_d k_m_ac = 8 "maximum uptake rate for acetate degrading organisms [kgCODs/kgCODx/d]";
    parameter Types.Kinetic_d k_m_h2 = 35 "maximum uptake rate for hydrogen degrading organisms [kgCODs/kgCODx/d]";
    /*Half-saturation constants*/
    parameter SI.MassConcentration Ks_su = 0.5 "half saturation constant for monosaccharidedegradation [kgCOD/m3]";
    parameter SI.MassConcentration Ks_aa = 0.3 "half saturation constant for amino acid degradation [kgCOD/m3]";
    parameter SI.MassConcentration Ks_fa = 0.4 "half saturation constant for long chain fatty acid degrading organisms [kgCOD/m3]";
    parameter SI.MassConcentration Ks_c4 = 0.1 "half saturation constant for c4 degrading organisms [kgCOD/m3]";
    parameter SI.MassConcentration Ks_pro = 0.3 "half saturation constant for propionate degrading organisms [kgCOD/m3]";
    parameter SI.MassConcentration Ks_ac = 0.15 "half saturation constant for acetate degrading organisms [kgCOD/m3]";
    parameter SI.MassConcentration Ks_h2 = 2.5e-5 "half saturation constant for hydrogen degrading organisms [kgCOD/m3]";
    parameter Types.MolarDensity_M Ks_IN = 1e-4 "inorganic nitrogen concentration at which growth ceases [mol/L]";
    parameter Types.MolarDensity_M Ks_IP = 2e-5 "inorganic phosforous concentration at which growth ceases [mol/L]";
    /*First-order decay constants*/
    parameter Types.Kinetic_d k_dec_su = 0.02 "decay rate for monosaccharide degrading organisms [1/d]";
    parameter Types.Kinetic_d k_dec_aa = 0.02 "decay rate for amino acid degrading organisms [1/d]";
    parameter Types.Kinetic_d k_dec_fa = 0.02 "decay rate  for long chain fatty acid degrading organisms [1/d]";
    parameter Types.Kinetic_d k_dec_c4 = 0.02 "decay rate  for c4 degrading organisms [1/d]";
    parameter Types.Kinetic_d k_dec_pro = 0.02 "decay rate for propionate degrading organisms [1/d]";
    parameter Types.Kinetic_d k_dec_ac = 0.02 "decay rate  for acetate degrading organisms [1/d]";
    parameter Types.Kinetic_d k_dec_h2 = 0.02 "decay rate for hydrogen degrading organisms [1/d]";
    /*Inhibition constants*/
    parameter SI.MassConcentration Ki_h2_fa = 5e-6 "hydrogen inhibitory concentration for LCFA degrading organisms [kgCOD/m3]";
    parameter SI.MassConcentration Ki_h2_c4 = 1e-5 "hydrogen inhibitory concentration for C4 degrading organisms [kgCOD/m3]";
    parameter SI.MassConcentration Ki_h2_pro = 3.5e-6 "hydrogen inhibitory concentration for propionate degrading organisms [kgCOD/m3]";
    parameter Types.MolarDensity_M Ki_nh3_ac = 0.0018 "inhibitory free ammonia concentration for acetate degrading organisms [mol/L]";
    parameter SI.MassConcentration Ki_hac_ac = 2.2 "Haldane inhibition constant for acetate degrading organisms [kgCOD/m3]";
    parameter SI.MassConcentration Ki_hpro_pro = 2.2 "Haldane inhibition constant for acetate degrading organisms [kgCOD/m3]";
    parameter SI.PerUnit pH_UL_aa = 5.5 "pH level at where there is no inhibition of amino acid degrading organisms";
    parameter SI.PerUnit pH_LL_aa = 4 "pH level at where there is full inhibition of amino acid degrading organisms";
    parameter SI.PerUnit pH_UL_ac = 7 "pH level at where there is no inhibition of acetate degrading organisms";
    parameter SI.PerUnit pH_LL_ac = 6 "pH level at where there is full inhibition of acetate degrading organisms";
    parameter SI.PerUnit pH_UL_h2 = 6 "pH level at where there is no inhibition of hydrogen degrading organisms";
    parameter SI.PerUnit pH_LL_h2 = 5 "pH level at where there is full inhibition of hydrogen degrading organisms";
    /*Parameters for temperature correction*/
    parameter SI.Temperature T_ref_k = 308.15 "Reference temperature for kinetic parameters [K]";
    parameter SI.Temperature Tref_khyd[8] = fill(308.15, 8) "Reference temperature for first-order hydrolysis constants [K]";
    final parameter Real th_k_hyd = 0.024;
    final parameter Real th_k_m_su = 0.069;
    final parameter Real th_k_m_aa = 0.069;
    final parameter Real th_k_m_fa = 0.055;
    final parameter Real th_k_m_pro = 0.055;
    //parameter Real th_k_m_c4 = ?; not found
    final parameter Real th_k_m_ac = 0.069;
    final parameter Real th_k_m_h2 = 0.069;
    final parameter Real th_Ks_su = 0.069;
    final parameter Real th_Ks_aa = 0.069;
    final parameter Real th_Ks_fa = 0.035;
    final parameter Real th_Ks_pro = 0.10;
    //parameter Real th_Ks_c4 = ?; not found
    final parameter Real th_Ks_ac = 0.10;
    final parameter Real th_Ks_h2 = 0.08;
    final parameter Real th_k_dec_su = 0.069;
    final parameter Real th_k_dec_aa = 0.069;
    final parameter Real th_k_dec_fa = 0.055;
    final parameter Real th_k_dec_pro = 0.055;
    //parameter Real th_k_dec_c4 = ?; not found
    final parameter Real th_k_dec_ac = 0.069;
    final parameter Real th_k_dec_h2 = 0.069;
    annotation(
      Documentation(info = "<html><p> This record contains the kinetic parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_kinetic;

  record ParametersADM1_physiochemical
    /*Declaration of physicochemical parameters*/
    /*Equilibrium constants*/
    final parameter SI.PerUnit pKa_va = 4.86 "- log10Ka valerate at 298K";
    final parameter SI.PerUnit pKa_bu = 4.82 "- log10Ka butyrate at 298K";
    final parameter SI.PerUnit pKa_pro = 4.88 "- log10Ka propionate at 298K";
    final parameter SI.PerUnit pKa_ac = 4.76 "- log10Ka acetate at 298K";
    final parameter SI.PerUnit pKa_co2 = 6.37 "- log10Ka CO2 at 298K";
    final parameter SI.PerUnit pKa_hco3 = 10.33 "- log10Ka HCO3 at 298K";
    final parameter SI.PerUnit pKa_nh3 = 9.25 "- log10ka NH4+ at 298K ";
    final parameter SI.PerUnit pKa_h2o = 14 "- log10ka water at 298K ";
    final parameter SI.PerUnit pKa_h2po4 = 7.21 "-log10kaH2PO4";
    final parameter SI.PerUnit pKa_hpo4 = 12.67 "-log10kaHPO4";
    final parameter SI.PerUnit pKa_h3po4 = 2.12 "-log10kaH3PO4";
    /*Acidity constants (for which temperature correction does not apply)*/
    parameter Types.MolarDensity_M Ka_va = 10^(-pKa_va) "Valerate acidity constant without temperature correction - unit = M";
    parameter Types.MolarDensity_M Ka_bu = 10^(-pKa_bu) "Butyrate acidity constant without temperature correction - unit = M";
    parameter Types.MolarDensity_M Ka_pro = 10^(-pKa_pro) "Propionate acidity constant without temperature correction - unit = M";
    parameter Types.MolarDensity_M Ka_ac = 10^(-pKa_ac) "Acetate acidity constant without temperature correction - unit = M";
    /*Gas-liquid solubility constants*/
    final parameter Types.HenryConstant coeffHch4 = 0.0014 "Henry constant for CH4 at standard T and P [kmol/m3/bar]";
    final parameter Types.HenryConstant coeffHco2 = 0.035 "Henry constant for CO2 at standard T and P [kmol/m3/bar]";
    final parameter Types.HenryConstant coeffHh2 = 0.00078 "Henry constant for H2 at standard T and P [kmol/m3/bar]";
    constant Types.HenryConstant KH_nh3_Tref = 61 "Henry constant for ammonia at standard T and P [kmol/m3/bar]";
    constant Types.HenryConstant KH_n2_Tref = 0.00065 "Henry constant for nitrogen gas at standard T and P [kmol/m3/bar]";
    /*Enthalpy of reactions for temperature corrections*/
    parameter SI.Temperature T_ref = 298.15 "Reference temperature for pKa and enthalpy values [K]";
    constant SI.MolarEnergy deltaH0_Ka_co2 = 7646 "enthalpy of reaction CO2->HCO3";
    constant SI.MolarEnergy deltaH0_Ka_hco3 = 14900 "enthalpy of reaction HCO3->CO3";
    constant SI.MolarEnergy deltaH0_Ka_nh4 = 51965 "enthalpy of reaction NH4->NH3";
    constant SI.MolarEnergy deltaH0_Ka_h2o = 55900 "enthalpy of reaction H2O->OH+H+";
    constant SI.MolarEnergy deltaH0_KH_ch4 = -14240 "enthalpy of reaction of CH4gas->CH4liq";
    constant SI.MolarEnergy deltaH0_KH_co2 = -19410 "enthalpy of reaction of CO2gas->CO2liq";
    constant SI.MolarEnergy deltaH0_KH_h2 = -4180 "enthalpy of reaction of H2gas->H2liq";
    constant SI.MolarEnergy deltaH0_Ka_h2po4 = 4200 "enthalpy of reaction H2PO4->HPO4. To be verified!";
    constant SI.MolarEnergy deltaH0_Ka_hpo4 = 14700 "enthalpy of reaction HPO4->PO4. To be verified!";
    constant SI.MolarEnergy deltaH0_Ka_h3po4 = -41900 "enthalpy of reaction H3PO4->H2PO4. To be verified!";
    /*Mineral precipitation submodel*/
    constant SI.MolarEnergy deltaH0_Ksp_stru = -22600 "Enthalpy of reaction of struvite formation. Note: value taken from Rontenltap et al., 2007; alternative is 98.82 kJ/mol (struvite precipitation is endothermic up to 30°C and esothermic between 30-60°C)";
    constant SI.MolarEnergy deltaH0_Ksp_acp = 54000 "Enthalpy of reaction of calcium phosphate formation";
    constant SI.MolarEnergy deltaH0_Ksp_ccm = -8000 "Enthalpy of reaction of calcite formation";
    constant SI.MolarEnergy deltaH0_Ksp_mag = -20000 "Enthalpy of reaction of magnesite formation";
    final parameter SI.PerUnit pKsp_acp = 28.92 "-log10Ksp for X_acp. Value taken from IWA PCM,";
    final parameter Types.Kinetic_d kcryst_acp = 3*(24*60) "Crystalization constant for X_acp [1/d]";
    final parameter SI.PerUnit pKsp_stru = 13.6 "-log10Ksp for X_srtu. Value taken from IWA PCM, alternative in Ronteltap et al. 2007";
    final parameter Types.Kinetic_d kcryst_stru = 5*(24*60) "Crystalization constant for X_stru [1/d]";
    final parameter SI.PerUnit pKsp_ccm = 8.480 "-log10Ksp for X_ccm. Value taken from IWA PC,";
    final parameter Types.Kinetic_d kcryst_ccm = 0.35*(24*60) "Crystalization constant for X_ccm [1/d]";
    final parameter SI.PerUnit pKsp_mag = 7.46 "-log10Ksp for X_mag. Value taken from IWA PCM";
    final parameter Types.Kinetic_d kcryst_mag = 0.034*(24*60) "Crystalization constant for X_mag [1/d]. Value taken from Musvoto et al., 1999";
    annotation(
      Documentation(info = "<html><p> This record contains the physiochemical parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_physiochemical;

  record Feed_variables_NIR
    /*Declaration of parameters used ONLY in Feed_Source_NIR block model.
          Note 10.04.2026: the composition of bacteria was f_Xbiom_ch = 0.195 and f_Xbiom_pr=0.8. This is kept in the 'Settable_composites' record but it is removed from here for consistency with 'PartialDigester' model and 'ParametersADM1_stoichiometric' record.*/
    parameter Boolean liquid "if True, some transformation equations are considered. See the 'Feed_Source_NIR' block. Generally, if liquid = False some operations are not computed and the values of fixed parameters are used instead of the values from the CombiTimeTables (regardless the value of the 'steady' parameter; see 'Feed_Source_NIR' block)";
    /*Time-varying composition coefficients of composite components*/
    SI.MassFraction f_xc[6];
    SI.MassFraction f_xi[3];
    SI.MassFraction f_si[3];
    SI.MassFraction u(fixed = false, start = 0) "Moisture content in substrate [kgH20/kg]";
    SI.MassFraction v(fixed = false, start = 0) "Volatile fraction of total solids in substrate [kgVS/kgTS]";
    SI.Density d(fixed = false, start = 0) "Density of substrate [kg/m3]";
    /*From this point on, these quantities are used if the paramter 'steady' in the 'Feed_Source_NIR' block is true*/
    /*NIR-only parameters*/
    parameter SI.PerUnit protein = 0.0 "Particulate protein content [%TS]";
    parameter SI.PerUnit lipid = 0.0 "Particulate lipid content [%TS]";
    parameter SI.PerUnit starch = 0.0 "Starch content [%TS]";
    parameter SI.PerUnit hemicellulose = 0.0 "Hemicellulose content [%TS]";
    parameter SI.PerUnit cellulose = 0.0 "Cellulose content [%TS]";
    parameter SI.PerUnit adl = 0.0 "Lignin content [%TS]";
    //
    parameter SI.PerUnit bd_cell = 50 "Biodegradability quotient of cellulose [%cellulose]";
    parameter SI.PerUnit bd_hemicell = 50 "Biodegradability quotient of hemicellulose [%hemicellulose]";
    parameter SI.PerUnit bd_pr = 50 "Biodegradability quotient of particulate proteins [%proteins]";
    parameter SI.PerUnit bd_li = 50 "Biodegradability quotient of particulate lipids [%lipids]";
    parameter SI.MassFraction f_pr_s = 0.5 "Fraction of slowly biodegradable particulate proteins";
    parameter SI.MassFraction f_pr_r = 0.5 "Fraction of readily biodegradable particulate proteins";
    /*Catenacci-method and NIR parameters*/
    parameter Types.MassConcentration_g tac = 0.0 "Total alkalinity [mgCaCO3/L]";
    parameter SI.PerUnit ts = 0.0 "TS concentration in fresh matter [gTS/kgFM]";
    parameter SI.PerUnit vs_ts = 0.0 "VS content [%TS]";
    parameter Real tbmp_vs = 0.0 "Ultimate BMP of the overall VS [NmLCH4/gVS]";
  end Feed_variables_NIR;

  record Feed_variables_Direct
    /*Declaration of parameters used ONLY in Feed_Source_Direct block model.*/
    parameter SI.MassConcentration xli = 0.0 "Biodegradable particulate lipid concentration [gCOD/L]";
    parameter SI.MassConcentration xprr = 0.0 "Readily biodegradable particulate protein concentration [gCOD/L]";
    parameter SI.MassConcentration xprs = 0.0 "Slowly biodegradable particulate protein concentration [gCOD/L]";
    parameter SI.MassConcentration xi = 0.0 "Particulate inerts concentration [gCOD/L]";
    parameter SI.MassConcentration xc = 0.0 "Composite matter concentration [gCOD/L]";
    parameter SI.MassConcentration xchr = 0.0 "Readily biodegradable particulate carbohydrate concentration [gCOD/L]";
    parameter SI.MassConcentration xchm = 0.0 "Mildly biodegradable particulate carbohydrate concentration [gCOD/L]";
    parameter SI.MassConcentration xchs = 0.0 "Slowly biodegradable particulate carbohydrate concentration [gCOD/L]";
    parameter SI.MassConcentration xlig = 0.0 "Lignin concentration [gCOD/L]";
    parameter SI.MassConcentration xp = 0.0 "Dead microbial biomass concentration [gCOD/L]";
    parameter SI.MassConcentration ash = 0.0 "Ash concentration [g/L]";
  end Feed_variables_Direct;

  record Feed_variables_Catenacci
    /*Declaration of parameters and variables used in the 'Feed_Source_Catenacci' block model ONLY*/
    SI.MassFraction u(fixed = false, start = 0) "Moisture content in substrate [kgH20/kg]";
    SI.MassFraction v(fixed = false, start = 0) "Volatile fraction of total solids in substrate [kgVS/kgTS]";
    SI.Density d(fixed = false, start = 0) "Density of substrate [kg/m3]";
    SI.MassConcentration COD_VFA(fixed = false, start = 0) "Total VFA concentration in substrate as COD [kgCOD/m3]";
    SI.MassFraction alpha(fixed = false, start = 0) "Centrifuge efficiency for substrate [kgFMs/kgFM]";
    Real tCOd(fixed = false, start = 0) "Measured total COD";
    Real pCOd(fixed = false, start = 0) "Measured particulate COD";
    Real tBMP_COd(fixed = false, start = 0) "Ultimate BMP of the overall COD [NmLCH4/gCOD]";
    Real tLI_in "Total lipids concentration [g/m3]";
    SI.MassFraction fd_tCOd "Biodegradability quotient of total COD [kgCOD/kgCOD]";
    SI.MassFraction fd_pCOd "Biodegradability quotient of particulate COD [kgCOD/kgCOD]";
    Real pLI_VS_in "Particulate lipid concentration over VS [gLI/kgVS]";
    //Composition of feeding substrates
    parameter Real f_newbio_BMP = 0.08 "Substrates COD fraction resulting in new biomass during BMP tests [kgCOD/kgCOD]";
    parameter Real f_Xc_in = 0.10 "Fraction of substrate #1 COD entering the digester in the aggregated form, X_c [kgCOD/kgCOD]";
    parameter Real sCH = 0.0 "Soluble carbohydrate concentration [gGlu/m3]";
    parameter Real sPR = 0.0 "Soluble carbohydrate concentration [gN/m3 or gBSA/m3]";
    parameter Real pVS = 0.0 "Particulate VS concentration on solid fraction of the feedstock [gVSp/kgp]";
    parameter Real sVS = 0.0 "Soluble VS concentration on liquid fraction of the feedstock [gVSs/kgs]";
    parameter Real tCH = 0.0 "Total carbohydrate concentration in the feedstock [gGlu/m3]";
    parameter Real tPR = 0.0 "Total protein concentration in the feedstock [gN/kg or gBSA/kg]";
    parameter Real pLI_pVS = 0.0 "Lipid content in the VS of the solid fraction of the feedstock [gLI/kgVSp]";
    parameter Real sCOD = 0.0 "Soluble COD concentration in the feedstock [gCOD/L]";
    /*Catenacci-method and NIR parameters*/
    parameter Types.MassConcentration_g tac = 0.0 "Total alkalinity [mgCaCO3/L]";
    parameter SI.PerUnit ts = 0.0 "TS concentration in fresh matter [gTS/kgFM]";
    parameter SI.PerUnit vs_ts = 0.0 "VS content [%TS]";
    parameter Real tbmp_vs = 0.0 "Ultimate BMP of the overall VS [NmLCH4/gVS]";
  end Feed_variables_Catenacci;

  record Feed_variables_Common
    extends ParametersADM1_stoichiometric;
    /*Declaration of parameters and variables used both in 'Feed_Source_NIR/Catenacci/Direct' block models*/
    parameter Boolean steady = true "if True, CombiTimeTables are not used, and the values parameters declared here and in the other method-specic Records should be set. See, for example, the 'Feed_Source_NIR' block.";
    /*Common algebraic variables. See 'ParametersADM1_physiochemical' and 'VariablesADM1_pH' for descriptions.*/
    Types.MolarDensity_M Ka_co2(fixed = false, start = 0);
    Types.MolarDensity_M Ka_nh4(fixed = false, start = 0);
    Types.MolarDensity_M Ka_h2o(fixed = false, start = 0);
    Types.MolarDensity_M Ka_h2po4(fixed = false, start = 0);
    Types.MolarDensity_M Ka_hpo4(fixed = false, start = 0);
    Types.MolarDensity_M Ka_h3po4(fixed = false, start = 0);
    Types.MolarDensity_M Ka_hco3(fixed = false, start = 0);
    Types.MolarDensity_M S_h(fixed = false, start = 0);
    Types.MolarDensity_M S_oh(fixed = false, start = 0);
    Types.MolarDensity_M S_acm(fixed = false, start = 0);
    Types.MolarDensity_M S_prom(fixed = false, start = 0);
    Types.MolarDensity_M S_bum(fixed = false, start = 0);
    Types.MolarDensity_M S_vam(fixed = false, start = 0);
    Types.MolarDensity_M S_hpo4(fixed = false, start = 0);
    Types.MolarDensity_M S_po4(fixed = false, start = 0);
    Types.MolarDensity_M S_h2po4(fixed = false, start = 0);
    Types.MolarDensity_M S_hco3(fixed = false, start = 0);
    Types.MolarDensity_M S_co2(fixed = false, start = 0);
    Types.MolarDensity_M S_nh4(fixed = false, start = 0);
    Types.MolarDensity_M S_h3po4(fixed = false, start = 0);
    Types.MolarDensity_M S_co3(fixed = false, start = 0);
    Types.MolarDensity_M S_nh3(fixed = false, start = 0);
    SI.PerUnit pH;
    Types.MolarDensity_M Alk_mol(fixed = false, start = 0) "Total alkalinity expressed in mol/L";
    /*Common parameters*/
    parameter SI.MassConcentration aa = 0.0 "Soluble amino-acids concentration [gCOD/L]";
    parameter SI.MassConcentration ac = 0.0 "Soluble acetic acid concentration [gCOD/L]";
    parameter Types.MolarDensity_M an = 0.0 "Total anionic ion concentration [mol/L]";
    parameter SI.MassConcentration bu = 0.0 "Soluble butyric acid concentration [gCOD/L]";
    parameter Types.MolarDensity_M ca = 0.0 "Total calcium ion concentration [mol/L]";
    parameter Types.MolarDensity_M cat = 0.0 "Total cationic ion concentration [mol/L]";
    parameter SI.MassConcentration ch4 = 0.0 "Soluble CH4 concentration [gCOD/L]";
    parameter SI.MassConcentration fa = 0.0 "Soluble long-chain fatty acids concentration [gCOD/L]";
    parameter SI.MassConcentration h2 = 0.0 "Soluble H2 concentration [gCOD/L]";
    parameter Types.MolarDensity_M mg = 0.0 "Total magnesium ion concentration [mol/L]";
    parameter Types.MassConcentration_g ortop = 0.0 "Dissolved inorganic phosphorus concentration [mgP/L]";
    parameter SI.MassConcentration pro = 0.0 "Soluble propionic acid concentration [gCOD/L]";
    parameter SI.MassConcentration si = 0.0 "Soluble inerts concentration [gCOD/L]";
    parameter SI.MassConcentration su = 0.0 "Soluble sugars concentration [gCOD/L]";
    parameter Types.MassConcentration_g tan = 0.0 "Dissolved inorganic nitrogen concentration [mgN/L]";
    parameter Types.MassConcentration_g tic = 0.0 "Dissolved inorganic carbon concentration [mgC/L]";
    parameter SI.MassConcentration va = 0.0 "Soluble valeric acid concentration [gCOD/L]";
    parameter SI.MassConcentration xaa = 0.0 "Amino-acids degrading organism concentration [gCOD/L]";
    parameter SI.MassConcentration xac = 0.0 "Acetate degrading organism concentration [gCOD/L]";
    parameter SI.MassConcentration xc4 = 0.0 "C4-degrading organism concentration [gCOD/L]";
    parameter SI.MassConcentration xfa = 0.0 "Long-chain fatty acids degrading organism concentration [gCOD/L]";
    parameter SI.MassConcentration xh2 = 0.0 "H2 degrading organism concentration [gCOD/L]";
    parameter SI.MassConcentration xpro = 0.0 "Propionate degrading organism concentration [gCOD/L]";
    parameter SI.MassConcentration xsu = 0.0 "Sugars degrading organism concentration [gCOD/L]";
    parameter SI.PerUnit ph = 0.0;
  end Feed_variables_Common;

  record VariablesADM1_comparisonAM2HN
    /*Declaration of trivial algebraic variables used only to compare outputs with AM2HN-like model state variables and other quantities.*/
    SI.MassConcentration COD_tot_bd(fixed = false, start = 0) "Biodegradable COD concentration [gCOD/L]";
    SI.MassConcentration COD_tot_bd_in(fixed = false, start = 0) "Influent biodegradable COD concentration [gCOD/L]";
    SI.MassConcentration acidogens(fixed = false, start = 0) "X1 concentration [gVS/L]";
    SI.MassConcentration methanogens(fixed = false, start = 0) "X2 concentration [gVS/L]";
    SI.MassConcentration COD_s(fixed = false, start = 0) "Biodegradable CODs concentration [gCOD/L], without VFA";
    SI.MassConcentration COD_s_in(fixed = false, start = 0) "Influent biodegradable CODs concentration [gCOD/L], without VFA";
    SI.MassConcentration VS_bd_x(fixed = false, start = 0) "Volatile Solid content in the digester [gVS/L]";
    SI.MassConcentration VS_bd_x_in(fixed = false, start = 0) "Volatile Solid content in the influent [gVS/L]";
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating output aggregated variables. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2021 </em></p></html>"));
  end VariablesADM1_comparisonAM2HN;

  package Types
    type FlowRate_d = Real(final quantity = "Daily flow rate", final unit = "m3/d", final displayUnit = "m3/d");
    type Kinetic_s = Real(final quantity = "Inverse time-second", final unit = "1/s", final displayUnit = "1/s", min = 0);
    type Kinetic_d = Real(final quantity = "Inverse time-day", final unit = "1/d", final displayUnit = "1/d", min = 0);
    type MassConcRate = Real(final quantity = "COD concentration per unit time", final unit = "kg/(m3.s)", final displayUnit = "kg/(m3.d)");
    type MolConcRate = Real(final quantity = "Molar concentration per unit time", final unit = "kmol/(m3.d)", final displayUnit = "kmol/(m3.d)");
    type InvMolConcRate = Real(final quantity = "Molar concentration rate", final unit = "m3/(mol.s)", final displayUnit = "m3/(mol.s)", min = 0);
    type MassConversion = Real(final quantity = "Mass of COD per unit mass of VS", final unit = "kg/kg", final displayUnit = "kg/kg", min = 0);
    //type VStoN_conversion = Real(final quantity = "Mass of VS per unit mass of nitrogen", final unit = "kg/kg", final displayUnit = "kg/kg", min = 0);
    type Mole = Real(final quantity = "Number of moles", final unit = "mol", displayUnit = "mol", min = 0);
    type MolarContent = Real(final quantity = "Mass of carbon or nitrogen per unit mass of COD", final unit = "mol/kg", final displayUnit = "mol/kg", min = 0);
    //type N_content = Real(final quantity = "Mass of nitrogen per unit mass of COD", final unit = "mol/kg", final displayUnit = "mol/kg", min = 0);
    //type Enthalpy = Real(final quantity = "Reaction enthalpy", final unit = "J/kmol", final displayUnit = "J/kmol", min = 0) "sarebbe 100*bar*m3/kmol";
    //type ThetaCoeff = Real(final quantity = "Inverse temperature", final unit = "1/K", final displayUnit = "1/K", min = 0);
    type Inhibition = Real(final quantity = "Rate fraction", final unit = "1", final displayUnit = "1", min = 0, max = 1);
    //type Diffusivity = Real(final quantity = "Gas diffusivity in liquid-phase", final unit = "m2/s", final displayUnit = "cm2/s", min = 0);
    type MassContent = Real(final quantity = "Total Solid content in substrate unit mass", final unit = "g/kg", final displayUnit = "g/kg", min = 0);
    //type VScontent = Real(final quantity = "Volatile Solid in substrate unit mass", final unit = "g/kg", final displayUnit = "g/kg", min = 0);
    type MassConcentration_g = Real(final quantity = "Volatile Solid concentration", final unit = "g/m3", final displayUnit = "g/m3", min = 0);
    //type NConcentration = Real(final quantity = "Nitrogen concentration", final unit = "g/m3", final displayUnit = "g/m3", min = 0);
    //type TKNConcentration = Real(final quantity = "Total Kjeldahl Nitrogen concentration", final unit = "mg/kg", final displayUnit = "mg/kg", min = 0);
    type BMP = Real(final quantity = "Biochemical Methane Potential on VS basis", final unit = "l/kg", final displayUnit = "l/kg", min = 0);
    type Pressure_bar = Real(final quantity = "Pressure", final unit = "bar", final displayUnit = "bar");
    type MolarDensity_M = Real(final quantity = "MolarDensity_M", unit = "kmol/m3");
    type SatIndex = Real(final quantity = "Saturation Index", final unit = "1", final displayUnit = "1");
    type MolarDensity_M_Ksp_acp = Real(final quantity = "MolarDensity_M", unit = "kmol5/m15");
    type MolarDensity_M_Ksp_stru = Real(final quantity = "MolarDensity_M", unit = "kmol3/m9");
    //type BMP_COD = Real(final quantity = "Biochemical Methane Potential on COD basis", final unit = "l/kg", final displayUnit = "l/kg", min = 0);
    //type Alkalinity = Real(final quantity = "Alkalinity as CaCO3", final unit = "g/m3", final displayUnit = "g/m3", min = 0);
    //type MolConcentration = Real(final quantity = "Molar concentration", final unit = "mol/m3", final displayUnit = "kmol/m3", min = 0);
    //type CODConcentration = Real(final quantity = "COD concentration", final unit = "kg/m3", final displayUnit = "kg/m3", min = 0);
    //type Stoichio_CODmol = Real(final quantity = "Stoichiometric mass of COD per molar unit", final unit = "kg/mol", final displayUnit = "kg/kmol", min = 0);
    //type MassFraction_COD = Real(final quantity = "COD Mass fraction", final unit = "kg/kg", final displayUnit = "kg/kg", min = 0, max = 1);
    //type MassFraction_VS = Real(final quantity = "VS Mass fraction", final unit = "g/kg", final displayUnit = "g/kg", min = 0);
    //type COD_flowrate_s = Real(final quantity = "COD mass flowrate", final unit = "kg/s", final displayUnit = "kg/d", min = 0);
    //type MolC_flowrate_s = Real(final quantity = "Carbon molar mass flowrate", final unit = "mol/s", final displayUnit = "mol/d", min = 0);
    //type MolN_flowrate_s = Real(final quantity = "Nitrogen molar mass flowrate", final unit = "mol/s", final displayUnit = "mol/d", min = 0);
    type Species = enumeration(A, B, X);
    type FlowRate_Ld = Real(final quantity = "Daily flow rate", final unit = "dm3/d", final displayUnit = "dm3/d");
    type CODContent = Real(final quantity = "CODPerMass", final unit = "1", final displayUnit = "kg/kg", min = 0);
    type MolarDensity_M_Ksp_squared = Real(final quantity = "MolarDensity_M", unit = "kmol2/m6");
    type HenryConstant = Real(final quantity = "HenryConstant", final unit = "kmol/(m3.bar)");
    type GasConstant = Real(final quantity = "GasConstant", final unit = "bar.m3/(kmol.K)");
  end Types;

  package Icons
    partial block FeedSource1
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "CattleManure"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {93, 45, 0}, fillColor = {71, 34, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {-2, 0}, lineColor = {90, 44, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.24365, -0.168094}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {98, 47, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end FeedSource1;

    partial block FeedSource2
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "CattleSlurry"), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}), Line(origin = {-1.66045, 0.41511}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {255, 150, 75}, fillColor = {255, 150, 75}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Rectangle(origin = {-2, 0}, lineColor = {255, 150, 75}, fillColor = {255, 150, 75}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Polygon(origin = {0, 4}, lineColor = {255, 150, 75}, fillColor = {255, 150, 75}, fillPattern = FillPattern.Solid, points = {{0, -56}, {-14, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {0, -54}, {0, -56}})}));
    end FeedSource2;

    partial block FeedSource3
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "MaizeSilage"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {-2, 0}, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.24365, -0.168094}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {255, 255, 0}, fillColor = {255, 255, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end FeedSource3;

    partial block FeedingTank
      annotation(
        Icon(graphics = {Rectangle(lineColor = {98, 106, 124}, fillColor = {186, 204, 220}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-60, 80}, {60, -80}}), Rectangle(origin = {0, -90}, lineColor = {145, 145, 145}, fillColor = {222, 222, 222}, fillPattern = FillPattern.Solid, lineThickness = 0.5, borderPattern = BorderPattern.Engraved, extent = {{-80, 10}, {80, -10}}, radius = 3), Ellipse(origin = {-2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}, endAngle = 360), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Ellipse(origin = {2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}, endAngle = 360), Line(origin = {0.326594, -0.653188}, points = {{0, -34}, {0, 40}, {0, 98}}, thickness = 1), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, thickness = 0.5), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}, endAngle = 360), Ellipse(origin = {0.25, -87.49}, lineColor = {88, 88, 88}, fillColor = {159, 159, 159}, fillPattern = FillPattern.Solid, extent = {{-18.25, 11.49}, {18.25, -11.49}}, endAngle = 360), Line(origin = {-2, -89.55}, points = {{2, -9}, {8, 11}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line(origin = {-11.1441, -80.7082}, points = {{-1, 1}, {3, -3}}), Line(origin = {3.2058, -79.2899}, points = {{-3, 3}, {-3, -3}}), Line(origin = {-12.61, -85.62}, points = {{-5, -3}, {3, -3}}), Line(origin = {11.7335, -74.6764}, points = {{-3, -9}, {1, -5}}), Line(origin = {15.39, -85.62}, points = {{-5, -3}, {3, -3}})}));
    end FeedingTank;

    partial block Digester
      annotation(
        Icon(graphics = {Ellipse(origin = {0, 52}, lineColor = {154, 149, 124}, fillColor = {229, 220, 200}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-64, 36}, {64, -36}}, endAngle = 360), Polygon(origin = {-1, -24}, lineColor = {131, 65, 0}, fillColor = {214, 142, 106}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{-63, 78}, {-63, -52}, {1, -70}, {65, -52}, {65, 64}, {65, 78}, {-63, 78}}), Ellipse(lineColor = {85, 0, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}, endAngle = 360), Line(points = {{10, -36}, {2, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(origin = {0.33, -0.65}, points = {{0, -34}, {0, 40}, {0, 54}}, color = {85, 0, 0}, thickness = 1), Ellipse(origin = {2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}, endAngle = 360), Ellipse(origin = {-2.69, 0}, lineColor = {85, 0, 0}, fillColor = {189, 107, 79}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}, endAngle = 360)}));
    end Digester;

    partial block SludgeDischarge
      annotation(
        Icon(graphics = {Rectangle(origin = {2, 34}, lineColor = {127, 61, 0}, fillColor = {163, 118, 80}, fillPattern = FillPattern.Solid, extent = {{-36, -43}, {97.5, -80}}), Polygon(origin = {6, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-62, 18}, {-50, 26}, {-50, 10}, {-62, 18}}), Rectangle(origin = {-3.33, 24.67}, lineColor = {122, 122, 122}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-76.67, 1.33}, {-30.67, -6.67}}), Line(origin = {3.27, 33.8}, points = {{-34, -14}, {-30, -14}, {-24, -16}, {-20, -20}, {-16, -26}, {-12, -34}, {-12, -42}}, color = {163, 118, 80}, thickness = 1.75), Polygon(origin = {4, 24}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-72, 26}, {-72, 10}, {-60, 18}, {-72, 26}}), Line(origin = {3.97819, 21.734}, points = {{-60, 20}, {-60, 4}}, thickness = 1), Line(origin = {2.06, 33.9318}, points = {{-36, -16}, {-36, -80}, {98, -80}, {98, -8}}, thickness = 0.5)}));
    end SludgeDischarge;

    partial block GasMeter
      annotation(
        Icon(graphics = {Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Ellipse(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-12, -12}, {12, 12}}), Ellipse(fillColor = {252, 255, 184}, fillPattern = FillPattern.Solid, extent = {{-70, -70}, {70, 70}}), Line(points = {{-22.9, 32.8}, {-40.2, 57.3}}), Ellipse(fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-7, -7}, {7, 7}}), Line(points = {{-37.6, 13.7}, {-65.8, 23.9}}), Line(visible = false, points = {{55, -85}, {-60, -85}}, color = {0, 128, 255}), Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Line(points = {{22.9, 32.8}, {40.2, 57.3}}), Line(points = {{37.6, 13.7}, {65.8, 23.9}}), Line(points = {{0, 70}, {0, 40}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})));
    end GasMeter;

    partial block ProbeT
      annotation(
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Line(origin = {0.195359, 0}, points = {{50, 0}, {88, 0}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "T"), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5)}));
    end ProbeT;

    partial block ProbeP
      annotation(
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Line(origin = {0.195359, 0}, points = {{50, 0}, {88, 0}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "P"), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5)}));
    end ProbeP;

    partial block Probe_measurements
      annotation(
        Diagram(graphics = {Line(points = {{0, -50}, {0, -90}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Text(extent = {{-36, -10}, {36, -32}}, textString = "Measured"), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5)}),
        Icon(graphics = {Line(origin = {0.379794, -0.379705}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Ellipse(fillColor = {223, 223, 159}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(points = {{-50, 0}, {38, 0}}, thickness = 0.5), Line(points = {{0, -50}, {0, -90}}, thickness = 0.5), Text(extent = {{-36, -10}, {36, -32}}, textString = "Measured"), Line(points = {{-36, 34}, {-28, 26}}, thickness = 0.5), Line(points = {{34, 36}, {26, 28}}, thickness = 0.5), Line(points = {{0, 50}, {0, 38}}, thickness = 0.5), Polygon(fillPattern = FillPattern.Solid, points = {{30, 32}, {10, 24}, {24, 12}, {30, 32}}), Line(origin = {0.59813, 0.166136}, points = {{0, 0}, {26, 28}}, thickness = 0.5), Line(points = {{50, 0}, {38, 0}}, thickness = 0.5)}));
    end Probe_measurements;
  end Icons;

  package Functions
    function regSign
      input Real u;
      output Real y;
    algorithm
      y := Modelica.Fluid.Utilities.regStep(u, 1, -1);
    end regSign;

    function sqrtReg "Symmetric square root approximation with finite derivative in zero"
      extends Modelica.Icons.Function;
      input Real x;
      input Real delta = 0.01 "Range of significant deviation from sqrt(x)";
      output Real y;
    algorithm
      y := x/sqrt(sqrt(x*x + delta*delta));
      annotation(
        derivative(zeroDerivative = delta) = Functions.sqrtReg_der,
        Documentation(info = "<html>
    This function approximates sqrt(x)*sign(x), such that the derivative is finite and smooth in x=0. 
    </p>
    <p>
    <table border=1 cellspacing=0 cellpadding=2> 
    <tr><th>Function</th><th>Approximation</th><th>Range</th></tr>
    <tr><td>y = sqrtReg(x)</td><td>y ~= sqrt(abs(x))*sign(x)</td><td>abs(x) &gt;&gt delta</td></tr>
    <tr><td>y = sqrtReg(x)</td><td>y ~= x/sqrt(delta)</td><td>abs(x) &lt;&lt  delta</td></tr>
    </table>
    <p>
    With the default value of delta=0.01, the difference between sqrt(x) and sqrtReg(x) is 16% around x=0.1, 0.25% around x=0.1 and 0.0025% around x=1.
    </p> 
    </html>", revisions = "<html>
    <ul>
    <li><i>15 Mar 2005</i>
      by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
         Created. </li>
    </ul>
    </html>"));
    end sqrtReg;

    function sqrtReg_der "Derivative of sqrtReg"
      extends Modelica.Icons.Function;
      input Real x;
      input Real delta = 0.01 "Range of significant deviation from sqrt(x)";
      input Real dx "Derivative of x";
      output Real dy;
    algorithm
      dy := dx*0.5*(x*x + 2*delta*delta)/((x*x + delta*delta)^1.25);
      annotation(
        Documentation(info = "<html>
    </html>", revisions = "<html>
    <ul>
    <li><i>15 Mar 2005</i>
      by <a href=\"mailto:francesco.casella@polimi.it\">Francesco Casella</a>:<br>
         Created. </li>
    </ul>
    </html>"));
    end sqrtReg_der;

    function round
      input Real x;
      output Real result;
    algorithm
      result := if noEvent(x - floor(x) >= 0.5) then ceil(x) else floor(x);
    end round;
  end Functions;

  package Interfaces
    connector LiquidSolid_stream
      /*Stream connector used for solid-liquid mixtures (i.e. feed flows, digestate flows) It must contain all the state variables present in 'StateVariablesADM1' and 'StateVariablesADM1_mpp', with the exception for gaseous ones.
                Note: an eps-limit for the flowrate is defined as eps := relativeTolerance*min(nominal(mj.c.m_flow)) exists to avoid division by 0 when performing weighted averages in the inStream operator. Lower nominal.Q if working with different reactor scale.*/
      flow Types.FlowRate_d Q(nominal = 1e-12);
      Types.Pressure_bar pressure;
      stream SI.MassConcentration X_h2(nominal = 1e-1, min = 0);
      stream SI.MassConcentration X_i[4](each nominal = 1e-1, each min = 0);
      stream SI.MassConcentration S_su(nominal = 1e-2, min = 0);
      stream SI.MassConcentration S_aa(nominal = 1e-3, min = 0);
      stream SI.MassConcentration S_fa(nominal = 1e-2, min = 0);
      stream SI.MassConcentration S_va(nominal = 1e-3, min = 0);
      stream SI.MassConcentration S_bu(nominal = 1e-2, min = 0);
      stream SI.MassConcentration S_pro(nominal = 1e-2, min = 0);
      stream SI.MassConcentration S_ac(nominal = 1, min = 0);
      stream SI.MassConcentration S_h2(nominal = 1e-7, min = 0);
      stream SI.MassConcentration S_ch4(nominal = 1e-1, min = 0);
      stream Types.MolarDensity_M S_ic(nominal = 1e-1, min = 0);
      stream Types.MolarDensity_M S_in(nominal = 1e-2, min = 0);
      stream Types.MolarDensity_M S_ip(nominal = 1e-2, min = 0);
      stream SI.MassConcentration S_i[4](each nominal = 1e-1, each min = 0);
      stream Types.MolarDensity_M S_cat(nominal = 1e-1, min = 0);
      stream Types.MolarDensity_M S_ca(nominal = 1e-3, min = 0);
      stream Types.MolarDensity_M S_mg(nominal = 1e-5, min = 0);
      stream Types.MolarDensity_M S_an(nominal = 1e-2, min = 0);
      stream SI.MassConcentration X_c[7](each nominal = 1e-1, each min = 0) "X_c state variable decomposed in its fractions.";
      stream SI.MassConcentration X_ch[3](nominal = {1e-1, 1e-1, 1}, each min = 0);
      stream SI.MassConcentration X_pr[2](each nominal = 1e-1, each min = 0);
      stream SI.MassConcentration X_li(nominal = 1e-1, min = 0);
      stream SI.MassConcentration X_p(nominal = 1e-1, min = 0);
      stream SI.MassConcentration X_lig(nominal = 1, min = 0);
      stream SI.MassConcentration X_su(nominal = 1, min = 0);
      stream SI.MassConcentration X_aa(nominal = 1e-1, min = 0);
      stream SI.MassConcentration X_fa(nominal = 1e-1, min = 0);
      stream SI.MassConcentration X_c4(nominal = 1e-1, min = 0);
      stream SI.MassConcentration X_pro(nominal = 1e-1, min = 0);
      stream SI.MassConcentration X_ac(nominal = 1e-1, min = 0);
      stream Types.MolarDensity_M X_stru(nominal = 1e-2, min = 0);
      stream Types.MolarDensity_M X_acp(nominal = 1e-11, min = 0);
      stream Types.MolarDensity_M X_ccm(nominal = 1e-3, min = 0);
      stream Types.MolarDensity_M X_mag(nominal = 1e-9, min = 0);
      stream SI.MassConcentration ash(nominal = 1, min = 0);
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end LiquidSolid_stream;

    connector Gas_stream
      /*Stream connector used for gaseous mixtures (i.e. biogas) It must contain all the gas partial pressures present in 'VariablesADM1_bio'.
                Note: an eps-limit for the flowrate is defined as eps := relativeTolerance*min(nominal(mj.c.m_flow)) exists to avoid division by 0 when performing weighted averages in the inStream operator. Lower nominal.Q if working with different reactor scale.*/
      flow Types.FlowRate_d Q_gas_N(nominal = 1e-2);
      Types.Pressure_bar P_gas(nominal = 1);
      stream Types.Pressure_bar p_gas_h2o(nominal = 1e-1, min = 0);
      stream Types.Pressure_bar p_gas_h2(nominal = 1e-5, min = 0);
      stream Types.Pressure_bar p_gas_ch4(nominal = 1e-1, min = 0);
      stream Types.Pressure_bar p_gas_co2(nominal = 1e-1, min = 0);
      stream Types.Pressure_bar p_gas_nh3(nominal = 1e-5, min = 0);
      stream Types.Pressure_bar p_gas_n2(nominal = 1e-5, min = 0);
      annotation(
        Diagram(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}));
    end Gas_stream;
  end Interfaces;

  package BlockLibrary
    model Feed_Source_NIR
      /*Model block to tranform and cast measured/literature values of feedstock characterization into agri-AcoDM state variables.
                Note: tested on S.Antonio BTS full-scale plant, BSM2 (Flores-Alsina et al., 2016) and Catenacci et al., 2021/2024.*/
      extends ADM1_P.Feed_variables_NIR;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput Q "Feedstock flow rate (m3/d)" annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_feed "Temperature at which characterization data have been extracted/measured" annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Outlet port as agri-AcoDM state variables (bulk)" annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[26] "Inlet info port for CombiTimeTable data" annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      /*Declaration of variables that should take the value from CombiTimeTable or fixed parameters declared in the Records
                Note: to simulate a solid feedstock with fixed parameters you should set Carbonates/Phosphates/S_an_in/Ca/Mg = 0.0.
                Note: Sugars directly mapped in S_su. Soluble proteins as S_aa.*/
      Real TS_in(fixed = false, start = 0) "Concentration of TS in feedstock [gTS/kg]";
      Real VS_in(fixed = false, start = 0) "Concentration of VS in feedstock [gVS/kg]";
      Real Alk_in(fixed = false, start = 0) "Total alkalinity [mgCaCO3/L]";
      Real Ammonium_in(fixed = false, start = 0) "TAN concentration [mgN/L]";
      Real Fosfates_in(fixed = false, start = 0) "Orthophosphates concentration [mgP/L]";
      Real Ca_in(fixed = false, start = 0) "Total calcium ion concentration [mol/L]";
      Real Mg_in(fixed = false, start = 0) "Total magnesium ion concentration [mol/L]";
      Real ac_in(fixed = false, start = 0) "Total acetic acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real pro_in(fixed = false, start = 0) "Total propionic acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real bu_in(fixed = false, start = 0) "Total butyric acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real va_in(fixed = false, start = 0) "Total valeric acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real Ssu_in(fixed = false, start = 0) "Total simple sugars concentration [if Catenacci mg_i/L else gCOD/L]";
      Real Saa_in(fixed = false, start = 0) "Total amino-acids concentration [if Catenacci mg_i/L else gCOD/L]";
      Real Sfa_in(fixed = false, start = 0) "Total LCFA concentration [if Catenacci mg_i/L else gCOD/L]";
      Real tBMP_VS_in(fixed = false, start = 0) "Ultimate BMP_\infty of the overall VS [NmLCH4/gVS]";
      Real CP_in(fixed = false, start = 0) "Crude protein content [%TS]";
      Real EE_in(fixed = false, start = 0) "Ether extract content [%TS]";
      Real Cellulose_in(fixed = false, start = 0) "Cellulose content [%TS]";
      Real Hemicellulose_in(fixed = false, start = 0) "Hemicellulose content [%TS]";
      Real Lignin_in(fixed = false, start = 0) "Lignin content [%TS]";
      Real Starch_in(fixed = false, start = 0) "Starch content [%TS]";
      Real BD_pr(fixed = false, start = 0) "Biodegradability of CP_in [%CP_in]";
      Real BD_li(fixed = false, start = 0) "Biodegradability of EE_in [%EE_in]";
      Real BD_cell(fixed = false, start = 0) "Biodegradability of Cellulose_in [%Cellulose_in]";
      Real BD_hemicell(fixed = false, start = 0) "Biodegradability of Hemicellulose_in [%Hemicellulose_in]";
      /*Declaration of other internal algebraic variables*/
      Real BD_ch "Biodegradability of overall carbohydrates, %Carbohydrate";
      Real NDF_in "Neutral Detergent Fiber [%TS]";
      Real CH_in "Carbohydrate [%TS]";
      Real tBMPth_vs "Theoretical ultimate BMP_\infty of overall VS [NmLCH4/gVS]";
      Real BD_vs "Biodegradability of overall VS [%VS]";
      Real tBMPerror "Difference between BMP_\infty measured and computed from input macromolecules' biodegradabilities and theoretical BMP_\infly(s) [NmLCH4/gVS]";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Re-declaration of COD/VS and MW (dynamic compositions)*/
      COD_VS[1:12] = COD_VS_def[1:12];
      COD_VS[13] = 1/(f_si[1]/COD_VS_CH + f_si[3]/COD_VS_LI + f_si[2]/COD_VS_PR);
      COD_VS[14] = 1/(f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[1]/COD_VS_CH + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13] + f_xc[6]/COD_VS_LIG);
      COD_VS[15:24] = COD_VS_def[15:24];
      COD_VS[25] = 1/(f_xi[1]/COD_VS_CH + f_xi[2]/COD_VS_PR + f_xi[3]/COD_VS_LI);
      COD_VS[26:27] = COD_VS_def[26:27];
      MW[1:12] = MW_def[1:12];
      MW[13] = (1/COD_VS[13])*1/(f_si[1]/COD_VS_CH/MW_CH + f_si[3]/COD_VS_LI/MW_LI + f_si[2]/COD_VS_PR/MW_PR);
      MW[14] = (1/COD_VS[14])*1/(f_xc[2]/MW_PR/COD_VS_PR + f_xc[3]/MW_LI/COD_VS_LI + f_xc[1]/MW_CH/COD_VS_CH + f_xc[4]/MW[25]/COD_VS[25] + f_xc[5]/MW[13]/COD_VS[13] + f_xc[6]/MW_LIG/COD_VS_LIG);
      MW[15:24] = MW_def[15:24];
      MW[25] = (1/COD_VS[25])*1/(f_xi[1]/MW_CH/COD_VS_CH + f_xi[2]/MW_PR/COD_VS_PR + f_xi[3]/MW_LI/COD_VS_LI);
      MW[26:27] = MW_def[26:27];
/*Re-declaration of input quantities as fixed parameter or values from CombiTimeTable*/
      TS_in = if steady == true then ts else inlet[1];
      VS_in = if steady == true then vs_ts*TS_in/100 else inlet[2]*TS_in/100;
      pH = if steady == true then ph else inlet[3];
      Alk_in = if steady == true then tac else inlet[4];
      Ammonium_in = if steady == true then tan else inlet[5];
      Fosfates_in = if steady == true then ortop else inlet[6];
      Ca_in = if steady == true or liquid == false then ca else inlet[7];
      Mg_in = if steady == true or liquid == false then mg else inlet[8];
      ac_in = if steady == true then ac else inlet[9];
      pro_in = if steady == true then pro else inlet[10];
      bu_in = if steady == true then bu else inlet[11];
      va_in = if steady == true then va else inlet[12];
      Ssu_in = if steady == true then su else inlet[13];
      Saa_in = if steady == true then aa else inlet[14];
      Sfa_in = if steady == true then fa else inlet[15];
      tBMP_VS_in = if steady == true then tbmp_vs else inlet[16] "Note: to be done, introduce check with BD macromolecules";
      CP_in = if steady == true then protein else inlet[17];
      EE_in = if steady == true then lipid else inlet[18];
      Cellulose_in = if steady == true then cellulose else inlet[19];
      Hemicellulose_in = if steady == true then hemicellulose else inlet[20];
      Lignin_in = if steady == true then adl else inlet[21];
      Starch_in = if steady == true then starch else inlet[22];
      BD_pr = if steady == true then bd_pr else inlet[23];
      BD_li = if steady == true then bd_li else inlet[24];
      BD_cell = if steady == true then bd_cell else inlet[25];
      BD_hemicell = if steady == true then bd_hemicell else inlet[26];
/*Computation of overall physical properties*/
      u = 1 - TS_in/1000;
      v = VS_in/TS_in;
      d = 1/(u/1000 + (1 - u)*(v/1050 + (1 - v)/2500));
/*Computation of the other internal algebraic variables*/
      BD_ch*CH_in = 100*(Ssu_in + Starch_in + BD_cell*Cellulose_in/100 + BD_hemicell*Hemicellulose_in/100);
      NDF_in = Cellulose_in + Hemicellulose_in + Lignin_in;
      CH_in = Ssu_in + Starch_in + NDF_in;
      tBMPth_vs = (tBMPth_pr*CP_in + tBMPth_li*EE_in + tBMPth_ch*(CH_in - Ssu_in) + tBMPth_su*Ssu_in)/(VS_in*100/TS_in) "Note: this misses other variables, especially VFA";
      BD_vs = (BD_ch*CH_in + BD_pr*CP_in + BD_li*EE_in)/(VS_in*100/TS_in);
      tBMPerror = BD_vs/100*tBMPth_vs - tBMP_VS_in;
/*Computation of outlet variables*/
      outlet.Q = -Q;
/*Computation of organics*/
      outlet.S_h2 = h2;
      outlet.S_ch4 = ch4;
      outlet.S_ac = ac_in;
      outlet.S_pro = pro_in;
      outlet.S_bu = bu_in;
      outlet.S_va = va_in;
      outlet.S_su = Ssu_in*TS_in/100*COD_VS[1];
      outlet.S_aa = Saa_in*TS_in/100*COD_VS[2];
      outlet.S_fa = Sfa_in*TS_in/100*COD_VS[3];
// Computation of particulates
      outlet.X_su = xsu;
      outlet.X_aa = xaa;
      outlet.X_fa = xfa;
      outlet.X_c4 = xc4;
      outlet.X_pro = xpro;
      outlet.X_ac = xac;
      outlet.X_h2 = xh2;
      outlet.X_ch[2] = BD_hemicell*Hemicellulose_in*TS_in*COD_VS[15]/10^4;
      outlet.X_ch[1] = Starch_in*TS_in*COD_VS[15]/10^2;
      outlet.X_ch[3] = BD_cell*Cellulose_in*TS_in*COD_VS[15]/10^4;
      outlet.X_pr[2] = f_pr_s*CP_in*TS_in*BD_pr*COD_VS[16]/10^4;
      outlet.X_pr[1] = f_pr_r*CP_in*TS_in*BD_pr*COD_VS[16]/10^4;
      outlet.X_li = EE_in*TS_in*BD_li*COD_VS[17]/10^4;
      outlet.X_p = 0;
      outlet.X_lig = TS_in/100*Lignin_in*COD_VS_LIG;
// Computation of S_I entries
      outlet.S_i[end] = si;
      outlet.S_i[1] = outlet.S_i[end];
      outlet.S_i[2] = outlet.S_i[end];
      outlet.S_i[3] = outlet.S_i[end];
      f_si[1] = outlet.S_i[1]/outlet.S_i[end];
      f_si[2] = outlet.S_i[2]/outlet.S_i[end];
      f_si[3] = outlet.S_i[3]/outlet.S_i[end];
// Computation of X_c entries
      outlet.X_c[end] = 1e-10;
      outlet.X_c[1] = outlet.X_c[end];
      outlet.X_c[2] = outlet.X_c[end];
      outlet.X_c[3] = outlet.X_c[end];
      outlet.X_c[4] = outlet.X_c[end];
      outlet.X_c[5] = outlet.X_c[end];
      outlet.X_c[6] = outlet.X_c[end];
      f_xc[1] = outlet.X_c[1]/outlet.X_c[end];
      f_xc[2] = outlet.X_c[2]/outlet.X_c[end];
      f_xc[3] = outlet.X_c[3]/outlet.X_c[end];
      f_xc[4] = outlet.X_c[4]/outlet.X_c[end];
      f_xc[5] = outlet.X_c[5]/outlet.X_c[end];
      f_xc[6] = outlet.X_c[6]/outlet.X_c[end];
// Computation of X_I entries
      outlet.X_i[1] = TS_in/100*((100 - BD_cell)/100*Cellulose_in*COD_VS[15] + (100 - BD_hemicell)/100*Hemicellulose_in*COD_VS[15]);
      outlet.X_i[2] = TS_in/100*((100 - BD_pr)/100*CP_in*COD_VS[16]);
      outlet.X_i[3] = TS_in/100*((100 - BD_li)/100*EE_in*COD_VS[17]);
      outlet.X_i[end] = sum(outlet.X_i[i] for i in 1:3);
      f_xi[1] = outlet.X_i[1]/outlet.X_i[end];
      f_xi[2] = outlet.X_i[2]/outlet.X_i[end];
      f_xi[3] = outlet.X_i[3]/outlet.X_i[end];
/*Computation of inorganics*/
      Alk_mol = Alk_in/100*2/1000;
      S_hco3 = max(0, if liquid == false then outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h) else Alk_mol - (S_acm + S_prom + S_bum + S_vam) - S_oh - (outlet.S_in - S_nh4) + S_h - S_hpo4 - 2*S_po4 + S_h3po4 - 2*S_co3);
      outlet.S_ic = if liquid == false then tic/12/1000 else (S_hco3*(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h))/Ka_co2;
      outlet.S_in = Ammonium_in/14/1000;
      outlet.S_ip = Fosfates_in/30.973762/1000;
      outlet.S_an = an;
      outlet.S_cat = if liquid == false then cat else (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3;
      outlet.S_ca = Ca_in;
      outlet.S_mg = Mg_in;
      outlet.ash = TS_in - VS_in;
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      outlet.X_mag = 0;
/*Lumped charachteristics of feed.
    Note: missing X_p contribution to macromolecules. Not clear its composition.*/
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000;
      TVFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000;
      FOS_TAC = TVFA/Alk;
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*(f_ch_xb/COD_VS_CH + f_pr_xb/COD_VS_PR + f_li_xb/COD_VS_LI + f_si_xb/COD_VS[13] + f_P/COD_VS[25]) + outlet.S_su/COD_VS[1] + sum(outlet.X_ch[i] for i in 1:3)/COD_VS_CH + (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2))/COD_VS_PR + (outlet.S_fa + outlet.X_li)/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]/COD_VS[14] + outlet.X_lig/COD_VS_LIG + outlet.X_p/COD_VS[26];
      TAN = outlet.S_in*14*1000;
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig + outlet.X_p;
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_xc[4]*f_xi[1] + outlet.X_c[end]*f_xc[5]*f_si[1] + outlet.X_c[end]*f_xc[1] + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_ch_xb)/COD_VS_CH + (1/6*outlet.X_c[end] + outlet.X_lig)/COD_VS_LIG;
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xc[4]*f_xi[2] + outlet.X_c[end]*f_xc[5]*f_si[2] + outlet.X_c[end]*1/6 + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_pr_xb)/COD_VS_PR_BCA;
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xc[4]*f_xi[2] + outlet.X_c[end]*f_xc[5]*f_si[2] + outlet.X_c[end]*f_xc[2] + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_pr_xb)/COD_VS_PR/N_PR;
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_xc[4]*f_xi[3] + outlet.X_c[end]*f_xc[5]*f_si[3] + outlet.X_c[end]*f_xc[3] + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_li_xb)/COD_VS_LI;
      CH_sol = (outlet.S_su + outlet.S_i[1])/COD_VS_CH;
      PR_sol_BCA = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR_BCA;
      PR_sol_TKN = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR/N_PR;
      LI_sol = (outlet.S_fa + outlet.S_i[3])/COD_VS_LI;
/*Computation of ionic components (common with the other method-specific feedstock transformation model blocks)*/
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_feed));
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_feed));
      S_h = 10^(-pH);
      S_oh = Ka_h2o/S_h;
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac);
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro);
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu);
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va);
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4);
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4));
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h);
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS,LOG_NLS_V,LOG_STATS", s = "dassl", variableFilter = ".*"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ");
    end Feed_Source_NIR;

    model Feed_Source_Catenacci
      //Verified on S.Antonio, BSM2 e Ari
      //14.03.2024 Still to be checked COD/VS e lumped quantities
      extends ADM1_P.Feed_variables_Catenacci;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput Q "Feedstock flow rate (m3/d)" annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_feed "Temperature at which characterization data have been extracted/measured" annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Outlet port as agri-AcoDM state variables (bulk)" annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[21] "Inlet info port for CombiTimeTable data" annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      /*Declaration of variables that should take the value from CombiTimeTable or fixed parameters declared in the Records*/
      parameter Boolean TKN "if True, input proteins are considered to be expressed as gN/kgFM instead of gBSA/kgFM (e.g., sludge vs yogurt in Catenacci et al., 2024)";
      Real TS_in(fixed = false, start = 0) "Concentration of TS in feedstock [gTS/kg]";
      Real VS_in(fixed = false, start = 0) "Concentration of VS in feedstock [gVS/kg]";
      Real Alk_in(fixed = false, start = 0) "Total alkalinity [mgCaCO3/L]";
      Real Ammonium_in(fixed = false, start = 0) "TAN concentration [mgN/L]";
      Real Fosfates_in(fixed = false, start = 0) "Orthophosphates concentration [mgP/L]";
      Real Ca_in(fixed = false, start = 0) "Total calcium ion concentration [mol/L]";
      Real Mg_in(fixed = false, start = 0) "Total magnesium ion concentration [mol/L]";
      Real ac_in(fixed = false, start = 0) "Total acetic acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real pro_in(fixed = false, start = 0) "Total propionic acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real bu_in(fixed = false, start = 0) "Total butyric acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real va_in(fixed = false, start = 0) "Total valeric acid concentration [if Catenacci mg_i/L else gCOD/L]";
      Real tBMP_VS_in(fixed = false, start = 0) "Ultimate BMP_\infty of the overall VS [NmLCH4/gVS]";
      Real pVS_in(fixed = false, start = 0) "Particulate VS concentration on solid fraction of the feedstock [gVSp/kgp]";
      Real sVS_in(fixed = false, start = 0) "Soluble VS concentration on liquid fraction of the feedstock [gVSs/kgs]";
      Real tCH_in(fixed = false, start = 0) "Total carbohydrate concentration in the feedstock [gGlu/m3]";
      Real tPR_in(fixed = false, start = 0) "Total protein concentration in the feedstock [gN/kg or gBSA/kg]";
      Real pLI_pVS_in(fixed = false, start = 0) "Lipid content in the VS of the solid fraction of the feedstock [gLI/kgVSp]";
      Real sCOD_in(fixed = false, start = 0) "Soluble COD concentration in the feedstock [gCOD/L]";
      Real sCH_in(fixed = false, start = 0) "Soluble carbohydrates concentration in the feedstock [gGlu/m3]";
      Real sPR_in(fixed = false, start = 0) "Soluble protein concentration in the feedstock [gN/m3 or gBSA/m3]";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Re-declaration of COD/VS and MW (dynamic compositions)*/
      COD_VS = COD_VS_def;
      MW = MW_def;
/*Re-declaration of input quantities as fixed parameter or values from CombiTimeTable*/
      TS_in = if steady == true then ts else inlet[1];
      VS_in = if steady == true then vs_ts*TS_in/100 else inlet[2]*TS_in/100;
      pH = if steady == true then ph else inlet[3];
      Alk_in = if steady == true then tac else inlet[4];
      Ammonium_in = if steady == true then tan else inlet[5];
      Fosfates_in = if steady == true then ortop else inlet[6];
      Ca_in = if steady == true then ca else inlet[7];
      Mg_in = if steady == true then mg else inlet[8];
      ac_in = if steady == true then ac else inlet[9];
      pro_in = if steady == true then pro else inlet[10];
      bu_in = if steady == true then bu else inlet[11];
      va_in = if steady == true then va else inlet[12];
      tBMP_VS_in = if steady == true then tbmp_vs else inlet[13] "Note: to be done, introduce check with BD macromolecules";
      pVS_in = if steady == true then pVS else inlet[14];
      sVS_in = if steady == true then sVS else inlet[15];
      tCH_in = if steady == true then tCH else inlet[16];
      tPR_in = if steady == true then tPR else inlet[17];
      pLI_pVS_in = if steady == true then pLI_pVS else inlet[18];
      sCOD_in = if steady == true then sCOD else inlet[19];
      sCH_in = if steady == true then sCH else inlet[20];
      sPR_in = if steady == true then sPR else inlet[21];
//Computation of physical properties
      u = 1 - TS_in/1000;
      v = VS_in/TS_in;
      d = 1/(u/1000 + (1 - u)*(v/1050 + (1 - v)/2500));
/*Computation of the other internal algebraic variables (COD components)*/
      alpha = if pVS_in < 1e-10 then 0 else (pVS_in - VS_in)/(pVS_in - sVS_in);
      pLI_VS_in = pLI_pVS_in*(1 - alpha)*pVS_in/VS_in;
      tLI_in = pLI_VS_in*VS_in*d/1000 + outlet.S_fa*1000/COD_VS[17];
      COD_VFA = outlet.S_ac + outlet.S_pro + outlet.S_bu + outlet.S_va "gCOD/L, COD associated to VFA";
      tCOd = if TKN == true then COD_VFA + tCH_in*COD_VS[15]/1000 + (tPR_in*d/1000 - Ammonium_in)*COD_VS[16]*N_PR/1000 + tLI_in*COD_VS[17]/1000 else COD_VFA + tCH_in*COD_VS[15]/1000 + tPR_in*COD_VS_PR_BCA/1000 + tLI_in*COD_VS[17]/1000 "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOd = tCOd - COD_VFA - outlet.S_su - outlet.S_fa - outlet.S_aa "gCOD/L, particulate COD";
      tBMP_COd = tBMP_VS_in/tCOd*VS_in*d/1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
      fd_tCOd = if tBMP_COd < 1e-10 then 1 else tBMP_COd/(R*100*273.15/101325/2/32*10^6*(1 - f_newbio_BMP)) "Problema dello Yogurth: se BMP nullo, significa tutto degradabile";
      tCOd*fd_tCOd = COD_VFA + outlet.S_aa + outlet.S_su + outlet.S_fa + pCOd*fd_pCOd;
/*Computation of outlet variables*/
      outlet.Q = -Q;
/*Computation of organics*/
      outlet.S_h2 = h2;
      outlet.S_ch4 = ch4;
      outlet.S_ac = ac_in*COD_VS[7]/1000;
      outlet.S_pro = pro_in*COD_VS[6]/1000;
      outlet.S_bu = bu_in*COD_VS[5]/1000;
      outlet.S_va = va_in*COD_VS[4]/1000;
      outlet.S_su = sCH_in/1000*COD_VS[1];
      outlet.S_aa = if TKN == true then sPR_in/1000*COD_VS_PR else sPR_in/1000*COD_VS_PR_BCA;
      outlet.S_fa = max(0, sCOD_in/1000 - COD_VFA - (outlet.S_su + outlet.S_aa));
// Computation of paticulates
      outlet.X_su = xsu;
      outlet.X_aa = xaa;
      outlet.X_fa = xfa;
      outlet.X_c4 = xc4;
      outlet.X_pro = xpro;
      outlet.X_ac = xac;
      outlet.X_h2 = xh2;
      outlet.X_ch[2] = (tCH_in - sCH_in)*COD_VS[15]/1000 - (outlet.X_i[end]*f_ch_xi + outlet.X_c[end]*f_ch_xc + outlet.X_c[end]*f_xi_xc*f_ch_xi);
      outlet.X_ch[1] = 0;
      outlet.X_ch[3] = 0;
      outlet.X_pr[2] = if TKN == true then (tPR_in*d/1000 - Ammonium_in)*COD_VS_PR*N_PR/1000 - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi) else (tPR_in - sPR_in)/1000*COD_VS_PR_BCA - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi);
      outlet.X_pr[1] = 0;
      outlet.X_li = tLI_in*COD_VS[17]/1000 - outlet.S_fa - (outlet.X_i[end]*f_li_xi + outlet.X_c[end]*f_li_xc + outlet.X_c[end]*f_xi_xc*f_li_xi);
      outlet.X_p = 0;
      outlet.X_lig = 0;
// Computation of S_I entries
      outlet.S_i[end] = si;
      outlet.S_i[1] = outlet.S_i[end]*f_ch_si;
      outlet.S_i[2] = outlet.S_i[end]*f_pr_si;
      outlet.S_i[3] = outlet.S_i[end]*f_li_si;
// Computation of X_c entries
      outlet.X_c[end] = pCOd*f_Xc_in;
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
      outlet.X_c[6] = outlet.X_c[end]*f_lig_xc;
// Computation of X_I entries
      outlet.X_i[end] = pCOd*(1 - fd_pCOd) - outlet.X_c[end]*f_xi_xc;
      outlet.X_i[1] = outlet.X_i[end]*f_ch_xi;
      outlet.X_i[2] = outlet.X_i[end]*f_pr_xi;
      outlet.X_i[3] = outlet.X_i[end]*f_li_xi;
/*Computation of inorganics*/
      Alk_mol = Alk_in/100*2/1000;
      S_hco3 = if Alk_in < 1e-10 then outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h) else Alk_mol - (S_acm + S_prom + S_bum + S_vam) - S_oh - (outlet.S_in - S_nh4) + S_h - S_hpo4 - 2*S_po4 + S_h3po4 - 2*S_co3;
      outlet.S_ic = if Alk_in < 1e-10 then tic/12/1000 else (S_hco3*(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h))/Ka_co2;
      outlet.S_in = Ammonium_in/14/1000;
      outlet.S_ip = Fosfates_in/31/1000;
      outlet.S_an = an;
      outlet.S_cat = (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3;
      outlet.S_ca = ca;
      outlet.S_mg = mg;
      outlet.ash = TS_in - VS_in;
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      outlet.X_mag = 0;
/*Lumped charachteristics of feed.
    Note: missing X_p contribution to macromolecules. Not clear its composition.*/
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000;
      TVFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000;
      FOS_TAC = TVFA/Alk;
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_li/COD_VS_LI + outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3))/COD_VS_CH + outlet.S_aa/COD_VS[2] + sum(outlet.X_pr[2] for i in 1:2)/COD_VS_PR + outlet.S_fa/COD_VS[3] + outlet.X_li/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13] + f_lig_xc/COD_VS_LIG);
      TAN = outlet.S_in*14*1000;
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig;
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_xi_xc*f_ch_xi + outlet.X_c[end]*f_si_xc*f_ch_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (outlet.X_lig + outlet.X_c[end]*f_lig_xc)/COD_VS_LIG;
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA;
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_pr_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR;
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_xi_xc*f_li_xi + outlet.X_c[end]*f_si_xc*f_li_si + outlet.X_c[end]*f_li_xc + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS_LI;
      CH_sol = (outlet.S_su + outlet.S_i[1])/COD_VS_CH;
      PR_sol_BCA = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR_BCA;
      PR_sol_TKN = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR/N_PR;
      LI_sol = (outlet.S_fa + outlet.S_i[3])/COD_VS_LI;
/*Computation of ionic components (common with the other method-specific feedstock transformation model blocks)*/
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_feed));
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_feed));
      S_h = 10^(-pH);
      S_oh = Ka_h2o/S_h;
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac);
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro);
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu);
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va);
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4);
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4));
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h);
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Catenacci;

    model Feed_Source_Direct
      /*Model block to tranform and cast measured/literature values of feedstock characterization into agri-AcoDM state variables.
                Note: tested on S.Antonio BTS full-scale plant, BSM2 (Flores-Alsina et al., 2016) and Catenacci et al., 2021/2024.*/
      extends ADM1_P.Feed_variables_Direct;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput Q "Feedstock flow rate (m3/d)" annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_feed "Temperature at which characterization data have been extracted/measured" annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Outlet port as agri-AcoDM state variables (bulk)" annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[31] "Inlet info port for CombiTimeTable data" annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      /*Declaration of variables that should take the value from CombiTimeTable or fixed parameters declared in the Records
                Note: S_an_in = 0 in Flores-Alsina et al., 2016.*/
      parameter Boolean inputpH "If True, the pH value is used to compute the 'S_cat' value instead of the 'cat' fixed parameter";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Re-declaration of COD/VS and MW (dynamic compositions)*/
      COD_VS = COD_VS_def;
      MW = MW_def;
/*Computation of outlet variables*/
      outlet.Q = -Q;
/*Computation of organics*/
      outlet.S_h2 = if steady == true then h2 else inlet[8];
      outlet.S_ch4 = if steady == true then ch4 else inlet[9];
      outlet.X_su = if steady == true then xsu else inlet[18];
      outlet.X_aa = if steady == true then xaa else inlet[19];
      outlet.X_fa = if steady == true then xfa else inlet[20];
      outlet.X_c4 = if steady == true then xc4 else inlet[21];
      outlet.X_pro = if steady == true then xpro else inlet[22];
      outlet.X_ac = if steady == true then xac else inlet[23];
      outlet.X_h2 = if steady == true then xh2 else inlet[24];
      outlet.S_ac = if steady == true then ac else inlet[7];
      outlet.S_pro = if steady == true then pro else inlet[6];
      outlet.S_bu = if steady == true then bu else inlet[5];
      outlet.S_va = if steady == true then va else inlet[4];
      outlet.S_su = if steady == true then su else inlet[1];
      outlet.S_aa = if steady == true then aa else inlet[2];
      outlet.S_fa = if steady == true then fa else inlet[3];
// Computation of particulates
      outlet.X_ch[2] = if steady == true then xchm else inlet[15];
      outlet.X_ch[1] = xchr;
      outlet.X_ch[3] = xchs;
      outlet.X_pr[2] = if steady == true then xprs else inlet[16];
      outlet.X_pr[1] = xprr;
      outlet.X_li = if steady == true then xli else inlet[17];
      outlet.X_p = xp;
      outlet.X_lig = xlig;
// Computation of S_I entries
      outlet.S_i[end] = if steady == true then si else inlet[13];
      outlet.S_i[1] = outlet.S_i[end]*f_ch_si;
      outlet.S_i[2] = outlet.S_i[end]*f_pr_si;
      outlet.S_i[3] = outlet.S_i[end]*f_li_si;
// Computation of X_c entries
      outlet.X_c[end] = if steady == true then xc else inlet[14];
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
      outlet.X_c[6] = outlet.X_c[end]*f_lig_xc;
// Computation of X_I entries
      outlet.X_i[end] = if steady == true then xi else inlet[25];
      outlet.X_i[1] = outlet.X_i[end]*f_ch_xi;
      outlet.X_i[2] = outlet.X_i[end]*f_pr_xi;
      outlet.X_i[3] = outlet.X_i[end]*f_li_xi;
/* Computation of inorganics*/
      pH = ph;
      S_hco3 = outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h);
      outlet.S_ic = if steady == true then tic/12/1000 else inlet[10]/12/1000;
      outlet.S_in = if steady == true then tan/14/1000 else inlet[11]/14/1000;
      outlet.S_ip = if steady == true then ortop/31/1000 else inlet[12]/31/1000;
      outlet.S_an = if steady == true then an else inlet[29];
      outlet.S_cat = if inputpH == true then (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 elseif steady == true and inputpH == false then cat else inlet[28];
      outlet.S_ca = if steady == true then ca else inlet[30];
      outlet.S_mg = if steady == true then mg else inlet[31];
      outlet.ash = ash;
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      outlet.X_mag = 0;
      Alk_mol = S_hco3 + (S_acm + S_prom + S_bum + S_vam) + S_oh + (outlet.S_in - S_nh4) - S_h + S_hpo4 + 2*S_po4 - S_h3po4 + 2*S_co3;
/*Lumped charachteristics of feed.
    Note: missing X_p contribution to macromolecules. Not clear its composition.*/
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000;
      TVFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000;
      FOS_TAC = TVFA/Alk;
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*(f_ch_xb/COD_VS_CH + f_pr_xb/COD_VS_PR + f_li_xb/COD_VS_LI + f_si_xb/COD_VS[13] + f_P/COD_VS[25]) + outlet.S_su/COD_VS[1] + sum(outlet.X_ch[i] for i in 1:3)/COD_VS_CH + (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2))/COD_VS_PR + (outlet.S_fa + outlet.X_li)/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]/COD_VS[14] + outlet.X_lig/COD_VS_LIG + outlet.X_p/COD_VS[26];
      TAN = outlet.S_in*14*1000;
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig + outlet.X_p;
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_xi_xc*f_ch_xi + outlet.X_c[end]*f_si_xc*f_ch_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (1/6*outlet.X_c[end] + outlet.X_lig)/COD_VS_LIG;
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*1/6 + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA;
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_pr_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR;
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_xi_xc*f_li_xi + outlet.X_c[end]*f_si_xc*f_li_si + outlet.X_c[end]*f_li_xc + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS_LI;
/*Computation of ionic components (common with the other method-specific feedstock transformation model blocks)*/
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_feed));
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_feed));
      S_h = 10^(-pH);
      S_oh = Ka_h2o/S_h;
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac);
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro);
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu);
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va);
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4);
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4));
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h);
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Direct;

    model Feed_Source_Water
      //Verified on S.Antonio, BSM2 e Ari
      //On 24.10.2023: lignin was missing in VS calculation. Wrong parameters were associated with Xch[1] and Xch[3]
      //Copied on 14.03.2024 from "ADM1_X" (version with batch)
      extends ADM1_P.Feed_variables_Direct;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput Q "Feedstock flow rate (m3/d)" annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_feed "Temperature at which characterization data have been extracted/measured" annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Outlet port as agri-AcoDM state variables (bulk)" annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      /*Declaration of variables that should take the value from CombiTimeTable or fixed parameters declared in the Records*/
      parameter Boolean inputpH;
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Re-declaration of COD/VS and MW (dynamic compositions)*/
      COD_VS = COD_VS_def;
      MW = MW_def;
/*Computation of outlet variables*/
      outlet.Q = -Q;
/*Computation of organics*/
      outlet.S_h2 = h2;
      outlet.S_ch4 = ch4;
      outlet.S_ac = ac;
      outlet.S_pro = pro;
      outlet.S_bu = bu;
      outlet.S_va = va;
      outlet.S_su = su;
      outlet.S_aa = aa;
      outlet.S_fa = fa;
// Computation of particulates
      outlet.X_su = xsu;
      outlet.X_aa = xaa;
      outlet.X_fa = xfa;
      outlet.X_c4 = xc4;
      outlet.X_pro = xpro;
      outlet.X_ac = xac;
      outlet.X_h2 = xh2;
      outlet.X_ch[2] = xchm;
      outlet.X_ch[1] = xchr;
      outlet.X_ch[3] = xchs;
      outlet.X_pr[2] = xprs;
      outlet.X_pr[1] = xprr;
      outlet.X_li = xli;
      outlet.X_p = xp;
      outlet.X_lig = xlig;
// Computation of S_I entries
      outlet.S_i[end] = si;
      outlet.S_i[1] = outlet.S_i[end]*f_ch_si;
      outlet.S_i[2] = outlet.S_i[end]*f_pr_si;
      outlet.S_i[3] = outlet.S_i[end]*f_li_si;
// Computation of X_c entries
      outlet.X_c[end] = xc;
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
      outlet.X_c[6] = outlet.X_c[end]*f_lig_xc;
// Computation of X_I entries
      outlet.X_i[end] = xi;
      outlet.X_i[1] = outlet.X_i[end]*f_ch_xi;
      outlet.X_i[2] = outlet.X_i[end]*f_pr_xi;
      outlet.X_i[3] = outlet.X_i[end]*f_li_xi;
/*Computation of inorganics*/
      pH = ph;
      S_hco3 = outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h);
      outlet.S_ic = tic/12/1000;
      outlet.S_in = tan/14/1000;
      outlet.S_ip = ortop/31/1000;
      outlet.S_an = an;
      outlet.S_cat = if inputpH == true then (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 else cat;
      outlet.S_ca = ca;
      outlet.S_mg = mg;
      outlet.ash = ash;
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      outlet.X_mag = 0;
      Alk_mol = S_hco3 + (S_acm + S_prom + S_bum + S_vam) + S_oh + (outlet.S_in - S_nh4) - S_h + S_hpo4 + 2*S_po4 - S_h3po4 + 2*S_co3;
/*Lumped charachteristics of feed.
    Note: missing X_p contribution to macromolecules. Not clear its composition.*/
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000;
      TVFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000;
      FOS_TAC = TVFA/Alk;
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*(f_ch_xb/COD_VS_CH + f_pr_xb/COD_VS_PR + f_li_xb/COD_VS_LI + f_si_xb/COD_VS[13] + f_P/COD_VS[25]) + outlet.S_su/COD_VS[1] + sum(outlet.X_ch[i] for i in 1:3)/COD_VS_CH + (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2))/COD_VS_PR + (outlet.S_fa + outlet.X_li)/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]/COD_VS[14] + outlet.X_lig/COD_VS_LIG + outlet.X_p/COD_VS[26];
      TAN = outlet.S_in*14*1000;
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig + outlet.X_p;
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_xi_xc*f_ch_xi + outlet.X_c[end]*f_si_xc*f_ch_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (1/6*outlet.X_c[end] + outlet.X_lig)/COD_VS_LIG;
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*1/6 + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA;
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_pr_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR;
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_xi_xc*f_li_xi + outlet.X_c[end]*f_si_xc*f_li_si + outlet.X_c[end]*f_li_xc + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS_LI;
      CH_sol = (outlet.S_su + outlet.S_i[1])/COD_VS_CH;
      PR_sol_BCA = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR_BCA;
      PR_sol_TKN = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR/N_PR;
      LI_sol = (outlet.S_fa + outlet.S_i[3])/COD_VS_LI;
/*Computation of ionic components (common with the other method-specific feedstock transformation model blocks)*/
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_feed));
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_feed));
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_feed));
      S_h = 10^(-pH);
      S_oh = Ka_h2o/S_h;
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac);
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro);
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu);
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va);
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4);
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4));
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h);
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Water;

    partial model PartialDigester
      /*Block model that contains the actual DAE system of the agri-AcoDM model.
                Note 07/08/2023: Introduction of Haldane term of r11.
                Note 28/01/2024: Introduced S_gas_n2 for gasbag modelling.
                Note 29.07.2025: 'S_gas_h2o' and 'rt_h2o' added to model 'Q_gas' when no external controller of 'P_gas' is present (latter set to target values directly.)*/
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.StateVariablesADM1;
      extends ADM1_P.VariablesADM1_bio;
      extends ADM1_P.VariablesADM1_mpp;
      extends ADM1_P.VariablesADM1_pH;
      extends ADM1_P.Lumped_variables;
      extends ADM1_P.VariablesADM1_comparisonAM2HN;
      Modelica.Blocks.Interfaces.RealInput T_op "Operating temperature of the reactor" annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      /*Boolean parameters that should be set by the user*/
      parameter Boolean ideality "if True, pH submodel considers acid-base equilibrium ideality";
      parameter Boolean precipitation "if True, mineral precipitation and dissolution can have rates different than 0";
      parameter Boolean noXc "if True, simplify some computations when X_c is not of interest";
      /*Additional variables*/
      input Real flush_flow(start = 0) "N2 flow rate to flush the headspace [mol/m3.d]";
      Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 0, falling = 604800, nperiod = 1, offset = 0, period = 60480000, rising = 604800, startTime = 1209600, width = 604800) "Block to model a disturbance on the k_m_ac value. See DOI: 10.1109/CDC57313.2025.11312886" annotation(
        Placement(visible = true, transformation(origin = {-198, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Re-declaration of COD/VS and MW (dynamic compositions)*/
      COD_VS[1:12] = COD_VS_def[1:12];
      COD_VS[13] = 1/(f_si[1]/COD_VS_CH + f_si[3]/COD_VS_LI + f_si[2]/COD_VS_PR);
      COD_VS[14] = 1/(f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[1]/COD_VS_CH + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13] + f_xc[6]/COD_VS_LIG);
      COD_VS[15:24] = COD_VS_def[15:24];
      COD_VS[25] = 1/(f_xi[1]/COD_VS_CH + f_xi[2]/COD_VS_PR + f_xi[3]/COD_VS_LI);
      COD_VS[26:27] = COD_VS_def[26:27];
      MW[1:12] = MW_def[1:12];
      MW[13] = (1/COD_VS[13])*1/(f_si[1]/COD_VS_CH/MW_CH + f_si[3]/COD_VS_LI/MW_LI + f_si[2]/COD_VS_PR/MW_PR);
      MW[14] = (1/COD_VS[14])*1/(f_xc[2]/MW_PR/COD_VS_PR + f_xc[3]/MW_LI/COD_VS_LI + f_xc[1]/MW_CH/COD_VS_CH + f_xc[4]/MW[25]/COD_VS[25] + f_xc[5]/MW[13]/COD_VS[13] + f_xc[6]/MW_LIG/COD_VS_LIG);
      MW[15:24] = MW_def[15:24];
      MW[25] = (1/COD_VS[25])*1/(f_xi[1]/MW_CH/COD_VS_CH + f_xi[2]/MW_PR/COD_VS_PR + f_xi[3]/MW_LI/COD_VS_LI);
      MW[26:27] = MW_def[26:27];
/*Composite fractioning from feed mixing and consequent elemental compositions*/
      for i in 1:6 loop
        f_xc[i] = if noEvent(noXc == true) then 1/6 else X_c_in[i]/X_c_in[end];
      end for;
      for i in 1:3 loop
        f_xi[i] = if noEvent(X_i_in[end] - 0 < 1e-10) then 1/3 else X_i_in[i]/X_i_in[end];
      end for;
      for i in 1:3 loop
        f_si[i] = if noEvent(S_i_in[end] - 0 < 1e-10) then 1/3 else S_i_in[i]/S_i_in[end];
      end for;
      i_XI = {i_CH[1]*f_xi[1] + i_PR[1]*f_xi[2] + i_LI[1]*f_xi[3], 0, 0, i_PR[4]*f_xi[2], i_LI[5]*f_xi[3]};
      i_SI = {i_CH[1]*f_si[1] + i_PR[1]*f_si[2] + i_LI[1]*f_si[3], 0, 0, i_PR[4]*f_si[2], i_LI[5]*f_si[3]};
      i_XC = {f_xc[3]*i_LI[1] + f_xc[2]*i_PR[1] + f_xc[1]*i_CH[1] + f_xc[4]*i_XI[1] + f_xc[5]*i_SI[1] + f_xc[6]*i_LIG[1], 0, 0, f_xc[2]*i_PR[4] + f_xc[4]*i_XI[4] + f_xc[5]*i_SI[4], f_xc[3]*i_LI[5] + f_xc[4]*i_XI[5] + f_xc[5]*i_SI[5]};
/*-------------------------------------------------*/
/*Computation of temperature-dependent parameters*/
      for i in 1:size(k_hyd, 1) loop
        k_hyd_T[i] = k_hyd[i]*exp(th_k_hyd*(T_op - Tref_khyd[i]));
      end for;
//Acidity constants with temperature correction
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op));
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op));
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op));
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op));
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op));
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op));
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op));
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op));
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op));
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op));
      KH_nh3 = KH_nh3_Tref;
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op));
//Kinetic
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = (k_m_ac - trapezoid.y)*exp(th_k_m_ac*(T_op - T_ref_k));
      k_m_h2_T = k_m_h2*exp(th_k_m_h2*(T_op - T_ref_k));
      Ks_su_T = Ks_su*exp(th_Ks_su*(T_op - T_ref_k));
      Ks_aa_T = Ks_aa*exp(th_Ks_aa*(T_op - T_ref_k));
      Ks_fa_T = Ks_fa*exp(th_Ks_fa*(T_op - T_ref_k));
      Ks_pro_T = Ks_pro*exp(th_Ks_pro*(T_op - T_ref_k));
//Ks_c4_T = Ks_c4 * exp(th_Ks_c4*(T_op - T_ref_k)); not found
      Ks_ac_T = Ks_ac*exp(th_Ks_ac*(T_op - T_ref_k));
      Ks_h2_T = Ks_h2*exp(th_Ks_h2*(T_op - T_ref_k));
      k_dec_su_T = k_dec_su*exp(th_k_dec_su*(T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa*exp(th_k_dec_aa*(T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa*exp(th_k_dec_fa*(T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro*exp(th_k_dec_pro*(T_op - T_ref_k));
//k_dec_c4_T = k_dec_c4 * exp(th_k_dec_c4*(T_op - T_ref_k)); not found
      k_dec_ac_T = k_dec_ac*exp(th_k_dec_ac*(T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2*exp(th_k_dec_h2*(T_op - T_ref_k));
/*-------------------------------------------------*/
/*Biological submodel*/
//Inhibitions and limitations
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0;
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0;
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0;
      I_in_lim = 1/(1 + Ks_IN/S_in);
      I_ip_lim = 1/(1 + Ks_IP/S_ip);
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa);
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4);
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro);
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac);
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
      I_hald_ac = k_m_ac_T*S_ac/(S_ac + Ks_ac_T + S_ac^2/Ki_hac_ac);
      I_hald_pro = k_m_pro_T*S_pro/(S_pro + Ks_pro_T + S_pro^2/Ki_hpro_pro);
//Inorganic carbon stoichiometric coefficients on rates
      v1 = (-i_XC[1]) + f_xc[5]*i_SI[1] + f_xc[1]*i_CH[1] + f_xc[2]*i_PR[1] + f_xc[3]*i_LI[1] + f_xc[4]*i_XI[1] + f_xc[6] + i_LIG[1];
      v2 = (-i_CH[1]) + C_su;
      v3 = (-i_PR[1]) + i_PR[1];
      v4 = (-i_LI[1]) + (1 - f_fa_li)*C_su + f_fa_li*C_fa;
      v5 = (-C_su) + (1 - Y_su)*(f_bu_su*C_bu + f_pro_su*C_pro + f_ac_su*C_ac) + Y_su*i_BM[1];
      v6 = (-i_PR[1]) + (1 - Y_aa)*(f_va_aa*C_va + f_bu_aa*C_bu + f_pro_aa*i_PR[1] + f_ac_aa*i_PR[1]) + Y_aa*i_BM[1];
      v7 = (-C_fa) + (1 - Y_fa)*0.7*C_ac + Y_fa*i_BM[1];
      v8 = (-C_va) + (1 - Y_c4)*0.54*C_pro + (1 - Y_c4)*0.31*C_ac + Y_c4*i_BM[1];
      v9 = (-C_bu) + (1 - Y_c4)*0.8*C_ac + Y_c4*i_BM[1];
      v10 = (-C_pro) + (1 - Y_pro)*0.57*C_ac + Y_pro*i_BM[1];
      v11 = (-C_ac) + (1 - Y_ac)*C_ch4 + Y_ac*i_BM[1];
      v12 = (1 - Y_h2)*C_ch4 + Y_h2*i_BM[1];
      v13 = (-i_BM[1]) + i_PR[1]*f_pr_xb + i_CH[1]*f_ch_xb + i_LI[1]*f_li_xb + i_XP[1]*f_P + i_SI[1]*f_si_xb;
      n1 = (i_XC[4] - f_xc[4]*i_XI[4] - f_xc[5]*i_SI[4] - f_xc[2]*i_PR[4]);
      n6 = (i_PR[4] - Y_aa*i_BM[4]);
      n13 = (i_BM[4] - i_XP[4]*f_P - i_SI[4]*f_si_xb - i_PR[4]*f_pr_xb);
//Biochemical process rates
      r1 = if noEvent(noXc == true) then 0 else k_dis*X_c;
      for i in 1:3 loop
        r2[i] = k_hyd_T[i + 2]*X_ch[i];
      end for;
      for i in 1:2 loop
        r3[i] = k_hyd_T[i + 5]*X_pr[i];
      end for;
      r4 = k_hyd_T[8]*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4*S_va/(S_va + Ks_c4)*X_c4*S_va/(S_bu + S_va + 1e-6)*I_8;
      r9 = k_m_c4*S_bu/(S_bu + Ks_c4)*X_c4*S_bu/(S_bu + S_va + 1e-6)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T + S_pro^2/Ki_hpro_pro)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T + S_ac^2/Ki_hac_ac)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
      rate_overall_Sic = -(v1*r1 + v2*sum(r2[i] for i in 1:size(r2, 1)) + v3*sum(r3[i] for i in 1:size(r3, 1)) + v4*r4 + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19));
//Gas transfer rates
      rt8 = kla_h2*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla_ch4*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla_co2*(S_co2 - KH_co2*p_gas_co2);
      rt12 = kla_nh3*(S_nh3 - KH_nh3*p_gas_nh3);
      rt_h2o = S_gas_h2o*Q_gas/V_liq;
//Particulate matter
      24*3600*der(X_c) = Q/V_liq*(X_c_in[end] - X_c) - r1;
      24*3600*der(X_p) = Q/V_liq*(X_p_in - X_p) + f_P*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_ch[1]) = Q/V_liq*(X_ch_in[1] - X_ch[1]) - r2[1];
      24*3600*der(X_ch[3]) = Q/V_liq*(X_ch_in[3] - X_ch[3]) - r2[3];
      24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + f_xc[1]*r1 + f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_pr[1]) = Q/V_liq*(X_pr_in[1] - X_pr[1]) - r3[1];
      24*3600*der(X_pr[2]) = Q/V_liq*(X_pr_in[2] - X_pr[2]) - r3[2] + f_xc[2]*r1 + f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li) = Q/V_liq*(X_li_in - X_li) - r4 + f_xc[3]*r1 + f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i) = Q/V_liq*(X_i_in[end] - X_i) + f_xc[4]*r1;
//Soluble matter
      24*3600*der(S_i) = Q/V_liq*(S_i_in[end] - S_i) + f_si_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + f_xc[5]*r1;
      24*3600*der(S_su) = Q/V_liq*(S_su_in - S_su) + sum(r2[i] for i in 1:size(r2, 1)) + (1 - f_fa_li)*r4 - r5;
      24*3600*der(S_aa) = Q/V_liq*(S_aa_in - S_aa) + sum(r3[i] for i in 1:size(r3, 1)) - r6;
      24*3600*der(S_fa) = Q/V_liq*(S_fa_in - S_fa) + f_fa_li*r4 - r7;
      24*3600*der(S_va) = Q/V_liq*(S_va_in - S_va) + (1 - Y_aa)*f_va_aa*r6 - r8;
      24*3600*der(S_bu) = Q/V_liq*(S_bu_in - S_bu) + (1 - Y_su)*f_bu_su*r5 + (1 - Y_aa)*f_bu_aa*r6 - r9;
      24*3600*der(S_pro) = Q/V_liq*(S_pro_in - S_pro) + (1 - Y_su)*f_pro_su*r5 + (1 - Y_aa)*f_pro_aa*r6 + (1 - Y_c4)*0.54*r8 - r10;
      24*3600*der(S_ac) = Q/V_liq*(S_ac_in - S_ac) + (1 - Y_su)*f_ac_su*r5 + (1 - Y_aa)*f_ac_aa*r6 + (1 - Y_fa)*0.7*r7 + (1 - Y_c4)*0.31*r8 + (1 - Y_c4)*0.8*r9 + (1 - Y_pro)*0.57*r10 - r11;
      24*3600*der(S_h2) = Q/V_liq*(S_h2_in - S_h2) + (1 - Y_su)*f_h2_su*r5 + (1 - Y_aa)*f_h2_aa*r6 + (1 - Y_fa)*0.3*r7 + (1 - Y_c4)*0.15*r8 + (1 - Y_c4)*0.2*r9 + (1 - Y_pro)*0.43*r10 - r12 - rt8;
      24*3600*der(S_ch4) = Q/V_liq*(S_ch4_in - S_ch4) + (1 - Y_ac)*r11 + (1 - Y_h2)*r12 - rt9;
      24*3600*der(S_ic) = Q/V_liq*(S_ic_in - S_ic) - (v1*r1 + v2*sum(r2[i] for i in 1:size(r2, 1)) + v3*sum(r3[i] for i in 1:size(r3, 1)) + v4*r4 + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10 - (rp3 - rd3)*24*60 - (rp4 - rd4)*24*60;
      24*3600*der(S_in) = Q/V_liq*(S_in_in - S_in) - Y_su*i_BM[4]*r5 + n6*r6 - Y_fa*i_BM[4]*r7 - Y_c4*i_BM[4]*r8 - Y_c4*i_BM[4]*r9 - Y_pro*i_BM[4]*r10 - Y_ac*i_BM[4]*r11 - Y_h2*i_BM[4]*r12 + n13*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + n1*r1 - (rp2 - rd2)*24*60 - rt12;
      24*3600*der(S_ip) = Q/V_liq*(S_ip_in - S_ip) + i_LI[5]*r4 - Y_su*i_BM[5]*r5 - Y_aa*i_BM[5]*r6 - Y_fa*i_BM[5]*r7 - Y_c4*i_BM[5]*r8 - Y_c4*i_BM[5]*r9 - Y_pro*i_BM[5]*r10 - Y_ac*i_BM[5]*r11 - Y_h2*i_BM[5]*r12 + (i_BM[5] - i_XP[5]*f_P - i_SI[5]*f_si_xb - i_LI[5]*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (i_XC[5] - f_xc[4]*i_XI[5] - f_xc[5]*i_SI[5] - f_xc[3]*i_LI[5])*r1 - 2*(rp1 - rd1)*24*60 - (rp2 - rd2)*24*60;
//Biomasses
      24*3600*der(X_su) = Q/V_liq*(X_su_in - X_su) + Y_su*r5 - r13;
      24*3600*der(X_aa) = Q/V_liq*(X_aa_in - X_aa) + Y_aa*r6 - r14;
      24*3600*der(X_fa) = Q/V_liq*(X_fa_in - X_fa) + Y_fa*r7 - r15;
      24*3600*der(X_c4) = Q/V_liq*(X_c4_in - X_c4) + Y_c4*r8 + Y_c4*r9 - r16;
      24*3600*der(X_pro) = Q/V_liq*(X_pro_in - X_pro) + Y_pro*r10 - r17;
      24*3600*der(X_ac) = Q/V_liq*(X_ac_in - X_ac) + Y_ac*r11 - r18;
      24*3600*der(X_h2) = Q/V_liq*(X_h2_in - X_h2) + Y_h2*r12 - r19;
//Inorganics
      24*3600*der(S_cat) = Q/V_liq*(S_cat_in - S_cat);
      24*3600*der(S_ca) = Q/V_liq*(S_ca_in - S_ca) - 3*(rp1 - rd1)*24*60 - (rp3 - rd3)*24*60;
      24*3600*der(S_mg) = Q/V_liq*(S_mg_in - S_mg) - (rp2 - rd2)*24*60 - (rp4 - rd4)*24*60;
      24*3600*der(S_an) = Q/V_liq*(S_an_in - S_an);
      24*3600*der(ash) = Q/V_liq*(ash_in - ash);
      24*3600*der(X_lig) = Q/V_liq*(X_lig_in - X_lig) + f_xc[6]*r1;
//Gas phase
      24*3600*der(S_gas_h2) = (-S_gas_h2*Q_gas/V_gas) + rt8*V_liq/V_gas;
      24*3600*der(S_gas_ch4) = (-S_gas_ch4*Q_gas/V_gas) + rt9*V_liq/V_gas;
      24*3600*der(S_gas_co2) = (-S_gas_co2*Q_gas/V_gas) + rt10*V_liq/V_gas;
      24*3600*der(S_gas_nh3) = (-S_gas_nh3*Q_gas/V_gas) + rt12*V_liq/V_gas;
      24*3600*der(S_gas_n2) = (-S_gas_n2*Q_gas/V_gas) + flush_flow "+ rt11*V_liq/V_gas";
      S_gas_h2o = p_gas_h2o/R/T_op;
/*-------------------------------------------------*/
/*Acid-base and pH submodel*/
      I - 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4])) = ionic_force;
      ionic_force + 0.00025*der(ionic_force) = 0;
      I = z^2;
      g_mono = if noEvent(ideality == true) then 1.0 else 10^(-0.51*1^2*(z/(1 + z) - 0.24*I));
      g_bi = if noEvent(ideality == true) then 1.0 else 10^(-0.51*2^2*(z/(1 + z) - 0.24*I));
      g_tri = if noEvent(ideality == true) then 1.0 else 10^(-0.51*3^2*(z/(1 + z) - 0.24*I));
      a_h2o = if noEvent(ideality == true) then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/COD_VS[4]/MW[4] + S_bum/COD_VS[5]/MW[5] + S_prom/COD_VS[6]/MW[6] + S_acm/COD_VS[7]/MW[7] + S_ca + S_mg + S_cat + S_an) "Note: MINTEQ, derivation using Raoult's law";
//Activitites calculation = f(S_tot,i)
      a_h = 1/10^(pH);
      a_h = g_mono*S_h;
      a_ca = g_bi*S_ca;
      a_mg = g_bi*S_mg;
      a_nh4 = a_h/Ka_nh4*S_in/(1 + a_h/(Ka_nh4*g_mono));
      a_hco3 = Ka_co2/a_h*S_ic/(1 + Ka_co2/(a_h*g_mono) + Ka_co2*Ka_hco3/(g_bi*(a_h)^2));
      a_co3 = S_ic*a_h*Ka_co2*Ka_hco3/(a_h^3 + Ka_co2*Ka_hco3*a_h/g_bi + Ka_co2*a_h^2/g_mono);
      a_hpo4 = S_ip*a_h*Ka_h3po4*Ka_h2po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_po4 = S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_h2po4 = S_ip*a_h^2*Ka_h3po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
      a_acm = S_ac/COD_VS[7]/MW[7]*a_h^2*Ka_ac/(a_h^3 + Ka_ac*a_h^2/g_mono);
      a_prom = S_pro/COD_VS[6]/MW[6]*a_h^2*Ka_pro/(a_h^3 + Ka_pro*a_h^2/g_mono);
      a_bum = S_bu/COD_VS[5]/MW[5]*a_h^2*Ka_bu/(a_h^3 + Ka_bu*a_h^2/g_mono);
      a_vam = S_va/COD_VS[4]/MW[4]*a_h^2*Ka_va/(a_h^3 + Ka_va*a_h^2/g_mono);
      a_oh = Ka_h2o*a_h2o/a_h;
//Concentration calculation
      S_nh4 = a_nh4/g_mono;
      S_hco3 = a_hco3/g_mono;
      S_hpo4 = a_hpo4/g_bi;
      S_po4 = a_po4/g_tri;
      S_h2po4 = a_h2po4/g_mono;
      S_co3 = a_co3/g_bi;
      S_acm = a_acm/g_mono*COD_VS[7]*MW[7];
      S_prom = a_prom/g_mono*COD_VS[6]*MW[6];
      S_bum = a_bum/g_mono*COD_VS[5]*MW[5];
      S_vam = a_vam/g_mono*COD_VS[4]*MW[4];
      S_oh = a_oh/g_mono;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3 - S_co3;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
      charge = 1*(S_h + S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/(COD_VS[7]*MW[7]) - S_prom/(COD_VS[6]*MW[6]) - S_bum/(COD_VS[5]*MW[5]) - S_vam/(COD_VS[4]*MW[4]) - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3 - S_oh);
      charge + 0.00025*der(charge) = 0;
/*-------------------------------------------------*/
/*Mineral precipitation submodel*/
      arg_log_acp = max(1e-140, a_ca^3*a_po4^2/Ksp_acp);
      arg_log_stru = max(1e-140, a_nh4*a_po4*a_mg/Ksp_stru);
      arg_log_ccm = max(1e-140, a_ca*a_co3/Ksp_ccm);
      arg_log_mag = max(1e-140, a_mg*a_co3/Ksp_mag);
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      Ksp_mag = 10^(-pKsp_mag)*exp(deltaH0_Ksp_mag/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log10(arg_log_acp);
      SI_stru = log10(arg_log_stru);
      SI_ccm = log10(arg_log_ccm);
      SI_mag = log10(arg_log_mag);
      rp1 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rp2 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rd1 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rd2 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rp3 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rd3 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rp4 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      rd4 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      24*3600*der(X_ccm) = Q/V_liq*(1e-6 - X_ccm) + rp3*24*60 - rd3*24*60 + r_ccm;
      24*3600*der(X_acp) = Q/V_liq*(1e-6 - X_acp) + rp1*24*60 - rd1*24*60 + r_acp;
      24*3600*der(X_stru) = Q/V_liq*(1e-6 - X_stru) + rp2*24*60 - rd2*24*60 + r_stru;
      24*3600*der(X_mag) = Q/V_liq*(1e-6 - X_mag) + rp4*24*60 - rd4*24*60 + r_mag;
      r_stru = if noEvent(Functions.regSign(X_stru) + 1 < 1e-10) then -1000*X_stru else 0;
      r_acp = if noEvent(Functions.regSign(X_acp) + 1 < 1e-10) then -1000*X_acp else 0;
      r_ccm = if noEvent(Functions.regSign(X_ccm) + 1 < 1e-10) then -1000*X_ccm else 0;
      r_mag = if noEvent(Functions.regSign(X_mag) + 1 < 1e-10) then -1000*X_mag else 0;
/*-------------------------------------------------*/
/*Lumped charachteristics of digestate.
    Note: missing X_p contribution to macromolecules. Not clear its composition.*/
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm/(COD_VS[7]*MW[7]) + S_prom/(COD_VS[6]*MW[6]) + S_bum/(COD_VS[5]*MW[5]) + S_vam/(COD_VS[4]*MW[4]) - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000;
      TVFA = (S_ac/(COD_VS[7]*MW[7]) + S_pro/(COD_VS[6]*MW[6]) + S_bu/(COD_VS[5]*MW[5]) + S_va/(COD_VS[4]*MW[4]))*60*1000;
      FOS_TAC = TVFA/Alk;
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*(f_ch_xb/COD_VS_CH + f_pr_xb/COD_VS_PR + f_li_xb/COD_VS_LI + f_si_xb/COD_VS[13] + f_P/COD_VS[25]) + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c/COD_VS[14] + X_lig/COD_VS_LIG + X_p/COD_VS[26];
      TAN = S_in*14*1000;
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_lig + X_p;
      COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
      CH_tot = S_su/COD_VS[1] + (X_lig + f_xc[6]*X_c)/COD_VS_LIG + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1] + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH;
      PR_tot_BCA = S_aa/COD_VS[2] + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA;
      PR_tot_TKN = S_aa/COD_VS[2]/N_PR + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR;
      LI_tot = S_fa/COD_VS[3] + (X_li + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3] + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI;
      CH_sol = S_su/COD_VS[1] + S_i*f_si[1]/COD_VS_CH;
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA;
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR;
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI;
/*-------------------------------------------------*/
/*Computation for comparison with AM2HN-like models*/
      COD_tot_bd = S_aa + S_fa + S_su + X_c + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1));
      COD_tot_bd_in = S_aa_in + S_fa_in + S_su_in + sum(X_c_in[i] for i in 1:size(X_c_in, 1)) + sum(X_ch_in[i] for i in 1:size(X_ch_in, 1)) + X_li_in + sum(X_pr_in[i] for i in 1:size(X_pr_in, 1));
      acidogens = (X_su + X_aa + X_fa)/COD_VS_BM;
      methanogens = (X_ac + X_h2 + X_c4 + X_pro)/COD_VS_BM;
      COD_s = S_aa + S_fa + S_su;
      COD_s_in = S_aa_in + S_fa_in + S_su_in;
      VS_bd_x = sum(X_ch[i] for i in 1:size(X_ch, 1))/COD_VS_CH + sum(X_pr[i] for i in 1:size(X_pr, 1))/COD_VS_PR + X_li/COD_VS_LI + X_c/COD_VS[14];
      VS_bd_x_in = sum(X_ch_in[i] for i in 1:size(X_ch_in, 1))/COD_VS_CH + sum(X_pr_in[i] for i in 1:size(X_pr_in, 1))/COD_VS_PR + X_li_in/COD_VS_LI + sum(X_c_in[i] for i in 1:size(X_c_in, 1))/COD_VS[14];
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002));
    end PartialDigester;

    model Digester
      /*Model block that extends 'PartialDigester' to inlet/outlet ports and to compute mass balances*/
      extends ADM1_P.OtherVariables_MassBalance;
      extends ADM1_P.BlockLibrary.PartialDigester;
      extends ADM1_P.Icons.Digester;
      ADM1_P.Interfaces.LiquidSolid_stream inlet "Feedstock mixture inlet port" annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Digestate outlet port" annotation(
        Placement(visible = true, transformation(origin = {74, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream Biogas_Out "Biogas outlet port" annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas(nominal = 1) "Information port of total pressure of the headspace for control" annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u "Control action of flow rate to mantained target 'P_gas'" annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
      Real[44] x "Collection of state variables of both digestate and gas phase";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Inlet computations*/
      Q = inlet.Q;
      inlet.pressure = outlet.pressure;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = inStream(inlet.X_i[i]);
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]);
      end for;
      inlet.X_h2 = inStream(inlet.X_h2);
      inlet.S_su = inStream(inlet.S_su);
      inlet.S_aa = inStream(inlet.S_aa);
      inlet.S_fa = inStream(inlet.S_fa);
      inlet.S_va = inStream(inlet.S_va);
      inlet.S_bu = inStream(inlet.S_bu);
      inlet.S_pro = inStream(inlet.S_pro);
      inlet.S_ac = inStream(inlet.S_ac);
      inlet.S_h2 = inStream(inlet.S_h2);
      inlet.S_ch4 = inStream(inlet.S_ch4);
      inlet.S_ic = inStream(inlet.S_ic);
      inlet.S_in = inStream(inlet.S_in);
      inlet.S_ip = inStream(inlet.S_ip);
      inlet.S_cat = inStream(inlet.S_cat);
      inlet.S_ca = inStream(inlet.S_ca);
      inlet.S_mg = inStream(inlet.S_mg);
      inlet.S_an = inStream(inlet.S_an);
      for i in 1:size(inlet.X_c, 1) loop
        inlet.X_c[i] = inStream(inlet.X_c[i]);
      end for;
      for i in 1:size(inlet.X_ch, 1) loop
        inlet.X_ch[i] = inStream(inlet.X_ch[i]);
      end for;
      for i in 1:size(inlet.X_pr, 1) loop
        inlet.X_pr[i] = inStream(inlet.X_pr[i]);
      end for;
      inlet.X_li = inStream(inlet.X_li);
      inlet.X_su = inStream(inlet.X_su);
      inlet.X_aa = inStream(inlet.X_aa);
      inlet.X_fa = inStream(inlet.X_fa);
      inlet.X_c4 = inStream(inlet.X_c4);
      inlet.X_pro = inStream(inlet.X_pro);
      inlet.X_ac = inStream(inlet.X_ac);
      inlet.X_stru = inStream(inlet.X_stru);
      inlet.X_acp = inStream(inlet.X_acp);
      inlet.X_ccm = inStream(inlet.X_ccm);
      inlet.X_mag = inStream(inlet.X_mag);
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = inlet.X_i[i];
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = inlet.S_i[i];
      end for;
      X_h2_in = inlet.X_h2;
      S_su_in = inlet.S_su;
      S_aa_in = inlet.S_aa;
      S_fa_in = inlet.S_fa;
      S_bu_in = inlet.S_bu;
      S_pro_in = inlet.S_pro;
      S_ac_in = inlet.S_ac;
      S_va_in = inlet.S_va;
      S_h2_in = inlet.S_h2;
      S_ch4_in = inlet.S_ch4;
      S_ic_in = inlet.S_ic;
      S_in_in = inlet.S_in;
      S_ip_in = inlet.S_ip;
      S_cat_in = inlet.S_cat;
      S_ca_in = inlet.S_ca;
      S_mg_in = inlet.S_mg;
      S_an_in = inlet.S_an;
      for i in 1:size(X_c_in, 1) loop
        X_c_in[i] = inlet.X_c[i];
      end for;
      X_ch_in = inlet.X_ch;
      X_pr_in = inlet.X_pr;
      X_li_in = inlet.X_li;
      X_p_in = inlet.X_p;
      X_su_in = inlet.X_su;
      X_aa_in = inlet.X_aa;
      X_fa_in = inlet.X_fa;
      X_c4_in = inlet.X_c4;
      X_pro_in = inlet.X_pro;
      X_ac_in = inlet.X_ac;
      X_stru_in = inlet.X_stru;
      X_acp_in = inlet.X_acp;
      X_ccm_in = inlet.X_ccm;
      X_mag_in = inlet.X_mag;
      ash_in = inlet.ash;
      X_lig_in = inlet.X_lig;
/*Computation of overall mass balance
    Note: for now unitary density has been considered and no contribution of loss of mass from biogas is taken into accound...improve! E.g., inlet.Q + sum(Biogas_Out.Q_i*MWi)/22.4 + outlet.Q = 0*/
      inlet.Q + outlet.Q = 0;
/* Outlet computations: gas*/
      p_gas_h2 = S_gas_h2*R*T_op/COD_VS[8]/MW[8];
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_VS[9]/MW[9];
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      p_gas_n2 = S_gas_n2*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o + p_gas_nh3 + p_gas_n2;
      Q_gas = u;
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Alternative without external controller: Q_gas = if noEvent(P_gas > P_atm) then 1000*(P_gas - P_atm) else 0";
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.p_gas_n2 = p_gas_n2;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
/*Outlet computations: digestate*/
      outlet.S_su = S_su;
      outlet.S_aa = S_aa;
      outlet.S_fa = S_fa;
      outlet.S_va = S_va;
      outlet.S_bu = S_bu;
      outlet.S_pro = S_pro;
      outlet.S_ac = S_ac;
      outlet.S_h2 = S_h2;
      outlet.S_ch4 = S_ch4;
      outlet.S_ic = S_ic;
      outlet.S_in = S_in;
      outlet.S_ip = S_ip;
      outlet.S_cat = S_cat;
      outlet.S_ca = S_ca;
      outlet.S_mg = S_mg;
      outlet.S_an = S_an;
      for i in 1:size(outlet.X_c, 1) loop
        outlet.X_c[i] = X_c;
      end for;
      outlet.X_ch = X_ch;
      outlet.X_pr = X_pr;
      outlet.X_li = X_li;
      outlet.X_su = X_su;
      outlet.X_aa = X_aa;
      outlet.X_fa = X_fa;
      outlet.X_c4 = X_c4;
      outlet.X_pro = X_pro;
      outlet.X_ac = X_ac;
      outlet.X_h2 = X_h2;
      for i in 1:3 loop
        outlet.X_i[i] = X_i*f_xi[i];
      end for;
      outlet.X_i[end] = X_i;
      for i in 1:size(outlet.S_i, 1) loop
        outlet.S_i[i] = S_i;
      end for;
      outlet.X_acp = X_acp;
      outlet.X_stru = X_stru;
      outlet.X_ccm = X_ccm;
      outlet.X_mag = X_mag;
      outlet.X_p = X_p;
      outlet.ash = ash;
      outlet.X_lig = X_lig;
      x = cat(1, {X_su, X_aa, X_fa, X_c4, X_pro, X_ac, X_h2, X_c, X_i}, X_ch, X_pr, {X_li, X_p, S_i, S_su, S_aa, S_fa, S_va, S_bu, S_pro, S_ac, S_h2, S_ch4, S_ic, S_in, S_ip, S_cat, S_ca, S_mg, S_an, ash, X_lig, S_gas_h2, S_gas_ch4, S_gas_co2, S_gas_nh3, S_gas_n2, X_acp, X_stru, X_ccm, X_mag});
/*Other variables and elemental mass balances*/
      HRT = V_liq/(Q + 1e-10);
      OLR = COD_balance_in/V_liq;
      VS_in = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*(f_ch_xb/COD_VS_CH + f_pr_xb/COD_VS_PR + f_li_xb/COD_VS_LI + f_si_xb/COD_VS[13] + f_P/COD_VS[25]) + inlet.S_su/COD_VS[1] + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1))/COD_VS_CH + inlet.S_aa/COD_VS[2] + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))/COD_VS_PR + inlet.S_fa/COD_VS[3] + inlet.X_li/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_c[end]/COD_VS[14] + inlet.X_i[end]/COD_VS[25] + inlet.X_lig/COD_VS_LIG + inlet.X_p/COD_VS[26];
/*COD Balance*/
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
      COD_X = X_p + X_aa + X_ac + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_c + X_lig;
      COD_balance_in = inlet.Q*(inlet.X_p + inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + X_lig);
      COD_balance_out = outlet.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
      24*3600*der(V_in_cum) = inlet.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
/*Inorganic Carbon Balance*/
      IC_balance_in = inlet.Q*(i_LIG[1]*inlet.X_lig + i_XP[1]*inlet.X_p + inlet.S_ic + i_XC[1]*inlet.X_c[end] + i_SI[1]*inlet.S_i[end] + i_XI[1]*inlet.X_i[end] + i_CH[1]*sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + i_PR[1]*sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + i_LI[1]*inlet.X_li + C_su*inlet.S_su + i_PR[1]*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + i_BM[1]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + X_ccm_in + X_mag_in);
      IC_balance_out = outlet.Q*(i_LIG[1]*X_lig + i_XP[1]*X_p + S_ic + i_SI[1]*S_i + i_XI[1]*X_i + i_CH[1]*sum(X_ch[i] for i in 1:size(X_ch, 1)) + i_PR[1]*sum(X_pr[i] for i in 1:size(X_pr, 1)) + i_LI[1]*X_li + C_su*S_su + i_PR[1]*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + i_BM[1]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + i_XC[1]*X_c + X_ccm + X_mag);
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_co2/P_gas/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
/*Inorganic Nitrogen Balance*/
      IN_balance_in = inlet.Q*(i_XP[4]*inlet.X_p + inlet.S_in + i_SI[4]*inlet.S_i[end] + i_XI[4]*inlet.X_i[end] + i_PR[4]*(inlet.S_aa + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))) + i_BM[4]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[4]*inlet.X_c[end]);
      IN_balance_out = outlet.Q*(i_XP[4]*X_p + S_in + i_SI[4]*S_i + i_XI[4]*X_i + i_PR[4]*(S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1))) + i_BM[4]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru + i_XC[4]*X_c);
      IN_balance_gas = Biogas_Out.Q_gas_N*(p_gas_nh3/P_gas/R/273.15*1.01325);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
      24*3600*der(IN_balance_gas_cum) = IN_balance_gas;
/*Inorganic Phosforous Balance*/
      IP_balance_in = inlet.Q*(i_XP[5]*inlet.X_p + inlet.S_ip + i_SI[5]*inlet.S_i[end] + i_XI[5]*inlet.X_i[end] + i_LI[5]*inlet.X_li + i_BM[5]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[5]*inlet.X_c[end]);
      IP_balance_out = outlet.Q*(i_XP[5]*X_p + S_ip + i_SI[5]*S_i + i_XI[5]*X_i + i_LI[5]*X_li + i_BM[5]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru + X_c*i_XC[5]);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
      24*3600*der(Vcum) = inlet.Q;
      24*3600*der(Vcum_ch4) = Q_gas_N*p_gas_ch4/P_gas;
/*Residual BMP calculation*/
      resBMP_vs = ((LI_tot - (S_i*f_si[3] + X_i*f_xi[3] + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3])/COD_VS_LI)*tBMPth_li + (CH_tot - (X_lig + f_xc[6]*X_c)/COD_VS_LIG - (S_i*f_si[1] + X_i*f_xi[1] + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1])/COD_VS_CH)*tBMPth_ch + (PR_tot_TKN - (S_i*f_si[2] + X_i*f_xi[2] + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2])/COD_VS_PR)*tBMPth_pr)/VS;
    end Digester;

    model Open
      /*Model block that extends 'PartialDigester' to inlet/outlet ports and to compute mass balances.
                Open-air configuration (e.g., post-digester pond for digestate stock.)*/
      extends ADM1_P.OtherVariables_MassBalance;
      extends ADM1_P.BlockLibrary.PartialDigester;
      extends ADM1_P.Icons.SludgeDischarge;
      ADM1_P.Interfaces.LiquidSolid_stream inlet "Feedstock mixture inlet port" annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Digestate outlet port" annotation(
        Placement(visible = true, transformation(origin = {74, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream Biogas_Out "Biogas outlet port" annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas(nominal = 1) "Information port of total pressure of the headspace for control" annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Inlet computations*/
      Q = inlet.Q;
      inlet.pressure = outlet.pressure;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = inStream(inlet.X_i[i]);
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]);
      end for;
      inlet.X_h2 = inStream(inlet.X_h2);
      inlet.S_su = inStream(inlet.S_su);
      inlet.S_aa = inStream(inlet.S_aa);
      inlet.S_fa = inStream(inlet.S_fa);
      inlet.S_va = inStream(inlet.S_va);
      inlet.S_bu = inStream(inlet.S_bu);
      inlet.S_pro = inStream(inlet.S_pro);
      inlet.S_ac = inStream(inlet.S_ac);
      inlet.S_h2 = inStream(inlet.S_h2);
      inlet.S_ch4 = inStream(inlet.S_ch4);
      inlet.S_ic = inStream(inlet.S_ic);
      inlet.S_in = inStream(inlet.S_in);
      inlet.S_ip = inStream(inlet.S_ip);
      inlet.S_cat = inStream(inlet.S_cat);
      inlet.S_ca = inStream(inlet.S_ca);
      inlet.S_mg = inStream(inlet.S_mg);
      inlet.S_an = inStream(inlet.S_an);
      for i in 1:size(inlet.X_c, 1) loop
        inlet.X_c[i] = inStream(inlet.X_c[i]);
      end for;
      for i in 1:size(inlet.X_ch, 1) loop
        inlet.X_ch[i] = inStream(inlet.X_ch[i]);
      end for;
      for i in 1:size(inlet.X_pr, 1) loop
        inlet.X_pr[i] = inStream(inlet.X_pr[i]);
      end for;
      inlet.X_li = inStream(inlet.X_li);
      inlet.X_su = inStream(inlet.X_su);
      inlet.X_aa = inStream(inlet.X_aa);
      inlet.X_fa = inStream(inlet.X_fa);
      inlet.X_c4 = inStream(inlet.X_c4);
      inlet.X_pro = inStream(inlet.X_pro);
      inlet.X_ac = inStream(inlet.X_ac);
      inlet.X_stru = inStream(inlet.X_stru);
      inlet.X_acp = inStream(inlet.X_acp);
      inlet.X_ccm = inStream(inlet.X_ccm);
      inlet.X_mag = inStream(inlet.X_mag);
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = inlet.X_i[i];
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = inlet.S_i[i];
      end for;
      X_h2_in = inlet.X_h2;
      S_su_in = inlet.S_su;
      S_aa_in = inlet.S_aa;
      S_fa_in = inlet.S_fa;
      S_bu_in = inlet.S_bu;
      S_pro_in = inlet.S_pro;
      S_ac_in = inlet.S_ac;
      S_va_in = inlet.S_va;
      S_h2_in = inlet.S_h2;
      S_ch4_in = inlet.S_ch4;
      S_ic_in = inlet.S_ic;
      S_in_in = inlet.S_in;
      S_ip_in = inlet.S_ip;
      S_cat_in = inlet.S_cat;
      S_ca_in = inlet.S_ca;
      S_mg_in = inlet.S_mg;
      S_an_in = inlet.S_an;
      for i in 1:size(X_c_in, 1) loop
        X_c_in[i] = inlet.X_c[i];
      end for;
      X_ch_in = inlet.X_ch;
      X_pr_in = inlet.X_pr;
      X_li_in = inlet.X_li;
      X_p_in = inlet.X_p;
      X_su_in = inlet.X_su;
      X_aa_in = inlet.X_aa;
      X_fa_in = inlet.X_fa;
      X_c4_in = inlet.X_c4;
      X_pro_in = inlet.X_pro;
      X_ac_in = inlet.X_ac;
      X_stru_in = inlet.X_stru;
      X_acp_in = inlet.X_acp;
      X_ccm_in = inlet.X_ccm;
      X_mag_in = inlet.X_mag;
      ash_in = inlet.ash;
      X_lig_in = inlet.X_lig;
/*Computation of overall mass balance
    Note: for now unitary density has been considered and no contribution of loss of mass from biogas is taken into accound...improve! E.g., inlet.Q + sum(Biogas_Out.Q_i*MWi)/22.4 + outlet.Q = 0*/
      inlet.Q + outlet.Q = 0;
/*Outlet computations: gas*/
      p_gas_h2 = 1e-10;
      p_gas_ch4 = 1e-10;
      p_gas_co2 = 0.0004;
      p_gas_nh3 = 1e-10;
      p_gas_n2 = 0.78 "Note: oxygen is missing...P_gas cannot be dynamic. I can fake O2 = N2";
      P_gas = P_atm;
      Q_gas = (rt8/COD_VS[8]/MW[8] + rt9/COD_VS[9]/MW[9] + rt10 + rt12 + rt_h2o)*V_liq*R*273.15/P_atm*(T_op/273.15*P_atm/P_gas) "Note: how to model N2 rate? Separate fluxes? It is on the inverse direction.";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas;
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.p_gas_n2 = p_gas_n2;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
/* Outlet computations: digestate*/
      outlet.S_su = S_su;
      outlet.S_aa = S_aa;
      outlet.S_fa = S_fa;
      outlet.S_va = S_va;
      outlet.S_bu = S_bu;
      outlet.S_pro = S_pro;
      outlet.S_ac = S_ac;
      outlet.S_h2 = S_h2;
      outlet.S_ch4 = S_ch4;
      outlet.S_ic = S_ic;
      outlet.S_in = S_in;
      outlet.S_ip = S_ip;
      outlet.S_cat = S_cat;
      outlet.S_ca = S_ca;
      outlet.S_mg = S_mg;
      outlet.S_an = S_an;
      for i in 1:size(outlet.X_c, 1) loop
        outlet.X_c[i] = X_c;
      end for;
      outlet.X_ch = X_ch;
      outlet.X_pr = X_pr;
      outlet.X_li = X_li;
      outlet.X_su = X_su;
      outlet.X_aa = X_aa;
      outlet.X_fa = X_fa;
      outlet.X_c4 = X_c4;
      outlet.X_pro = X_pro;
      outlet.X_ac = X_ac;
      outlet.X_h2 = X_h2;
      for i in 1:3 loop
        outlet.X_i[i] = X_i*f_xi[i];
      end for;
      outlet.X_i[end] = X_i;
      for i in 1:size(outlet.S_i, 1) loop
        outlet.S_i[i] = S_i;
      end for;
      outlet.X_acp = X_acp;
      outlet.X_stru = X_stru;
      outlet.X_ccm = X_ccm;
      outlet.X_mag = X_mag;
      outlet.X_p = X_p;
      outlet.ash = ash;
      outlet.X_lig = X_lig;
/*Other variables and mass balances*/
      HRT = V_liq/(Q + 1e-10);
      OLR = COD_balance_in/V_liq;
      VS_in = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*(f_ch_xb/COD_VS_CH + f_pr_xb/COD_VS_PR + f_li_xb/COD_VS_LI + f_si_xb/COD_VS[13] + f_P/COD_VS[25]) + inlet.S_su/COD_VS[1] + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1))/COD_VS_CH + inlet.S_aa/COD_VS[2] + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))/COD_VS_PR + inlet.S_fa/COD_VS[3] + inlet.X_li/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_c[end]/COD_VS[14] + inlet.X_i[end]/COD_VS[25] + inlet.X_lig/COD_VS_LIG + inlet.X_p/COD_VS[26];
/*COD Balance*/
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
      COD_X = X_p + X_aa + X_ac + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_c + X_lig;
      COD_balance_in = inlet.Q*(inlet.X_p + inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + X_lig);
      COD_balance_out = outlet.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
      24*3600*der(V_in_cum) = inlet.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
/*Inorganic Carbon Balance*/
      IC_balance_in = inlet.Q*(i_LIG[1]*inlet.X_lig + i_XP[1]*inlet.X_p + inlet.S_ic + i_XC[1]*inlet.X_c[end] + i_SI[1]*inlet.S_i[end] + i_XI[1]*inlet.X_i[end] + i_CH[1]*sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + i_PR[1]*sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + i_LI[1]*inlet.X_li + C_su*inlet.S_su + i_PR[1]*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + i_BM[1]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + X_ccm_in + X_mag_in);
      IC_balance_out = outlet.Q*(i_LIG[1]*X_lig + i_XP[1]*X_p + S_ic + i_SI[1]*S_i + i_XI[1]*X_i + i_CH[1]*sum(X_ch[i] for i in 1:size(X_ch, 1)) + i_PR[1]*sum(X_pr[i] for i in 1:size(X_pr, 1)) + i_LI[1]*X_li + C_su*S_su + i_PR[1]*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + i_BM[1]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + i_XC[1]*X_c + X_ccm + X_mag);
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_co2/P_gas/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
/*Inorganic Nitrogen Balance*/
      IN_balance_in = inlet.Q*(i_XP[4]*inlet.X_p + inlet.S_in + i_SI[4]*inlet.S_i[end] + i_XI[4]*inlet.X_i[end] + i_PR[4]*(inlet.S_aa + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))) + i_BM[4]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[4]*inlet.X_c[end]);
      IN_balance_out = outlet.Q*(i_XP[4]*X_p + S_in + i_SI[4]*S_i + i_XI[4]*X_i + i_PR[4]*(S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1))) + i_BM[4]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru + i_XC[4]*X_c);
      IN_balance_gas = Biogas_Out.Q_gas_N*(p_gas_nh3/P_gas/R/273.15*1.01325);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
      24*3600*der(IN_balance_gas_cum) = IN_balance_gas;
/*Inorganic Phosforous Balance*/
      IP_balance_in = inlet.Q*(i_XP[5]*inlet.X_p + inlet.S_ip + i_SI[5]*inlet.S_i[end] + i_XI[5]*inlet.X_i[end] + i_LI[5]*inlet.X_li + i_BM[5]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[5]*inlet.X_c[end]);
      IP_balance_out = outlet.Q*(i_XP[5]*X_p + S_ip + i_SI[5]*S_i + i_XI[5]*X_i + i_LI[5]*X_li + i_BM[5]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru + X_c*i_XC[5]);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
      24*3600*der(Vcum) = inlet.Q;
      24*3600*der(Vcum_ch4) = Q_gas_N*p_gas_ch4/P_gas;
/*Residual BMP calculation*/
      resBMP_vs = ((LI_tot - (S_i*f_si[3] + X_i*f_xi[3] + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3])/COD_VS_LI)*tBMPth_li + (CH_tot - (X_lig + f_xc[6]*X_c)/COD_VS_LIG - (S_i*f_si[1] + X_i*f_xi[1] + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1])/COD_VS_CH)*tBMPth_ch + (PR_tot_TKN - (S_i*f_si[2] + X_i*f_xi[2] + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2])/COD_VS_PR)*tBMPth_pr)/VS;
    end Open;

    model Recycle
      /*Block model to impose a (positive) recirculation flow rate of digestate*/
      ADM1_P.Interfaces.LiquidSolid_stream inlet "Digestate inlet port" annotation(
        Placement(visible = true, transformation(origin = {96, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {112, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Digestate outlet port" annotation(
        Placement(visible = true, transformation(origin = {-94, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-90, 2}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      parameter Types.FlowRate_d recycledQ "Recycling flow rate to be imposed";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Computation of inlet*/
      inlet.Q = recycledQ;
      outlet.Q + inlet.Q = 0;
      inlet.X_i = fill(0, size(inlet.X_i, 1));
      inlet.X_h2 = 0;
      inlet.S_su = 0;
      inlet.S_aa = 0;
      inlet.S_fa = 0;
      inlet.S_va = 0;
      inlet.S_bu = 0;
      inlet.S_pro = 0;
      inlet.S_ac = 0;
      inlet.S_h2 = 0;
      inlet.S_ch4 = 0;
      inlet.S_ic = 0;
      inlet.S_in = 0;
      inlet.S_ip = 0;
      inlet.S_i = fill(0, size(inlet.S_i, 1));
      inlet.S_cat = 0;
      inlet.S_ca = 0;
      inlet.S_mg = 0;
      inlet.S_an = 0;
      inlet.X_c = fill(0, size(inlet.X_c, 1));
      inlet.X_ch = fill(0, size(inlet.X_ch, 1));
      inlet.X_pr = fill(0, size(inlet.X_pr, 1));
      inlet.X_li = 0;
      inlet.X_su = 0;
      inlet.X_aa = 0;
      inlet.X_fa = 0;
      inlet.X_c4 = 0;
      inlet.X_pro = 0;
      inlet.X_ac = 0;
      inlet.X_stru = 0;
      inlet.X_acp = 0;
      inlet.X_ccm = 0;
      inlet.X_p = 0;
      inlet.ash = 0;
      inlet.X_mag = 0;
      inlet.X_lig = 0;
/*Computation of inlet*/
      outlet.X_h2 = inStream(inlet.X_h2);
      outlet.X_i = inStream(inlet.X_i);
      outlet.S_su = inStream(inlet.S_su);
      outlet.S_aa = inStream(inlet.S_aa);
      outlet.S_fa = inStream(inlet.S_fa);
      outlet.S_va = inStream(inlet.S_va);
      outlet.S_bu = inStream(inlet.S_bu);
      outlet.S_pro = inStream(inlet.S_pro);
      outlet.S_ac = inStream(inlet.S_ac);
      outlet.S_h2 = inStream(inlet.S_h2);
      outlet.S_ch4 = inStream(inlet.S_ch4);
      outlet.S_ic = inStream(inlet.S_ic);
      outlet.S_in = inStream(inlet.S_in);
      outlet.S_ip = inStream(inlet.S_ip);
      outlet.S_i = inStream(inlet.S_i);
      outlet.S_cat = inStream(inlet.S_cat);
      outlet.S_ca = inStream(inlet.S_ca);
      outlet.S_mg = inStream(inlet.S_mg);
      outlet.S_an = inStream(inlet.S_an);
      outlet.X_c = inStream(inlet.X_c);
      outlet.X_ch = inStream(inlet.X_ch);
      outlet.X_pr = inStream(inlet.X_pr);
      outlet.X_li = inStream(inlet.X_li);
      outlet.X_su = inStream(inlet.X_su);
      outlet.X_aa = inStream(inlet.X_aa);
      outlet.X_fa = inStream(inlet.X_fa);
      outlet.X_c4 = inStream(inlet.X_c4);
      outlet.X_pro = inStream(inlet.X_pro);
      outlet.X_ac = inStream(inlet.X_ac);
      outlet.X_stru = inStream(inlet.X_stru);
      outlet.X_acp = inStream(inlet.X_acp);
      outlet.X_ccm = inStream(inlet.X_ccm);
      outlet.X_p = inStream(inlet.X_p);
      outlet.ash = inStream(inlet.ash);
      outlet.X_mag = inStream(inlet.X_mag);
      outlet.X_lig = inStream(inlet.X_lig);
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Recycle;

    model ScrewPress
      /*Block model to mimic the behaviour of a solid-liquid separation unit of digestate (e.g., screw press).*/
      Interfaces.LiquidSolid_stream inlet "Digestate inlet port" annotation(
        Placement(visible = true, transformation(origin = {-80, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.LiquidSolid_stream liquidoutlet "Oulet port of the liquid fraction of digestate" annotation(
        Placement(visible = true, transformation(origin = {76, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.LiquidSolid_stream solidoutlet "Oulet port of the solid fraction of digestate" annotation(
        Placement(visible = true, transformation(origin = {-34, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-34, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      /*"Black-box" efficiencies of separation.
                Note: to be applied always to the LOAD of the quantity they refer to.*/
      parameter Real eta_liq = 0.9 "Overall volumetric efficiency. Defined as 'liquidoutlet.Q/inlet.Q'";
      parameter Real eta_ts = 0.665 "Overall TS efficiency. Defined as 'liquidoutlet.Q*Liquid.TS/(inlet.Q*inlet.TS)'";
      parameter Real eta_tan = 0.89 "TAN removal efficiency";
      parameter Real eta_ca = 0.8 "Calcium removal efficiency";
      parameter Real eta_mg = 0.74 "Magnesium removal efficiency";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Computations of the inlet*/
      inlet.pressure = 1;
      inlet.X_i = inStream(inlet.X_i);
      inlet.S_i = inStream(inlet.S_i);
      inlet.X_h2 = inStream(inlet.X_h2);
      inlet.S_su = inStream(inlet.S_su);
      inlet.S_aa = inStream(inlet.S_aa);
      inlet.S_fa = inStream(inlet.S_fa);
      inlet.S_va = inStream(inlet.S_va);
      inlet.S_bu = inStream(inlet.S_bu);
      inlet.S_pro = inStream(inlet.S_pro);
      inlet.S_ac = inStream(inlet.S_ac);
      inlet.S_h2 = inStream(inlet.S_h2);
      inlet.S_ch4 = inStream(inlet.S_ch4);
      inlet.S_ic = inStream(inlet.S_ic);
      inlet.S_in = inStream(inlet.S_in);
      inlet.S_ip = inStream(inlet.S_ip);
      inlet.S_cat = inStream(inlet.S_cat);
      inlet.S_ca = inStream(inlet.S_ca);
      inlet.S_mg = inStream(inlet.S_mg);
      inlet.S_an = inStream(inlet.S_an);
      inlet.X_c = inStream(inlet.X_c);
      inlet.X_ch = inStream(inlet.X_ch);
      inlet.X_pr = inStream(inlet.X_pr);
      inlet.X_li = inStream(inlet.X_li);
      inlet.X_su = inStream(inlet.X_su);
      inlet.X_aa = inStream(inlet.X_aa);
      inlet.X_fa = inStream(inlet.X_fa);
      inlet.X_c4 = inStream(inlet.X_c4);
      inlet.X_pro = inStream(inlet.X_pro);
      inlet.X_ac = inStream(inlet.X_ac);
      inlet.X_stru = inStream(inlet.X_stru);
      inlet.X_acp = inStream(inlet.X_acp);
      inlet.X_ccm = inStream(inlet.X_ccm);
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
      inlet.X_mag = inStream(inlet.X_mag);
/*Computations of the liquid outlet*/
      liquidoutlet.Q = -eta_liq*inlet.Q;
      liquidoutlet.X_i*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_i;
      liquidoutlet.S_i = inlet.S_i;
      liquidoutlet.X_h2*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_h2;
      liquidoutlet.S_su = inlet.S_su;
      liquidoutlet.S_aa = inlet.S_aa;
      liquidoutlet.S_fa = inlet.S_fa;
      liquidoutlet.S_va = inlet.S_va;
      liquidoutlet.S_bu = inlet.S_bu;
      liquidoutlet.S_pro = inlet.S_pro;
      liquidoutlet.S_ac = inlet.S_ac;
      liquidoutlet.S_h2 = inlet.S_h2;
      liquidoutlet.S_ch4 = inlet.S_ch4;
      liquidoutlet.S_ic = inlet.S_ic;
      liquidoutlet.S_in*liquidoutlet.Q = -eta_tan*inlet.S_in*inlet.Q;
      liquidoutlet.S_ip = inlet.S_ip;
      liquidoutlet.S_cat = inlet.S_cat;
      liquidoutlet.S_ca*liquidoutlet.Q = -eta_ca*inlet.S_ca*inlet.Q;
      liquidoutlet.S_mg*liquidoutlet.Q = -eta_mg*inlet.S_mg*inlet.Q;
      liquidoutlet.S_an = inlet.S_an;
      liquidoutlet.X_c*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_c;
      liquidoutlet.X_ch*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_ch;
      liquidoutlet.X_pr*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_pr;
      liquidoutlet.X_li*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_li;
      liquidoutlet.X_su*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_su;
      liquidoutlet.X_aa*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_aa;
      liquidoutlet.X_fa*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_fa;
      liquidoutlet.X_c4*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_c4;
      liquidoutlet.X_pro*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_pro;
      liquidoutlet.X_ac*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_ac;
      liquidoutlet.X_stru*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_stru;
      liquidoutlet.X_acp*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_acp;
      liquidoutlet.X_ccm*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_ccm;
      liquidoutlet.X_p*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_p;
      liquidoutlet.ash*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.ash;
      liquidoutlet.X_lig*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_lig;
      liquidoutlet.X_mag*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_mag;
/*Computations of the solid outlet*/
      solidoutlet.Q + liquidoutlet.Q + inlet.Q = 0;
      solidoutlet.X_i*solidoutlet.Q + inlet.X_i*inlet.Q = -liquidoutlet.X_i*liquidoutlet.Q;
      solidoutlet.S_i*solidoutlet.Q + inlet.S_i*inlet.Q = -liquidoutlet.S_i*liquidoutlet.Q;
      solidoutlet.X_h2*solidoutlet.Q + inlet.X_h2*inlet.Q = -liquidoutlet.X_h2*liquidoutlet.Q;
      solidoutlet.S_su*solidoutlet.Q + inlet.S_su*inlet.Q = -liquidoutlet.S_su*liquidoutlet.Q;
      solidoutlet.S_aa*solidoutlet.Q + inlet.S_aa*inlet.Q = -liquidoutlet.S_aa*liquidoutlet.Q;
      solidoutlet.S_fa*solidoutlet.Q + inlet.S_fa*inlet.Q = -liquidoutlet.S_fa*liquidoutlet.Q;
      solidoutlet.S_va*solidoutlet.Q + inlet.S_va*inlet.Q = -liquidoutlet.S_va*liquidoutlet.Q;
      solidoutlet.S_bu*solidoutlet.Q + inlet.S_bu*inlet.Q = -liquidoutlet.S_bu*liquidoutlet.Q;
      solidoutlet.S_pro*solidoutlet.Q + inlet.S_pro*inlet.Q = -liquidoutlet.S_pro*liquidoutlet.Q;
      solidoutlet.S_ac*solidoutlet.Q + inlet.S_ac*inlet.Q = -liquidoutlet.S_ac*liquidoutlet.Q;
      solidoutlet.S_h2*solidoutlet.Q + inlet.S_h2*inlet.Q = -liquidoutlet.S_h2*liquidoutlet.Q;
      solidoutlet.S_ch4*solidoutlet.Q + inlet.S_ch4*inlet.Q = -liquidoutlet.S_ch4*liquidoutlet.Q;
      solidoutlet.S_ic*solidoutlet.Q + inlet.S_ic*inlet.Q = -liquidoutlet.S_ic*liquidoutlet.Q;
      solidoutlet.S_in*solidoutlet.Q + inlet.S_in*inlet.Q = -liquidoutlet.S_in*liquidoutlet.Q;
      solidoutlet.S_ip*solidoutlet.Q + inlet.S_ip*inlet.Q = -liquidoutlet.S_ip*liquidoutlet.Q;
      solidoutlet.S_cat*solidoutlet.Q + inlet.S_cat*inlet.Q = -liquidoutlet.S_cat*liquidoutlet.Q;
      solidoutlet.S_ca*solidoutlet.Q + inlet.S_ca*inlet.Q = -liquidoutlet.S_ca*liquidoutlet.Q;
      solidoutlet.S_mg*solidoutlet.Q + inlet.S_mg*inlet.Q = -liquidoutlet.S_mg*liquidoutlet.Q;
      solidoutlet.S_an*solidoutlet.Q + inlet.S_an*inlet.Q = -liquidoutlet.S_an*liquidoutlet.Q;
      solidoutlet.X_c*solidoutlet.Q + inlet.X_c*inlet.Q = -liquidoutlet.X_c*liquidoutlet.Q;
      solidoutlet.X_ch*solidoutlet.Q + inlet.X_ch*inlet.Q = -liquidoutlet.X_ch*liquidoutlet.Q;
      solidoutlet.X_pr*solidoutlet.Q + inlet.X_pr*inlet.Q = -liquidoutlet.X_pr*liquidoutlet.Q;
      solidoutlet.X_li*solidoutlet.Q + inlet.X_li*inlet.Q = -liquidoutlet.X_li*liquidoutlet.Q;
      solidoutlet.X_su*solidoutlet.Q + inlet.X_su*inlet.Q = -liquidoutlet.X_su*liquidoutlet.Q;
      solidoutlet.X_aa*solidoutlet.Q + inlet.X_aa*inlet.Q = -liquidoutlet.X_aa*liquidoutlet.Q;
      solidoutlet.X_fa*solidoutlet.Q + inlet.X_c4*inlet.Q = -liquidoutlet.X_fa*liquidoutlet.Q;
      solidoutlet.X_c4*solidoutlet.Q + inlet.X_c4*inlet.Q = -liquidoutlet.X_c4*liquidoutlet.Q;
      solidoutlet.X_pro*solidoutlet.Q + inlet.X_pro*inlet.Q = -liquidoutlet.X_pro*liquidoutlet.Q;
      solidoutlet.X_ac*solidoutlet.Q + inlet.X_ac*inlet.Q = -liquidoutlet.X_ac*liquidoutlet.Q;
      solidoutlet.X_stru*solidoutlet.Q + inlet.X_stru*inlet.Q = -liquidoutlet.X_stru*liquidoutlet.Q;
      solidoutlet.X_acp*solidoutlet.Q + inlet.X_acp*inlet.Q = -liquidoutlet.X_acp*liquidoutlet.Q;
      solidoutlet.X_ccm*solidoutlet.Q + inlet.X_ccm*inlet.Q = -liquidoutlet.X_ccm*liquidoutlet.Q;
      solidoutlet.X_p*solidoutlet.Q + inlet.X_p*inlet.Q = -liquidoutlet.X_p*liquidoutlet.Q;
      solidoutlet.ash*solidoutlet.Q + inlet.ash*inlet.Q = -liquidoutlet.ash*liquidoutlet.Q;
      solidoutlet.X_lig*solidoutlet.Q + inlet.X_lig*inlet.Q = -liquidoutlet.X_lig*liquidoutlet.Q;
      solidoutlet.X_mag*solidoutlet.Q + inlet.X_mag*inlet.Q = -liquidoutlet.X_mag*liquidoutlet.Q;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(origin = {0, -6}, extent = {{-100, 100}, {100, 60}}, textString = "ScrewPress"), Polygon(origin = {0, -38}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Line(origin = {1.09038, -17.0811}, points = {{-71.0904, -56.9189}, {-61.0904, -48.9189}, {-79.0904, -20.9189}, {54.9096, 63.0811}, {78.9096, 29.0811}, {78.9096, 11.0811}, {72.9096, 11.0811}, {72.9096, 23.0811}, {-57.0904, -56.9189}, {-47.0904, -64.9189}, {-29.0904, -64.9189}, {72.9096, 23.0811}, {72.9096, 11.0811}}), Line(origin = {0.727027, -14.0048}, points = {{-70.727, -33.9952}, {-60.727, -49.9952}, {71.273, 32.0048}, {59.273, 50.0048}, {-70.727, -33.9952}, {-60.727, -49.9952}, {-44.727, -39.9952}}), Polygon(origin = {1, -16}, fillColor = {108, 82, 2}, fillPattern = FillPattern.VerticalCylinder, points = {{-71, -58}, {-61, -50}, {-79, -22}, {55, 62}, {79, 28}, {79, 10}, {73, 10}, {73, 22}, {-67, -64}, {-71, -58}, {-67, -64}, {-71, -58}}), Polygon(origin = {0, -13}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-70, -35}, {-62, -47}, {72, 33}, {62, 47}, {-70, -35}, {-64, -31}, {-70, -35}}), Polygon(origin = {-52, -47}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {-36, -78}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, points = {{-20, 4}, {-10, -4}, {-4, -4}, {-4, -6}, {0, -6}, {0, -4}, {8, -4}, {20, 6}, {-16, 6}, {-16, 6}, {-20, 4}}), Polygon(origin = {14, -30}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Polygon(origin = {28, -22}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Polygon(origin = {-32, -33}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {-10, -19}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {10, -7}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {30, 5}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {52, 19}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}})}),
        Documentation(info = "Icon for a secondary clarifier"));
    end ScrewPress;

    model Pump_onoff
      /*Block model to convert a constant signal into a pulse-width modular (PWM) signal.
                Used to simulate pump ON/OFF duty cycle.*/
      Modelica.Blocks.Interfaces.RealInput input_signal "Input signal [m3/day]" annotation(
        Placement(visible = true, transformation(origin = {-92, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-92, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput onoff_signal "Output signal [m3/day]" annotation(
        Placement(visible = true, transformation(origin = {88, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real tfr_pump "Counter of time for the block. Used to trigger 'when' events";
      Real sampling_time "The time interval that represents one full duty cycle (1 ON + OFF cycle), to guarantee that the whole 'input_signal' load is fed in a day.";
      Boolean impulse = true "If True, it returns PWM, else, the original 'input_signal'";
      parameter Real pump_dosage_persec = 10/60 "Pump flow per second [g/s]";
      parameter Real duration_of_ON_time = 60 "Duration of ON time [s]";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
      sampling_time = 86400*duration_of_ON_time*pump_dosage_persec/(1e-10 + input_signal*1e6);
      when time > pre(tfr_pump) + ADM1_P.Functions.round(sampling_time) then
        tfr_pump = time;
      end when;
      if abs(time - tfr_pump) < duration_of_ON_time and impulse then
        onoff_signal = pump_dosage_persec/1e6*86400;
      elseif not impulse then
        onoff_signal = input_signal;
      else
        onoff_signal = 1e-10;
      end if;
    end Pump_onoff;

    model Gasbag_p
      /*Block model to mimic the presence of a biogas gasbag before the biogas composition analysis.
                Note: to mimic the presence of gas accumulation and dischage, user should include an 'if condition' in the expression of 'outlet.Q_gas_N'.
                Note: missing to model the removal of H2O. Indeed, biogas flow rate is measured wet, but composition is measured dry.*/
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.OtherVariables_Gas;
      ADM1_P.Interfaces.Gas_stream inlet "Biogas inlet port" annotation(
        Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream outlet "Biogas outlet port" annotation(
        Placement(visible = true, transformation(origin = {84, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {82, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real x[5] "Store of state variables";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Overall volumetric balance*/
      86400*der(V_gasbag) = inlet.Q_gas_N + outlet.Q_gas_N;
      outlet.Q_gas_N + inlet.Q_gas_N = 0;
      inlet.P_gas = p_gas_h2o_in + p_gas_h2_in + p_gas_ch4_in + p_gas_co2_in + p_gas_nh3_in + p_gas_n2_in;
/*Computations of inlet*/
      p_gas_h2o_in = inlet.p_gas_h2o;
      p_gas_h2_in = inlet.p_gas_h2;
      p_gas_ch4_in = inlet.p_gas_ch4;
      p_gas_co2_in = inlet.p_gas_co2;
      p_gas_nh3_in = inlet.p_gas_nh3;
      p_gas_n2_in = inlet.p_gas_n2;
      inlet.p_gas_h2o = inStream(inlet.p_gas_h2o);
      inlet.p_gas_h2 = inStream(inlet.p_gas_h2);
      inlet.p_gas_ch4 = inStream(inlet.p_gas_ch4);
      inlet.p_gas_co2 = inStream(inlet.p_gas_co2);
      inlet.p_gas_nh3 = inStream(inlet.p_gas_nh3);
      inlet.p_gas_n2 = inStream(inlet.p_gas_n2);
      x_ch4_in = p_gas_ch4_in/(inlet.P_gas - p_gas_h2o_in);
      x_co2_in = p_gas_co2_in/(inlet.P_gas - p_gas_h2o_in);
      x_h2_in = p_gas_h2_in/(inlet.P_gas - p_gas_h2o_in);
      x_nh3_in = p_gas_nh3_in/(inlet.P_gas - p_gas_h2o_in);
      x_n2_in = p_gas_n2_in/(inlet.P_gas - p_gas_h2o_in);
      S_gas_h2_in = inlet.p_gas_h2/R/T_op_mean*7.94*2.02;
      S_gas_co2_in = inlet.p_gas_co2/R/T_op_mean;
      S_gas_ch4_in = inlet.p_gas_ch4/R/T_op_mean*3.99*16.04;
      S_gas_nh3_in = inlet.p_gas_nh3/R/T_op_mean;
      S_gas_n2_in = inlet.p_gas_n2/R/T_op_mean;
/*State equations*/
      V_gasbag*86400*der(S_gas_ch4) = S_gas_ch4_in*inlet.Q_gas_N + S_gas_ch4*outlet.Q_gas_N;
      V_gasbag*86400*der(S_gas_co2) = S_gas_co2_in*inlet.Q_gas_N + S_gas_co2*outlet.Q_gas_N;
      V_gasbag*86400*der(S_gas_nh3) = S_gas_nh3_in*inlet.Q_gas_N + S_gas_nh3*outlet.Q_gas_N;
      V_gasbag*86400*der(S_gas_h2) = S_gas_h2_in*inlet.Q_gas_N + S_gas_h2*outlet.Q_gas_N;
      V_gasbag*86400*der(S_gas_n2) = S_gas_n2_in*inlet.Q_gas_N + S_gas_n2*outlet.Q_gas_N;
/*Computations of outlet*/
      outlet.p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/298.15 - 1/(T_op_mean)));
      outlet.p_gas_h2 = S_gas_h2*R*(T_op_mean)/7.94/2.02;
      outlet.p_gas_ch4 = S_gas_ch4*R*(T_op_mean)/3.99/16.04;
      outlet.p_gas_co2 = S_gas_co2*R*(T_op_mean);
      outlet.p_gas_nh3 = S_gas_nh3*R*(T_op_mean);
      outlet.p_gas_n2 = S_gas_n2*R*(T_op_mean);
      x_h2 = S_gas_h2*R*(T_op_mean)/7.94/2.02/(inlet.P_gas - p_gas_h2o_in);
      x_ch4 = S_gas_ch4*R*(T_op_mean)/3.99/16.04/(inlet.P_gas - p_gas_h2o_in);
      x_co2 = S_gas_co2*R*(T_op_mean)/(inlet.P_gas - p_gas_h2o_in);
      x_nh3 = S_gas_nh3*R*(T_op_mean)/(inlet.P_gas - p_gas_h2o_in);
      x_n2 = S_gas_n2*R*(T_op_mean)/(inlet.P_gas - p_gas_h2o_in);
/*Computation of flow rate in standard conditions*/
      Q_ch4_N = -outlet.Q_gas_N*x_ch4*1000;
      Q_co2_N = -outlet.Q_gas_N*x_co2*1000;
      Q_h2_N = -outlet.Q_gas_N*x_h2*1000;
      Q_n2_N = -outlet.Q_gas_N*x_n2*1000;
/*Store of state variables*/
      x = {S_gas_ch4, S_gas_co2, S_gas_nh3, S_gas_h2, S_gas_n2};
      annotation(
        Icon(graphics = {Text(origin = {0, -1}, extent = {{-56, 25}, {56, -25}}, textString = "gasbag"), Rectangle(origin = {7, -1}, extent = {{-91, 83}, {91, -83}})}));
    end Gasbag_p;

    model Atmosphere
      /*Block model that acts as a sink for biogas flow rate.
                Note: missing to model the removal of H2O. Indeed, biogas flow rate is measured wet, but composition is measured dry.
                Note: override of V_gasbag.start with a very large value.*/
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.OtherVariables_Gas(V_gasbag.start = 1e6);
      ADM1_P.Interfaces.Gas_stream inlet "Biogas inlet port" annotation(
        Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput[3] y "Collection of online-measurable outputs" annotation(
        Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Overall volumetric balance*/
      der(V_gasbag) = 0;
      inlet.P_gas = 1.035;
/*Computations of inlet*/
      p_gas_h2o_in = inlet.p_gas_h2o;
      p_gas_h2_in = inlet.p_gas_h2;
      p_gas_ch4_in = inlet.p_gas_ch4;
      p_gas_co2_in = inlet.p_gas_co2;
      p_gas_nh3_in = inlet.p_gas_nh3;
      p_gas_n2_in = inlet.p_gas_n2;
      inlet.p_gas_h2o = inStream(inlet.p_gas_h2o);
      inlet.p_gas_h2 = inStream(inlet.p_gas_h2);
      inlet.p_gas_ch4 = inStream(inlet.p_gas_ch4);
      inlet.p_gas_co2 = inStream(inlet.p_gas_co2);
      inlet.p_gas_nh3 = inStream(inlet.p_gas_nh3);
      inlet.p_gas_n2 = inStream(inlet.p_gas_n2);
      x_ch4_in = p_gas_ch4_in/(inlet.P_gas - p_gas_h2o_in);
      x_co2_in = p_gas_co2_in/(inlet.P_gas - p_gas_h2o_in);
      x_h2_in = p_gas_h2_in/(inlet.P_gas - p_gas_h2o_in);
      x_nh3_in = p_gas_nh3_in/(inlet.P_gas - p_gas_h2o_in);
      x_n2_in = p_gas_n2_in/(inlet.P_gas - p_gas_h2o_in);
      S_gas_h2_in = inlet.p_gas_h2/R/T_op_mean*7.94*2.02;
      S_gas_co2_in = inlet.p_gas_co2/R/T_op_mean;
      S_gas_ch4_in = inlet.p_gas_ch4/R/T_op_mean*3.99*16.04;
      S_gas_nh3_in = inlet.p_gas_nh3/R/T_op_mean;
      S_gas_n2_in = inlet.p_gas_n2/R/T_op_mean;
/*(Fake) state equations*/
      V_gasbag*86400*der(S_gas_ch4) = 1e-6 - S_gas_ch4;
      V_gasbag*86400*der(S_gas_co2) = 0.0004 - S_gas_co2;
      V_gasbag*86400*der(S_gas_nh3) = 1e-6 - S_gas_nh3;
      V_gasbag*86400*der(S_gas_h2) = 1e-6 - S_gas_h2;
      V_gasbag*86400*der(S_gas_n2) = 0.7 - S_gas_n2;
/*Computations of "outlet"*/
      x_h2 = S_gas_h2*R*(T_op_mean)/7.94/2.02/(inlet.P_gas - p_gas_h2o_in);
      x_ch4 = S_gas_ch4*R*(T_op_mean)/3.99/16.04/(inlet.P_gas - p_gas_h2o_in);
      x_co2 = S_gas_co2*R*(T_op_mean)/(inlet.P_gas - p_gas_h2o_in);
      x_nh3 = S_gas_nh3*R*(T_op_mean)/(inlet.P_gas - p_gas_h2o_in);
      x_n2 = S_gas_n2*R*(T_op_mean)/(inlet.P_gas - p_gas_h2o_in);
/*Computation of flow rate in standard conditions*/
      Q_ch4_N = inlet.Q_gas_N*x_ch4*1000;
      Q_co2_N = inlet.Q_gas_N*x_co2*1000;
      Q_h2_N = inlet.Q_gas_N*x_h2*1000;
      Q_n2_N = inlet.Q_gas_N*x_n2*1000;
/*Online-measurable outputs*/
      y[:] = {inlet.Q_gas_N, x_ch4, x_co2};
      annotation(
        Icon(graphics = {Text(origin = {0, -1}, extent = {{-56, 25}, {56, -25}}, textString = "gas sink"), Rectangle(origin = {7, -1}, extent = {{-91, 83}, {91, -83}})}));
    end Atmosphere;

    model Info_to_mass
      /*Block model to cast informations of state variable values to a flow rate (from info to 'LiquidSolid_stream' interface).
                Similar to 'Feed_Source_Direct' but even more direct, no computations are performed.*/
      Modelica.Blocks.Interfaces.RealInput Q "Flow rate" annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.LiquidSolid_stream outlet "Digestate outlet port" annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[51] "Digestate information inlet port" annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      /*Declaration of parameters used when inlet port is not used*/
      parameter Real aa, ac, an, bu, ca, cat, ch4, fa, h2, sich, sipr, sili, si, tic, tan, ortop, mg, pro, su, va, xaa, xac, xacp, xcch, xcpr, xcli, xcxi, xcsi, xclig, xc, xc4, xccm, xchr, xchm, xchs, xfa, xh2, xich, xipr, xili, xi, xli, xlig, xmag, xp, xprr, xprs, xpro, xstru, xsu, ashp;
      parameter Boolean steady = true "If True, CombiTimeTables are not used, and the parameters declared above should be set";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
      outlet.Q = -Q;
      outlet.S_aa = if steady == true then aa else inlet[1];
      outlet.S_ac = if steady == true then ac else inlet[2];
      outlet.S_an = if steady == true then an else inlet[3];
      outlet.S_bu = if steady == true then bu else inlet[4];
      outlet.S_ca = if steady == true then ca else inlet[5];
      outlet.S_cat = if steady == true then cat else inlet[6];
      outlet.S_ch4 = if steady == true then ch4 else inlet[7];
      outlet.S_fa = if steady == true then fa else inlet[8];
      outlet.S_h2 = if steady == true then h2 else inlet[9];
      outlet.S_i[1] = if steady == true then sich else inlet[10];
      outlet.S_i[2] = if steady == true then sipr else inlet[11];
      outlet.S_i[3] = if steady == true then sili else inlet[12];
      outlet.S_i[end] = if steady == true then si else inlet[13];
      outlet.S_ic = if steady == true then tic else inlet[14];
      outlet.S_in = if steady == true then tan else inlet[15];
      outlet.S_ip = if steady == true then ortop else inlet[16];
      outlet.S_mg = if steady == true then mg else inlet[17];
      outlet.S_pro = if steady == true then pro else inlet[18];
      outlet.S_su = if steady == true then su else inlet[19];
      outlet.S_va = if steady == true then va else inlet[20];
      outlet.X_aa = if steady == true then xaa else inlet[21];
      outlet.X_ac = if steady == true then xac else inlet[22];
      outlet.X_acp = if steady == true then xacp else inlet[23];
      outlet.X_c[1] = if steady == true then xcch else inlet[24];
      outlet.X_c[2] = if steady == true then xcpr else inlet[25];
      outlet.X_c[3] = if steady == true then xcli else inlet[26];
      outlet.X_c[4] = if steady == true then xcxi else inlet[27];
      outlet.X_c[5] = if steady == true then xcsi else inlet[28];
      outlet.X_c[6] = if steady == true then xclig else inlet[29];
      outlet.X_c[end] = if steady == true then xc else inlet[30];
      outlet.X_c4 = if steady == true then xc4 else inlet[31];
      outlet.X_ccm = if steady == true then xccm else inlet[32];
      outlet.X_ch[1] = if steady == true then xchr else inlet[33];
      outlet.X_ch[2] = if steady == true then xchm else inlet[34];
      outlet.X_ch[3] = if steady == true then xchs else inlet[35];
      outlet.X_fa = if steady == true then xfa else inlet[36];
      outlet.X_h2 = if steady == true then xh2 else inlet[37];
      outlet.X_i[1] = if steady == true then xich else inlet[38];
      outlet.X_i[2] = if steady == true then xipr else inlet[39];
      outlet.X_i[3] = if steady == true then xili else inlet[40];
      outlet.X_i[end] = if steady == true then xi else inlet[41];
      outlet.X_li = if steady == true then xli else inlet[42];
      outlet.X_lig = if steady == true then xlig else inlet[43];
      outlet.X_mag = if steady == true then xmag else inlet[44];
      outlet.X_p = if steady == true then xp else inlet[45];
      outlet.X_pr[1] = if steady == true then xprr else inlet[46];
      outlet.X_pr[2] = if steady == true then xprs else inlet[47];
      outlet.X_pro = if steady == true then xpro else inlet[48];
      outlet.X_stru = if steady == true then xstru else inlet[49];
      outlet.X_su = if steady == true then xsu else inlet[50];
      outlet.ash = if steady == true then ashp else inlet[51];
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Info_to_mass;

    model Sink_vec
      /*Note: this model acts as a sink for inStream variables. 
                It uses the 'Settable_composites' parameters. As a result, it is just a block used to close the systems of equations when compled with 'Feed_Source_NIR' blocks, with potentially wrong results. It is recommended to consider the quantities in this block as model outputs only when this is not coupled with 'Feed_Source_NIR' blocks and there is consistency in the 'Settable_composites' values.
                Note: in alternative, extract output values directly from the 'Digester' block model or 'Mass_to_info'.*/
      //  extends ADM1_P.Settable_composites;
      extends ADM1_P.Lumped_variables;
      extends ADM1_P.ParametersADM1_stoichiometric;
      ADM1_P.Interfaces.LiquidSolid_stream inlet "Digestate inlet port" annotation(
        Placement(visible = true, transformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y[4] "Collection of offline-measurable outputs" annotation(
        Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Re-declaration of COD/VS and MW (dynamic compositions)*/
      COD_VS = COD_VS_def;
      MW = MW_def;
      inlet.pressure = 1;
      inlet.X_i = inStream(inlet.X_i);
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]);
      end for;
      inlet.X_h2 = inStream(inlet.X_h2);
      inlet.S_su = inStream(inlet.S_su);
      inlet.S_aa = inStream(inlet.S_aa);
      inlet.S_fa = inStream(inlet.S_fa);
      inlet.S_va = inStream(inlet.S_va);
      inlet.S_bu = inStream(inlet.S_bu);
      inlet.S_pro = inStream(inlet.S_pro);
      inlet.S_ac = inStream(inlet.S_ac);
      inlet.S_h2 = inStream(inlet.S_h2);
      inlet.S_ch4 = inStream(inlet.S_ch4);
      inlet.S_ic = inStream(inlet.S_ic);
      inlet.S_in = inStream(inlet.S_in);
      inlet.S_ip = inStream(inlet.S_ip);
      inlet.S_cat = inStream(inlet.S_cat);
      inlet.S_ca = inStream(inlet.S_ca);
      inlet.S_mg = inStream(inlet.S_mg);
      inlet.S_an = inStream(inlet.S_an);
      for i in 1:size(inlet.X_c, 1) loop
        inlet.X_c[i] = inStream(inlet.X_c[i]);
      end for;
      for i in 1:size(inlet.X_ch, 1) loop
        inlet.X_ch[i] = inStream(inlet.X_ch[i]);
      end for;
      for i in 1:size(inlet.X_pr, 1) loop
        inlet.X_pr[i] = inStream(inlet.X_pr[i]);
      end for;
      inlet.X_li = inStream(inlet.X_li);
      inlet.X_su = inStream(inlet.X_su);
      inlet.X_aa = inStream(inlet.X_aa);
      inlet.X_fa = inStream(inlet.X_fa);
      inlet.X_c4 = inStream(inlet.X_c4);
      inlet.X_pro = inStream(inlet.X_pro);
      inlet.X_ac = inStream(inlet.X_ac);
      inlet.X_stru = inStream(inlet.X_stru);
      inlet.X_acp = inStream(inlet.X_acp);
      inlet.X_ccm = inStream(inlet.X_ccm);
      inlet.X_mag = inStream(inlet.X_mag);
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
/*Collection of offline-measurable outputs*/
      y = {Alk, TVFA, VS, TAN};
/*Lumped charachteristics of digestate.
    Note: missing X_p contribution to macromolecules. Not clear its composition.
    Note: missing computation of Alk. A lot of additional computations about pH submodel should be carried out. It is suggested to extract information directly from 'Digester' or 'Open' model blocks.*/
      Alk = 1e-3;
      TVFA = (inlet.S_ac/COD_VS[7]/MW[7] + inlet.S_pro/COD_VS[6]/MW[6] + inlet.S_bu/COD_VS[5]/MW[5] + inlet.S_va/COD_VS[4]/MW[4])*60*1000;
      FOS_TAC = TVFA/Alk;
      VS = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_li/COD_VS_LI + inlet.S_su/COD_VS[1] + (sum(inlet.X_ch[i] for i in 1:3))/COD_VS_CH + inlet.S_aa/COD_VS[2] + sum(inlet.X_pr[2] for i in 1:2)/COD_VS_PR + inlet.S_fa/COD_VS[3] + inlet.X_li/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_i[end]/COD_VS[25] + inlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13] + f_lig_xc/COD_VS_LIG) + inlet.X_p/COD_VS[26];
      TAN = inlet.S_in*14*1000;
      COD_tot = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c[end] + inlet.X_c4 + sum(inlet.X_ch[i] for i in 1:3) + inlet.X_fa + inlet.X_h2 + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_pro + inlet.X_su + inlet.X_lig;
      COD_sol = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va;
      CH_tot = inlet.S_su/COD_VS[1] + (sum(inlet.X_ch[i] for i in 1:3) + inlet.X_c[end]*f_xi_xc*f_ch_xi + inlet.X_c[end]*f_si_xc*f_ch_si + inlet.X_c[end]*f_ch_xc + inlet.S_i[1] + inlet.X_i[1] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (inlet.X_lig + inlet.X_c[end]*f_lig_xc)/COD_VS_LIG + inlet.X_p;
      PR_tot_BCA = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_xi_xc*f_pr_xi + inlet.X_c[end]*f_si_xc*f_pr_si + inlet.X_c[end]*f_ch_xc + inlet.S_i[2] + inlet.X_i[2] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA;
      PR_tot_TKN = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_xi_xc*f_pr_xi + inlet.X_c[end]*f_si_xc*f_pr_si + inlet.X_c[end]*f_pr_xc + inlet.S_i[2] + inlet.X_i[2] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR;
      LI_tot = (inlet.S_fa + inlet.X_li + inlet.X_c[end]*f_xi_xc*f_li_xi + inlet.X_c[end]*f_si_xc*f_li_si + inlet.X_c[end]*f_li_xc + inlet.S_i[3] + inlet.X_i[3] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_li)/COD_VS_LI;
      CH_sol = (inlet.S_su + inlet.S_i[1])/COD_VS_CH;
      PR_sol_BCA = (inlet.S_aa + inlet.S_i[2])/COD_VS_PR_BCA;
      PR_sol_TKN = (inlet.S_aa + inlet.S_i[2])/COD_VS_PR/N_PR;
      LI_sol = (inlet.S_fa + inlet.S_i[3])/COD_VS_LI;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Sink_vec;

    model Mass_to_info
      /*Block model to cast flow rate variables ('LiquidSolid_stream' interface) to pure informations.
                Similar to 'Sink_vec', but no additional computations are performed. Recommedned for the external extraction of state variables' values.*/
      ADM1_P.Interfaces.LiquidSolid_stream inlet "Digestate inlet port" annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput outlet[51] "Outlet digestate information port" annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      parameter Boolean steady = true "CombiTimeTables are not used, parameters must be set";
      /*---------------------------- Start of equation section ----------------------------*/
    equation
/*Computations of inlet*/
      inlet.pressure = 1;
      inlet.S_aa = inStream(inlet.S_aa);
      inlet.S_ac = inStream(inlet.S_ac);
      inlet.S_an = inStream(inlet.S_an);
      inlet.S_bu = inStream(inlet.S_bu);
      inlet.S_ca = inStream(inlet.S_ca);
      inlet.S_cat = inStream(inlet.S_cat);
      inlet.S_ch4 = inStream(inlet.S_ch4);
      inlet.S_fa = inStream(inlet.S_fa);
      inlet.S_h2 = inStream(inlet.S_h2);
      inlet.S_i[1] = inStream(inlet.S_i[1]);
      inlet.S_i[2] = inStream(inlet.S_i[2]);
      inlet.S_i[3] = inStream(inlet.S_i[3]);
      inlet.S_i[end] = inStream(inlet.S_i[end]);
      inlet.S_ic = inStream(inlet.S_ic);
      inlet.S_in = inStream(inlet.S_in);
      inlet.S_ip = inStream(inlet.S_ip);
      inlet.S_mg = inStream(inlet.S_mg);
      inlet.S_pro = inStream(inlet.S_pro);
      inlet.S_su = inStream(inlet.S_su);
      inlet.S_va = inStream(inlet.S_va);
      inlet.X_aa = inStream(inlet.X_aa);
      inlet.X_ac = inStream(inlet.X_ac);
      inlet.X_acp = inStream(inlet.X_acp);
      inlet.X_c[1] = inStream(inlet.X_c[1]);
      inlet.X_c[2] = inStream(inlet.X_c[2]);
      inlet.X_c[3] = inStream(inlet.X_c[3]);
      inlet.X_c[4] = inStream(inlet.X_c[4]);
      inlet.X_c[5] = inStream(inlet.X_c[5]);
      inlet.X_c[6] = inStream(inlet.X_c[6]);
      inlet.X_c[end] = inStream(inlet.X_c[end]);
      inlet.X_c4 = inStream(inlet.X_c4);
      inlet.X_ccm = inStream(inlet.X_ccm);
      inlet.X_ch[1] = inStream(inlet.X_ch[1]);
      inlet.X_ch[2] = inStream(inlet.X_ch[2]);
      inlet.X_ch[3] = inStream(inlet.X_ch[3]);
      inlet.X_fa = inStream(inlet.X_fa);
      inlet.X_h2 = inStream(inlet.X_h2);
      inlet.X_i[1] = inStream(inlet.X_i[1]);
      inlet.X_i[2] = inStream(inlet.X_i[2]);
      inlet.X_i[3] = inStream(inlet.X_i[3]);
      inlet.X_i[end] = inStream(inlet.X_i[end]);
      inlet.X_li = inStream(inlet.X_li);
      inlet.X_lig = inStream(inlet.X_lig);
      inlet.X_mag = inStream(inlet.X_mag);
      inlet.X_p = inStream(inlet.X_p);
      inlet.X_pr[1] = inStream(inlet.X_pr[1]);
      inlet.X_pr[2] = inStream(inlet.X_pr[2]);
      inlet.X_pro = inStream(inlet.X_pro);
      inlet.X_stru = inStream(inlet.X_stru);
      inlet.X_su = inStream(inlet.X_su);
      inlet.ash = inStream(inlet.ash);
/*Computations of outlet*/
      inlet.S_aa = outlet[1];
      inlet.S_ac = outlet[2];
      inlet.S_an = outlet[3];
      inlet.S_bu = outlet[4];
      inlet.S_ca = outlet[5];
      inlet.S_cat = outlet[6];
      inlet.S_ch4 = outlet[7];
      inlet.S_fa = outlet[8];
      inlet.S_h2 = outlet[9];
      inlet.S_i[1] = outlet[10];
      inlet.S_i[2] = outlet[11];
      inlet.S_i[3] = outlet[12];
      inlet.S_i[end] = outlet[13];
      inlet.S_ic = outlet[14];
      inlet.S_in = outlet[15];
      inlet.S_ip = outlet[16];
      inlet.S_mg = outlet[17];
      inlet.S_pro = outlet[18];
      inlet.S_su = outlet[19];
      inlet.S_va = outlet[20];
      inlet.X_aa = outlet[21];
      inlet.X_ac = outlet[22];
      inlet.X_acp = outlet[23];
      inlet.X_c[1] = outlet[24];
      inlet.X_c[2] = outlet[25];
      inlet.X_c[3] = outlet[26];
      inlet.X_c[4] = outlet[27];
      inlet.X_c[5] = outlet[28];
      inlet.X_c[6] = outlet[29];
      inlet.X_c[end] = outlet[30];
      inlet.X_c4 = outlet[31];
      inlet.X_ccm = outlet[32];
      inlet.X_ch[1] = outlet[33];
      inlet.X_ch[2] = outlet[34];
      inlet.X_ch[3] = outlet[35];
      inlet.X_fa = outlet[36];
      inlet.X_h2 = outlet[37];
      inlet.X_i[1] = outlet[38];
      inlet.X_i[2] = outlet[39];
      inlet.X_i[3] = outlet[40];
      inlet.X_i[end] = outlet[41];
      inlet.X_li = outlet[42];
      inlet.X_lig = outlet[43];
      inlet.X_mag = outlet[44];
      inlet.X_p = outlet[45];
      inlet.X_pr[1] = outlet[46];
      inlet.X_pr[2] = outlet[47];
      inlet.X_pro = outlet[48];
      inlet.X_stru = outlet[49];
      inlet.X_su = outlet[50];
      inlet.ash = outlet[51];
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Mass_to_info;
  end BlockLibrary;

  package Control
    model PI_with_tracking
      /*Block model with the formulation of a PI controller with 'override'/'tracking' of a TR (see below) active control action ('anti wind-up').
                Part of the 'selector-PI' controller. For further description visit DOI: 10.1109/CDC56724.2024.10886344.*/
      parameter Real K = 1;
      parameter Real Ti = 1;
      parameter Real CSmin = 0;
      parameter Real CSmax = 1;
      parameter Real Ts = 0.05;
      discrete Real e, up, ui, uio(start = 0), u;
      Modelica.Blocks.Interfaces.RealInput SP "setpoint" annotation(
        Placement(visible = true, transformation(origin = {-126, 70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput PV "process output" annotation(
        Placement(visible = true, transformation(origin = {-114, 12}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanInput TS "boolean condition" annotation(
        Placement(visible = true, transformation(origin = {-172, -58}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput TR "switch control output" annotation(
        Placement(visible = true, transformation(origin = {-192, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput CS "block control output" annotation(
        Placement(visible = true, transformation(origin = {46, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    equation
      u = CS;
    algorithm
      when sample(0, Ts) then
        e := SP - PV;
        up := K*e;
        if TS then
          u := TR;
        else
          ui := uio + K*Ts/Ti*e;
          u := up + ui "Note: to test P instead of PI, comment out the '+ ui' part in this line.";
        end if;
        u := max(CSmin, min(CSmax, u));
        uio := u - up "Note: to test the controller without 'anti wind-up' capability, substitute this line with 'uio:=ui'";
      end when;
    end PI_with_tracking;

    model Switch
      /*Model to switch between two signals based on a boolean condition*/
      extends Modelica.Blocks.Logical.Switch;
    equation

    end Switch;

    model HysteresisComparator
      /*Model to check if an input signal lays within a bandwidth of values. Returns boolean condition depending on current result and the previous boolean condition.*/
      extends Modelica.Blocks.Logical.Hysteresis;
    end HysteresisComparator;

    model Example_controller_selection
      /*Example of closed-loop test with the selector-PI controller.
                SISO case on a simple second-order process*/
      PI_with_tracking PI_1(K = 5, Ti = 1, Ts = 0.01) annotation(
        Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      PI_with_tracking PI_2(K = 2, Ti = 4, Ts = 0.01) annotation(
        Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Logical.Switch switch annotation(
        Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.RealExpression SP(y = 0.5 + 0.2*sin(6.28/5*time)) annotation(
        Placement(visible = true, transformation(origin = {-150, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Logical.Not not1 annotation(
        Placement(visible = true, transformation(origin = {-120, -4}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Sources.BooleanExpression PI_1_active(y = sin(6.28/30*time) > 0) annotation(
        Placement(visible = true, transformation(origin = {-150, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction Process(a = {2, 1}, b = {1}) annotation(
        Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(PI_1.CS, switch.u1) annotation(
        Line(points = {{-38, 36}, {-20, 36}, {-20, 8}, {-2, 8}}, color = {0, 0, 127}));
      connect(PI_2.CS, switch.u3) annotation(
        Line(points = {{-38, -24}, {-20, -24}, {-20, -8}, {-2, -8}}, color = {0, 0, 127}));
      connect(switch.y, PI_2.TR) annotation(
        Line(points = {{21, 0}, {39, 0}, {39, -60}, {-71, -60}, {-71, -36}, {-63, -36}}, color = {0, 0, 127}));
      connect(SP.y, PI_1.SP) annotation(
        Line(points = {{-139, 36}, {-63, 36}}, color = {0, 0, 127}));
      connect(SP.y, PI_2.SP) annotation(
        Line(points = {{-139, 36}, {-101, 36}, {-101, -24}, {-63, -24}}, color = {0, 0, 127}));
      connect(PI_1_active.y, PI_2.TS) annotation(
        Line(points = {{-138, -32}, {-62, -32}}, color = {255, 0, 255}));
      connect(PI_1_active.y, switch.u2) annotation(
        Line(points = {{-138, -32}, {-80, -32}, {-80, 0}, {-2, 0}}, color = {255, 0, 255}));
      connect(PI_1_active.y, not1.u) annotation(
        Line(points = {{-138, -32}, {-120, -32}, {-120, -12}}, color = {255, 0, 255}));
      connect(not1.y, PI_1.TS) annotation(
        Line(points = {{-120, 2}, {-120, 28}, {-62, 28}}, color = {255, 0, 255}));
      connect(PI_2.TR, PI_1.TR) annotation(
        Line(points = {{-62, -36}, {-72, -36}, {-72, 24}, {-62, 24}}, color = {0, 0, 127}));
      connect(switch.y, Process.u) annotation(
        Line(points = {{22, 0}, {58, 0}}, color = {0, 0, 127}));
      connect(Process.y, PI_2.PV) annotation(
        Line(points = {{82, 0}, {90, 0}, {90, -70}, {-90, -70}, {-90, -28}, {-62, -28}}, color = {0, 0, 127}));
      connect(PI_2.PV, PI_1.PV) annotation(
        Line(points = {{-62, -28}, {-90, -28}, {-90, 32}, {-62, 32}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-6, Interval = 0.3),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
    end Example_controller_selection;
    annotation(
      uses(Modelica(version = "4.0.0")));
  end Control;

  model A2A_FrageaSesto
  /*Block model to mimic the behaviour of the full-scale plant of A2A Fragea (Sesto ed Uniti, Cremona, Italy).
  Note 21.04.2026: problem of acidification of 'digester', i.e. first fermenter...investigate reason./
  /*(Re)declaration of 'Feed_Source_NIR' block models*/
  ADM1_P.BlockLibrary.Feed_Source_NIR maizesilage(steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADM1_P.BlockLibrary.Feed_Source_NIR pastauovo(steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADM1_P.BlockLibrary.Feed_Source_NIR farinetta(tan = 520, ortop = 441, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*Declarations of CombiTimeTables for influent characteristics*/
  Modelica.Blocks.Sources.CombiTimeTable maizesilage_data(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\txt_new\\sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable pastauovo_data(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\txt_new\\Fragea_PastaUovo_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_PastaUovo", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable farinetta_data(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\txt_new\\Fragea_Farinetta_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Farinetta", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*Declaration of TimeTables for influent flow rates*/
  Modelica.Blocks.Sources.TimeTable maizesilage_flow(table = [0, 30; 732, 30], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable pastauovo_flow(table = [0, 8; 732, 8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable farinetta_flow(table = [0, 4; 732, 4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*(Re)declaration of 'Digester' block model*/
  ADM1_P.BlockLibrary.Digester digester(V_gas = 3000*1/3, V_liq = 3000, ideality = true, k_dis = 1.2, k_hyd_xchr = 0.5, k_m_ac = 5.6, k_m_fa = 8, k_m_pro = 13, noXc = true, precipitation = false, kla = 200, k_hyd_xchm = 0.3, k_hyd_xchs = 0.01, k_hyd_xprr = 1, k_hyd_xprs = 0.2, k_hyd_xli = 0.3, k_m_aa = 8, Ks_ac = 0.15, Ki_hac_ac = 500, Ki_hpro_pro = 500, k_m_h2 = 35, Ks_pro = 0.3, Ks_h2 = 2.5e-5, Ks_c4 = 0.1, Ki_h2_c4 = 1e-5, Ki_h2_pro = 3.5e-6, Ks_su = 0.5, pH_UL_ac = 7, z(start = 0.5069072894), k_m_su = 8, k_m_c4 = 20, Ki_nh3_ac = 0.01) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  ADM1_P.BlockLibrary.Digester postdigester(V_gas = 3000*1/3, V_liq = 3000, ideality = true, k_dis = 1.2, k_hyd_xchr = 0.5, k_m_ac = 5.6, k_m_fa = 8, k_m_pro = 13, noXc = true, precipitation = false, kla = 200, k_hyd_xchm = 0.3, k_hyd_xchs = 0.01, k_hyd_xprr = 1, k_hyd_xprs = 0.2, k_hyd_xli = 0.3, k_m_aa = 8, Ks_ac = 0.15, Ki_hac_ac = 500, Ki_hpro_pro = 500, k_m_h2 = 35, Ks_pro = 0.3, Ks_h2 = 2.5e-5, Ks_c4 = 0.1, Ki_h2_c4 = 1e-5, Ki_h2_pro = 3.5e-6, Ks_su = 0.5, pH_UL_ac = 7, z(start = 0.5069072894), k_m_su = 8, k_m_c4 = 20, Ki_nh3_ac = 0.01) annotation(
      Placement(visible = true, transformation(origin = {83, 13}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  /*Other declarations*/
  Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.NoInit, k = 1.5, strict = false, yMax = 20000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable temperature_digester(table = [0, 46 + 273.15; 732, 46 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable temperature_data(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADM1_P.BlockLibrary.Sink_vec liquidstock annotation(
      Placement(visible = true, transformation(origin = {162, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Step pressure_set(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-44, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADM1_P.BlockLibrary.ScrewPress screwPress(eta_liq = 0.8425) annotation(
      Placement(visible = true, transformation(origin = {119, 10}, extent = {{-13, -14}, {13, 14}}, rotation = 0)));
  ADM1_P.BlockLibrary.Sink_vec solidstock annotation(
      Placement(visible = true, transformation(origin = {136, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.NoInit, k = 1.5, strict = false, yMax = 20000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {84, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 BlockLibrary.Recycle recycle(recycledQ = 38) annotation(
      Placement(visible = true, transformation(origin = {52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADM1_P.BlockLibrary.Atmosphere Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {56, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    digester.flush_flow = 0 "Simulation of N2 headspace flushing";
    postdigester.flush_flow = 0 "Simulation of N2 headspace flushing";
  /*Connect equations*/
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(temperature_digester.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(temperature_data.y, maizesilage.T_feed) annotation(
      Line(points = {{-94, -74}, {-85, -74}, {-85, -54}}, color = {0, 0, 127}));
    connect(maizesilage.outlet, digester.inlet) annotation(
      Line(points = {{-69, -55}, {12, -55}, {12, 22}, {28, 22}}));
    connect(maizesilage_data.y, maizesilage.inlet) annotation(
      Line(points = {{-155, -40}, {-85, -40}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(maizesilage_flow.y, maizesilage.Q) annotation(
      Line(points = {{-103, -20}, {-103, -34}, {-85, -34}, {-85, -52}}, color = {0, 0, 127}));
    connect(pastauovo_flow.y, pastauovo.Q) annotation(
      Line(points = {{-101, 32}, {-101, 18}, {-83, 18}, {-83, 0}}, color = {0, 0, 127}));
    connect(pastauovo_data.y, pastauovo.inlet) annotation(
      Line(points = {{-153, 12}, {-83, 12}, {-83, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(farinetta_data.y, farinetta.inlet) annotation(
      Line(points = {{-151, 60}, {-83, 60}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(farinetta_flow.y, farinetta.Q) annotation(
      Line(points = {{-103, 82}, {-103, 44}, {-83, 44}}, color = {0, 0, 127}));
    connect(farinetta.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {28, 42}, {28, 22}}));
    connect(pastauovo.outlet, digester.inlet) annotation(
      Line(points = {{-68, -2}, {28, -2}, {28, 22}}));
    connect(temperature_data.y, pastauovo.T_feed) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(temperature_data.y, farinetta.T_feed) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(pressure_set.y, PID_Pgas.u_m) annotation(
      Line(points = {{-33, 70}, {-33, 52}, {-6, 52}, {-6, 60}}, color = {0, 0, 127}));
    connect(screwPress.solidoutlet, solidstock.inlet) annotation(
      Line(points = {{115, -2}, {115, -41.76}, {125.9, -41.76}}));
    connect(screwPress.liquidoutlet, liquidstock.inlet) annotation(
      Line(points = {{129, 9}, {140.4, 9}, {140.4, 10.4}, {152.4, 10.4}}));
    connect(temperature_digester.y, postdigester.T_op) annotation(
      Line(points = {{-30, -78}, {70, -78}, {70, 2}}, color = {0, 0, 127}));
    connect(digester.outlet, postdigester.inlet) annotation(
      Line(points = {{56, 2}, {62, 2}, {62, 20}, {70, 20}}));
    connect(postdigester.outlet, screwPress.inlet) annotation(
      Line(points = {{96, 2}, {106, 2}, {106, -1}, {109, -1}}));
    connect(pressure_set.y, limPID.u_m) annotation(
      Line(points = {{-33, 70}, {-33, 44}, {84, 44}, {84, 58}}, color = {0, 0, 127}));
    connect(postdigester.P_gas, limPID.u_s) annotation(
      Line(points = {{80, 28}, {72, 28}, {72, 70}}, color = {0, 0, 127}));
    connect(limPID.y, postdigester.u) annotation(
      Line(points = {{96, 70}, {100, 70}, {100, 28}, {84, 28}}, color = {0, 0, 127}));
    connect(screwPress.liquidoutlet, recycle.inlet) annotation(
      Line(points = {{129, 9}, {136, 9}, {136, -20}, {64, -20}}));
    connect(recycle.outlet, digester.inlet) annotation(
      Line(points = {{44, -20}, {20, -20}, {20, 22}, {28, 22}}));
  connect(Gas_Meter.inlet, digester.Biogas_Out) annotation(
      Line(points = {{48, 82}, {48, 55}, {50, 55}, {50, 28}}));
  connect(Gas_Meter.inlet, postdigester.Biogas_Out) annotation(
      Line(points = {{48, 82}, {48, 54}, {58, 54}, {58, 36}, {90, 36}, {90, 26}}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.1536e+07, Tolerance = 1e-06, Interval = 3600.07),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS_NEWTON_DIAG,LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-180, 100}, {180, -100}})));
  end A2A_FrageaSesto;
  
  model BTS_SAntonio
  /*Block model to mimic the behaviour of the full-scale plant of BTS San Antonio (Cremona, Italy)*/
  /*(Re)declaration of 'Feed_Source_NIR' block models*/
    ADM1_P.BlockLibrary.Feed_Source_NIR maize(tan = 764, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR slurry(an = 0.02, steady = false, liquid = true) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR manure(tan = 520, ortop = 441, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR tomatopeels(liquid = false, steady = false, tan = 764) annotation(
      Placement(visible = true, transformation(origin = {-204, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Declarations of CombiTimeTables for influent characteristics*/
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\txt_new\\sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\txt_new\\sAntonio_CattleSlurry_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\txt_new\\sAntonio_Manure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable3(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\txt_new\\sAntonio_TomatoPeels_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_TomatoPeels", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-292, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*Declaration of TimeTables for influent flow rates*/
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 42 + 273.15; 732, 42 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 37; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 130; 732, 130], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 12.8; 732, 12.8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable8(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-232, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 37, falling = 1184400, nperiod = 1, period = 28576000, rising = 1184400, startTime = 12960000, width = 5407200) annotation(
      Placement(visible = true, transformation(origin = {-238, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = -37, falling = 1184400, nperiod = 1, offset = 37, period = 28576000, rising = 1184400, startTime = 12960000, width = 5407200) annotation(
      Placement(visible = true, transformation(origin = {-144, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*(Re)declaration of 'Digester' block model*/
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = (1527 - 1350)*2 + 1.6*706.5*(6 - 4.5), V_liq = 1350*2 + 706.5*4.5, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, k_m_ac = 5.6, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 150, precipitation = true, k_hyd_xchr = 1, k_hyd_xchm = 0.3, k_hyd_xchs = 0.01, k_hyd_xprr = 1, k_hyd_xprs = 0.2, k_hyd_xli = 0.3, k_m_aa = 8, Ks_ac = 0.15, Ki_nh3_ac = 0.0018, Ki_hac_ac = 50, Ki_hpro_pro = 50, k_m_h2 = 35, Ks_pro = 0.3, Ks_h2 = 2.5e-5, Ks_c4 = 0.1, Ki_h2_c4 = 1e-5, Ki_h2_pro = 3.5e-6, Ks_su = 0.5, pH_UL_ac = 7) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  /*Other declarations*/
    Modelica.Blocks.Sources.Step step(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 43200, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 73000, strict = false, xi_start = 0.181266, yMax = 20000, yMin = 0, y_start = 13000) annotation(
      Placement(visible = true, transformation(origin = {8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Atmosphere Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {62, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec sink_vec1 annotation(
      Placement(visible = true, transformation(origin = {88, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    digester.flush_flow = 0 "Simulation of N2 headspace flushing";
/*Connect equations*/
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, maize.T_feed) annotation(
      Line(points = {{-94, -74}, {-85, -74}, {-85, -54}}, color = {0, 0, 127}));
    connect(maize.outlet, digester.inlet) annotation(
      Line(points = {{-69, -55}, {12, -55}, {12, 22}, {28, 22}}));
    connect(combiTimeTable1.y, maize.inlet) annotation(
      Line(points = {{-155, -40}, {-85, -40}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable3.y, slurry.Q) annotation(
      Line(points = {{-101, 32}, {-101, 18}, {-83, 18}, {-83, 0}}, color = {0, 0, 127}));
    connect(combiTimeTable.y, slurry.inlet) annotation(
      Line(points = {{-153, 12}, {-83, 12}, {-83, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable2.y, manure.inlet) annotation(
      Line(points = {{-151, 60}, {-83, 60}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable4.y, manure.Q) annotation(
      Line(points = {{-103, 82}, {-103, 44}, {-83, 44}}, color = {0, 0, 127}));
    connect(manure.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {28, 42}, {28, 22}}));
    connect(slurry.outlet, digester.inlet) annotation(
      Line(points = {{-68, -2}, {28, -2}, {28, 22}}));
    connect(timeTable.y, slurry.T_feed) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(timeTable.y, manure.T_feed) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(digester.outlet, sink_vec1.inlet) annotation(
      Line(points = {{56, 2}, {79, 2}}));
    connect(limPID.y, digester.u) annotation(
      Line(points = {{20, 68}, {42, 68}, {42, 30}}, color = {0, 0, 127}));
    connect(digester.P_gas, limPID.u_s) annotation(
      Line(points = {{40, 30}, {34, 30}, {34, 48}, {-14, 48}, {-14, 68}, {-4, 68}}, color = {0, 0, 127}));
    connect(step.y, limPID.u_m) annotation(
      Line(points = {{-36, 86}, {-24, 86}, {-24, 32}, {8, 32}, {8, 56}}, color = {0, 0, 127}));
    connect(timeTable8.y, tomatopeels.T_feed) annotation(
      Line(points = {{-221, -34}, {-212, -34}, {-212, -14}}, color = {0, 0, 127}));
    connect(combiTimeTable3.y, tomatopeels.inlet) annotation(
      Line(points = {{-281, 0}, {-211, 0}, {-211, -12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(tomatopeels.outlet, digester.inlet) annotation(
      Line(points = {{-196, -14}, {28, -14}, {28, 22}}));
    connect(trapezoid.y, tomatopeels.Q) annotation(
      Line(points = {{-226, 58}, {-212, 58}, {-212, -12}}, color = {0, 0, 127}));
    connect(trapezoid1.y, maize.Q) annotation(
      Line(points = {{-132, -72}, {-86, -72}, {-86, -52}}, color = {0, 0, 127}));
  connect(Gas_Meter.inlet, digester.Biogas_Out) annotation(
      Line(points = {{54, 44}, {50, 44}, {50, 28}}));
    annotation(
      experiment(StartTime = 0, StopTime = 3.1536e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "-LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"),
  Diagram(coordinateSystem(extent = {{-320, 100}, {160, -100}})));
  end BTS_SAntonio;

  model Batch_BMP_cowslurry_April2024
    /*Block model used to model a biochemical methane potential (BMP) batch test.
      Note: this formulation with the 'Digester' model was created on 14.12.2023 to overcome reinit issues related to the solution of pH nonlinear system.
      Note: it is just important to have the correct 'batch.V_liq' and proportions between water, inoculum and substrate at test start.*/
    /*Declaration of main test parameters*/
    parameter Boolean steady = true "If True, CombiTimeTables are not used in 'Info to mass', and fixed parameters are used to derive inoculum composition from CSTR digestate.";
    parameter Modelica.Units.SI.Volume V_inoculum(displayUnit = "cm3") = 200/1e6;
    Modelica.Units.SI.Volume V_water(displayUnit = "cm3") = batch.V_liq - V_inoculum - V_substrate;
    parameter Modelica.Units.SI.Volume V_substrate(displayUnit = "cm3") = 40.7/1e6;
    parameter Modelica.Units.SI.Time Test_start = 167*86400 + 3600 "Time at which inoculum is derived from CSTR, reactor headspace is flushed and 'substrate' impulse response starts [s]. Note: actual test starts at 'Test_start' + 1 day.";
    Real V_cum_water(fixed = true, start = 0) "Note: used to integrate 'V_water' just for checking purposes.";
    /*Declaration of inputs*/
    //Inoculum
    Modelica.Blocks.Interfaces.RealInput comp_inoculum[51](each start = 0) annotation(
      Placement(visible = true, transformation(origin = {-274, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -54}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    ADM1_P.BlockLibrary.Info_to_mass inoculum(aa = 0.00337876, ac = 0.0776284, an = 0.0169262, ashp = 12.4792, bu = 0.00123758, ca = 0.000035818, cat = 0.093796, ch4 = 0.0701558, fa = 0.0119432, h2 = 0.0000000254837, mg = 0.00017728, ortop = 0.00160129, pro = 0.00139284, si = 0.176218, sich = 0.176218, sili = 0.176218, sipr = 0.176218, steady = steady, su = 0.00232421, tan = 0.125718, tic = 0.202698, va = 0.000839521, xaa = 0.415135, xac = 0.85676, xacp = 3.07286E-15, xc = 0.0000000000983774, xc4 = 0.41774, xcch = 0.0000000000983774, xccm = 0.00568572, xchm = 0.129961, xchr = 0.00144898, xchs = 2.75347, xcli = 0.0000000000983774, xclig = 0.0000000000983774, xcpr = 0.0000000000983774, xcsi = 0.0000000000983774, xcxi = 0.0000000000983774, xfa = 0.180102, xh2 = 0.412131, xi = 27.5286, xich = 27.5286, xili = 0.00000294539, xipr = 0.00000629877, xli = 0.0934693, xlig = 6.64611, xmag = 0.0000000000273236, xp = 0.70487, xpro = 0.230247, xprr = 0.00011307, xprs = 0.198195, xstru = 0.0106292, xsu = 1.67745) annotation(
      Placement(visible = true, transformation(origin = {-20, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Feedstock characterization (see 'Feed_variables_NIR' and 'Feed_variables_common' for descriptions)
    parameter Real f_pr_r = 0.5;
    parameter Real f_pr_s = 0.5;
    parameter Real bd_hemicell = 28;
    parameter Real bd_cell = 10;
    parameter Real bd_li = 50;
    parameter Real bd_pr = 73;
    parameter Real an = 0.02;
    parameter Real protein = 14.71026863;
    parameter Real lipid = 4.613279511;
    parameter Real su = 0;
    parameter Real cellulose = 15.84182776;
    parameter Real hemicellulose = 9.661774071;
    parameter Real starch = 11.750863;
    parameter Real ortop = 650;
    parameter Real tan = 1400;
    parameter Real ac = 3.27313;
    parameter Real tac = 12741;
    parameter Real ph = 7.21;
    parameter Real ts = 58.4;
    parameter Real vs_ts = 78.3;
    parameter Real pro = 2.00981;
    parameter Real bu = 0.5551;
    parameter Real va = 0;
    ADM1_P.BlockLibrary.Feed_Source_NIR substrate(ac = ac, adl = 12.96940844, an = 0.02, bd_cell = bd_cell, bd_hemicell = bd_hemicell, bd_li = bd_li, bd_pr = bd_pr, bu = bu, ca = 0.007, cellulose = cellulose, f_pr_r = f_pr_r, f_pr_s = f_pr_s, hemicellulose = hemicellulose, lipid = lipid, liquid = true, mg = 0.013, ortop = ortop, ph = ph, pro = pro, protein = protein, starch = starch, steady = false, tac = tac, tan = tan, tbmp_vs = 200, ts = ts, va = va, vs_ts = vs_ts) annotation(
      Placement(visible = true, transformation(origin = {88, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable comp_slurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/CombiTimeTables/UIT_CattleSlurry_BMP_2024.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-100, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant temperature_feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-132, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Water water(an = 0.04, cat = 0.0615, inputpH = true, ph = 7, tic = 0.008394*12*1000) annotation(
      Placement(visible = true, transformation(origin = {88, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Batch(k = 43 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {48, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 10;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of 'Digester' model*/
    ADM1_P.BlockLibrary.Digester batch(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, I(start = 0.14), Ki_h2_c4 = Ki_h2_c4, Ki_h2_pro = Ki_h2_pro, Ki_hac_ac = Ki_hac_ac, Ki_hpro_pro = Ki_hpro_pro, Ki_nh3_ac = Ki_nh3_ac, Ks_ac = Ks_ac, Ks_c4 = Ks_c4, Ks_h2 = Ks_h2, Ks_pro = Ks_pro, Ks_su = Ks_su, S_an(fixed = false), S_cat(fixed = false), S_h(start = 3.04e-8), V_liq = 480/1e6, V_tot = 600/1e6, charge(fixed = true), ideality = true, inlet(Q(nominal = 1e-12)), ionic_force(fixed = true), k_dis = 1.2, k_hyd_xchm = k_hyd_xchm, k_hyd_xchr = k_hyd_xchr, k_hyd_xchs = k_hyd_xchs, k_hyd_xli = k_hyd_xli, k_hyd_xprr = k_hyd_xprr, k_hyd_xprs = k_hyd_xprs, k_m_aa = k_m_aa, k_m_ac = k_m_ac, k_m_c4 = k_m_c4, k_m_h2 = k_m_h2, k_m_pro = k_m_pro, k_m_su = k_m_su, kla = kla_batch, noXc = true, pH_UL_ac = pH_UL_ac, precipitation = false, a_h(start = 3.4e-8), z(start = 0.37)) annotation(
      Placement(visible = true, transformation(origin = {132, -68}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    /*Additional declarations*/
    ADM1_P.BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {194, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant P_ref(k = 1.03500) annotation(
      Placement(visible = true, transformation(origin = {2, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 43200, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 0.73000, strict = false, xi_start = 0.0235182, yMax = 20000, yMin = 0, y_start = 0.00646294) annotation(
      Placement(visible = true, transformation(origin = {90, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Atmosphere atmosphere annotation(
      Placement(visible = true, transformation(origin = {154, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Ouuputs
    Modelica.Blocks.Interfaces.RealOutput y_gas[4] annotation(
      Placement(visible = true, transformation(origin = {208, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {90, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_gas_batch annotation(
      Placement(visible = true, transformation(origin = {210, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {90, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_dig[6](fixed = {false, false, false, false, false, false}, start = {7.3, 121, 10536, 1810, 41, 0.0119}) annotation(
      Placement(visible = true, transformation(origin = {210, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {92, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
/*Inputs computation*/
    water.Q = if time > Test_start and time < Test_start + 86400 then (time - Test_start)*(V_water*2*24*3600/3600) else 1e-10;
    inoculum.Q = if time > Test_start and time < Test_start + 86400 then (time - Test_start)*(V_inoculum*2*24*3600/3600) else 1e-10;
    substrate.Q = if time > Test_start and time < Test_start + 86400 then (time - Test_start)*(V_substrate*2*24*3600/3600) else 1e-10;
    batch.flush_flow = if time < Test_start + 86400 - 1*3600 then 0 else if time < (Test_start + 86400 - 1*3600 + 3600) then (time - (Test_start + 86400 - 1*3600))*30/600 else 0;
/*Reinit of gaseous state variables (flush headspace)*/
    when time > (Test_start + 86400) then
      reinit(batch.CH4_cum, 0);
      reinit(batch.S_gas_co2, 0);
      reinit(batch.S_gas_ch4, 0);
      reinit(batch.S_gas_n2, 0.036339);
    end when;
    der(V_cum_water) = water.Q;
/*Outputs computation.
  Note: gas flowrates are converted in L/h (not in normal conditions!)*/
    y_gas = {batch.Q_gas*1000/24, atmosphere.x_ch4_in, atmosphere.x_co2_in, batch.Q_gas*1000/24*atmosphere.x_ch4_in};
    y_dig = {batch.pH, batch.TVFA, batch.Alk, batch.TAN, batch.VS, batch.FOS_TAC};
    y_gas_batch = batch.Q_gas*1000/24*atmosphere.x_ch4_in;
/*Connect equations*/
    connect(batch.outlet, sink_vec.inlet) annotation(
      Line(points = {{146, -80}, {184, -80}}));
    connect(temperature_feed.y, water.T_feed) annotation(
      Line(points = {{-120, -84}, {-16.5, -84}, {-16.5, -80}, {81, -80}}, color = {0, 0, 127}));
    connect(temperature_feed.y, substrate.T_feed) annotation(
      Line(points = {{-120, -84}, {-60, -84}, {-60, -106}, {81, -106}}, color = {0, 0, 127}));
    connect(T_Batch.y, batch.T_op) annotation(
      Line(points = {{60, -84}, {118, -84}, {118, -78}}, color = {0, 0, 127}));
    connect(water.outlet, batch.inlet) annotation(
      Line(points = {{96, -80}, {110, -80}, {110, -60}, {118, -60}}));
    connect(substrate.outlet, batch.inlet) annotation(
      Line(points = {{96, -106}, {118, -106}, {118, -60}}));
    connect(inoculum.outlet, batch.inlet) annotation(
      Line(points = {{-11, 31}, {-11, -60}, {118, -60}}));
    connect(inoculum.inlet, comp_inoculum) annotation(
      Line(points = {{-27, 36}, {-271, 36}, {-271, -30}, {-274, -30}}, color = {0, 0, 127}, thickness = 0.5));
    connect(P_ref.y, limPID.u_m) annotation(
      Line(points = {{13, 4}, {57, 4}, {57, -52}, {89, -52}, {89, -28}}, color = {0, 0, 127}));
    connect(limPID.y, batch.u) annotation(
      Line(points = {{102, -16}, {132, -16}, {132, -52}}, color = {0, 0, 127}));
    connect(limPID.u_s, batch.P_gas) annotation(
      Line(points = {{78, -16}, {74, -16}, {74, -40}, {130, -40}, {130, -52}}, color = {0, 0, 127}));
    connect(comp_slurry.y, substrate.inlet);
    connect(batch.Biogas_Out, atmosphere.inlet) annotation(
      Line(points = {{140, -54}, {146, -54}, {146, -38}}));
  protected
    annotation(
      experiment(StartTime = 1.45044e+07, StopTime = 1.728e+07, Tolerance = 1e-05, Interval = 900),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end Batch_BMP_cowslurry_April2024;

  model Batch_activity_Propionate_6gCOD_April2024
    /*Block model used to model an activity batch test.
      Note: this formulation with the 'Digester' model was created on 14.12.2023 to overcome reinit issues related to the solution of pH nonlinear system.
      Note: it is just important to have the correct 'batch.V_liq' and proportions between water, inoculum and substrate at test start.*/
    /*Declaration of main test parameters*/
    parameter Boolean steady = true "If True, CombiTimeTables are not used in 'Info to mass', and fixed parameters are used to derive inoculum composition from CSTR digestate.";
    parameter Modelica.Units.SI.Volume V_inoculum(displayUnit = "cm3") = 300/1e6;
    Modelica.Units.SI.Volume V_water(displayUnit = "cm3") = batch.V_liq - V_inoculum - V_substrate;
    parameter Modelica.Units.SI.Volume V_substrate(displayUnit = "cm3") = 57.6/1e6;
    parameter Modelica.Units.SI.Time Test_start = 167*86400 + 3600 "Time at which inoculum is derived from CSTR, reactor headspace is flushed and 'substrate' impulse response starts [s]. Note: actual test starts at 'Test_start' + 1 day.";
    Real V_cum_water(fixed = true, start = 0) "Note: used to integrate 'V_water' just for checking purposes.";
    /*Declaration of inputs*/
    ADM1_P.BlockLibrary.Feed_Source_Water water(an = 0.04, cat = 0.043485, inputpH = true, ph = 7.75, tic = 0.00697*12*1000) annotation(
      Placement(visible = true, transformation(origin = {88, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_Water substrate(ac = 0, cat = 0.4464, inputpH = false, pro = 48.2) annotation(
      Placement(visible = true, transformation(origin = {86, -104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput comp_inoculum[51](each start = 0) "Composition of inoculum in terms of digestate state variables" annotation(
      Placement(visible = true, transformation(origin = {-274, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -54}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    BlockLibrary.Info_to_mass inoculum(aa = 0.00337876, ac = 0.0776284, an = 0.0169262, ashp = 12.4792, bu = 0.00123758, ca = 0.000035818, cat = 0.093796, ch4 = 0.0701558, fa = 0.0119432, h2 = 0.0000000254837, mg = 0.00017728, ortop = 0.00160129, pro = 0.00139284, si = 0.176218, sich = 0.176218, sili = 0.176218, sipr = 0.176218, steady = steady, su = 0.00232421, tan = 0.125718, tic = 0.202698, va = 0.000839521, xaa = 0.415135, xac = 0.85676, xacp = 3.07286E-15, xc = 0.0000000000983774, xc4 = 0.41774, xcch = 0.0000000000983774, xccm = 0.00568572, xchm = 0.129961, xchr = 0.00144898, xchs = 2.75347, xcli = 0.0000000000983774, xclig = 0.0000000000983774, xcpr = 0.0000000000983774, xcsi = 0.0000000000983774, xcxi = 0.0000000000983774, xfa = 0.180102, xh2 = 0.412131, xi = 27.5286, xich = 27.5286, xili = 0.00000294539, xipr = 0.00000629877, xli = 0.0934693, xlig = 6.64611, xmag = 0.0000000000273236, xp = 0.70487, xpro = 0.230247, xprr = 0.00011307, xprs = 0.198195, xstru = 0.0106292, xsu = 1.67745) annotation(
      Placement(visible = true, transformation(origin = {-12, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Batch(k = 43 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {48, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant temperature_feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-132, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 10;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of 'Digester' model*/
    ADM1_P.BlockLibrary.Digester batch(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, I(start = 0.2), Ki_h2_c4 = Ki_h2_c4, Ki_h2_pro = Ki_h2_pro, Ki_hac_ac = Ki_hac_ac, Ki_hpro_pro = Ki_hpro_pro, Ki_nh3_ac = Ki_nh3_ac, Ks_ac = Ks_ac, Ks_c4 = Ks_c4, Ks_h2 = Ks_h2, Ks_pro = Ks_pro, Ks_su = Ks_su, S_an(fixed = false), S_cat(fixed = false), S_h(start = 4e-8), V_liq = 480/1e6, V_tot = 600/1e6, charge(fixed = true), ideality = false, inlet(Q(nominal = 1e-12)), ionic_force(fixed = true), k_dis = 1.2, k_hyd_xchm = k_hyd_xchm, k_hyd_xchr = k_hyd_xchr, k_hyd_xchs = k_hyd_xchs, k_hyd_xli = k_hyd_xli, k_hyd_xprr = k_hyd_xprr, k_hyd_xprs = k_hyd_xprs, k_m_aa = k_m_aa, k_m_ac = k_m_ac, k_m_c4 = k_m_c4, k_m_h2 = k_m_h2, k_m_pro = k_m_pro, k_m_su = k_m_su, kla = kla_batch, noXc = true, pH_UL_ac = pH_UL_ac, precipitation = false, a_h(start = 3.2e-8), z(start = 0.44)) annotation(
      Placement(visible = true, transformation(origin = {132, -68}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    /*Additional declarations*/
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 43200, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 0.73000, strict = false, xi_start = 0.0235182, yMax = 20000, yMin = 0, y_start = 0.00646294) annotation(
      Placement(visible = true, transformation(origin = {90, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant P_ref(k = 1.03500) annotation(
      Placement(visible = true, transformation(origin = {2, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {194, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Atmosphere atmosphere annotation(
      Placement(visible = true, transformation(origin = {158, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Ouuputs
    Modelica.Blocks.Interfaces.RealOutput y_gas[4] annotation(
      Placement(visible = true, transformation(origin = {208, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {90, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_gas_batch annotation(
      Placement(visible = true, transformation(origin = {210, -46}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {90, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_dig[6](fixed = {false, false, false, false, false, false}, start = {7.3, 121, 10536, 1810, 41, 0.0119}) annotation(
      Placement(visible = true, transformation(origin = {210, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {92, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
/*Inputs computation*/
    water.Q = if time > Test_start and time < Test_start + 86400 then (time - Test_start)*(V_water*2*24*3600/3600) else 1e-10;
    inoculum.Q = if time > Test_start and time < Test_start + 86400 then (time - Test_start)*(V_inoculum*2*24*3600/3600) else 1e-10;
    substrate.Q = if time > Test_start and time < Test_start + 86400 then (time - Test_start)*(V_substrate*2*24*3600/3600) else 1e-10;
    batch.flush_flow = if time < Test_start + 86400 - 1*3600 then 0 else if time < (Test_start + 86400 - 1*3600 + 3600) then (time - (Test_start + 86400 - 1*3600))*30/600 else 0;
/*Reinit of gaseous state variables (flush headspace)*/
    when time > (Test_start + 86400) then
      reinit(batch.CH4_cum, 0);
      reinit(batch.S_gas_co2, 0);
      reinit(batch.S_gas_ch4, 0);
      reinit(batch.S_gas_n2, 0.036339);
    end when;
    der(V_cum_water) = water.Q;
/*Outputs computation.
  Note: gas flowrates are converted in L/h (not in normal conditions!)*/
    y_gas = {batch.Q_gas*1000/24, atmosphere.x_ch4_in, atmosphere.x_co2_in, batch.Q_gas*1000/24*atmosphere.x_ch4_in};
    y_dig = {batch.pH, batch.TVFA, batch.Alk, batch.TAN, batch.VS, batch.FOS_TAC};
    y_gas_batch = batch.Q_gas*1000/24*atmosphere.x_ch4_in;
/*Connect equations*/
    connect(batch.outlet, sink_vec.inlet) annotation(
      Line(points = {{146, -80}, {184, -80}}));
    connect(temperature_feed.y, water.T_feed) annotation(
      Line(points = {{-120, -84}, {-16.5, -84}, {-16.5, -80}, {81, -80}}, color = {0, 0, 127}));
    connect(T_Batch.y, batch.T_op) annotation(
      Line(points = {{60, -84}, {118, -84}, {118, -78}}, color = {0, 0, 127}));
    connect(water.outlet, batch.inlet) annotation(
      Line(points = {{96, -80}, {110, -80}, {110, -60}, {118, -60}}));
    connect(inoculum.outlet, batch.inlet) annotation(
      Line(points = {{-4, 32}, {118, 32}, {118, -60}}));
    connect(inoculum.inlet, comp_inoculum) annotation(
      Line(points = {{-20, 36}, {-274, 36}, {-274, -30}}, color = {0, 0, 127}, thickness = 0.5));
    connect(P_ref.y, limPID.u_m) annotation(
      Line(points = {{13, 4}, {57, 4}, {57, -52}, {89, -52}, {89, -28}}, color = {0, 0, 127}));
    connect(limPID.y, batch.u) annotation(
      Line(points = {{102, -16}, {132, -16}, {132, -52}}, color = {0, 0, 127}));
    connect(limPID.u_s, batch.P_gas) annotation(
      Line(points = {{78, -16}, {68, -16}, {68, -40}, {130, -40}, {130, -52}}, color = {0, 0, 127}));
    connect(temperature_feed.y, substrate.T_feed) annotation(
      Line(points = {{-120, -84}, {-14, -84}, {-14, -110}, {78, -110}}, color = {0, 0, 127}));
    connect(substrate.outlet, batch.inlet) annotation(
      Line(points = {{94, -110}, {118, -110}, {118, -60}}));
    connect(batch.Biogas_Out, atmosphere.inlet) annotation(
      Line(points = {{140, -54}, {140, -42}, {150, -42}}));
  protected
    annotation(
      experiment(StartTime = 1.45044e+07, StopTime = 1.728e+07, Tolerance = 1e-5, Interval = 900),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump -d=aliasConflicts",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-300, 80}, {240, -120}})));
  end Batch_activity_Propionate_6gCOD_April2024;

  model Batch_activity_Acetate_10gCOD_April2024
    extends ADM1_P.Batch_activity_Propionate_6gCOD_April2024(V_substrate = 96/1e6, substrate(ac = 48.7, cat = 0.78125, pro = 0));
  equation

    annotation(
      experiment(StartTime = 1.45044e+07, StopTime = 1.728e+07, Tolerance = 1e-5, Interval = 900),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump -d=aliasConflicts",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end Batch_activity_Acetate_10gCOD_April2024;

  model Batch_activity_Acetate_3gCOD_April2024
    extends ADM1_P.Batch_activity_Propionate_6gCOD_April2024(V_substrate = 28.8/1e6, substrate(ac = 48.7, cat = 0.78125, pro = 0));
  equation

    annotation(
      experiment(StartTime = 1.45044e+07, StopTime = 1.728e+07, Tolerance = 1e-5, Interval = 900),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump -d=aliasConflicts",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end Batch_activity_Acetate_3gCOD_April2024;

  model Batch_activity_Propionate_3gCOD_April2024
    extends ADM1_P.Batch_activity_Propionate_6gCOD_April2024(V_substrate = 28.8/1e6, substrate(ac = 0, cat = 0.4464, pro = 48.2));
  equation

    annotation(
      experiment(StartTime = 1.45044e+07, StopTime = 1.728e+07, Tolerance = 1e-5, Interval = 900),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump -d=aliasConflicts",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end Batch_activity_Propionate_3gCOD_April2024;

  model Batch_April2024_externalsteady_copia
    /*Block model used to wrap together and re-initialize consistently the batch tests with a given digestate composition (e.g., from CSTR).
      Note: for ease of simulation, especially by the OpenModelica Compiler (OMC) from Python.*/
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 10;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of parameters for inoculum composition.
          Note: all vector of states excluding gaseous states in the headspace, gasbag and 'P_gas' PI controller state.*/
    parameter Real aa = 0.0006094356515138888, ac = 0.010650686308376907, an = 0.016926199732348685, bu = 0.0008385910830293881, ca = 3.641456543583061e-05, cat = 0.09379589546077637, ch4 = 0.055564481081633324, fa = 0.01193237483236201, h2 = 2.3393545210710995e-08, sich = 0.1721643677578219, sipr = 0.1721643677578219, sili = 0.1721643677578219, si = 0.1721643677578219, tic = 0.20357235702738685, tan = 0.12496174483131749, ortop = 0.0015017600457220503, mg = 0.00019702595906044597, pro = 0.0011924058321740828, su = 0.0007725035819137104, va = 0.0005749436967558217, xaa = 0.4498060720420397, xac = 0.8848971848033694, xacp = 3.0893987610409847e-15, xcch = 9.837736242496396e-11, xcpr = 9.837736242496396e-11, xcli = 9.837736242496396e-11, xcxi = 9.837736242496396e-11, xcsi = 9.837736242496396e-11, xclig = 9.837736242496396e-11, xc = 9.837736242496396e-11, xc4 = 0.41600119147631737, xccm = 0.005685116330311863, xchr = 8.387446846054853e-08, xchm = 0.11865874480552563, xchs = 2.9025299535858156, xfa = 0.18748429197640748, xh2 = 0.43105751288879374, xich = 27.528576986226263, xipr = 6.298766057255837e-06, xili = 2.9453875380472794e-06, xi = 27.528586230379858, xli = 0.14569359612725785, xlig = 6.646100141915346, xmag = 2.1417920205231412e-07, xp = 0.6886574645407436, xprr = 7.190157183846813e-05, xprs = 0.18977908019376213, xpro = 0.23719868303796318, xstru = 0.010609237882156541, xsu = 1.7370360475299031, ashp = 12.47918184059392;
    /*(Re)declaration of each lower-level batch test block model*/
    ADM1_P.Batch_activity_Acetate_10gCOD_April2024 Ac_10(Test_start = 167*86400 + 3600, batch(Ki_hac_ac = Ki_hac_ac, Ki_hpro_pro = Ki_hpro_pro, Ki_nh3_ac = Ki_nh3_ac, Ks_ac = Ks_ac, Ks_pro = Ks_pro, k_hyd_xchm = k_hyd_xchm, k_hyd_xchr = k_hyd_xchr, k_hyd_xchs = k_hyd_xchs, k_hyd_xli = k_hyd_xli, k_hyd_xprr = k_hyd_xprr, k_hyd_xprs = k_hyd_xprs, k_m_aa = k_m_aa, k_m_ac = k_m_ac, k_m_c4 = k_m_c4, k_m_h2 = k_m_h2, k_m_pro = k_m_pro, k_m_su = k_m_su, kla = kla_batch, Ks_h2 = Ks_h2, Ks_c4 = Ks_c4, Ki_h2_pro = Ki_h2_pro, Ks_su = Ks_su, pH_UL_ac = pH_UL_ac), inoculum(aa = aa, ac = ac, an = an, bu = bu, ca = ca, cat = cat, ch4 = ch4, fa = fa, h2 = h2, sich = sich, sipr = sipr, sili = sili, si = si, tic = tic, tan = tan, ortop = ortop, mg = mg, pro = pro, su = su, va = va, xaa = xaa, xac = xac, xacp = xacp, xcch = xcch, xcpr = xcpr, xcli = xcli, xcxi = xcxi, xcsi = xcsi, xclig = xclig, xc = xc, xc4 = xc4, xccm = xccm, xchr = xchr, xchm = xchm, xchs = xchs, xfa = xfa, xh2 = xh2, xich = xich, xipr = xipr, xili = xili, xi = xi, xli = xli, xlig = xlig, xmag = xmag, xp = xp, xprr = xprr, xprs = xprs, xpro = xpro, xstru = xstru, xsu = xsu, ashp = ashp)) annotation(
      Placement(visible = true, transformation(origin = {-42, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Batch_activity_Propionate_6gCOD_April2024 Pro_6(Test_start = 167*86400 + 3600, batch(Ki_hac_ac = Ki_hac_ac, Ki_hpro_pro = Ki_hpro_pro, Ki_nh3_ac = Ki_nh3_ac, Ks_ac = Ks_ac, Ks_pro = Ks_pro, k_hyd_xchm = k_hyd_xchm, k_hyd_xchr = k_hyd_xchr, k_hyd_xchs = k_hyd_xchs, k_hyd_xli = k_hyd_xli, k_hyd_xprr = k_hyd_xprr, k_hyd_xprs = k_hyd_xprs, k_m_aa = k_m_aa, k_m_ac = k_m_ac, k_m_c4 = k_m_c4, k_m_h2 = k_m_h2, k_m_pro = k_m_pro, k_m_su = k_m_su, kla = kla_batch, Ks_h2 = Ks_h2, Ks_c4 = Ks_c4, Ki_h2_pro = Ki_h2_pro, Ks_su = Ks_su, pH_UL_ac = pH_UL_ac), inoculum(aa = aa, ac = ac, an = an, bu = bu, ca = ca, cat = cat, ch4 = ch4, fa = fa, h2 = h2, sich = sich, sipr = sipr, sili = sili, si = si, tic = tic, tan = tan, ortop = ortop, mg = mg, pro = pro, su = su, va = va, xaa = xaa, xac = xac, xacp = xacp, xcch = xcch, xcpr = xcpr, xcli = xcli, xcxi = xcxi, xcsi = xcsi, xclig = xclig, xc = xc, xc4 = xc4, xccm = xccm, xchr = xchr, xchm = xchm, xchs = xchs, xfa = xfa, xh2 = xh2, xich = xich, xipr = xipr, xili = xili, xi = xi, xli = xli, xlig = xlig, xmag = xmag, xp = xp, xprr = xprr, xprs = xprs, xpro = xpro, xstru = xstru, xsu = xsu, ashp = ashp)) annotation(
      Placement(visible = true, transformation(origin = {0, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Batch_activity_Acetate_3gCOD_April2024 Ac_3(Test_start = 167*86400 + 3600, batch(Ki_hac_ac = Ki_hac_ac, Ki_hpro_pro = Ki_hpro_pro, Ki_nh3_ac = Ki_nh3_ac, Ks_ac = Ks_ac, Ks_pro = Ks_pro, k_hyd_xchm = k_hyd_xchm, k_hyd_xchr = k_hyd_xchr, k_hyd_xchs = k_hyd_xchs, k_hyd_xli = k_hyd_xli, k_hyd_xprr = k_hyd_xprr, k_hyd_xprs = k_hyd_xprs, k_m_aa = k_m_aa, k_m_ac = k_m_ac, k_m_c4 = k_m_c4, k_m_h2 = k_m_h2, k_m_pro = k_m_pro, k_m_su = k_m_su, kla = kla_batch, Ks_h2 = Ks_h2, Ks_c4 = Ks_c4, Ki_h2_pro = Ki_h2_pro, Ks_su = Ks_su, pH_UL_ac = pH_UL_ac), inoculum(aa = aa, ac = ac, an = an, bu = bu, ca = ca, cat = cat, ch4 = ch4, fa = fa, h2 = h2, sich = sich, sipr = sipr, sili = sili, si = si, tic = tic, tan = tan, ortop = ortop, mg = mg, pro = pro, su = su, va = va, xaa = xaa, xac = xac, xacp = xacp, xcch = xcch, xcpr = xcpr, xcli = xcli, xcxi = xcxi, xcsi = xcsi, xclig = xclig, xc = xc, xc4 = xc4, xccm = xccm, xchr = xchr, xchm = xchm, xchs = xchs, xfa = xfa, xh2 = xh2, xich = xich, xipr = xipr, xili = xili, xi = xi, xli = xli, xlig = xlig, xmag = xmag, xp = xp, xprr = xprr, xprs = xprs, xpro = xpro, xstru = xstru, xsu = xsu, ashp = ashp)) annotation(
      Placement(visible = true, transformation(origin = {-4, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Batch_activity_Propionate_3gCOD_April2024 Pro_3(Test_start = 167*86400 + 3600, batch(Ki_hac_ac = Ki_hac_ac, Ki_hpro_pro = Ki_hpro_pro, Ki_nh3_ac = Ki_nh3_ac, Ks_ac = Ks_ac, Ks_pro = Ks_pro, k_hyd_xchm = k_hyd_xchm, k_hyd_xchr = k_hyd_xchr, k_hyd_xchs = k_hyd_xchs, k_hyd_xli = k_hyd_xli, k_hyd_xprr = k_hyd_xprr, k_hyd_xprs = k_hyd_xprs, k_m_aa = k_m_aa, k_m_ac = k_m_ac, k_m_c4 = k_m_c4, k_m_h2 = k_m_h2, k_m_pro = k_m_pro, k_m_su = k_m_su, kla = kla_batch, Ks_h2 = Ks_h2, Ks_c4 = Ks_c4, Ki_h2_pro = Ki_h2_pro, Ks_su = Ks_su, pH_UL_ac = pH_UL_ac), inoculum(aa = aa, ac = ac, an = an, bu = bu, ca = ca, cat = cat, ch4 = ch4, fa = fa, h2 = h2, sich = sich, sipr = sipr, sili = sili, si = si, tic = tic, tan = tan, ortop = ortop, mg = mg, pro = pro, su = su, va = va, xaa = xaa, xac = xac, xacp = xacp, xcch = xcch, xcpr = xcpr, xcli = xcli, xcxi = xcxi, xcsi = xcsi, xclig = xclig, xc = xc, xc4 = xc4, xccm = xccm, xchr = xchr, xchm = xchm, xchs = xchs, xfa = xfa, xh2 = xh2, xich = xich, xipr = xipr, xili = xili, xi = xi, xli = xli, xlig = xlig, xmag = xmag, xp = xp, xprr = xprr, xprs = xprs, xpro = xpro, xstru = xstru, xsu = xsu, ashp = ashp)) annotation(
      Placement(visible = true, transformation(origin = {-4, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Batch_BMP_cowslurry_April2024 BMP_slurry(Test_start = 167*86400 + 3600, batch(Ki_hac_ac = Ki_hac_ac, Ki_hpro_pro = Ki_hpro_pro, Ki_nh3_ac = Ki_nh3_ac, Ks_ac = Ks_ac, Ks_pro = Ks_pro, k_hyd_xchm = k_hyd_xchm, k_hyd_xchr = k_hyd_xchr, k_hyd_xchs = k_hyd_xchs, k_hyd_xli = k_hyd_xli, k_hyd_xprr = k_hyd_xprr, k_hyd_xprs = k_hyd_xprs, k_m_aa = k_m_aa, k_m_ac = k_m_ac, k_m_c4 = k_m_c4, k_m_h2 = k_m_h2, k_m_pro = k_m_pro, k_m_su = k_m_su, kla = kla_batch, Ks_h2 = Ks_h2, Ks_c4 = Ks_c4, Ki_h2_pro = Ki_h2_pro, Ks_su = Ks_su, pH_UL_ac = pH_UL_ac), substrate(adl = 12.96940844, liquid = true, steady = false, tbmp_vs = 200), inoculum(aa = aa, ac = ac, an = an, bu = bu, ca = ca, cat = cat, ch4 = ch4, fa = fa, h2 = h2, sich = sich, sipr = sipr, sili = sili, si = si, tic = tic, tan = tan, ortop = ortop, mg = mg, pro = pro, su = su, va = va, xaa = xaa, xac = xac, xacp = xacp, xcch = xcch, xcpr = xcpr, xcli = xcli, xcxi = xcxi, xcsi = xcsi, xclig = xclig, xc = xc, xc4 = xc4, xccm = xccm, xchr = xchr, xchm = xchm, xchs = xchs, xfa = xfa, xh2 = xh2, xich = xich, xipr = xipr, xili = xili, xi = xi, xli = xli, xlig = xlig, xmag = xmag, xp = xp, xprr = xprr, xprs = xprs, xpro = xpro, xstru = xstru, xsu = xsu, ashp = ashp), comp_slurry.fileName = LibraryPath + "\\CombiTimeTables\\UIT_CattleSlurry_BMP_2024_check.txt") annotation(
      Placement(visible = true, transformation(origin = {-4, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
/*Insert null placeholders since no CombiTimeTable is present for inoculum composition*/
    for i in 1:size(Pro_6.comp_inoculum, 1) loop
      Pro_6.comp_inoculum[i] = 0;
      Ac_10.comp_inoculum[i] = 0;
      Ac_3.comp_inoculum[i] = 0;
      Pro_3.comp_inoculum[i] = 0;
      BMP_slurry.comp_inoculum[i] = 0;
    end for;
  protected
    annotation(
      experiment(StartTime = 1.45044e+07, StopTime = 1.728e+07, Tolerance = 1e-05, Interval = 900),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end Batch_April2024_externalsteady_copia;

  model PhD_CaseStudy_CSTR
    /*Upper-level block used to model the bench-scale facilities used during the PhD project of the author (D. Carecci).
          It models the case-study of interst during the PhD project. See PhD thesis and related publications.*/
    Modelica.Blocks.Interfaces.RealInput q[3](start = {0.1*4e-4, 0.9*(1 - 0.12)*4e-4, 0.9*0.12*4e-4}) "Co-feedstocks flow rates" annotation(
      Placement(visible = true, transformation(origin = {-274, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    /*Note: q[i]=name_i.Q allows only open-loop (OL) simulations with constant input q.start
          To perform OL simulations with custom flow rates, (i) call this model in a higher-level or (ii) at this level neglect equations for q[i] and directly specify name_i.Q = custom flow rate.*/
    Modelica.Blocks.Interfaces.RealOutput y_gas[4] "Online-measurable outputs" annotation(
      Placement(visible = true, transformation(origin = {208, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {90, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_dig[6] "Offline-measurable outputs" annotation(
      Placement(visible = true, transformation(origin = {210, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {92, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    parameter Boolean real = false "If True, some realistic quantities/conditions are considered, else, simplified cases. E.g., flow rate of co-feedstocks are taken from CombiTimeTable that read external files, else, computed internally (see also the models at higher levels, e.g. 'Chile_real_R2').";
    /*(Re)declaration of 'Digester' block model*/
    ADM1_P.BlockLibrary.Digester digester(I(start = 0.264544), Ki_nh3_ac = 0.0071428571, S_aa_start = 0.0260061, S_ac_start = 0.259353, S_an(fixed = true), S_an_start = 0.0156, S_bu_start = 0.00643617, S_ca_start = 3.28398e-05, S_cat(fixed = true), S_cat_start = 0.121528, S_ch4_start = 0.277401, S_fa_start = 0.0444521, S_gas_ch4_start = 1.27265, S_gas_co2_start = 0.0164995, S_gas_h2_start = 5.30538e-06, S_gas_nh3_start = 3.35695e-06, S_h(start = 5.38e-8), S_h2_start = 6.87765e-07, S_i_start = 0.193985, S_ic_start = 0.255202, S_in_start = 0.157029, S_ip_start = 0.00496694, S_mg_start = 5.62229e-05, S_pro_start = 0.050891, S_su_start = 0.0246664, S_va_start = 0.00353521, X_aa_start = 0.566877, X_ac_start = 1.32145, X_acp_start = 8.78817e-12, X_c4_start = 0.498118, X_c_start = 0, X_ccm_start = 0.00543116, X_ch_start = {0.82044, 0.712461, 10.3487}, X_fa_start = 0.288931, X_h2_start = 0.621273, X_i_start = 36.0924, X_li_start = 0.707873, X_lig_start = 13.3149, X_mag_start = 1.41797e-09, X_p_start = 0.77594, X_pr_start = {0.140817, 0.868087}, X_pro_start = 0.316025, X_stru_start = 0.0100858, X_su_start = 2.61837, ash_start = 14.1091, charge(fixed = false), ideality = false, inlet(Q(nominal = 1e-12)), ionic_force(fixed = false), k_dis = 1.2, k_m_ac = 5.6, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 10, noXc = true, precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    /*(Re)declaration of 'Feed_Source_NIR' block models*/
    ADM1_P.BlockLibrary.Feed_Source_NIR maize(aa = 0.0, ac = 9.457801107, adl = 1.689430052, an = 0, bd_cell = 36, bd_hemicell = 80, bd_li = 100, bd_pr = 77, bu = 0.415258619, ca = 0.007, cellulose = 22.16134715, hemicellulose = 14.60860104, lipid = 2.583834197, liquid = false, mg = 0.013, ortop = 0.0, ph = 4.3, pro = 2.606863761, protein = 6.857098446, starch = 44.3226943, steady = false, su = 0.656849784, tac = 2000, tan = 764, tbmp_vs = 352, ts = 265.7, vs_ts = 95.9) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR slurry(ac = 3.27313, adl = 12.96940844, an = 0.02, bd_cell = 10, bd_hemicell = 28, bd_li = 50, bd_pr = 73, bu = 0.5551, ca = 0.007, cellulose = 15.84182776, hemicellulose = 9.661774071, lipid = 4.613279511, liquid = true, mg = 0.013, ortop = 650, ph = 7.21, pro = 2.00981, protein = 14.71026863, starch = 11.7507863, steady = false, tac = 12741, tan = 1400, tbmp_vs = 200, ts = 58.4, vs_ts = 78.3) annotation(
      Placement(visible = true, transformation(origin = {-72, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR tomatosouce(T_ref(displayUnit = "nK"), aa = 0.0, ac = 1.023241, adl = 0.0, an = 0.02, bd_cell = 0.0, bd_hemicell = 38, bd_li = 100, bd_pr = 100, ca = 0.00325, cellulose = 0.0, f_pr_r = 0.5, f_pr_s = 0.5, hemicellulose = 28.80309091, liquid = true, mg = 0.006584362, ortop = 260, ph = 5, pro = 0, protein = 16.82121212, starch = 0.0, steady = false, su = 39.77569697, tac = 0.0, tan = 0, tbmp_vs = 506, ts = 76.9, va = 0.12298548, vs_ts = 85.4) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Declarations of CombiTimeTables for influent characteristics*/
    Modelica.Blocks.Sources.CombiTimeTable comp_maize(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\MaizeSilage_real.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-102, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable comp_slurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\CattleSlurry_real.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-100, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable comp_tomatosouce(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\TomatoSauce_real.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_TomatoSouce", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-102, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Declaration of controller that governs 'P_gas' inside the 'Digester'*/
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 43200, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 0.73000, strict = false, xi_start = 0.0235182, yMax = 20000, yMin = 0, y_start = 0.00646294) annotation(
      Placement(visible = true, transformation(origin = {8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of 'Gasbag_p' block model*/
    BlockLibrary.Gasbag_p gasbag(T_op_mean = 316.15, V_gasbag(start = 0.0045)) annotation(
      Placement(visible = true, transformation(origin = {82, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Other declarations*/
    Modelica.Blocks.Sources.Constant temperature_feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-132, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant temperature(k = 42 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {12, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant P_ref(k = 1.03500) annotation(
      Placement(visible = true, transformation(origin = {-80, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.RealExpression realExpression(y = if time > 2e6 and time < 2.2592e6 then 42 + 273.15 else 42 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-34, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Atmosphere atmosphere annotation(
      Placement(visible = true, transformation(origin = {108, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Mass_to_info mass_to_info annotation(
      Placement(visible = true, transformation(origin = {90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    digester.flush_flow = 0 "Simulation of N2 headspace flushing";
    digester.T_op = if real == true then realExpression.y else temperature.y "Simulation of real temperature drop in Chile";
/*Inputs computation*/
    q[1] = tomatosouce.Q;
    q[2] = slurry.Q;
    q[3] = maize.Q;
/*Outputs computation.
  Note: gas flowrates are converted in L/h (not in normal conditions!)*/
    y_gas = {digester.Q_gas*1000/24, gasbag.x_ch4, gasbag.x_co2, digester.Q_gas*1000/24*gasbag.x_ch4};
    y_dig = {digester.pH, digester.TVFA, digester.Alk, digester.TAN, digester.VS, digester.FOS_TAC};
/*Connect equations*/
    connect(maize.outlet, digester.inlet) annotation(
      Line(points = {{-69, -55}, {12, -55}, {12, 22}, {28, 22}}));
    connect(comp_maize.y, maize.inlet) annotation(
      Line(points = {{-91, -38}, {-83, -38}, {-83, -52}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(comp_tomatosouce.y, tomatosouce.inlet) annotation(
      Line(points = {{-91, 48}, {-81, 48}, {-81, 44}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(tomatosouce.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {28, 42}, {28, 22}}));
    connect(slurry.outlet, digester.inlet) annotation(
      Line(points = {{-63, -3}, {-63, 22}, {28, 22}}));
    connect(limPID.y, digester.u) annotation(
      Line(points = {{20, 68}, {42, 68}, {42, 30}}, color = {0, 0, 127}));
    connect(digester.P_gas, limPID.u_s) annotation(
      Line(points = {{40, 30}, {34, 30}, {34, 48}, {-14, 48}, {-14, 68}, {-4, 68}}, color = {0, 0, 127}));
    connect(slurry.T_feed, temperature_feed.y) annotation(
      Line(points = {{-80, -2}, {-80, -84}, {-121, -84}}, color = {0, 0, 127}));
    connect(maize.T_feed, temperature_feed.y) annotation(
      Line(points = {{-86, -54}, {-88, -54}, {-88, -84}, {-121, -84}}, color = {0, 0, 127}));
    connect(tomatosouce.T_feed, temperature_feed.y) annotation(
      Line(points = {{-84, 42}, {-84, -84}, {-121, -84}}, color = {0, 0, 127}));
    connect(P_ref.y, limPID.u_m) annotation(
      Line(points = {{-68, 88}, {-24, 88}, {-24, 32}, {8, 32}, {8, 56}}, color = {0, 0, 127}));
    connect(comp_slurry.y, slurry.inlet);
    connect(gasbag.inlet, digester.Biogas_Out) annotation(
      Line(points = {{74, 52}, {50, 52}, {50, 28}}));
    connect(gasbag.outlet, atmosphere.inlet) annotation(
      Line(points = {{90, 52}, {100, 52}}));
    connect(digester.outlet, mass_to_info.inlet) annotation(
      Line(points = {{56, 2}, {81, 2}}));
    annotation(
      experiment(StartTime = 0, StopTime = 5.184e+05, Tolerance = 1e-06, Interval = 360),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-300, 100}, {240, -100}})));
  end PhD_CaseStudy_CSTR;

  model Chile_real_R2
    /*Upper-level block used to model the bench-scale of the BioTA lab (USM, Valparaiso, Chile) used during the PhD project of the author (D. Carecci).
          See PhD thesis and related publications.*/
    parameter Boolean impulse = true "if True, feeding mode of co-feedstock flow rates is pulsed";
    parameter Boolean real = true "if True, the actual dosages fed in the real experiment and loaded from the proepr CombiTimeTables are considered";
    Real tfr "Counter of time for the block. Used to trigger 'when' events";
    /*Declaration of co-feedstock custom flow rates*/
    parameter Real Qtot = 400 "Total input flowrate [mL/d]";
    parameter Real feed_ratio = 0.2 "Defined as '(Qpalpable-Qcontrol)/(Qpalpable-Qcontrol+Qslurry)'";
    parameter Real liquidcontrol_ratio = 0.24 "Defined as 'Qcontrol/Qtot'. Set from 15%OLR of BTS overall reactor OLR";
    //CombiTimeTables used in synthetic and 'real' cases.
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates(columns = {2, 3, 4}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 1e6, table = [0, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 1, 0, 0, liquidcontrol_ratio*Qtot; 2, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 3, 0, 0, liquidcontrol_ratio*Qtot; 4, 3*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 3*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 5, 0, 0, liquidcontrol_ratio*Qtot; 6, 0, 0, liquidcontrol_ratio*Qtot; 7, 0, 0, liquidcontrol_ratio*Qtot], tableOnFile = false, timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-172, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates_real(columns = {2, 3}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\Manual_flowrates_real_R2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "Flowrates", tableOnFile = true, timeScale = 1) annotation(
      Placement(visible = true, transformation(origin = {-172, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Tomato_flowrate_real(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\Tomato_flowrate_real_R2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "Flowrates", tableOnFile = true, timeScale = 1) annotation(
      Placement(visible = true, transformation(origin = {-142, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Constant loads (for steady-state simulations and diet optimization)
    Modelica.Blocks.Sources.Constant slurry_bar(k = (1 - feed_ratio)*(1 - liquidcontrol_ratio)*3.7e-4) annotation(
      Placement(visible = true, transformation(origin = {-80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant silage_bar(k = feed_ratio*(1 - liquidcontrol_ratio)*3.7e-4) annotation(
      Placement(visible = true, transformation(origin = {-80, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant tomatosouce_bar(k = liquidcontrol_ratio*3.7e-4) annotation(
      Placement(visible = true, transformation(origin = {-80, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 10;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of parameters for state variables' inizialization.
          Note: all vector of states (also gasbag and 'P_gas' PI controller state.
          Note: values extracted on 24.05.2025 to make initialization coherent with 21.03.2025 10:00, BioTA experiment.*/
    parameter Real xsu = 1.77084, xaa = 0.384142, xfa = 0.249665, xc4 = 0.346494, xpro = 0.245104, xac = 0.914162, xh2 = 0.458658, xc = 9.99996e-11, xi = 0.4*25.4897, xchr = 0.706574, xchm = 0.704505, xchs = 3.67843, xprr = 0.170552, xprs = 0.687459, xli = 0.715749, xp = 0.352447, si = 0.0881116, ssu = 0.0109249, saa = 0.00482104, sfa = 0.0560122, sva = 0.0065994, sbu = 0.0113863, spro = 0.0571026, sac = 0.597495, sh2 = 7.48637e-07, sch4 = 0.240558, sic = 0.172785, sin = 0.09285714285714286, sip = 0.00397762, scat = 0.117577, sca = 0.0000668897, smg = 0.000185182, san = 0.0182832, xash = 13.3083, xlig = 0, sgh2 = 0.00000661494, sgch4 = 1.26849, sgco2 = 0.0165666, sgnh3 = 0.00000118352, sgn2 = 0, xacp = 0.0000000000165461, xstru = 0.0111487, xccm = 0.00596211, xmag = 0.00000000374112, pidi = 0.0200309, sgbch4 = 1.26448, sgbco2 = 0.0165142, sgbnh3 = 0.00000117977, sgbh2 = 0.00000659401, sgbn2 = 0;
    /*(Re)declaration of 'PhD_CaseStudy_CSTR' block model*/
    PhD_CaseStudy_CSTR Chile(digester.X_su_start = xsu, digester.X_aa_start = xaa, digester.X_fa_start = xfa, digester.X_c4_start = xc4, digester.X_pro_start = xpro, digester.X_ac_start = xac, digester.X_h2_start = xh2, digester.X_c_start = xc, digester.X_i_start = xi, digester.X_ch_start = {xchr, xchm, xchs}, digester.X_pr_start = {xprr, xprs}, digester.X_li_start = xli, digester.X_p_start = xp, digester.S_i_start = si, digester.S_su_start = ssu, digester.S_aa_start = saa, digester.S_fa_start = sfa, digester.S_va_start = sva, digester.S_bu_start = sbu, digester.S_pro_start = spro, digester.S_ac_start = sac, digester.S_h2_start = sh2, digester.S_ch4_start = sch4, digester.S_ic_start = sic, digester.S_in_start = sin, digester.S_ip_start = sip, digester.S_cat_start = scat, digester.S_ca_start = sca, digester.S_mg_start = smg, digester.S_an_start = san, digester.ash_start = xash, digester.X_lig_start = xlig, digester.S_gas_h2_start = sgh2, digester.S_gas_ch4_start = sgch4, digester.S_gas_co2_start = sgco2, digester.S_gas_nh3_start = sgnh3, digester.S_gas_n2_start = sgn2, digester.X_acp_start = xacp, digester.X_stru_start = xstru, digester.X_ccm_start = xccm, digester.X_mag_start = xmag, limPID.xi_start = pidi, gasbag.S_gas_ch4_start = sgbch4, gasbag.S_gas_co2_start = sgbco2, gasbag.S_gas_nh3_start = sgbnh3, gasbag.S_gas_h2_start = sgbh2, gasbag.S_gas_n2_start = sgbn2, real = real, digester.k_hyd_xchr = k_hyd_xchr, digester.k_hyd_xchm = k_hyd_xchm, digester.k_hyd_xchs = k_hyd_xchs, digester.k_hyd_xprr = k_hyd_xprr, digester.k_hyd_xprs = k_hyd_xprs, digester.k_hyd_xli = k_hyd_xli, digester.k_m_su = k_m_su, digester.k_m_aa = k_m_aa, digester.k_m_c4 = k_m_c4, digester.k_m_pro = k_m_pro, digester.k_m_ac = k_m_ac, digester.Ks_ac = Ks_ac, digester.Ki_nh3_ac = Ki_nh3_ac, digester.Ki_hac_ac = Ki_hac_ac, digester.Ki_hpro_pro = Ki_hpro_pro, digester.kla = kla, digester.k_m_h2 = k_m_h2, digester.Ks_pro = Ks_pro, digester.Ks_h2 = Ks_h2, digester.Ks_c4 = Ks_c4, digester.Ki_h2_c4 = Ki_h2_c4, digester.Ki_h2_pro = Ki_h2_pro, digester.Ks_su = Ks_su, digester.pH_UL_ac = pH_UL_ac, digester.V_tot = 0.015, digester.V_liq = v_liq.y[1]) annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Additional declarations*/
    BlockLibrary.Pump_onoff pump_onoff(impulse = impulse) annotation(
      Placement(visible = true, transformation(origin = {-6, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable v_liq(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\Volume_R2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Volumes", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 1, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-142, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Inputs
    Modelica.Blocks.Math.Add u3 annotation(
      Placement(visible = true, transformation(origin = {-48, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u2 annotation(
      Placement(visible = true, transformation(origin = {-44, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u1 annotation(
      Placement(visible = true, transformation(origin = {-44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Outputs
    Modelica.Blocks.Sources.Constant Qch4_bar(k = 0.456788) annotation(
      Placement(visible = true, transformation(origin = {34, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant pH_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {54, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant gasquality_bar(k = 1.18198) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add Qch4(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {92, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product annotation(
      Placement(visible = true, transformation(origin = {132, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(
      Placement(visible = true, transformation(origin = {130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add gasquality(k1 = -1) annotation(
      Placement(visible = true, transformation(origin = {174, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add pH(k1 = -1, k2 = +1) annotation(
      Placement(visible = true, transformation(origin = {92, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Interfaces to simply multiple closed-loop (CL) simulations
    Modelica.Blocks.Interfaces.RealOutput y[2] "Outputs" annotation(
      Placement(visible = true, transformation(origin = {214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u[3](each start = 0) "Closed-loop inputs (to be specified in upper-level)" annotation(
      Placement(visible = true, transformation(origin = {-178, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    when sample(0, 86400) then
      tfr = time;
    end when;
/*Cow slurry and maize silage flow rates (manual feeding)*/
    if real == true then
      u3.u1 = if impulse and time > 1e6 then 86400/300*Manual_flowrates_real.y[1]/1e6 elseif not impulse or time < 1e6 then silage_bar.y else 1e-7;
      u2.u1 = if impulse and time > 1e6 then 86400/300*Manual_flowrates_real.y[2]/1e6 elseif not impulse or time < 1e6 then slurry_bar.y else 1e-7;
      u1.u1 = if time > 1e6 then Tomato_flowrate_real.y[1]/1e6 elseif time < 1e6 then tomatosouce_bar.y else 1e-7;
    else
      u3.u1 = if (time - tfr) < 300 and impulse and time > 1e6 then 86400/300*Manual_flowrates.y[1]/1e6 elseif not impulse or time < 1e6 then silage_bar.y else 1e-7;
      u2.u1 = if (time - tfr) < 300 and impulse and time > 1e6 then 86400/300*Manual_flowrates.y[2]/1e6 elseif not impulse or time < 1e6 then slurry_bar.y else 1e-7;
      u1.u1 = if time > 1e6 then Manual_flowrates.y[3]/1e6 elseif time < 1e6 then tomatosouce_bar.y else 1e-7;
    end if;
/*Tomato flow rate (pump feeding)*/
    if time > 1e6 then
      Chile.q[1] = pump_onoff.onoff_signal;
    else
      Chile.q[1] = u1.y;
    end if;
/*Interfaces of inputs and outputs*/
    u[1] = u1.u2;
    u[2] = u2.u2;
    u[3] = u3.u2;
    y[1] = Qch4.y;
    y[2] = gasquality.y;
/*Connect equations*/
    connect(u2.y, Chile.q[2]) annotation(
      Line(points = {{-33, 32}, {-33, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(u3.y, Chile.q[3]) annotation(
      Line(points = {{-36, -22}, {36, -22}, {36, 6}}, color = {0, 0, 127}));
    connect(Chile.y_gas[4], Qch4.u1) annotation(
      Line(points = {{54, 4}, {54, 2}, {80, 2}, {80, -40}}, color = {0, 0, 127}));
    connect(Qch4_bar.y, Qch4.u2) annotation(
      Line(points = {{45, -52}, {80, -52}}, color = {0, 0, 127}));
    connect(Chile.y_gas[2], division.u1) annotation(
      Line(points = {{54, 4}, {118, 4}, {118, 26}}, color = {0, 0, 127}));
    connect(Chile.y_gas[3], division.u2) annotation(
      Line(points = {{54, 4}, {86, 4}, {86, 14}, {118, 14}}, color = {0, 0, 127}));
    connect(Chile.y_gas[1], product.u1) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -10}}, color = {0, 0, 127}));
    connect(Chile.y_gas[3], product.u2) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -22}}, color = {0, 0, 127}));
    connect(gasquality_bar.y, gasquality.u1) annotation(
      Line(points = {{142, 54}, {162, 54}, {162, 34}}, color = {0, 0, 127}));
    connect(division.y, gasquality.u2) annotation(
      Line(points = {{142, 20}, {162, 20}, {162, 22}}, color = {0, 0, 127}));
    connect(Chile.y_dig[1], pH.u2) annotation(
      Line(points = {{54, -2}, {80, -2}, {80, 28}}, color = {0, 0, 127}));
    connect(pH_bar.y, pH.u1) annotation(
      Line(points = {{66, 40}, {80, 40}}, color = {0, 0, 127}));
    connect(u1.y, pump_onoff.input_signal) annotation(
      Line(points = {{-32, 62}, {-16, 62}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 1.728e+07, Tolerance = 1e-05, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end Chile_real_R2;

  model UIT_real_R2_copia
    /*Upper-level block used to model the UIT bench-scale facility (PoliMi, Cremona, Italy) used during the PhD project of the author (D. Carecci).
          See PhD thesis and related publications.*/
    parameter Boolean impulse = true "if True, feeding mode of co-feedstock flow rates is pulsed";
    parameter Boolean real = true "if True, the actual dosages fed in the real experiment and loaded from the proepr CombiTimeTables are considered";
    Real tfr "Counter of time for the block. Used to trigger 'when' events";
    /*Declaration of co-feedstock custom flow rates*/
    parameter Real Qtot = 400 "Total input flowrate [mL/d]";
    parameter Real feed_ratio = 0.2 "Defined as '(Qpalpable-Qcontrol)/(Qpalpable-Qcontrol+Qslurry)'";
    parameter Real liquidcontrol_ratio = 0.24 "Defined as 'Qcontrol/Qtot'. Set from 15%OLR of BTS overall reactor OLR";
    //CombiTimeTables used in synthetic and 'real' cases.
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates(columns = {2, 3, 4}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 1e6, table = [0, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 1, 0, 0, liquidcontrol_ratio*Qtot; 2, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 3, 0, 0, liquidcontrol_ratio*Qtot; 4, 3*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 3*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 5, 0, 0, liquidcontrol_ratio*Qtot; 6, 0, 0, liquidcontrol_ratio*Qtot; 7, 0, 0, liquidcontrol_ratio*Qtot], tableOnFile = false, timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-172, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates_real(columns = {2, 3}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, fileName = LibraryPath + "\\CombiTimeTables\\Manual_flowrates_real_R2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "Flowrates", tableOnFile = true, timeScale = 1) annotation(
      Placement(visible = true, transformation(origin = {-172, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Tomato_flowrate_real(columns = {2}, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "\\CombiTimeTables\\Tomato_flowrate_real_R2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "Flowrates", tableOnFile = true, timeScale = 1) annotation(
      Placement(visible = true, transformation(origin = {-142, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Constant loads (for steady-state simulations and diet optimization)
    Modelica.Blocks.Sources.Constant slurry_bar(k = (1 - feed_ratio)*(1 - liquidcontrol_ratio)*3.7e-4) annotation(
      Placement(visible = true, transformation(origin = {-80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant silage_bar(k = feed_ratio*(1 - liquidcontrol_ratio)*3.7e-4) annotation(
      Placement(visible = true, transformation(origin = {-80, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant tomatosouce_bar(k = liquidcontrol_ratio*3.7e-4) annotation(
      Placement(visible = true, transformation(origin = {-80, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 10;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of parameters for state variables' inizialization.
          Note: all vector of states (also gasbag and 'P_gas' PI controller state.
          Note: values extracted on 24.05.2025 to make initialization coherent with 21.03.2025 10:00, BioTA experiment.*/
    parameter Real xsu = 1.65728, xaa = 0.541241, xfa = 0.160968, xc4 = 0.375958, xpro = 0.21632, xac = 0.891913, xh2 = 0.416472, xc = 0, xi = 24.9314, xchr = 1.46379, xchm = 0.69305, xchs = 2.06708, xprr = 0.190092, xprs = 0.666805, xli = 0.323295, xp = 0.343258, si = 0.0858146, ssu = 0.0299818, saa = 0.025083, sfa = 0.0504583, sva = 0.00966647, sbu = 0.0155887, spro = 0.0186578, sac = 1.07684, sh2 = 2.33354e-07, sch4 = 0.372485, sic = 0.203826, sin = 0.116751, sip = 0.00420842, scat = 0.119452, sca = 5.63432e-05, smg = 0.000122709, san = 0.0182832, xash = 12.8749, xlig = 7.88827, sgh2 = 1.35944e-06, sgch4 = 1.28316, sgco2 = 0.016337, sgnh3 = 1.81043e-06, sgn2 = 0, xacp = 1.50977e-11, xstru = 0.0100953, xccm = 0.00537178, xmag = 2.76859e-9, pidi = 0.0188717, sgbch4 = 1.28316, sgbco2 = 0.016337, sgbnh3 = 1.81043e-06, sgbh2 = 1.35944e-06, sgbn2 = 0;
    /*(Re)declaration of 'PhD_CaseStudy_CSTR' block model*/
    PhD_CaseStudy_CSTR uit(digester.X_su_start = xsu, digester.X_aa_start = xaa, digester.X_fa_start = xfa, digester.X_c4_start = xc4, digester.X_pro_start = xpro, digester.X_ac_start = xac, digester.X_h2_start = xh2, digester.X_c_start = xc, digester.X_i_start = xi, digester.X_ch_start = {xchr, xchm, xchs}, digester.X_pr_start = {xprr, xprs}, digester.X_li_start = xli, digester.X_p_start = xp, digester.S_i_start = si, digester.S_su_start = ssu, digester.S_aa_start = saa, digester.S_fa_start = sfa, digester.S_va_start = sva, digester.S_bu_start = sbu, digester.S_pro_start = spro, digester.S_ac_start = sac, digester.S_h2_start = sh2, digester.S_ch4_start = sch4, digester.S_ic_start = sic, digester.S_in_start = sin, digester.S_ip_start = sip, digester.S_cat_start = scat, digester.S_ca_start = sca, digester.S_mg_start = smg, digester.S_an_start = san, digester.ash_start = xash, digester.X_lig_start = xlig, digester.S_gas_h2_start = sgh2, digester.S_gas_ch4_start = sgch4, digester.S_gas_co2_start = sgco2, digester.S_gas_nh3_start = sgnh3, digester.S_gas_n2_start = sgn2, digester.X_acp_start = xacp, digester.X_stru_start = xstru, digester.X_ccm_start = xccm, digester.X_mag_start = xmag, limPID.xi_start = pidi, gasbag.S_gas_ch4_start = sgbch4, gasbag.S_gas_co2_start = sgbco2, gasbag.S_gas_nh3_start = sgbnh3, gasbag.S_gas_h2_start = sgbh2, gasbag.S_gas_n2_start = sgbn2, real = real, digester.k_hyd_xchr = k_hyd_xchr, digester.k_hyd_xchm = k_hyd_xchm, digester.k_hyd_xchs = k_hyd_xchs, digester.k_hyd_xprr = k_hyd_xprr, digester.k_hyd_xprs = k_hyd_xprs, digester.k_hyd_xli = k_hyd_xli, digester.k_m_su = k_m_su, digester.k_m_aa = k_m_aa, digester.k_m_c4 = k_m_c4, digester.k_m_pro = k_m_pro, digester.k_m_ac = k_m_ac, digester.Ks_ac = Ks_ac, digester.Ki_nh3_ac = Ki_nh3_ac, digester.Ki_hac_ac = Ki_hac_ac, digester.Ki_hpro_pro = Ki_hpro_pro, digester.kla = kla, digester.k_m_h2 = k_m_h2, digester.Ks_pro = Ks_pro, digester.Ks_h2 = Ks_h2, digester.Ks_c4 = Ks_c4, digester.Ki_h2_c4 = Ki_h2_c4, digester.Ki_h2_pro = Ki_h2_pro, digester.Ks_su = Ks_su, digester.pH_UL_ac = pH_UL_ac, comp_tomatosouce.fileName = LibraryPath + "\\CombiTimeTables\\UIT_TomatoSouce_nir_CampoLargocomp_2024_sugars.txt", digester.V_tot = 0.0344/2, digester.V_liq = v_liq.y[1], comp_maize.fileName = LibraryPath + "\\CombiTimeTables\\UIT_MaizeSilage_2024_highvfa_check.txt", comp_slurry.fileName = LibraryPath + "\\CombiTimeTables\\UIT_CattleSlurry_real_2024_check.txt", gasbag.V_gasbag.start = 0.003) annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Additional declarations*/
    BlockLibrary.Pump_onoff pump_onoff(impulse = impulse) annotation(
      Placement(visible = true, transformation(origin = {-6, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable v_liq(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "\\CombiTimeTables\\Volume_R2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Volumes", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 1, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-142, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Inputs
    Modelica.Blocks.Math.Add u3 annotation(
      Placement(visible = true, transformation(origin = {-48, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u2 annotation(
      Placement(visible = true, transformation(origin = {-44, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u1 annotation(
      Placement(visible = true, transformation(origin = {-44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Outputs
    Modelica.Blocks.Sources.Constant Qch4_bar(k = 0.456788) annotation(
      Placement(visible = true, transformation(origin = {34, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant pH_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {54, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant gasquality_bar(k = 1.18198) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add Qch4(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {92, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product annotation(
      Placement(visible = true, transformation(origin = {132, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(
      Placement(visible = true, transformation(origin = {130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add gasquality(k1 = -1) annotation(
      Placement(visible = true, transformation(origin = {174, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add pH(k1 = -1, k2 = +1) annotation(
      Placement(visible = true, transformation(origin = {92, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Interfaces to simply multiple closed-loop (CL) simulations
    Modelica.Blocks.Interfaces.RealOutput y[2] "Outputs" annotation(
      Placement(visible = true, transformation(origin = {214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u[3](each start = 0) "Closed-loop inputs (to be specified in upper-level)" annotation(
      Placement(visible = true, transformation(origin = {-178, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    when sample(0, 86400) then
      tfr = time;
    end when;
/*Cow slurry and maize silage flow rates (manual feeding)*/
    if real == true then
      u3.u1 = if impulse and time > 1e6 then 86400/300*Manual_flowrates_real.y[1]/1e6 elseif not impulse or time < 1e6 then silage_bar.y else 1e-7;
      u2.u1 = if impulse and time > 1e6 then 86400/300*Manual_flowrates_real.y[2]/1e6 elseif not impulse or time < 1e6 then slurry_bar.y else 1e-7;
      u1.u1 = if time > 1e6 then Tomato_flowrate_real.y[1]/1e6 elseif time < 1e6 then tomatosouce_bar.y else 1e-7;
    else
      u3.u1 = if (time - tfr) < 300 and impulse and time > 1e6 then 86400/300*Manual_flowrates.y[1]/1e6 elseif not impulse or time < 1e6 then silage_bar.y else 1e-7;
      u2.u1 = if (time - tfr) < 300 and impulse and time > 1e6 then 86400/300*Manual_flowrates.y[2]/1e6 elseif not impulse or time < 1e6 then slurry_bar.y else 1e-7;
      u1.u1 = if time > 1e6 then Manual_flowrates.y[3]/1e6 elseif time < 1e6 then tomatosouce_bar.y else 1e-7;
    end if;
/*Tomato flow rate (pump feeding)*/
    if time > 1e6 then
      uit.q[1] = pump_onoff.onoff_signal;
    else
      uit.q[1] = u1.y;
    end if;
/*Interfaces of inputs and outputs*/
    u[1] = u1.u2;
    u[2] = u2.u2;
    u[3] = u3.u2;
    y[1] = Qch4.y;
    y[2] = gasquality.y;
/*Connect equations*/
    connect(u2.y, uit.q[2]) annotation(
      Line(points = {{-33, 32}, {-33, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(u3.y, uit.q[3]) annotation(
      Line(points = {{-36, -22}, {36, -22}, {36, 6}}, color = {0, 0, 127}));
    connect(uit.y_gas[4], Qch4.u1) annotation(
      Line(points = {{54, 4}, {54, 2}, {80, 2}, {80, -40}}, color = {0, 0, 127}));
    connect(Qch4_bar.y, Qch4.u2) annotation(
      Line(points = {{45, -52}, {80, -52}}, color = {0, 0, 127}));
    connect(uit.y_gas[2], division.u1) annotation(
      Line(points = {{54, 4}, {118, 4}, {118, 26}}, color = {0, 0, 127}));
    connect(uit.y_gas[3], division.u2) annotation(
      Line(points = {{54, 4}, {86, 4}, {86, 14}, {118, 14}}, color = {0, 0, 127}));
    connect(uit.y_gas[1], product.u1) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -10}}, color = {0, 0, 127}));
    connect(uit.y_gas[3], product.u2) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -22}}, color = {0, 0, 127}));
    connect(gasquality_bar.y, gasquality.u1) annotation(
      Line(points = {{142, 54}, {162, 54}, {162, 34}}, color = {0, 0, 127}));
    connect(division.y, gasquality.u2) annotation(
      Line(points = {{142, 20}, {162, 20}, {162, 22}}, color = {0, 0, 127}));
    connect(uit.y_dig[1], pH.u2) annotation(
      Line(points = {{54, -2}, {80, -2}, {80, 28}}, color = {0, 0, 127}));
    connect(pH_bar.y, pH.u1) annotation(
      Line(points = {{66, 40}, {80, 40}}, color = {0, 0, 127}));
    connect(u1.y, pump_onoff.input_signal) annotation(
      Line(points = {{-32, 62}, {-16, 62}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 1.728e+07, Tolerance = 1e-05, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_real_R2_copia;

  model UIT_real_R2_copia_compare_AM2HNtan
    /*Upper-level block used to carry out the first-stage training of the AM2HN-like models on agri-AcoDM-generated synthetic data.
          See PhD thesis (D. Carecci) and related publications.*/
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 10;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of 'UIT_real_R2_copia'*/
    UIT_real_R2_copia uit_real_R2(uit.digester.k_hyd_xchr = k_hyd_xchr, uit.digester.k_hyd_xchm = k_hyd_xchm, uit.digester.k_hyd_xchs = k_hyd_xchs, uit.digester.k_hyd_xprr = k_hyd_xprr, uit.digester.k_hyd_xprs = k_hyd_xprs, uit.digester.k_hyd_xli = k_hyd_xli, uit.digester.k_m_su = k_m_su, uit.digester.k_m_aa = k_m_aa, uit.digester.k_m_c4 = k_m_c4, uit.digester.k_m_pro = k_m_pro, uit.digester.k_m_ac = k_m_ac, uit.digester.Ks_ac = Ks_ac, uit.digester.Ki_nh3_ac = Ki_nh3_ac, uit.digester.Ki_hac_ac = Ki_hac_ac, uit.digester.Ki_hpro_pro = Ki_hpro_pro, uit.digester.kla = kla, uit.digester.k_m_h2 = k_m_h2, uit.digester.Ks_pro = Ks_pro, uit.digester.Ks_h2 = Ks_h2, uit.digester.Ks_c4 = Ks_c4, uit.digester.Ki_h2_c4 = Ki_h2_c4, uit.digester.Ki_h2_pro = Ki_h2_pro, uit.digester.Ks_su = Ks_su, uit.digester.pH_UL_ac = pH_UL_ac, Manual_flowrates_real.fileName = LibraryPath + "\\CombiTimeTables\\Manual_flowrates_real_R2_compare_AM2HN_v2.txt", Tomato_flowrate_real.fileName = LibraryPath + "\\CombiTimeTables\\Tomato_flowrate_real_R2_compare_AM2HN_v2.txt", pump_onoff.impulse = pumprealexp);
    Boolean pumprealexp "Note: variable introduced on 26.07.2025 to stop pump-type feeding after end of real experiment and start of synthetic influent";
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    pumprealexp = if time < 12722400 then true else false;
    uIT_real_R2_copia.u = {0, 0, 0};
    annotation(
      experiment(StartTime = 0, StopTime = 19008000, Tolerance = 1e-05, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_real_R2_copia_compare_AM2HNtan;

  model Chile_OL_MPC
    /*Block model used to simulate a real reactor controlled recursively by an external controller (e.g., NMPC routine in Python).
      The external control action should given either by means of the override of the 'controlaction' parameter or set 'real' = True and give both control action and known disturbances as 'Manual_flowrates_real' CombiTimeTable (recommended).
      Note: example provided for the NMPC experimental validation at the BioTA lab (USM, Valparaiso, Chile).*/
    parameter Boolean impulse = true "if True, feeding mode of co-feedstock flow rates is pulsed";
    parameter Boolean real = true "if True, the actual dosages fed in the real experiment and loaded from the proepr CombiTimeTables are considered";
    parameter Boolean pump = false "if True, use the 'pump_onoff' block model, else, constant flow rate";
    Real tfr "Counter of time for the block. Used to trigger 'when' events";
    parameter Real fake_theta_reduction = +0.0 "Additional parameter introduced to set the 'trapezoid' in 'PartialDigester' to model a disturbance on the k_m_ac value. See DOI: 10.1109/CDC57313.2025.11312886";
    /*Declaration of co-feedstock custom flow rates*/
    parameter Real Qtot = 378.57 "Total input flowrate [mL/day]";
    parameter Real feed_ratio = 0.1606 "Defined as '(Qpalpable-Qcontrol)/(Qpalpable-Qcontrol+Qslurry)'";
    parameter Real liquidcontrol_ratio = 0.2857 "Defined as 'Qcontrol/Qtot'. Set from 15%OLR of BTS overall reactor OLR";
    parameter Real controlaction = 100 "Used to set a constant control action when 'real' = False.";
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates(columns = {2, 3, 4}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 1e6, table = [0, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 1, 0, 0, liquidcontrol_ratio*Qtot; 2, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 3, 0, 0, liquidcontrol_ratio*Qtot; 4, 3*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 3*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 5, 0, 0, liquidcontrol_ratio*Qtot; 6, 0, 0, liquidcontrol_ratio*Qtot; 7, 0, 0, liquidcontrol_ratio*Qtot], tableName = "Flowrates", tableOnFile = false, timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-172, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates_real(columns = {2, 3, 4}, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\disturbance_interval.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "Flowrates", tableOnFile = true, timeScale = 1) annotation(
      Placement(visible = true, transformation(origin = {-172, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 115/4;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of parameters for state variables' inizialization.
          Note: all vector of states (also gasbag and 'P_gas' PI controller state.
          Note: values extracted on 24.05.2025 to make initialization coherent with 21.03.2025 10:00, BioTA experiment.*/
    parameter Real xsu = 1.77084, xaa = 0.384142, xfa = 0.249665, xc4 = 0.346494, xpro = 0.245104, xac = 0.914162, xh2 = 0.458658, xc = 9.99996e-11, xi = 0.4*25.4897, xchr = 0.706574, xchm = 0.704505, xchs = 3.67843, xprr = 0.170552, xprs = 0.687459, xli = 0.715749, xp = 0.352447, si = 0.0881116, ssu = 0.0109249, saa = 0.00482104, sfa = 0.0560122, sva = 0.0065994, sbu = 0.0113863, spro = 0.0571026, sac = 0.597495, sh2 = 7.48637e-07, sch4 = 0.240558, sic = 0.172785, sin = 0.09285714285714286, sip = 0.00397762, scat = 0.117577, sca = 0.0000668897, smg = 0.000185182, san = 0.0182832, xash = 13.3083, xlig = 0, sgh2 = 0.00000661494, sgch4 = 1.26849, sgco2 = 0.0165666, sgnh3 = 0.00000118352, sgn2 = 0, xacp = 0.0000000000165461, xstru = 0.0111487, xccm = 0.00596211, xmag = 0.00000000374112, pidi = 0.0200309, sgbch4 = 1.26448, sgbco2 = 0.0165142, sgbnh3 = 0.00000117977, sgbh2 = 0.00000659401, sgbn2 = 0;
    /*(Re)declaration of 'PhD_CaseStudy_CSTR' block model*/
    PhD_CaseStudy_CSTR Chile(digester.X_su_start = xsu, digester.X_aa_start = xaa, digester.X_fa_start = xfa, digester.X_c4_start = xc4, digester.X_pro_start = xpro, digester.X_ac_start = xac, digester.X_h2_start = xh2, digester.X_c_start = xc, digester.X_i_start = xi, digester.X_ch_start = {xchr, xchm, xchs}, digester.X_pr_start = {xprr, xprs}, digester.X_li_start = xli, digester.X_p_start = xp, digester.S_i_start = si, digester.S_su_start = ssu, digester.S_aa_start = saa, digester.S_fa_start = sfa, digester.S_va_start = sva, digester.S_bu_start = sbu, digester.S_pro_start = spro, digester.S_ac_start = sac, digester.S_h2_start = sh2, digester.S_ch4_start = sch4, digester.S_ic_start = sic, digester.S_in_start = sin, digester.S_ip_start = sip, digester.S_cat_start = scat, digester.S_ca_start = sca, digester.S_mg_start = smg, digester.S_an_start = san, digester.ash_start = xash, digester.X_lig_start = xlig, digester.S_gas_h2_start = sgh2, digester.S_gas_ch4_start = sgch4, digester.S_gas_co2_start = sgco2, digester.S_gas_nh3_start = sgnh3, digester.S_gas_n2_start = sgn2, digester.X_acp_start = xacp, digester.X_stru_start = xstru, digester.X_ccm_start = xccm, digester.X_mag_start = xmag, limPID.xi_start = pidi, gasbag.S_gas_ch4_start = sgbch4, gasbag.S_gas_co2_start = sgbco2, gasbag.S_gas_nh3_start = sgbnh3, gasbag.S_gas_h2_start = sgbh2, gasbag.S_gas_n2_start = sgbn2, real = real, digester.k_hyd_xchr = k_hyd_xchr, digester.k_hyd_xchm = k_hyd_xchm, digester.k_hyd_xchs = k_hyd_xchs, digester.k_hyd_xprr = k_hyd_xprr, digester.k_hyd_xprs = k_hyd_xprs, digester.k_hyd_xli = k_hyd_xli, digester.k_m_su = k_m_su, digester.k_m_aa = k_m_aa, digester.k_m_c4 = k_m_c4, digester.k_m_pro = k_m_pro, digester.k_m_ac = k_m_ac, digester.Ks_ac = Ks_ac, digester.Ki_nh3_ac = Ki_nh3_ac, digester.Ki_hac_ac = Ki_hac_ac, digester.Ki_hpro_pro = Ki_hpro_pro, digester.kla = kla, digester.k_m_h2 = k_m_h2, digester.Ks_pro = Ks_pro, digester.Ks_h2 = Ks_h2, digester.Ks_c4 = Ks_c4, digester.Ki_h2_c4 = Ki_h2_c4, digester.Ki_h2_pro = Ki_h2_pro, digester.Ks_su = Ks_su, digester.pH_UL_ac = pH_UL_ac, digester.V_tot = 0.015, digester.V_liq = 0.012, maize.cat = 0,  // digester.trapezoid.amplitude=2.31,digester.trapezoid.startTime = 691200,digester.trapezoid.width = 8*86400,
    digester.trapezoid.offset = fake_theta_reduction, comp_maize.fileName = LibraryPath + "\\CombiTimeTables\\Chile\\MaizeSilage_real_LaRotunda.txt", comp_tomatosouce.fileName = LibraryPath + "\\CombiTimeTables\\Chile\\TomatoSauce_real_new_withspike.txt", comp_slurry.fileName = LibraryPath + "\\CombiTimeTables\\Chile\\CattleSlurry_real_last.txt", tomatosouce.an = 0.05, comp_maize.timeScale = 1, comp_tomatosouce.timeScale = 1, comp_slurry.timeScale = 1) annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Additional declarations*/
    BlockLibrary.Pump_onoff pump_onoff(impulse = impulse) annotation(
      Placement(visible = true, transformation(origin = {-6, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Inputs
    Modelica.Blocks.Sources.Constant slurry_bar(k = 240/1e6) annotation(
      Placement(visible = true, transformation(origin = {-80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant silage_bar(k = 39/1e6) annotation(
      Placement(visible = true, transformation(origin = {-80, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step tomatosouce_step(height = 0, offset = max(controlaction/1e6, 0), startTime(displayUnit = "Ms") = 0) annotation(
      Placement(visible = true, transformation(origin = {-80, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Outputs
    Real y_gas_noisy[3] "Online-available measurements with noise";
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    when sample(0, 86400) then
      tfr = time;
    end when;
/*Cow slurry and maize silage flow rates (manual feeding)*/
    if real == true then
      Chile.q[3] = if impulse then 86400/300*Manual_flowrates_real.y[1]/1e6 elseif not impulse then silage_bar.y else 1e-10;
      Chile.q[2] = if impulse then 86400/300*Manual_flowrates_real.y[2]/1e6 elseif not impulse then slurry_bar.y else 1e-10;
    else
      Chile.q[3] = if (time - tfr) < 300 and impulse then 86400/300*Manual_flowrates.y[1]/1e6 elseif not impulse then silage_bar.y else 1e-10;
      Chile.q[2] = if (time - tfr) < 300 and impulse then 86400/300*Manual_flowrates.y[2]/1e6 elseif not impulse then slurry_bar.y else 1e-10;
    end if;
/*Tomato flow rate (pump feeding)*/
    if pump then
      Chile.q[1] = pump_onoff.onoff_signal;
    else
      Chile.q[1] = Manual_flowrates_real.y[3]/1e6;
    end if;
/*Noisy measurements.
  Note: if not setting noise in Python, add '*(1 + y_noisex.y)'*/
    y_gas_noisy[1] = Chile.y_gas[1];
    y_gas_noisy[2] = Chile.y_gas[2];
    y_gas_noisy[3] = Chile.y_gas[3];
/*Connect equations*/
    connect(tomatosouce_step.y, pump_onoff.input_signal) annotation(
      Line(points = {{-68, 66}, {-16, 66}, {-16, 62}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 4.5216e+06, Tolerance = 1e-05, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end Chile_OL_MPC;

  model CSTR_OL_onoff_gasbag
    /*Block model used to attribute general custom flow rates to the inputs of 'PhD_CaseStudy_CSTR' in an open-loop (OL) fashion.
      Note: used for extension to closed-loop (CL) cases in 'UIT_CL_oldselector_newmodel', and in 'Chile_OL_optim_05_05'.*/
    parameter Boolean impulse = true "if True, feeding mode of co-feedstock flow rates is pulsed";
    parameter Boolean real = false "if True, the actual dosages fed in the real experiment and loaded from the proepr CombiTimeTables are considered";
    parameter Boolean pump = false "if True, use the 'pump_onoff' block model, else, constant flow rate";
    Real tfr "Counter of time for the block. Used to trigger 'when' events";
    parameter Real fake_theta_reduction = +0.0 "Additional parameter introduced to set the 'trapezoid' in 'PartialDigester' to model a disturbance on the k_m_ac value. See DOI: 10.1109/CDC57313.2025.11312886";
    /*Declaration of co-feedstock custom flow rates*/
    parameter Real Qtot = 378.57 "Total input flowrate [mL/d]";
    parameter Real feed_ratio = 0.1384 "Defined as '(Qpalpable-Qcontrol)/(Qpalpable-Qcontrol+Qslurry)'";
    parameter Real liquidcontrol_ratio = 0.2647 "Defined as 'Qcontrol/Qtot'. Set from 15%OLR of BTS overall reactor OLR";
    Modelica.Blocks.Sources.Constant slurry_bar(k = (1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot/1e6) annotation(
      Placement(visible = true, transformation(origin = {-80, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant silage_bar(k = feed_ratio*(1 - liquidcontrol_ratio)*Qtot/1e6) annotation(
      Placement(visible = true, transformation(origin = {-80, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant tomatosouce_bar(k = liquidcontrol_ratio*Qtot/1e6) annotation(
      Placement(visible = true, transformation(origin = {-80, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates(columns = {2, 3, 4}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\Manual_flowrates_real_R2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 1, 0, 0, liquidcontrol_ratio*Qtot; 2, 2*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 2*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 3, 0, 0, liquidcontrol_ratio*Qtot; 4, 3*feed_ratio*(1 - liquidcontrol_ratio)*Qtot, 3*(1 - feed_ratio)*(1 - liquidcontrol_ratio)*Qtot, liquidcontrol_ratio*Qtot; 5, 0, 0, liquidcontrol_ratio*Qtot; 6, 0, 0, liquidcontrol_ratio*Qtot; 7, 0, 0, liquidcontrol_ratio*Qtot], tableName = "Flowrates", tableOnFile = false, timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-172, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Manual_flowrates_real(columns = {2, 3, 4}, extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "\\CombiTimeTables\\Chile\\disturbance_interval.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, tableName = "Flowrates", tableOnFile = true, timeScale = 1) annotation(
      Placement(visible = true, transformation(origin = {-172, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of process parameters (named after the original ones declared in 'ParametersADM1_kinetic')*/
    //Nominal parameters (literature-suggested)
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 0.7;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    parameter Real k_m_aa = 50;
    parameter Real k_m_c4 = 20;
    parameter Real kla_pilot = 10;
    parameter Real kla = 115/4;
    parameter Real Ki_h2_c4 = 1e-5;
    parameter Real Ks_c4 = 0.2;
    parameter Real Ks_su = 0.5;
    //parameter Real k_hyd_xchr = 1;
    //parameter Real k_m_su = 30;
    //parameter Real k_m_pro = 13;
    //parameter Real k_m_ac = 8;
    //parameter Real Ks_ac = 0.15;
    //parameter Real Ki_nh3_ac = 0.0018;
    //parameter Real Ki_hac_ac = 2.2;
    //parameter Real Ki_hpro_pro = 2.2;
    //parameter Real kla_batch = 10 "Note: not used in this model. Declared just for Python calibration purposes";
    //parameter Real k_m_h2 = 35;
    //parameter Real Ks_pro = 0.1;
    //parameter Real Ks_h2 = 7e-6;
    //parameter Real Ki_h2_pro = 3.5e-6;
    //parameter Real pH_UL_ac = 7;
    //Values from 'definitive calibration'
    parameter Real k_hyd_xchr = 0.654105977345518;
    parameter Real k_m_su = 29.5230387359749;
    parameter Real k_m_pro = 5.289840719563;
    parameter Real k_m_ac = 4.90818614453702;
    parameter Real Ks_ac = 0.441003980200205;
    parameter Real Ki_nh3_ac = 0.00274048834778162;
    parameter Real Ki_hac_ac = 7.94406089183934;
    parameter Real Ki_hpro_pro = 3.26744250389993;
    parameter Real kla_batch = 1;
    parameter Real Ks_pro = 0.08;
    parameter Real k_m_h2 = 21.3838200665712;
    parameter Real Ks_h2 = 0.0000135448145481595;
    parameter Real Ki_h2_pro = 2.22379010526246E-06;
    parameter Real pH_UL_ac = 7.96322443907504;
    /*(Re)declaration of parameters for state variables' inizialization.
          Note: all vector of states (also gasbag and 'P_gas' PI controller state.
          Note: values extracted on 05.05.2025 to make initialization coherent with steady-state of BioTA experiment found on 24.04.2025.*/
    parameter Real xsu = 2.216918732008048, xaa = 0.32575233590650776, xfa = 0.24778656277703373, xc4 = 0.34876515816592474, xpro = 0.27145037238720626, xac = 0.982071127243428, xh2 = 0.5184334972911816, xc = 9.99999999689662e-11, xi = 22.40350772694565, xchr = 0.879574855686162, xchm = 0.6567928100460073, xchs = 3.493890569476769, xprr = 0.1409255735757316, xprs = 0.6089615777346199, xli = 0.7335949385045774, xp = 0.3883274514637304, si = 0.0970818628542947, ssu = 0.011271049517802972, saa = 0.004973219292245819, sfa = 0.05827030537069991, sva = 0.006002650975849137, sbu = 0.012013984929445653, spro = 0.0602971060335058, sac = 0.7348108523245281, sh2 = 7.727916983862798e-07, sch4 = 0.11250758805713257, sic = 0.093715373533737, sin = 0.06829313007470285, sip = 0.0008309789360047832, scat = 0.05098126294596609, sca = 0.00018734930003239857, smg = 0.0015634906392869715, san = 0.02585693213896252, xash = 13.091586102546962, xlig = 4.192628581545303, sgh2 = 1.374989764729213e-05, sgch4 = 1.2282928047513564, sgco2 = 0.01719476729108323, sgnh3 = 6.149806993731091e-07, sgn2 = 1.4284208934735333e-26, xacp = 1.4580862833168327e-11, xstru = 0.00965089051583139, xccm = 0.005827205866694336, xmag = 9.485030926668138e-05, pidi = 0.022891951114063443, sgbch4 = 1.2244076462301403, sgbco2 = 0.017140379290066943, sgbnh3 = 6.130360887017445e-07, sgbh2 = 1.370640600790507e-05, sgbn2 = 6.852393360021599e-27;
    /*(Re)declaration of 'PhD_CaseStudy_CSTR' block model*/
    PhD_CaseStudy_CSTR ol_onoff_gasbag(digester.X_su_start = xsu, digester.X_aa_start = xaa, digester.X_fa_start = xfa, digester.X_c4_start = xc4, digester.X_pro_start = xpro, digester.X_ac_start = xac, digester.X_h2_start = xh2, digester.X_c_start = xc, digester.X_i_start = xi, digester.X_ch_start = {xchr, xchm, xchs}, digester.X_pr_start = {xprr, xprs}, digester.X_li_start = xli, digester.X_p_start = xp, digester.S_i_start = si, digester.S_su_start = ssu, digester.S_aa_start = saa, digester.S_fa_start = sfa, digester.S_va_start = sva, digester.S_bu_start = sbu, digester.S_pro_start = spro, digester.S_ac_start = sac, digester.S_h2_start = sh2, digester.S_ch4_start = sch4, digester.S_ic_start = sic, digester.S_in_start = sin, digester.S_ip_start = sip, digester.S_cat_start = scat, digester.S_ca_start = sca, digester.S_mg_start = smg, digester.S_an_start = san, digester.ash_start = xash, digester.X_lig_start = xlig, digester.S_gas_h2_start = sgh2, digester.S_gas_ch4_start = sgch4, digester.S_gas_co2_start = sgco2, digester.S_gas_nh3_start = sgnh3, digester.S_gas_n2_start = sgn2, digester.X_acp_start = xacp, digester.X_stru_start = xstru, digester.X_ccm_start = xccm, digester.X_mag_start = xmag, limPID.xi_start = pidi, gasbag.S_gas_ch4_start = sgbch4, gasbag.S_gas_co2_start = sgbco2, gasbag.S_gas_nh3_start = sgbnh3, gasbag.S_gas_h2_start = sgbh2, gasbag.S_gas_n2_start = sgbn2, real = real, digester.k_hyd_xchr = k_hyd_xchr, digester.k_hyd_xchm = k_hyd_xchm, digester.k_hyd_xchs = k_hyd_xchs, digester.k_hyd_xprr = k_hyd_xprr, digester.k_hyd_xprs = k_hyd_xprs, digester.k_hyd_xli = k_hyd_xli, digester.k_m_su = k_m_su, digester.k_m_aa = k_m_aa, digester.k_m_c4 = k_m_c4, digester.k_m_pro = k_m_pro, digester.k_m_ac = k_m_ac, digester.Ks_ac = Ks_ac, digester.Ki_nh3_ac = Ki_nh3_ac, digester.Ki_hac_ac = Ki_hac_ac, digester.Ki_hpro_pro = Ki_hpro_pro, digester.kla = kla, digester.k_m_h2 = k_m_h2, digester.Ks_pro = Ks_pro, digester.Ks_h2 = Ks_h2, digester.Ks_c4 = Ks_c4, digester.Ki_h2_c4 = Ki_h2_c4, digester.Ki_h2_pro = Ki_h2_pro, digester.Ks_su = Ks_su, digester.pH_UL_ac = pH_UL_ac, digester.V_tot = 0.015, digester.V_liq = 0.012, maize.cat = 0,  //digester.trapezoid.amplitude=2,digester.trapezoid.startTime = 1814400,digester.trapezoid.width = 7*86400,
    digester.trapezoid.offset = fake_theta_reduction, comp_maize.fileName = LibraryPath + "\\CombiTimeTables\\Chile\\MaizeSilage_real_LaRotunda.txt", comp_tomatosouce.fileName = LibraryPath + "\\CombiTimeTables\\Chile\\TomatoSauce_real_new.txt", comp_slurry.fileName = LibraryPath + "\\CombiTimeTables\\Chile\\CattleSlurry_real_last.txt", tomatosouce.an = 0.05) annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Additional declarations*/
    BlockLibrary.Pump_onoff pump_onoff(impulse = impulse) annotation(
      Placement(visible = true, transformation(origin = {-6, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Inputs
    Modelica.Blocks.Math.Add u3 annotation(
      Placement(visible = true, transformation(origin = {-48, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u2 annotation(
      Placement(visible = true, transformation(origin = {-44, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add u1 annotation(
      Placement(visible = true, transformation(origin = {-44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Outputs
    Modelica.Blocks.Sources.Constant Qch4_bar(k = 0.456788) annotation(
      Placement(visible = true, transformation(origin = {34, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant pH_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {54, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant gasquality_bar(k = 1.18198) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add Qch4(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {92, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product annotation(
      Placement(visible = true, transformation(origin = {132, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(
      Placement(visible = true, transformation(origin = {130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add gasquality(k1 = -1) annotation(
      Placement(visible = true, transformation(origin = {174, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add pH(k1 = -1, k2 = +1) annotation(
      Placement(visible = true, transformation(origin = {92, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //Interfaces to simply multiple closed-loop (CL) simulations
    Modelica.Blocks.Interfaces.RealOutput y[2] annotation(
      Placement(visible = true, transformation(origin = {214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {214, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u[3](each start = 0) annotation(
      Placement(visible = true, transformation(origin = {-178, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    when sample(0, 86401) then
      tfr = time;
    end when;
/*Cow slurry and maize silage flow rates (manual feeding)*/
    if real == true then
      u3.u1 = if impulse then 86400/300*Manual_flowrates_real.y[1]/1e6 elseif not impulse then silage_bar.y else 1e-7;
      u2.u1 = if impulse then 86400/300*Manual_flowrates_real.y[2]/1e6 elseif not impulse then slurry_bar.y else 1e-7;
      u1.u1 = Manual_flowrates_real.y[3]/1e6 "Note: set Manual_flowrates_real.y[3]/1e6 = 100/1e6, if running 'UIT_CL_oldselector_newmodel' with disturbance_interval.txt";
    else
      u3.u1 = if (time - tfr) < 300 and impulse then 86400/300*Manual_flowrates.y[1]/1e6 elseif not impulse then silage_bar.y else 1e-7;
      u2.u1 = if (time - tfr) < 300 and impulse then 86400/300*Manual_flowrates.y[2]/1e6 elseif not impulse then slurry_bar.y else 1e-7;
      u1.u1 = Manual_flowrates.y[3]/1e6;
    end if;
/*Tomato flow rate (pump feeding)*/
    if pump then
      ol_onoff_gasbag.q[1] = pump_onoff.onoff_signal;
    else
      ol_onoff_gasbag.q[1] = u1.y;
    end if;
/*Interfaces of inputs and outputs*/
    u[1] = u1.u2;
    u[2] = u2.u2;
    u[3] = u3.u2;
    y[1] = Qch4.y;
    y[2] = gasquality.y;
/*Connect equations*/
    connect(u2.y, ol_onoff_gasbag.q[2]) annotation(
      Line(points = {{-33, 32}, {-33, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(u3.y, ol_onoff_gasbag.q[3]) annotation(
      Line(points = {{-36, -22}, {36, -22}, {36, 6}}, color = {0, 0, 127}));
    connect(ol_onoff_gasbag.y_gas[4], Qch4.u1) annotation(
      Line(points = {{54, 4}, {54, 2}, {80, 2}, {80, -40}}, color = {0, 0, 127}));
    connect(Qch4_bar.y, Qch4.u2) annotation(
      Line(points = {{45, -52}, {80, -52}}, color = {0, 0, 127}));
    connect(ol_onoff_gasbag.y_gas[2], division.u1) annotation(
      Line(points = {{54, 4}, {118, 4}, {118, 26}}, color = {0, 0, 127}));
    connect(ol_onoff_gasbag.y_gas[3], division.u2) annotation(
      Line(points = {{54, 4}, {86, 4}, {86, 14}, {118, 14}}, color = {0, 0, 127}));
    connect(ol_onoff_gasbag.y_gas[1], product.u1) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -10}}, color = {0, 0, 127}));
    connect(ol_onoff_gasbag.y_gas[3], product.u2) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -22}}, color = {0, 0, 127}));
    connect(gasquality_bar.y, gasquality.u1) annotation(
      Line(points = {{142, 54}, {162, 54}, {162, 34}}, color = {0, 0, 127}));
    connect(division.y, gasquality.u2) annotation(
      Line(points = {{142, 20}, {162, 20}, {162, 22}}, color = {0, 0, 127}));
    connect(ol_onoff_gasbag.y_dig[1], pH.u2) annotation(
      Line(points = {{54, -2}, {80, -2}, {80, 28}}, color = {0, 0, 127}));
    connect(pH_bar.y, pH.u1) annotation(
      Line(points = {{66, 40}, {80, 40}}, color = {0, 0, 127}));
    connect(u1.y, pump_onoff.input_signal) annotation(
      Line(points = {{-32, 62}, {-16, 62}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 5.184e+06, Tolerance = 1e-05, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end CSTR_OL_onoff_gasbag;

  model Chile_OL_optim_05_05
    /*Block used to perform the offline optimization of the input diet (co-feedstocks' flow rates as decision variables).
      Used during the experiment at the BioTA lab. (USM, Valparaiso, Chile).*/
    Real tfr "Counter of time for the block. Used to trigger 'when' events";
    parameter Boolean impulse = false "if True, feeding mode of co-feedstock flow rates is pulsed";
    parameter Boolean real = false "if True, the actual dosages fed in the real experiment and loaded from the proepr CombiTimeTables are considered";
    /*Declaration of optimization variables.
        Note: delta of flow rates with respect to a baseline condition (defined in 'CSTR_OL_onoff_gasbag') [mL/d]*/
    parameter Real tomato_delta = 11;
    parameter Real slurry_delta = -42;
    parameter Real maize_delta = 24;
    /*Declaration of co-feedstock custom flow rates.
        Note: variables used to impose ramp of transition between initial and final (optimized) diets and intermettent (munal) feeding mode of known disturbances.*/
    parameter Real tomato_duration = 1209600 "Tomato sauce ramp duration [s]";
    parameter Real slurry_duration = 1209600 "Cow slurry ramp duration [s]";
    parameter Real maize_duration = 1209600 "Maize silage ramp duration [s]";
    Real constant_delta_maize_ramp, constant_delta_slurry_ramp;
    /*(Re)declaration of co-feedstocks flow rates*/
    Modelica.Blocks.Sources.Ramp ramp_tomato(duration = tomato_duration, height = tomato_delta, offset = 0, startTime(displayUnit = "s") = 1814400) annotation(
      Placement(visible = true, transformation(origin = {-130, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp_slurry(duration = slurry_duration, height = slurry_delta, startTime(displayUnit = "s") = 1814400) annotation(
      Placement(visible = true, transformation(origin = {-132, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp_maize(duration = maize_duration, height = maize_delta, startTime(displayUnit = "s") = 1814400) annotation(
      Placement(visible = true, transformation(origin = {-130, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Manual_delta_flowrates(columns = {2, 3}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 2*maize_delta, 2*slurry_delta; 1, 0, 0; 2, 2*maize_delta, 2*slurry_delta; 3, 0, 0; 4, 3*maize_delta, 3*slurry_delta; 5, 0, 0; 6, 0, 0; 7, 0, 0], tableOnFile = false, timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-172, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of 'CSTR_OL_onoff_gasbag'*/
    CSTR_OL_onoff_gasbag pilot(impulse = impulse, real = real, kla = 115/4, ol_onoff_gasbag(comp_maize.timeScale = 1, comp_tomatosouce.timeScale = 1, comp_slurry.timeScale = 1)) annotation(
      Placement(visible = true, transformation(origin = {-66, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    when sample(0, 86401) then
      tfr = time;
    end when;
/*Computation of additional inputs*/
    pilot.u[1] = ramp_tomato.y/1e6;
    pilot.u[2] = if (time - tfr) < 300 and impulse then 86400/300*constant_delta_slurry_ramp elseif not impulse then ramp_slurry.y/1e6 else 0;
    pilot.u[3] = if (time - tfr) < 300 and impulse then 86400/300*constant_delta_maize_ramp elseif not impulse then ramp_maize.y/1e6 else 0;
    constant_delta_maize_ramp = if time < ramp_maize.startTime then 0 elseif time > ramp_maize.startTime and time < ramp_maize.startTime + maize_duration then (time - ramp_maize.startTime)*Manual_delta_flowrates.y[1]/1e6/maize_duration else Manual_delta_flowrates.y[1]/1e6;
    constant_delta_slurry_ramp = if time < ramp_slurry.startTime then 0 elseif time > ramp_slurry.startTime and time < ramp_slurry.startTime + slurry_duration then (time - ramp_slurry.startTime)*Manual_delta_flowrates.y[2]/1e6/slurry_duration else Manual_delta_flowrates.y[2]/1e6;
    annotation(
      experiment(StartTime = 0, StopTime = 1.2096e+07, Tolerance = 1e-05, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Chile_OL_optim_05_05;

  model UIT_CL_oldselector_newmodel
    /*Block model used to simulate a closed-loop experiment in which the 'CSTR_OL_onoff_gasbag' is controlled by the 'selector-PI' controller (see DOI: 10.1109/CDC56724.2024.10886344).
      Note: case-study mimicking the UIT bench-scale facility (PoliMi, Cremona, Italy).
      Note 28.01.2024: Simulates selector. Takes as 'input' the 'outputs' of the offline optimization done with "Chile_OL_23_01".
      Note: tomato u is not 'centered' around the optimal tomato u_star found, but around 'start equilibrium' values
      Note: Check if kLa override correctly*/
    Real tfr_solid "Counter of time for the block. Used to trigger 'when' events";
    parameter Boolean impulse = true "if True, feeding mode of co-feedstock flow rates is pulsed";
    parameter Boolean real = true "if True, the actual dosages fed in the real experiment and loaded from the proepr CombiTimeTables are considered";
    /*Variables to simulate diet transient of non-controllable inputs (known disturbances)
        Note: plug here values resulting from the offline optimization.*/
    parameter Real slurry_delta = 0 "Cow slurry flow rate delta with respect to a baseline condition (defined in 'CSTR_OL_onoff_gasbag') [mL/d]";
    parameter Real maize_delta = 0 "Maize silage flow rate delta with respect to a baseline condition (defined in 'CSTR_OL_onoff_gasbag') [mL/d]";
    parameter Real slurry_duration = 1209600 "Cow slury ramp duration [s]";
    parameter Real maize_duration = 1209600 "Maize silage ramp duration [s]";
    Real constant_delta_maize_ramp, constant_delta_slurry_ramp;
    Modelica.Blocks.Sources.Ramp ramp_slurry(duration = slurry_duration, height = slurry_delta, startTime(displayUnit = "s") = 2209600) annotation(
      Placement(visible = true, transformation(origin = {-132, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp_maize(duration = maize_duration, height = maize_delta, startTime(displayUnit = "s") = 2209600) annotation(
      Placement(visible = true, transformation(origin = {-130, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Manual_delta_flowrates(columns = {2, 3}, extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 1e6, table = [0, maize_delta, slurry_delta; 1, maize_delta, slurry_delta; 2, maize_delta, slurry_delta; 3, maize_delta, slurry_delta; 4, maize_delta, slurry_delta; 5, maize_delta, slurry_delta; 6, maize_delta, slurry_delta; 7, maize_delta, slurry_delta], tableOnFile = false, timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-172, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*(Re)declaration of 'CSTR_OL_onoff_gasbag'*/
    CSTR_OL_onoff_gasbag uit_ol(xsu = 1.77084, xaa = 0.384142, xfa = 0.249665, xc4 = 0.346494, xpro = 0.245104, xac = 0.914162, xh2 = 0.458658, xc = 9.99996e-11, xi = 25.4897, xchr = 0.706574, xchm = 0.704505, xchs = 3.67843, xprr = 0.170552, xprs = 0.687459, xli = 0.715749, xp = 0.352447, si = 0.0881116, ssu = 0.0109249, saa = 0.00482104, sfa = 0.0560122, sva = 0.0065994, sbu = 0.0113863, spro = 0.0571026, sac = 0.597495, sh2 = 7.48637e-07, sch4 = 0.240558, sic = 0.172785, sin = 0.079937, sip = 0.00397762, scat = 0.117577, sca = 0.0000668897, smg = 0.000185182, san = 0.0182832, xash = 13.3083, xlig = 8.2359, sgh2 = 0.00000661494, sgch4 = 1.26849, sgco2 = 0.0165666, sgnh3 = 0.00000118352, sgn2 = 0, xacp = 0.0000000000165461, xstru = 0.0111487, xccm = 0.00596211, xmag = 0.00000000374112, pidi = 0.0200309, sgbch4 = 1.26448, sgbco2 = 0.0165142, sgbnh3 = 1.17977e-06, sgbh2 = 6.59401e-06, sgbn2 = 0, kla = 10, real = real, impulse = impulse, feed_ratio = 0.116, liquidcontrol_ratio = 0.26, Qtot = 370, Manual_flowrates_real.fileName = LibraryPath + "\\CombiTimeTables\\disturbance_interval_Belgium_selector.txt", ol_onoff_gasbag(q(start = {0.24*4e-4, (1 - 0.24)*(1 - 0.4)*4e-4, (1 - 0.24)*0.4*4e-4}), digester(V_tot = 0.0344/2, V_liq = 0.012), comp_tomatosouce.fileName = LibraryPath + "\\CombiTimeTables\\UIT_TomatoSouce_nir_CampoLargocomp_2024_sugars.txt", comp_maize.fileName = LibraryPath + "\\CombiTimeTables\\UIT_MaizeSilage_steady_2024_highvfa_check_MPCtest.txt", comp_slurry.fileName = LibraryPath + "\\CombiTimeTables\\UIT_CattleSlurry_real_2024_check_MPCtest.txt", maize.cat = 0)) annotation(
      Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*Declaration of SELECTOR-PI feedback controller*/
    //Blocks
    Control.PI_with_tracking header(CSmax = 300/1e6, CSmin = -95/1e6, K = kp1, Ti = Ti1, Ts = 6*3600, uio(fixed = true, start = 0)) annotation(
      Placement(visible = true, transformation(origin = {-52, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.Control.PI_with_tracking follower(CSmax = 300/1e6, CSmin = -95/1e6, K = kp2, Ti = Ti2, Ts = 6*3600, uio(fixed = true)) annotation(
      Placement(visible = true, transformation(origin = {-54, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.Control.Switch switch annotation(
      Placement(visible = true, transformation(origin = {52, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.Control.HysteresisComparator hysteresisComparator(pre_y_start = true, uHigh = 0.923, uLow = 0.873) annotation(
      Placement(visible = true, transformation(origin = {2, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Logical.Not not11 annotation(
      Placement(visible = true, transformation(origin = {-26, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    //(Re)declaration of parameters
    parameter Real kp1 = 0.0022 "Proportional gain of 'header' controller";
    parameter Real kp2 = 0.0056 "Proportional gain of 'follower' controller";
    parameter Real Ti1 = 23233 "Integration constant of 'header' controller [s]";
    parameter Real Ti2 = 49317 "Integration constant of 'follower' controller [s]";
    /*Additional declarations*/
    //Feedback outputs
    Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod = 6*3600, sigma = 0.05) annotation(
      Placement(visible = true, transformation(origin = {134, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Noise.NormalNoise normalNoise1(samplePeriod = 6*3600, sigma = 0.01) annotation(
      Placement(visible = true, transformation(origin = {158, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Real y_gas_noisy[3] "Online-available measurements with noise";
    //Setpoints
    Modelica.Blocks.Sources.CombiTimeTable y1_set_optim_ss(columns = {2, 3}, fileName = LibraryPath + "\\CombiTimeTables\\Setpoints_optim_ss_Belgium.txt", tableName = "Setpoints", tableOnFile = true, timeScale = 3600) annotation(
      Placement(visible = true, transformation(origin = {-124, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp y2_set(duration(displayUnit = "Ms") = 1000000, height = 0, offset = 0.815, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-120, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    /*---------------------------- Start of equation section ----------------------------*/
  equation
    when sample(0, 86400) then
      tfr_solid = time;
    end when;
/*Set feedback and setpoints*/
    y_gas_noisy[1]*y_gas_noisy[2] = header.PV;
    y_gas_noisy[3]/y_gas_noisy[2] = follower.PV;
    hysteresisComparator.u = y_gas_noisy[3]/y_gas_noisy[2];
    header.SP = y1_set_optim_ss.y[1];
/*Computation of noisy measurements*/
    y_gas_noisy[1] = uit_ol.ol_onoff_gasbag.y_gas[1]*(1 + normalNoise.y);
    y_gas_noisy[2] = uit_ol.ol_onoff_gasbag.y_gas[2]*(1 + normalNoise1.y);
    y_gas_noisy[3] = uit_ol.ol_onoff_gasbag.y_gas[3]*(1 + normalNoise1.y);
/*Computation of additional inputs to 'CSTR_OL_onoff_gasbag'*/
    uit_ol.u[1] = switch.y;
    uit_ol.u[2] = if (time - tfr_solid) < 300 and impulse and time > 1e6 then 86400/300*constant_delta_slurry_ramp elseif not impulse or time < 1e6 then ramp_slurry.y/1e6 else 0;
    uit_ol.u[3] = if (time - tfr_solid) < 300 and impulse and time > 1e6 then 86400/300*constant_delta_maize_ramp elseif not impulse or time < 1e6 then ramp_maize.y/1e6 else 0;
    constant_delta_maize_ramp = if time < ramp_maize.startTime then 0 elseif time > ramp_maize.startTime and time < ramp_maize.startTime + maize_duration then (time - ramp_maize.startTime)*Manual_delta_flowrates.y[1]/1e6/maize_duration else Manual_delta_flowrates.y[1]/1e6;
    constant_delta_slurry_ramp = if time < ramp_slurry.startTime then 0 elseif time > ramp_slurry.startTime and time < ramp_slurry.startTime + slurry_duration then (time - ramp_slurry.startTime)*Manual_delta_flowrates.y[2]/1e6/slurry_duration else Manual_delta_flowrates.y[2]/1e6;
/*Connect equations*/
    connect(hysteresisComparator.y, switch.u2) annotation(
      Line(points = {{14, -2}, {40, -2}}, color = {255, 0, 255}));
    connect(header.CS, switch.u3) annotation(
      Line(points = {{-40, 40}, {40, 40}, {40, 6}}, color = {0, 0, 127}));
    connect(follower.CS, switch.u1) annotation(
      Line(points = {{-42, -40}, {40, -40}, {40, -10}}, color = {0, 0, 127}));
    connect(header.TR, switch.y) annotation(
      Line(points = {{-64, 28}, {-70, 28}, {-70, 20}, {64, 20}, {64, -2}}, color = {0, 0, 127}));
    connect(switch.y, follower.TR) annotation(
      Line(points = {{64, -2}, {64, -70}, {-66, -70}, {-66, -52}}, color = {0, 0, 127}));
    connect(hysteresisComparator.y, not11.u) annotation(
      Line(points = {{14, -2}, {26, -2}, {26, -58}, {-14, -58}}, color = {255, 0, 255}));
    connect(follower.TS, not11.y) annotation(
      Line(points = {{-66, -48}, {-80, -48}, {-80, -58}, {-36, -58}}, color = {255, 0, 255}));
    connect(header.TS, hysteresisComparator.y) annotation(
      Line(points = {{-64, 32}, {-78, 32}, {-78, 18}, {14, 18}, {14, -2}}, color = {255, 0, 255}));
    connect(follower.SP, y2_set.y) "Note: alternative is 'follower.SP = y1_set_optim_ss.y[2]'" annotation(
      Line(points = {{-66, -40}, {-92, -40}, {-92, -62}, {-109, -62}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 5184000.0, Tolerance = 1e-05, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_CL_oldselector_newmodel;
  annotation(
    uses(Modelica(version = "4.0.0"), Modelica_LinearSystems2(version = "2.4.0")));
  annotation(
    uses(Modelica(version = "4.0.0"), Modelica_LinearSystems2(version = "2.4.0")));
end ADM1_P;
