package ADM1_P

  record Variables_BMPtest
    Real X_su_feed;
    Real X_aa_feed;
    Real X_fa_feed;
    Real X_c4_feed;
    Real X_pro_feed;
    Real X_ac_feed;
    Real X_h2_feed;
    Real X_c_feed;
    Real X_i_feed;
    Real X_ch1_feed;
    Real X_ch2_feed;
    Real X_pr1_feed;
    Real X_pr2_feed;
    Real X_li_feed;
    Real X_p_feed;
    Real S_i_feed;
    Real S_su_feed;
    Real S_aa_feed;
    Real S_fa_feed;
    Real S_va_feed;
    Real S_bu_feed;
    Real S_pro_feed;
    Real S_ac_feed;
    Real S_h2_feed;
    Real S_ch4_feed;
    Real S_ic_feed;
    Real S_in_feed;
    Real S_ip_feed;
    Real S_cat_feed;
    Real S_ca_feed;
    Real S_mg_feed;
    Real S_an_feed;
    Real ash_feed;
    Real X_lig_feed;
  
  end Variables_BMPtest;
  record ParametersADM1_operational_AC
    //  parameter SI.Volume V_liq = 3400 "3400; SRT=19 o 20. Portata 190 m3/d. Single Digester usefull working volume";
    //  parameter SI.Volume V_gas = 100 "100; Single Digester headspace as A*H-usefull working volume";
    parameter SI.Volume V_tot = 0.09425 "100; Single Digester headspace as A*H-usefull working volume";
    parameter SI.Temperature T0 = 273.15 "Reference temperature for normal conditions";
    parameter SI.Temperature T_ref_k = 308.15 "Reference temperature for kinetic parameters";
    parameter SI.Temperature T_op_mean = 308.15 "35 + 273.15; Mean operative temperature";
    parameter NSI.Pressure_bar P_atm = 1.013 "Pressure of atmosphere [bar]";
    parameter Types.Kinetic_d kla = 200 "Volume-specific liquid-gas transfer coefficient [1/d]";
    /* Gas diffusivities */
    constant SI.ThermalDiffusivity D_o2 = 2.8e-9 "Oxygen diffusivity [m^2/s]";
    constant SI.ThermalDiffusivity D_ch4 = 1.57e-9 "Methane diffusivity [m^2/s]";
    constant SI.ThermalDiffusivity D_h2 = 4.65e-9 "Hydrogen diffusivity [m^2/s]";
    constant SI.ThermalDiffusivity D_co2 = 1.98e-9 "Carbon dioxide diffusivity [m^2/s]";
    constant SI.ThermalDiffusivity D_nh3 = 0.000169/86400 "Ammonia diffusivity [m^2/s]";
    constant SI.ThermalDiffusivity D_n2 = 0.0001536/86400 "Nitrogen diffusivity [m^2/s]";
    Types.Kinetic_d kla_ch4 = kla*(D_ch4/D_o2)^(1/2);
    Types.Kinetic_d kla_h2 = kla*(D_h2/D_o2)^(1/2);
    Types.Kinetic_d kla_co2 = kla*(D_co2/D_o2)^(1/2);
    Types.Kinetic_d kla_nh3 = kla*(D_nh3/D_o2)^(1/2);
    Types.Kinetic_d kla_n2 = kla*(D_n2/D_o2)^(1/2);
    annotation(
      Documentation(info = "<html><p> This record contains the operational parameters and constants of the digester. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_operational_AC;

  record StateVariablesADM1_reinit_AC
    //Possono essere serenamente eliminate inserendo espressione direttamente in reinit
    SI.Volume Vcum_ch4_restart;
    //Biomasses
    SI.MassConcentration Xsu_restart "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xaa_restart "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xfa_restart "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xc4_restart "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xpro_restart "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xac_restart "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xh2_restart "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    //Particulate substrate
    SI.MassConcentration Xc_restart "Complex particulate concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xi_restart "Particulate inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xch1_restart "Particulate carbohydrates concentration in digestate";
    SI.MassConcentration Xch2_restart "Particulate carbohydrates concentration in digestate";
    SI.MassConcentration Xpr1_restart "Particulate proteins concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xpr2_restart "Particulate proteins concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xli_restart "Particulate lipids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xp_restart "Particulate inert fraction from bacteria decay [kgCOD/m3]";
    //
    //Soluble substrate
    SI.MassConcentration Si_restart "Soluble inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Ssu_restart "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Saa_restart "Soluble amino acids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sfa_restart "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sva_restart "Valeric acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sbu_restart "Butyric concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Spro_restart "Propionic acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sac_restart "Acetic acid concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    SI.MassConcentration Sh2_restart "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sch4_restart "Soluble methane concentration in digestate [kgCOD/m3]";
    //Ionic total components
    Types.MolarDensity_M Sic_restart "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M Sin_restart "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M Sip_restart "8/10";
    Types.MolarDensity_M Scat_restart "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M Sca_restart "rimetti true!";
    Types.MolarDensity_M Smg_restart "rimetti true!";
    Types.MolarDensity_M San_restart;
    SI.MassConcentration ash_restart;
    SI.MassConcentration Xlig_restart;
    //
    //Gas components
    SI.MassConcentration Sgas_h2_restart;
    SI.MassConcentration Sgas_ch4_restart;
    Types.MolarDensity_M Sgas_co2_restart;
    Types.MolarDensity_M Sgas_nh3_restart;
    //cacate di Ari
    Types.MolarDensity_M Sn2_restart "Soluble nitrogen [kmol/m3]";
    Types.MolarDensity_M Sgas_n2_restart "Soluble nitrogen [kmol/m3]";
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_reinit_AC;

  record Additional_PARVAR_AC
    Real KH_n2(fixed = false);
    //  Types.MolarDensity_M S_gas_n2(fixed = true, start = S_gas_n2_start, stateSelect = StateSelect.always);
    Types.MolarDensity_M S_gas_n2(fixed = true, start = S_gas_n2_start);
    Types.Pressure_bar p_gas_n2(fixed = false, start = 1.5e-05);
    Types.MolarDensity_M S_n2(fixed = true, start = S_n2_start, nominal = 1e-6, stateSelect = StateSelect.always) "8/10";
    Real rt11(fixed = false, start = 0);
    parameter SI.MassConcentration S_gas_n2_start = 8.87e-5;
    parameter SI.MassConcentration S_n2_start = 1.569e-6;
    Types.MolarDensity_M S_n2_in;
    SI.Volume Vcum_ch4_L(fixed = true, start = 0) "Cumulated methane volume [L]";
    //  SI.Volume V_ch4_cum(fixed = true, start = 0) "Cumulated methane volume [m3]";
    //  SI.Volume V_feed_cum(fixed = true, start = 0) "Cumulated volume of feeding substrates [m3]";
  end Additional_PARVAR_AC;

  record StateVariablesADM1_reinit
    //Possono essere serenamente eliminate inserendo espressione direttamente in reinit
    //Biomasses
    SI.MassConcentration Xsu_restart "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xaa_restart "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xfa_restart "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xc4_restart "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xpro_restart "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xac_restart "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xh2_restart "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    //Particulate substrate
    SI.MassConcentration Xc_restart "Complex particulate concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xi_restart "Particulate inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xch_restart[3] "Particulate carbohydrates concentration in digestate [kgCOD/m3]; 1.09422";
    SI.MassConcentration Xpr_restart[2] "Particulate proteins concentration in digestate [kgCOD/m3]; 0.890377";
    SI.MassConcentration Xli_restart "Particulate lipids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Xp_restart "Particulate inert fraction from bacteria decay [kgCOD/m3]";
    //
    //Soluble substrate
    SI.MassConcentration Si_restart "Soluble inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Ssu_restart "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Saa_restart "Soluble amino acids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sfa_restart "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sva_restart "Valeric acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sbu_restart "Butyric concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Spro_restart "Propionic acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sac_restart "Acetic acid concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    SI.MassConcentration Sh2_restart "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    SI.MassConcentration Sch4_restart "Soluble methane concentration in digestate [kgCOD/m3]";
    //Ionic total components
    Types.MolarDensity_M Sic_restart "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M Sin_restart "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M Sip_restart "8/10";
    Types.MolarDensity_M Scat_restart "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M Sca_restart "rimetti true!";
    Types.MolarDensity_M Smg_restart "rimetti true!";
    Types.MolarDensity_M San_restart;
    SI.MassConcentration ash_restart;
    SI.MassConcentration Xlig_restart;
    //
    //Gas components
    SI.MassConcentration Sgas_h2_restart;
    SI.MassConcentration Sgas_ch4_restart;
    Types.MolarDensity_M Sgas_co2_restart;
    Types.MolarDensity_M Sgas_nh3_restart;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_reinit;

  import SI = Modelica.Units.SI;
  import NSI = Modelica.Units.NonSI;
  //import Modelica.Constants.*;
  //import R = Modelica.Constants.R;
  extends Modelica.Icons.Package;
  constant Real R(unit = "bar/(kmol/m3)/K") = 0.083145 "Gas law constant";
  final constant String LibraryPath = Modelica.Utilities.Files.loadResource("modelica://ADM1_P");

  record Feed_variables_Catenacci
    //TO BE SEPARATED IN ARI E DAVE
    //Feed composition: only "Real" for dynamic trajectory specified in "All" model or in the model block from Combi
    //Feed composition: "parameter" for fixed value specified here or in "All" model
    //
    //Feed algebraic variables (computed within the block model)
    SI.MassFraction u(fixed = false, start = 0) "Moisture content in substrate  [kgH20/kg]";
    SI.MassFraction v(fixed = false, start = 0) "Volatile fraction of total solids in substrate  [kgVS/kgTS]";
    SI.Density d(fixed = false, start = 0) "Density of substrate [kg/m3]";
    SI.MassConcentration COD_VFA(fixed = false, start = 0) "Total VFA concentration in substrate  as COD [kgCOD/m3]";
    SI.MassFraction alpha(fixed = false, start = 0) "Centrifuge efficiency for substrate [kgFMs/kgFM]";
    Real tCOD(fixed = false, start = 0);
    Real pCOD(fixed = false, start = 0);
    Real tBMP_COD(fixed = false, start = 0);
    Real tLI_in "g/m3";
    Real fd_tCOD "kgCOD/kgCOD";
    Real fd_pCOD "kgCOD/kgCOD";
    Real pLI_VS_in "gLI/kgVS";
    //
    //Composition of feeding substrates
    parameter Real f_Xc_in = 0.00 "Fraction of substrate #1 COD entering the digester in the aggregated form, X_c [kgCOD/kgCOD]";
    //
    parameter Real sCH = 0.0;
    parameter Real sPR = 0.0;
    //Catenacci and NIR parameters
    parameter Real tac = 0.0 "mgCaCO3/L";
    parameter Real ts = 0.0 "gTS/kg";
    parameter Real vs_ts = 0.0 "%TS";
    parameter Real tbmp_vs = 0.0 "NmLCH4/gVS";
  
  end Feed_variables_Catenacci;

  record Feed_variables_NIR
    //TO BE SEPARATED IN ARI E DAVE
    //Feed composition: only "Real" for dynamic trajectory specified in "All" model or in the model block from Combi
    //Feed composition: "parameter" for fixed value specified here or in "All" model
    //
    SI.MassFraction u(fixed = false, start = 0) "Moisture content in substrate  [kgH20/kg]";
    SI.MassFraction v(fixed = false, start = 0) "Volatile fraction of total solids in substrate  [kgVS/kgTS]";
    SI.Density d(fixed = false, start = 0) "Density of substrate [kg/m3]";
    //By now only xi and si. Xc?
    //Real f_xc[5];
    Real f_xi[3];
    Real f_si[3];
    //Composition of bacteria
    parameter Real f_Xbiom_ch(unit = "kgCOD/kgCOD") = 0.195 "Carbohydrates content in biomass";
    parameter Real f_Xbiom_pr(unit = "kgCOD/kgCOD") = 0.8 "Proteins content in biomass";
    parameter Real f_Xbiom_li(unit = "kgCOD/kgCOD") = 1 - f_Xbiom_ch - f_Xbiom_pr "Lipids content in biomass";
    //NIR parameters
    parameter Real protein(unit = "%TS") = 0.0;
    parameter Real lipid(unit = "%TS") = 0.0;
    parameter Real starch(unit = "%TS") = 0.0;
    parameter Real hemicellulose(unit = "%TS") = 0.0;
    parameter Real cellulose(unit = "%TS") = 0.0;
    parameter Real adl(unit = "%TS") = 0.0;
    //
    parameter Real bd_cell(unit = "%Cell") = 50;
    parameter Real bd_hemicell(unit = "%Hemicell") = 50;
    parameter Real bd_pr(unit = "%Protein") = 50;
    parameter Real bd_li(unit = "%VS") = 50;
    parameter Real f_pr_s = 0.5;
    parameter Real f_pr_r = 0.5;
    parameter Boolean liquid;
    //Catenacci and NIR parameters
    parameter Real tac = 0.0 "mcCaCO3/L";
    parameter Real ts = 0.0 "gTS/kg";
    parameter Real vs_ts = 0.0 "%TS";
    parameter Real tbmp_vs = 0.0 "NmLCH4/gVS";
  end Feed_variables_NIR;

  record Feed_variables_Direct
    //TO BE SEPARATED IN ARI E DAVE
    //Feed composition: only "Real" for dynamic trajectory specified in "All" model or in the model block from Combi
    //Feed composition: "parameter" for fixed value specified here or in "All" model
    //
    //
    //Direct parameters
    parameter Real xli(unit = "gCOD/L") = 0.0;
    parameter Real xpr(unit = "gCOD/L") = 0.0;
    parameter Real xi(unit = "gCOD/L") = 0.0;
    parameter Real xc(unit = "gCOD/L") = 0.0;
    parameter Real xch(unit = "gCOD/L") = 0.0;
    parameter Real ash(unit = "gASH/L") = 0.0;
  end Feed_variables_Direct;

  record Feed_variables_Common
    //TO BE SEPARATED IN ARI E DAVE
    //Feed composition: only "Real" for dynamic trajectory specified in "All" model or in the model block from Combi
    //Feed composition: "parameter" for fixed value specified here or in "All" model
    //
    //Feed algebraic variables (computed within the block model)
    //
    Real Ka_co2(fixed = false, start = 0);
    Real Ka_nh4(fixed = false, start = 0);
    Real Ka_h2o(fixed = false, start = 0);
    Real Ka_h2po4(fixed = false, start = 0);
    Real Ka_hpo4(fixed = false, start = 0);
    Real Ka_h3po4(fixed = false, start = 0);
    Real Ka_hco3(fixed = false, start = 0);
    //
    Real pH;
    Real S_h(fixed = false, start = 0);
    Real S_oh(fixed = false, start = 0);
    Real S_acm(fixed = false, start = 0);
    Real S_prom(fixed = false, start = 0);
    Real S_bum(fixed = false, start = 0);
    Real S_vam(fixed = false, start = 0);
    Real S_hpo4(fixed = false, start = 0);
    Real S_po4(fixed = false, start = 0);
    Real S_h2po4(fixed = false, start = 0);
    Real Alk_mol(fixed = false, start = 0);
    Real S_hco3(fixed = false, start = 0);
    Real S_co2(fixed = false, start = 0);
    Real S_nh4(fixed = false, start = 0);
    Real S_h3po4(fixed = false, start = 0);
    Real S_co3(fixed = false, start = 0);
    Real S_nh3(fixed = false, start = 0);
    //
    //Common parameters
    parameter Real aa(unit = "gCOD/L") = 0.0;
    parameter Real ac(unit = "gCOD/L") = 0.0;
    parameter Real an(unit = "mol/L") = 0.0;
    parameter Real bu = 0.0 "gCOD/L";
    parameter Real ca = 0.0 "mol/L";
    parameter Real cat = 0.0;
    parameter Real ch4(unit = "gCOD/L") = 0.0;
    parameter Real fa = 0.0;
    parameter Real h2(unit = "gCOD/L") = 0.0;
    parameter Real mg = 0.0 "mol/L";
    parameter Real ortop = 0.0 "mgP/L";
    parameter Real pro(unit = "gCOD/L") = 0.0;
    parameter Real si(unit = "gCOD/L") = 0.0;
    parameter Real su(unit = "gCOD/L") = 0.0;
    parameter Real tan = 0.0 "mgN/L";
    parameter Real tic(unit = "mgC/L") = 0.0;
    parameter Real va = 0.0 "gCOD/L";
    parameter Real xaa(unit = "gCOD/L") = 0.0;
    parameter Real xac(unit = "gCOD/L") = 0.0;
    parameter Real xc4(unit = "gCOD/L") = 0.0;
    parameter Real xfa(unit = "gCOD/L") = 0.0;
    parameter Real xh2(unit = "gCOD/L") = 0.0;
    parameter Real xpro(unit = "gCOD/L") = 0.0;
    parameter Real xsu(unit = "gCOD/L") = 0.0;
    //
    parameter Real ph = 0.0;
  end Feed_variables_Common;

  record StateVariablesADM1_mpp
    //MPP submodel (X_salt are states)
    Types.MolarDensity_M X_acp(fixed = true, start = X_acp_start, nominal = 1e-6, stateSelect = StateSelect.always) "mol/L rimetti true!";
    Types.MolarDensity_M X_stru(fixed = true, start = X_stru_start, nominal = 1e-6, stateSelect = StateSelect.always) "mol/L rimetti true!";
    Types.MolarDensity_M X_ccm(fixed = true, start = X_ccm_start, nominal = 1e-6, stateSelect = StateSelect.always) "mol/L";
    Types.MolarDensity_M X_mag(fixed = true, start = X_mag_start, nominal = 1e-6, stateSelect = StateSelect.always) "mol/L";
    //Initial conditions
    parameter Types.MolarDensity_M X_acp_start = 0.0;
    parameter Types.MolarDensity_M X_stru_start = 0.0129769;
    parameter Types.MolarDensity_M X_ccm_start = 0.00697862;
    parameter Types.MolarDensity_M X_mag_start = 0.0;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_mpp;

  record System
    parameter Integer nXch;
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating output aggregated variables. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2021 </em></p></html>"));
  end System;

  record Lumped_variables
    Real Alk(fixed = false, start = 0);
    Real TVFA(fixed = false, start = 0);
    Real FOS_TAC(fixed = false, start = 0);
    Real VS(fixed = false, start = 0);
    Real TAN(fixed = false, start = 0);
    Real COD_tot(fixed = false, start = 0);
    Real COD_sol(fixed = false, start = 0);
    Real CH_tot(fixed = false, start = 0);
    Real PR_tot_BCA(fixed = false, start = 0);
    Real PR_tot_TKN(fixed = false, start = 0);
    Real LI_tot(fixed = false, start = 0);
    Real CH_sol(fixed = false, start = 0);
    Real PR_sol_BCA(fixed = false, start = 0);
    Real PR_sol_TKN(fixed = false, start = 0);
    Real LI_sol(fixed = false, start = 0);
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating output aggregated variables. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2021 </em></p></html>"));
  end Lumped_variables;

  record StateVariablesADM1_gas
    //Gas components
    SI.MassConcentration S_gas_h2(fixed = false, start = 1.88676e-05);
    SI.MassConcentration S_gas_ch4(fixed = true, start = 1.48839);
    Types.MolarDensity_M S_gas_co2(fixed = true, start = 0.0144672);
    Types.Pressure_bar p_gas_h2(fixed = false, start = 1.5e-05);
    Types.Pressure_bar p_gas_ch4(fixed = false, start = 0.582185);
    Types.Pressure_bar p_gas_co2(fixed = false, start = 0.382985);
    //Other variables
    //Real P_gas(fixed = true, start = 1.014);
    Real Q_gas(fixed = false, start = 1e-16);
    Real Q_gas_N(fixed = false, start = 0);
    //Temperature dependant parameters
    Real KH_ch4(fixed = false, start = 0.00116);
    Real KH_co2(fixed = false, start = 0.0271);
    Real KH_h2(fixed = false, start = 7.38e-4);
    Real p_gas_h2o(fixed = false, start = 0.0557);
    Real rt8(fixed = false, start = 0);
    Real rt9(fixed = false, start = 0);
    Real rt10(fixed = false, start = 0);
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1_gas;

  record VariablesADM1_mpp
    extends StateVariablesADM1_mpp;
    //MPP submodel (X_salt are states)
    Types.MolConcRate rp1(nominal = 1e-12) "mol/L*d";
    Types.MolConcRate rp2(nominal = 1e-12) "mol/L*d";
    Types.MolConcRate rd1(nominal = 1e-12) "mol/L*d";
    Types.MolConcRate rd2(nominal = 1e-12) "mol/L*d";
    Types.MolConcRate rp3(nominal = 1e-12) "mol/L*d";
    Types.MolConcRate rd3(nominal = 1e-12) "mol/L*d";
    Types.MolConcRate rp4(nominal = 1e-12) "mol/L*d";
    Types.MolConcRate rd4(nominal = 1e-12) "mol/L*d";
    Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
    Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
    Types.MolarDensity_M_Ksp_acp Ksp_ccm(nominal = 1e-9);
    Types.MolarDensity_M_Ksp_acp Ksp_mag(nominal = 1e-9);
    SI.PerUnit SI_stru(nominal = 1);
    SI.PerUnit SI_acp(nominal = 1);
    SI.PerUnit SI_ccm(nominal = 1);
    SI.PerUnit SI_mag(nominal = 1);
    SI.PerUnit arg_log_acp(nominal = 1e-12);
    SI.PerUnit arg_log_stru(nominal = 1e-12);
    SI.PerUnit arg_log_ccm(nominal = 1e-12);
    SI.PerUnit arg_log_mag(nominal = 1e-12);
    Real r_stru;
    Real r_ccm;
    Real r_acp;
    Real r_mag;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end VariablesADM1_mpp;

  record VariablesADM1_pH
    //README:
    //This model is an intermediate level of complexity for physiochemical aqueous system modelling. It includes non-ideality and all multiple chemical species protonation i.e. acid-base reactions, but it does not include ion-pairing reactions. Calcium (S_ca) and magnesium (S_mg) cations are included (for precipitation processes modeled in another block), whereas other unknown cations and ions are lumped in the S_cat and S_an variables, to close the charge balance.
    //There are Nc chemical total components (TOT in IWA, now x). These are updated by ODE equations (states) and are given as inputs.
    //There are Ns chemical species ([S] in IWA, now z) that are corrected for non-ideality by means of coeffs=f(I(z,x)). The chemical species corrected ({S} in IWA, now z) are found by means of Ns-Nc chemical equilibrium algebraic equations, rewritten by substituion to be dependent only on x and a_h or S_h. There are Nc-1 algebraic equations that are component "mass balances" i.e. TOT[j] = sum(stechiom[i,j]*species[i,j])
    //There are two additional algebraic equations g(x,z) to close the system: the charge balance that shall solve for S_h (or a_h) and the definition of ionic force that shall solve for I.
    //NB the way {S} variables are calculated here by substitution is possible only for acid-base reactions. For ion-pairing reactions, it is not possible. The original chemical equilibrium equations are in the form h(z)=0
    //Parameters still used in decomposed pH block for simplicity
    constant Real Ac_conv(unit = "kgCOD/kmol") = 64;
    constant Real Pro_conv(unit = "kgCOD/kmol") = 112;
    constant Real Bu_conv(unit = "kgCOD/kmol") = 160;
    constant Real Va_conv(unit = "kgCOD/kmol") = 208;
    //Algebraic variables ([S] and {S} in IWA PCM). Now solved "esplicitly" in the form z[j]=h-1(x,z[i]) with i≠j
    SI.MassConcentration S_vam(fixed = false, start = 1.00433E-05*208, stateSelect = StateSelect.never) "Valerate ion concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_bum(fixed = false, start = 2.04904E-05*160, stateSelect = StateSelect.never) "Butyrate ion concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_prom(fixed = false, start = 0.000145231*112, stateSelect = StateSelect.never) "Propionate ion concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_acm(fixed = false, start = 0.012145469*60, stateSelect = StateSelect.never) "Acetate ion inerts concentration in digestate [kgCOD/m3]";
    Types.MolarDensity_M S_hco3(fixed = false, start = 0.302539, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_co3(fixed = false, start = 4.01e-3, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_nh3(fixed = false, start = 0.242044 - 0.161871282, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_nh4(fixed = false, start = 0.161871282, nominal = 1e-12, stateSelect = StateSelect.never) "from I value fixed; 8/10";
    Types.MolarDensity_M S_hpo4(fixed = false, start = 0.00509761, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_h2po4(fixed = false, start = 0.00126826, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_h3po4(fixed = false, start = 1.24e-9, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_po4(fixed = false, start = 8.37E-08, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_co2(fixed = false, start = 0.00985188, nominal = 1e-12, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M S_oh(fixed = false, start = 1.46E-06, nominal = 1e-10, stateSelect = StateSelect.never) "8/10";
    Types.MolarDensity_M a_ca(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_po4(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_nh4(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_mg(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_h(nominal = 1e-10, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_hco3(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_hpo4(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_h2po4(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_co3(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_acm(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_prom(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_bum(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_vam(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_h2o(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    Types.MolarDensity_M a_oh(nominal = 1e-12, stateSelect = StateSelect.never) "mol/L";
    //Variables that shall be selected for tearing and solved by g(x,z)=0
    Types.MolarDensity_M S_h(fixed = true, start = 1.481088E-07, nominal = 1e-8, stateSelect = StateSelect.avoid) "8/10";
    Types.MolarDensity_M I(fixed = true, start = 1.5097E-01, nominal = 1e-1, stateSelect = StateSelect.avoid) "mol/L";
    //Algebraic variables that depends only on I (ionic force)
    SI.ActivityCoefficient g_mono(fixed = false, stateSelect = StateSelect.never, nominal = 1e-1, start = 0.7);
    SI.ActivityCoefficient g_bi(fixed = false, stateSelect = StateSelect.never, nominal = 1e-1, start = 0.3);
    SI.ActivityCoefficient g_tri(fixed = false, stateSelect = StateSelect.never, nominal = 1e-1, start = 0.09);
    //Additional dummy states to relax g(x,u)=0
    Types.MolarDensity_M charge(start = 0, fixed = true, nominal = 1e-17, stateSelect = StateSelect.always);
    Types.MolarDensity_M ionic_force(fixed = true, start = 0, nominal = 1e-4, stateSelect = StateSelect.always);
    //  Real charge_error(fixed = true, start = 0, nominal = 1e-7);
    //Algebraic variables that doesn't depend on states not on other algebraic variables. Depends only on parameters and T [°C]
    Real Ka_co2(fixed = false, start = 4.94e-7);
    Real Ka_hco3(fixed = false, start = 6.32e-11);
    Real Ka_nh4(fixed = false, start = 1.11e-9);
    Real Ka_h2o(fixed = false, start = 2.08e-14);
    Real Ka_h2po4(fixed = false, start = 6.20e-8);
    Real Ka_hpo4(fixed = false, start = 2.14e-13);
    Real Ka_h3po4(fixed = false, start = 2.14e-2);
    //Outputs y
    //    Real TAC;
    SI.PerUnit pH(fixed = false, start = 7.11, nominal = 1, stateSelect = StateSelect.never) "Digestate pH [-]";
    //Process rates (old ODE version of the pH model > stiffness)
    //  Types.MolConcRate ra4(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra5(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra6(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra7(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra10(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra11(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra12(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra13(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra14(fixed = false, start = 0, nominal = 1e-20);
    //  Types.MolConcRate ra15(fixed = false, start = 0, nominal = 1e-20);
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end VariablesADM1_pH;

  record VariablesADM1_bio
    //Inflow variables
    ADM1_P.Types.FlowRate_d Q;
    //Biomass
    SI.MassConcentration X_su_in "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_aa_in "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_fa_in "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_c4_in "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_pro_in "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ac_in "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_h2_in "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    //Particulate substrate
    SI.MassConcentration X_c_in[7] "Complex particulate concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_i_in[4] "Particulate inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ch_in[3] "Particulate carbohydrates concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_pr_in[2] "Particulate proteins concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_li_in "Particulate lipids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_p_in "Particulate inert fraction from bacteria decay [kgCOD/m3]";
    SI.MassConcentration X_lig_in "Particulate inert fraction of lignin [kgCOD/m3]";
    //Soluble substrate
    SI.MassConcentration S_i_in[4] "Soluble inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_su_in "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_aa_in "Soluble amino acids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_fa_in "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_va_in "Valeric acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_bu_in "Butyric concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_pro_in "Propionic acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ac_in "Acetic acid concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    SI.MassConcentration S_h2_in "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ch4_in "Soluble methane concentration in digestate [kgCOD/m3]";
    Types.MolarDensity_M S_ic_in "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in_in "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip_in(nominal = 1e-3) "8/10";
    Types.MolarDensity_M S_cat_in "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ca_in(nominal = 1e-4) "rimetti true!";
    Types.MolarDensity_M S_mg_in(nominal = 1e-5) "rimetti true!";
    Types.MolarDensity_M S_an_in(nominal = 1e-5);
    Types.MolarDensity_M X_stru_in(nominal = 1e-5) "rimetti true!";
    Types.MolarDensity_M X_acp_in(nominal = 1e-5) "rimetti true!";
    Types.MolarDensity_M X_ccm_in(nominal = 1e-5);
    Real ash_in;
    //Gas components
    Types.Pressure_bar p_gas_h2;
    Types.Pressure_bar p_gas_ch4;
    Types.Pressure_bar p_gas_co2;
    Types.Pressure_bar p_gas_h2o;
    Types.Pressure_bar p_gas_nh3;
    //Real P_gas(fixed = true, start = 1.014);
    Real Q_gas;
    Real Q_gas_N;
    Real Vcum(fixed = true, start = 0);
    Real Vcum_ch4(fixed = true, start = 0);
    //    Real CH4_cum(fixed = true, start = 0);
    Real f_xc[6];
    Real f_xi[3];
    Real f_si[3];
    Real i_XI[5](each unit = "kmol_i/kgCOD");
    Real i_SI[5](each unit = "kmol_i/kgCOD");
    Real i_XC[5](each unit = "kmol_i/kgCOD");
    //Temperature dependant parameters
    Real k_hyd_T[8] "Xc[2],Xch[3],Xpr[2],Xli";
    Real k_m_su_T;
    Real k_m_aa_T;
    Real k_m_fa_T;
    Real k_m_pro_T;
    Real k_m_c4_T;
    Real k_m_ac_T;
    Real k_m_h2_T;
    Real Ks_su_T;
    Real Ks_aa_T;
    Real Ks_fa_T;
    Real Ks_pro_T;
    Real Ks_c4_T;
    Real Ks_ac_T;
    Real Ks_h2_T;
    Real k_dec_su_T;
    Real k_dec_aa_T;
    Real k_dec_fa_T;
    Real k_dec_pro_T;
    Real k_dec_c4_T;
    Real k_dec_ac_T;
    Real k_dec_h2_T;
    Real KH_ch4;
    Real KH_co2;
    Real KH_h2;
    Real KH_nh3;
    // Inorganic carbon coefficients on processes
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
    //Process rates
    Real r1;
    Real r2[3];
    Real r3[2];
    Real r4;
    Real r5;
    Real r6;
    Real r7;
    Real r8;
    Real r9;
    Real r10;
    Real r11;
    Real r12;
    Real r13;
    Real r14;
    Real r15;
    Real r16;
    Real r17;
    Real r18;
    Real r19;
    Real rt8;
    Real rt9;
    Real rt10;
    Real rt12;
    // Process inhibition
    Real I_5;
    Real I_6;
    Real I_7;
    Real I_8;
    Real I_9;
    Real I_10;
    Real I_11;
    Real I_12;
    Real I_pH_aa;
    Real I_pH_ac;
    Real I_pH_h2;
    Real I_in_lim;
    Real I_ip_lim;
    Real I_h2_fa;
    Real I_h2_c4;
    Real I_h2_pro;
    Real I_nh3;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end VariablesADM1_bio;

  record ParametersADM1_operational
    parameter SI.Volume V_liq = 3400 "3400; SRT=19 o 20. Portata 190 m3/d. Single Digester usefull working volume";
    parameter SI.Volume V_gas = 100 "100; Single Digester headspace as A*H-usefull working volume";
    parameter SI.Temperature T0 = 298.15 "Reference temperature for normal conditions";
    parameter SI.Temperature T_ref_k = 308.15 "Reference temperature for kinetic parameters";
    parameter SI.Temperature T_op_mean = 315.15 "35 + 273.15; Mean operative temperature";
    parameter NSI.Pressure_bar P_atm = 1.013 "Pressure of atmosphere [bar]";
    parameter Types.Kinetic_d kla = 200 "Volume-specific liquid-gas transfer coefficient [1/d]";
    /* Gas diffusivities */
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
    Types.Kinetic_d kla_n2 = kla*(D_n2/D_o2)^(1/2);
    annotation(
      Documentation(info = "<html><p> This record contains the operational parameters and constants of the digester. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_operational;

  record StateVariablesADM1
    //Biomasses
    SI.MassConcentration X_su(fixed = true, start = X_su_start, stateSelect = StateSelect.always) "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_aa(fixed = true, start = X_aa_start, stateSelect = StateSelect.always) "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_fa(fixed = true, start = X_fa_start, stateSelect = StateSelect.always) "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_c4(fixed = true, start = X_c4_start, stateSelect = StateSelect.always) "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_pro(fixed = true, start = X_pro_start, stateSelect = StateSelect.always) "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ac(fixed = true, start = X_ac_start, stateSelect = StateSelect.always) "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_h2(fixed = true, start = X_h2_start, stateSelect = StateSelect.always) "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    //Particulate substrate
    SI.MassConcentration X_c(fixed = true, start = X_c_start, stateSelect = StateSelect.always) "Complex particulate concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_i(fixed = true, start = X_i_start, stateSelect = StateSelect.always) "Particulate inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ch[3](each fixed = true, start = X_ch_start, each nominal = 1e-1, each stateSelect = StateSelect.always) "Particulate carbohydrates concentration in digestate [kgCOD/m3]; 1.09422";
    SI.MassConcentration X_pr[2](each fixed = true, start = X_pr_start, each nominal = 1e-1, each stateSelect = StateSelect.always) "Particulate proteins concentration in digestate [kgCOD/m3]; 0.890377";
    SI.MassConcentration X_li(fixed = true, start = X_li_start, stateSelect = StateSelect.always) "Particulate lipids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_p(fixed = true, start = X_p_start, stateSelect = StateSelect.always) "Particulate inert fraction from bacteria decay [kgCOD/m3]";
    //
    //Soluble substrate
    SI.MassConcentration S_i(fixed = true, start = S_i_start, stateSelect = StateSelect.always) "Soluble inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_su(fixed = true, start = S_su_start, stateSelect = StateSelect.always) "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_aa(fixed = true, start = S_aa_start, stateSelect = StateSelect.always) "Soluble amino acids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_fa(fixed = true, start = S_fa_start, stateSelect = StateSelect.always) "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_va(fixed = true, start = S_va_start, stateSelect = StateSelect.always) "Valeric acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_bu(fixed = true, start = S_bu_start, stateSelect = StateSelect.always) "Butyric concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_pro(fixed = true, start = S_pro_start, stateSelect = StateSelect.always) "Propionic acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ac(fixed = true, start = S_ac_start, stateSelect = StateSelect.always) "Acetic acid concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    SI.MassConcentration S_h2(fixed = true, start = S_h2_start, stateSelect = StateSelect.always) "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ch4(fixed = true, start = S_ch4_start, stateSelect = StateSelect.always) "Soluble methane concentration in digestate [kgCOD/m3]";
    //Ionic total components
    Types.MolarDensity_M S_ic(fixed = true, start = S_ic_start, stateSelect = StateSelect.always) "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in(fixed = true, start = S_in_start, stateSelect = StateSelect.always) "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip(fixed = true, start = S_ip_start, nominal = 1e-3, stateSelect = StateSelect.always) "8/10";
    Types.MolarDensity_M S_cat(fixed = false, start = S_cat_start, nominal = 1e-1) "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ca(fixed = true, start = S_ca_start "0.00027486", nominal = 1e-4, stateSelect = StateSelect.always) "rimetti true!";
    Types.MolarDensity_M S_mg(fixed = true, start = S_mg_start, nominal = 1e-5, stateSelect = StateSelect.always) "rimetti true!";
    Types.MolarDensity_M S_an(fixed = false, start = S_an_start, nominal = 1e-1);
    SI.MassConcentration ash(fixed = true, start = ash_start, stateSelect = StateSelect.always);
    SI.MassConcentration X_lig(fixed = true, start = X_lig_start, stateSelect = StateSelect.always);
    //
    //Gas components
    SI.MassConcentration S_gas_h2(fixed = true, start = S_gas_h2_start, stateSelect = StateSelect.always);
    SI.MassConcentration S_gas_ch4(fixed = true, start = S_gas_ch4_start, stateSelect = StateSelect.always);
    Types.MolarDensity_M S_gas_co2(fixed = true, start = S_gas_co2_start, stateSelect = StateSelect.always);
    Types.MolarDensity_M S_gas_nh3(fixed = true, start = S_gas_nh3_start, nominal = 1e-5, stateSelect = StateSelect.always);
    //
    //Initial conditions
    //Biomasses
    parameter SI.MassConcentration X_su_start = 0.645414;
    parameter SI.MassConcentration X_aa_start = 0.428271;
    parameter SI.MassConcentration X_fa_start = 0.1465;
    parameter SI.MassConcentration X_c4_start = 0.250091;
    parameter SI.MassConcentration X_pro_start = 0.10036;
    parameter SI.MassConcentration X_ac_start = 0.587209;
    parameter SI.MassConcentration X_h2_start = 0.214306;
    //Particulate substrate
    parameter SI.MassConcentration X_c_start = 0.2;
    parameter SI.MassConcentration X_i_start = 28.8256;
    parameter SI.MassConcentration X_ch_start[3] = {0.194191, 0.197045, 2.77039};
    parameter SI.MassConcentration X_pr_start[2] = {0.114573, 0.615433};
    parameter SI.MassConcentration X_li_start = 0.360349;
    parameter SI.MassConcentration X_p_start = 0.292196;
    //
    //Soluble substrate
    parameter SI.MassConcentration S_i_start = 0.0730489;
    parameter SI.MassConcentration S_su_start = 0.0246261;
    parameter SI.MassConcentration S_aa_start = 0.0259627;
    parameter SI.MassConcentration S_fa_start = 0.0443662;
    parameter SI.MassConcentration S_va_start = 0.00446885;
    parameter SI.MassConcentration S_bu_start = 0.00606139;
    parameter SI.MassConcentration S_pro_start = 0.0507891;
    parameter SI.MassConcentration S_ac_start = 0.529145;
    //Inorganic soluble components
    parameter SI.MassConcentration S_h2_start = 0.000000686659;
    parameter SI.MassConcentration S_ch4_start = 0.139109;
    //Ionic total components
    parameter Types.MolarDensity_M S_ic_start = 0.279901;
    parameter Types.MolarDensity_M S_in_start = 0.168532;
    parameter Types.MolarDensity_M S_ip_start = 0.00806374;
    parameter Types.MolarDensity_M S_cat_start = 0.099;
    parameter Types.MolarDensity_M S_ca_start = 0.0000213841;
    parameter Types.MolarDensity_M S_mg_start = 0.0000231323;
    parameter Types.MolarDensity_M S_an_start = 0.05;
    parameter SI.MassConcentration ash_start = 14.673;
    parameter SI.MassConcentration X_lig_start = 14.8112;
    //
    //Gas components
    parameter SI.MassConcentration S_gas_h2_start = 1.13668e-05;
    parameter SI.MassConcentration S_gas_ch4_start = 1.40749;
    parameter Types.MolarDensity_M S_gas_co2_start = 0.0143905;
    parameter Types.MolarDensity_M S_gas_nh3_start = 5.06177e-06;
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1;

  record ParametersADM1_stoichiometric
    parameter Integer nC = 27;
    //
    //Calculate everything from brut formula {C,H,O,N,P}
    constant Real MW_i[5] = {12, 1, 16, 14, 31};
    final parameter Real Protein[5] = {4, 6.1, 1.2, 1, 0};
    final parameter Real Carbohydrate[5] = {6, 10, 5, 0, 0};
    final parameter Real Lipid[5] = {51, 98, 6, 0, 0.804860191792887} "yP=3% [gP/gVS]";
    final parameter Real Biomass[5] = {5, 7, 2, 1, 0.11274};
    final parameter Real Lignin[5] = {3, 10, 3, 0, 0};
    final parameter Real MW_PR = sum(MW_i[i]*Protein[i] for i in 1:5);
    final parameter Real MW_CH = sum(MW_i[i]*Carbohydrate[i] for i in 1:5);
    final parameter Real MW_LI = sum(MW_i[i]*Lipid[i] for i in 1:5);
    final parameter Real MW_BM = sum(MW_i[i]*Biomass[i] for i in 1:5);
    final parameter Real MW_LIG = sum(MW_i[i]*Lignin[i] for i in 1:5);
    //Mass fractions (kg_i/kg)
    final parameter Real y_PR[5] = {MW_i[i]*Protein[i]/MW_PR for i in 1:5};
    final parameter Real y_CH[5] = {MW_i[i]*Carbohydrate[i]/MW_CH for i in 1:5};
    final parameter Real y_LI[5] = {MW_i[i]*Lipid[i]/MW_LI for i in 1:5};
    final parameter Real y_BM[5] = {MW_i[i]*Biomass[i]/MW_BM for i in 1:5};
    final parameter Real y_LIG[5] = {MW_i[i]*Lignin[i]/MW_LIG for i in 1:5};
    //Elemental composition (kmol_i/kgCOD)
    final parameter Real i_CH[5] = {y_CH[i]/MW_i[i]/COD_VS_CH for i in 1:5};
    final parameter Real i_PR[5] = {y_PR[i]/MW_i[i]/COD_VS_PR for i in 1:5};
    final parameter Real i_LI[5] = {y_LI[i]/MW_i[i]/COD_VS_LI for i in 1:5};
    final parameter Real i_BM[5] = {y_BM[i]/MW_i[i]/COD_VS_BM for i in 1:5};
    final parameter Real i_LIG[5] = {y_LIG[i]/MW_i[i]/COD_VS_LIG for i in 1:5};
    final parameter Real i_XP[5] = {0.0301, 0, 0, 0.0043, 0.00021};
    //It is possible to change what follows for conversions in Feed and Sink. Advice to keep it unchanged in digester.
    parameter Real N_PR(unit = "kgVS/kgN") = 1/0.16 "6.25 conversion factor for effluent proteins to organic nitrogen";
    parameter Real COD_VS_CH(unit = "kgCOD/kgVS") = 32*y_CH[1]/12 + 8*y_CH[2] - 16*y_CH[3]/16 - 24*y_CH[4]/14 + 40*y_CH[5]/31 + 48*0/32 "COD conversion factor for influent carbohydrates";
    parameter Real COD_VS_PR(unit = "kgCOD/kgVS") = 32*y_PR[1]/12 + 8*y_PR[2] - 16*y_PR[3]/16 - 24*y_PR[4]/14 + 40*y_PR[5]/31 + 48*0/32 "1.58 COD conversion factor for influent proteins";
    parameter Real COD_VS_LI(unit = "kgCOD/kgVS") = 32*y_LI[1]/12 + 8*y_LI[2] - 16*y_LI[3]/16 - 24*y_LI[4]/14 + 40*y_LI[5]/31 + 48*0/32 "COD conversion factor for influent lipids";
    parameter Real COD_VS_BM(unit = "kgCOD/kgVS") = 32*y_BM[1]/12 + 8*y_BM[2] - 16*y_BM[3]/16 - 24*y_BM[4]/14 + 40*y_BM[5]/31 + 48*0/32 "COD conversion factor for influent lipids";
    parameter Real COD_VS_LIG(unit = "kgCOD/kgVS") = 32*y_LIG[1]/12 + 8*y_LIG[2] - 16*y_LIG[3]/16 - 24*y_LIG[4]/14 + 40*y_LIG[5]/31 + 48*0/32 "COD conversion factor for influent lipids";
    parameter Real COD_VS_PR_BCA(unit = "kgCOD/kgVS") = 1.58 "COD conversion factor for effluent proteins measured with the BCA method";
    // Carbon, Nitrogen and Phosforous contents
    //Next stechiometric coefficient to be calculated for Xi/Si/Xc. See Digester block as they depends on f's fractionig from feed mixing. If they are needed in sink/feed, calculate as follows (different name would be needed and extend "Settable_composites")
    //  final parameter Real i_XI[5](each unit = "kmol_i/kgCOD") = {i_CH[1]*f_ch_xi + i_PR[1]*f_pr_xi + i_LI[1]*(1 - f_pr_xi - f_ch_xi), 0, 0, i_PR[4]*f_pr_xi, i_LI[5]*(1 - f_pr_xi - f_ch_xi)};
    //  final parameter Real i_SI[5](each unit = "kmol_i/kgCOD") = {i_CH[1]*f_ch_si + i_PR[1]*f_pr_si + i_LI[1]*(1 - f_pr_si - f_ch_si), 0, 0, i_PR[4]*f_pr_si, i_LI[5]*(1 - f_pr_si - f_ch_si)};
    //  final parameter Real i_XC[5](each unit = "kmol_i/kgCOD") = {f_li_xc*i_LI[1] + f_pr_xc*i_PR[1] + f_ch_xc*i_CH[1] + f_xi_xc*i_XI[1] + (1 - f_xi_xc - f_li_xc - f_ch_xc - f_pr_xc)*i_SI[1], 0, 0, f_pr_xc*i_PR[4] + f_xi_xc*i_XI[4] + (1 - f_xi_xc - f_li_xc - f_ch_xc - f_pr_xc)*i_SI[4], f_li_xc*i_LI[5] + f_xi_xc*i_XI[5] + (1 - f_xi_xc - f_li_xc - f_ch_xc - f_pr_xc)*i_SI[5]};
    //
    //OTHER FIXED STECHIOMETRIC COEFFICIENTS (protein=aminoacids)
    final parameter Real C_su(unit = "kmolC/kgCOD") = 0.0313 "carbon content of sugars";
    final parameter Real C_fa(unit = "kmolC/kgCOD") = 0.02174 "carbon content of long chain fatty acids";
    final parameter Real C_va(unit = "kmolC/kgCOD") = 0.024 "carbon content of valerate";
    final parameter Real C_bu(unit = "kmolC/kgCOD") = 0.025 "carbon content of butyrate";
    final parameter Real C_pro(unit = "kmolC/kgCOD") = 0.0268 "carbon content of propionate";
    final parameter Real C_ac(unit = "kmolC/kgCOD") = 0.0313 "carbon content of acetate";
    final parameter Real C_ch4(unit = "kmolC/kgCOD") = 0.0156 "carbon content of methane";
    //  final parameter Real C_xp(unit = "kmolC/kgCOD") = 0.0301 "carbon content of particulate inert COD";
    //  final parameter Real P_xp(unit = "kmolP/kgCOD") = 0.00021;
    //  final parameter Real N_xp(unit = "kmolN/kgCOD") = 0.0043 "nitrogen content of inert COD: 6% on weight basis in benchmark ASM";
    //
    parameter Real f_fa_li(unit = "kgCOD/kgCOD") = 0.95 "yield of long chain fatty acids (as opposed to glycerol) from lipids";
    parameter Real nu_1_su(unit = "kgCOD/kgCOD") = 0.495 "fraction of sucrose that degrades to acetate only";
    parameter Real nu_2_su(unit = "kgCOD/kgCOD") = 0.345 "fraction of sucrose that degrades to acetate and propionate";
    Real f_h2_su = 0.33*nu_1_su + 0.17*(1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of hydrogen from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_bu_su = 0.83*(1 - nu_1_su - nu_2_su) "unit = kgCOD/kgCOD - yield of butyrate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_pro_su = 0.78*nu_2_su "unit = kgCOD/kgCOD - yield of propionate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    Real f_ac_su = 0.67*nu_1_su + 0.22*nu_2_su "unit = kgCOD/kgCOD - yield of actetate from monosaccharide degradation; set using expression in Appendix D, ADM1";
    parameter Real f_h2_aa(unit = "kgCOD/kgCOD") = 0.06 "yield of hydrogen from amino acid degradation";
    parameter Real f_va_aa(unit = "kgCOD/kgCOD") = 0.23 "yield of valerate from amino acid degradation";
    parameter Real f_bu_aa(unit = "kgCOD/kgCOD") = 0.26 "yield of butyrate from amino acid degradation";
    parameter Real f_pro_aa(unit = "kgCOD/kgCOD") = 0.05 "yield of propionate from amino acid degradation";
    parameter Real f_ac_aa(unit = "kgCOD/kgCOD") = 0.4 "yield of acetate from amino acid degradation";
    // Yields of biomass on uptake of substrates
    parameter Real Y_su(unit = "kgCODx/kgCODs") = 0.1 "yield of biomass on uptake of monosaccharides";
    parameter Real Y_aa(unit = "kgCODx/kgCODs") = 0.08 "yield of biomass on uptake of amino acids";
    parameter Real Y_fa(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of long chain fatty acids";
    parameter Real Y_c4(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of valerate or butyrate";
    parameter Real Y_pro(unit = "kgCODx/kgCODs") = 0.04 "yield of biomass on uptake of propionate";
    parameter Real Y_ac(unit = "kgCODx/kgCODs") = 0.05 "0.05 yield of biomass on uptake of acetate";
    parameter Real Y_h2(unit = "kgCODx/kgCODs") = 0.06 "yield of biomass on uptake of elemental hydrogen";
    //
    //Fractions decay product_bacterial biomass (Flores 2016 values). f_Xbiom settable only in Feed and Sink.
    parameter Real f_si_xb(unit = "kgCOD/kgCOD") = 0.02 "0.02 yield of soluble inerts from disintegration of complex particulates";
    parameter Real f_xi_xb(unit = "kgCOD/kgCOD") = 0.08 "0.08 fP from Wett et al 2006. Yield of particulate inerts from disintegration of complex particulates";
    parameter Real f_ch_xb(unit = "kgCOD/kgCOD") = 0.275 "0.275 yield of carbohydrates from disintegration of complex particulates";
    parameter Real f_pr_xb(unit = "kgCOD/kgCOD") = 0.275 "0.275 yield of proteins from disintegration of complex particulates";
    parameter Real f_li_xb(unit = "kgCOD/kgCOD") = 0.35 "0.350 yield of lipids from disintegration of complex particulates";
    //
    //
    Real tBMPth_pr = 496;
    Real tBMPth_li = 1014;
    Real tBMPth_ch = 415;
    Real tBMPth_su = 415;
    //
    //OLD PARAMETERS
    //  final parameter Real C_xc(unit = "kmolC/kgCOD") = 0.02786 "carbon content of complex particulate COD";
    //  final parameter Real C_xi = 0.0301;
    //  final parameter Real C_si(unit = "kmolC/kgCOD") = 0.03 "carbon content of soluble inert COD";
    //  final parameter Real P_i = 0.00021;
    //  final parameter Real N_xc(unit = "kmolN/kgCOD") = 0.0376/14 "nitrogen content of particulate degradable COD";
    //  final parameter Real N_i = 0.0043;
    //  final parameter Real P_xc(unit = "kmolP/kgCOD") = 0.00006;
    //  final parameter Real P_li(unit = "kmolP/kgCOD") = 0.0003;
    //  final parameter Real P_bac(unit = "kmolP/kgCOD") = 0.0007;
    //  final parameter Real N_aa(unit = "kmolN/kgCOD") = 0.0075 "nitrogen content of amino acids";
    //  final parameter Real N_bac(unit = "kmolN/kgCOD") = 0.08/14 "nitrogen content of biomass: 8% on weight basis in benchmark ASM";
    //  final parameter Real C_bac(unit = "kmolC/kgCOD") = 0.0313 "carbon content of biomass: 8% on weight basis in benchmark ASM";
    //  final parameter Real C_aa(unit = "kmolC/kgCOD") = 0.0299 "carbon content of amino acids";
    //  final parameter Real C_ch(unit = "kmolC/kgCOD") = 0.0313 "carbon content of carbohydrates";
    //  final parameter Real C_pr(unit = "kmolC/kgCOD") = 0.03 "carbon content of proteins";
    //  final parameter Real C_li(unit = "kmolC/kgCOD") = 0.022 "carbon content of lipids";
    annotation(
      Documentation(info = "<html><p> This record contains the stoichiometric coefficients as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_stoichiometric;

  record ParametersADM1_kinetic
    parameter Real k_dis(unit = "1/d") = 0.5 "1.2 complex particulate disintegration first order constant";
    parameter Real k_hyd_xcr = 0.1;
    parameter Real k_hyd_xcs = 0.01;
    parameter Real k_hyd_xchr = 0.35;
    parameter Real k_hyd_xchm = 0.001;
    parameter Real k_hyd_xchs = 0.001;
    parameter Real k_hyd_xprr = 0.45;
    parameter Real k_hyd_xprs = 0.001;
    parameter Real k_hyd_xli = 0.4;
    final parameter Real k_hyd[8] = {k_hyd_xcr, k_hyd_xcs, k_hyd_xchr, k_hyd_xchm, k_hyd_xchs, k_hyd_xprr, k_hyd_xprs, k_hyd_xli};
    parameter Real Tref_khyd[8] = fill(308.15, 8);
    parameter Real k_m_su(unit = "kgCODs/kgCODx/d") = 30 "maximum uptake rate for monosaccharide degrading organisms";
    parameter Real k_m_aa(unit = "kgCODs/kgCODx/d") = 50 "maximum uptake rate amino acid degrading organisms";
    parameter Real k_m_fa(unit = "kgCODs/kgCODx/d") = 6 "maximum uptake rate for long chain fatty acid degrading organisms";
    parameter Real k_m_c4(unit = "kgCODs/kgCODx/d") = 20 "maximum uptake rate for c4 degrading organisms";
    parameter Real k_m_pro(unit = "kgCODs/kgCODx/d") = 13 "maximum uptake rate for propionate degrading organisms";
    parameter Real k_m_ac(unit = "kgCODs/kgCODx/d") = 8 "maximum uptake rate for acetate degrading organisms";
    parameter Real k_m_h2(unit = "kgCODs/kgCODx/d") = 35 "maximum uptake rate for hydrogen degrading organisms";
    parameter Real Ks_su(unit = "kgCOD/m3") = 0.5 "half saturation constant for monosaccharidedegradation";
    parameter Real Ks_aa(unit = "kgCOD/m3") = 0.3 "half saturation constant for amino acid degradation";
    parameter Real Ks_fa(unit = "kgCOD/m3") = 0.4 "half saturation constant for long chain fatty acid degrading organisms";
    parameter Real Ks_c4(unit = "kgCOD/m3") = 0.2 "half saturation constant for c4 degrading organisms";
    parameter Real Ks_pro(unit = "kgCOD/m3") = 0.1 "half saturation constant for propionate degrading organisms";
    parameter Real Ks_ac(unit = "kgCOD/m3") = 0.15 "half saturation constant for acetate degrading organisms";
    parameter Real Ks_h2(unit = "kgCOD/m3") = 7e-6 "half saturation constant for hydrogen degrading organisms";
    parameter Real k_dec_su(unit = "1/d") = 0.02 "decay rate for monosaccharide degrading organisms";
    parameter Real k_dec_aa(unit = "1/d") = 0.02 "decay rate for amino acid degrading organisms";
    parameter Real k_dec_fa(unit = "1/d") = 0.02 "decay rate  for long chain fatty acid degrading organisms";
    parameter Real k_dec_c4(unit = "1/d") = 0.02 "decay rate  for c4 degrading organisms";
    parameter Real k_dec_pro(unit = "1/d") = 0.02 "decay rate for propionate degrading organisms";
    parameter Real k_dec_ac(unit = "1/d") = 0.02 "decay rate  for acetate degrading organisms";
    parameter Real k_dec_h2(unit = "1/d") = 0.02 "decay rate for hydrogen degrading organisms";
    parameter Real Ks_IN(unit = "M") = 1e-4 "inorganic nitrogen concentration at which growth ceases";
    parameter Real Ks_IP(unit = "M") = 2e-5 "inorganic phosforous concentration at which growth ceases";
    parameter Real Ki_h2_fa(unit = "kgCOD/m3") = 5e-6 "hydrogen inhibitory concentration for LCFA degrading organisms";
    parameter Real Ki_h2_c4(unit = "kgCOD/m3") = 1e-5 "hydrogen inhibitory concentration for C4 degrading organisms";
    parameter Real Ki_h2_pro(unit = "kgCOD/m3") = 3.5e-6 "hydrogen inhibitory concentration for propionate degrading organisms";
    parameter Real Ki_nh3_ac(unit = "M") = 0.0018 "inhibitory free ammonia concentration for acetate degrading organisms";
    parameter Real pH_UL_aa = 5.5 "pH level at where there is no inhibition of amino acid degrading organisms";
    parameter Real pH_LL_aa = 4 "pH level at where there is full inhibition of amino acid degrading organisms";
    parameter Real pH_UL_ac = 7 "pH level at where there is no inhibition of acetate degrading organisms";
    parameter Real pH_LL_ac = 6 "pH level at where there is full inhibition of acetate degrading organisms";
    parameter Real pH_UL_h2 = 6 "pH level at where there is no inhibition of hydrogen degrading organisms";
    parameter Real pH_LL_h2 = 5 "pH level at where there is full inhibition of hydrogen degrading organisms";
    final parameter Real th_k_hyd = 0.024;
    final parameter Real th_k_m_su = 0.069;
    final parameter Real th_k_m_aa = 0.069;
    final parameter Real th_k_m_fa = 0.055;
    final parameter Real th_k_m_pro = 0.055;
    final parameter Real th_k_m_c4 = 0.055;
    final parameter Real th_k_m_ac = 0.069;
    final parameter Real th_k_m_h2 = 0.069;
    final parameter Real th_Ks_su = 0.069;
    final parameter Real th_Ks_aa = 0.069;
    final parameter Real th_Ks_fa = 0.035;
    final parameter Real th_Ks_pro = 0.10;
    final parameter Real th_Ks_c4 = 0.10;
    final parameter Real th_Ks_ac = 0.10;
    final parameter Real th_Ks_h2 = 0.08;
    final parameter Real th_k_dec_su = 0.069;
    final parameter Real th_k_dec_aa = 0.069;
    final parameter Real th_k_dec_fa = 0.055;
    final parameter Real th_k_dec_pro = 0.055;
    final parameter Real th_k_dec_c4 = 0.055;
    final parameter Real th_k_dec_ac = 0.069;
    final parameter Real th_k_dec_h2 = 0.069;
    constant Real epsilon = 1e-6;
    annotation(
      Documentation(info = "<html><p> This record contains the kinetic parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_kinetic;

  record ParametersADM1_physiochemical
    parameter SI.Temperature T_ref = 298.15 "Reference temperature for pKa and enthalpy values";
    //General
    final parameter Real pKa_va = 4.86 "- log10Ka valerate at 298K";
    final parameter Real pKa_bu = 4.82 "- log10Ka butyrate at 298K";
    final parameter Real pKa_pro = 4.88 "- log10Ka propionate at 298K";
    final parameter Real pKa_ac = 4.76 "- log10Ka acetate at 298K";
    final parameter Real pKa_co2 = 6.37 "- log10Ka CO2 at 298K";
    final parameter Real pKa_hco3 = 10.33 "- log10Ka HCO3 at 298K";
    final parameter Real pKa_nh3 = 9.25 "- log10ka NH4+ at 298K ";
    final parameter Real pKa_h2o = 14 "- log10ka water at 298K ";
    final parameter Real pKa_h2po4 = 7.21 "-log10kaH2PO4";
    final parameter Real pKa_hpo4 = 12.67 "-log10kaHPO4";
    final parameter Real pKa_h3po4 = 2.12 "-log10kaH3PO4";
    constant Real deltaH0_Ka_co2(unit = "J/mol") = 7646 "enthalpy of reaction CO2->HCO3";
    constant Real deltaH0_Ka_hco3(unit = "J/mol") = 14900 "enthalpy of reaction HCO3->CO3";
    constant Real deltaH0_Ka_nh4(unit = "J/mol") = 51965 "enthalpy of reaction NH4->NH3";
    constant Real deltaH0_Ka_h2o(unit = "J/mol") = 55900 "enthalpy of reaction H2O->OH+H+";
    constant Real deltaH0_KH_ch4(unit = "J/mol") = -14240 "enthalpy of reaction of CH4gas->CH4liq";
    constant Real deltaH0_KH_co2(unit = "J/mol") = -19410 "enthalpy of reaction of CO2gas->CO2liq";
    constant Real deltaH0_KH_h2(unit = "J/mol") = -4180 "enthalpy of reaction of H2gas->H2liq";
    constant Real deltaH0_Ka_h2po4(unit = "J/mol") = 4200 "enthalpy of reaction H2PO4->HPO4. To be verified!";
    constant Real deltaH0_Ka_hpo4(unit = "J/mol") = 14700 "enthalpy of reaction HPO4->PO4. To be verified!";
    constant Real deltaH0_Ka_h3po4(unit = "J/mol") = -41900 "enthalpy of reaction H3PO4->H2PO4. To be verified!";
    final parameter Real coeffHch4(unit = "kmol/m3/bar") = 0.0014;
    final parameter Real coeffHco2(unit = "kmol/m3/bar") = 0.035;
    final parameter Real coeffHh2(unit = "kmol/m3/bar") = 0.00078;
    constant Real KH_nh3_Tref(unit = "kmol/m3/bar") = 61 "Henry constant for nitrogen gas at standard T and P [kmol/m3/bar]";
    constant Real KH_n2_Tref(unit = "kmol/m3/bar") = 0.00065 "Henry constant for nitrogen gas at standard T and P [kmol/m3/bar]";
    final parameter Real coeffph20_T(unit = "K") = 5290;
    final parameter Real coeffph20_p(unit = "bar") = 0.0313;
    // Acidity constants (previously defined as "Real")
    Real Ka_va = 10^(-pKa_va) "valerate acidity constant without temperature correction - unit = M";
    Real Ka_bu = 10^(-pKa_bu) "butyrate acidity constant without temperature correction - unit = M";
    Real Ka_pro = 10^(-pKa_pro) "propionate acidity constant without temperature correction - unit = M";
    Real Ka_ac = 10^(-pKa_ac) "acetate acidity constant without temperature correction - unit = M";
    // Kinetic constant for acid-base reactions: set to be at least three orders of magnitude higher than the fastest time constant of the system
    //  parameter Real k_AB_va(unit = "1/d/(kmol/m3)") = 1e10;
    //  parameter Real k_AB_bu(unit = "1/d/(kmol/m3)") = 1e10;
    //  parameter Real k_AB_pro(unit = "1/d/(kmol/m3)") = 1e10;
    //  parameter Real k_AB_ac(unit = "1/d/(kmol/m3)") = 1e10;
    //  parameter Real k_AB_co2(unit = "1/d/(kmol/m3)") = 1e10;
    //  parameter Real k_AB_IN(unit = "1/d/(kmol/m3)") = 1e10;
    //  parameter Real k_AB_IP(unit = "1/d/(kmol/m3)") = 1e10;
    // Conversion factors for UM
    constant Real convKa(unit = "kmol/m3") = 1;
    //MPP submodel
    constant Real deltaH0_Ksp_stru(unit = "J/mol") = -22600 "enthalpy of reaction of struvite formation. Rontenltap et al 2007 as 22.6 kJ/mol; ; 98.82 kJ/mol; Struvite precipitation is endo up to 30°C and eso between 30-60°C";
    constant Real deltaH0_Ksp_acp(unit = "J/mol") = 54000 "enthalpy of reaction of calcium phosphate formation??; 310 g/mol*26.1 J/g = 8091 J/mol";
    constant Real deltaH0_Ksp_ccm(unit = "J/mol") = -8000 "enthalpy of reaction of calcium phosphate formation??; 310 g/mol*26.1 J/g = 8091 J/mol";
    constant Real deltaH0_Ksp_mag(unit = "J/mol") = -20000 "enthalpy of reaction of calcium phosphate formation??; 310 g/mol*26.1 J/g = 8091 J/mol";
    final parameter Real pKsp_acp(unit = "conc") = 28.92 "New value from PCM?";
    final parameter Real kcryst_acp(unit = "d-1") = 3*(24*60);
    final parameter Real pKsp_stru(unit = "conc") = 13.6 "New value from PCM? Also Ronteltap et al. 2007";
    final parameter Real kcryst_stru(unit = "d-1") = 5*(24*60);
    final parameter Real pKsp_ccm(unit = "conc") = 8.480 "New value from PCM?";
    final parameter Real kcryst_ccm(unit = "d-1") = 0.35*(24*60);
    final parameter Real pKsp_mag(unit = "conc") = 7.46 "New value from PCM?";
    final parameter Real kcryst_mag(unit = "d-1") = 0.034*(24*60) "Valore da Musvoto et al 1999";
    annotation(
      Documentation(info = "<html><p> This record contains the physiochemical parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_physiochemical;

  record OtherVariables_MassBalance
    //    Real V_in_cum(fixed = true, start = 0);
    Real COD_S(fixed = false, start = 0);
    Real COD_X(fixed = false, start = 0);
    Real COD_balance_in(fixed = false, start = 0);
    Real COD_balance_in_cum(fixed = true, start = 0);
    Real COD_balance_out(fixed = false, start = 0);
    Real COD_balance_out_cum(fixed = true, start = 0);
    Real COD_balance_gas(fixed = false, start = 0);
    Real COD_balance_gas_cum(fixed = true, start = 0);
    Real IC_balance_in(fixed = false, start = 0);
    Real IC_balance_in_cum(fixed = true, start = 0);
    Real IC_balance_out(fixed = false, start = 0);
    Real IC_balance_out_cum(fixed = true, start = 0);
    Real IC_balance_gas(fixed = false, start = 0);
    Real IC_balance_gas_cum(fixed = true, start = 0);
    Real IN_balance_in(fixed = false, start = 0);
    Real IN_balance_in_cum(fixed = true, start = 0);
    Real IN_balance_out(fixed = false, start = 0);
    Real IN_balance_out_cum(fixed = true, start = 0);
    Real IN_balance_gas(fixed = false, start = 0);
    Real IN_balance_gas_cum(fixed = true, start = 0);
    Real IP_balance_in(fixed = false, start = 0);
    Real IP_balance_in_cum(fixed = true, start = 0);
    Real IP_balance_out(fixed = false, start = 0);
    Real IP_balance_out_cum(fixed = true, start = 0);
    Real HRT(fixed = false, start = 0) "d";
    Real OLR(fixed = false, start = 0) "kgCOD/m3/d";
    //  Real VS_in;
    //Other algebraic variables
    //  Real resBMP_vs;
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating mass balances. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2021 </em></p></html>"));
  end OtherVariables_MassBalance;

  record Settable_composites
    //To be used only in Feed and Sink. These fractions are on COD basis!!
    parameter Real f_newbio_BMP = 0.08 "Substrates COD fraction resulting in new biomass during BMP tests [kgCOD/kgCOD]";
    //Xc fractioning
    parameter SI.MassFraction f_xi_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_ch_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_pr_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_li_xc(nominal = 1e-1) = 0.3;
    parameter SI.MassFraction f_lig_xc(nominal = 1e-1) = 0.0;
    parameter SI.MassFraction f_si_xc(nominal = 1e-1) = 1 - (f_xi_xc + f_pr_xc + f_li_xc + f_ch_xc + f_lig_xc);
    //
    //Xi fractioning (same fractioning between macromolecus of Xi and f_xi*Xc)
    parameter Real f_ch_xi(unit = "kgCOD/kgCOD") = 0.1 "COD fraction of carbohydrates from particulate inerts Xi [kgCOD/kgCOD]";
    parameter Real f_pr_xi(unit = "kgCOD/kgCOD") = 0.7 "COD fraction of proteins from particulate inerts Xi [kgCOD/kgCOD]";
    parameter Real f_li_xi(unit = "kgCOD/kgCOD") = 1 - (f_ch_xi + f_pr_xi);
    //
    //Si fractioning
    parameter Real f_ch_si(unit = "kgCOD/kgCOD") = 0.1 "fraction of carbohydrates in Si";
    parameter Real f_pr_si(unit = "kgCOD/kgCOD") = 0.7 "fraction of proteins Si";
    parameter Real f_li_si(unit = "kgCOD/kgCOD") = 1 - f_ch_si - f_pr_si "fraction of lipids in Si";
    //Composition of bacteria
    parameter Real f_Xbiom_ch(unit = "kgCOD/kgCOD") = 0.1 "Carbohydrates content in biomass";
    parameter Real f_Xbiom_pr(unit = "kgCOD/kgCOD") = 0.8 "Proteins content in biomass";
    parameter Real f_Xbiom_li(unit = "kgCOD/kgCOD") = 1 - f_Xbiom_ch - f_Xbiom_pr "Lipids content in biomass";
    parameter Real f_Xpr_s(unit = "kgCOD/kgCOD") = 0.10 "Fraction of slowly degradable particulate proteins";
    parameter Real f_Xch_s(unit = "kgCOD/kgCOD") = 0.10 "Fraction of slowly degradable particulate carbohydrates";  
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating output aggregated variables. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2021 </em></p></html>"));
  end Settable_composites;

  record OtherVariables_GasMeter
    Real x_ch4(fixed = false, start = 0);
    Real x_co2(fixed = false, start = 0);
    Real x_h2(fixed = false, start = 0);
    Real x_nh3(fixed = false, start = 0);
    Real x_n2(fixed = false, start = 0);
    Real Q_ch4_N(fixed = false, start = 0);
    Real Q_co2_N(fixed = false, start = 0);
    Real Q_h2_N(fixed = false, start = 0);
    Real Q_nh3_N(fixed = false, start = 0);
    Real Q_n2_N(fixed = false, start = 0);
  end OtherVariables_GasMeter;

  package Interfaces
    connector Feed_stream_vec
      //An eps-limit for the flowrate is defined as eps := relativeTolerance*min(nominal(mj.c.m_flow)) exists to avoid division by 0 when performing weighted averages in the inStream operator. Lower nominal.Q if working with different reactor scale
      flow SI.VolumeFlowRate Q(nominal = 1e-12);
      Real dummy;
      parameter Integer nW = 1;
      constant Integer N_ip = 1 "5";
      constant Integer N_in = 1 "3";
      constant Integer N_ic = 1 "4";
      constant Integer N_an = 1 "2";
      constant Integer N_cat = 1 "2";
      stream Real X_h2;
      stream SI.MassConcentration X_i[4];
      stream Real S_su;
      stream Real S_aa;
      stream Real S_fa;
      stream Real S_va;
      stream Real S_bu;
      stream Real S_pro;
      stream Real S_ac;
      stream Real S_h2;
      stream Real S_ch4;
      stream Types.MolarDensity_M S_ic;
      stream Types.MolarDensity_M S_in;
      stream Types.MolarDensity_M S_ip;
      stream SI.MassConcentration S_i[4];
      stream Types.MolarDensity_M S_cat;
      stream Types.MolarDensity_M S_ca;
      stream Types.MolarDensity_M S_mg;
      stream Types.MolarDensity_M S_an;
      stream SI.MassConcentration X_c[7];
      stream SI.MassConcentration X_ch[3];
      stream SI.MassConcentration X_pr[2];
      stream SI.MassConcentration X_li;
      stream SI.MassConcentration X_p;
      stream SI.MassConcentration X_lig;
      stream Real X_su;
      stream Real X_aa;
      stream Real X_fa;
      stream Real X_c4;
      stream Real X_pro;
      stream Real X_ac;
      stream Types.MolarDensity_M X_stru;
      stream Types.MolarDensity_M X_acp;
      stream Types.MolarDensity_M X_ccm;
      stream Real ash;
      annotation(
        Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}),
        Diagram(graphics = {Polygon(origin = {0, 1}, fillColor = {170, 170, 255}, fillPattern = FillPattern.Solid, points = {{-100, 99}, {-100, -99}, {100, -1}, {100, -1}, {-100, 99}})}));
    end Feed_stream_vec;

    connector Gas_stream
      flow Real Q_gas_N;
      Real P_gas;
      stream Real p_gas_h2o;
      stream Real p_gas_h2;
      stream Real p_gas_ch4;
      stream Real p_gas_co2;
      stream Real p_gas_nh3;
      stream Real p_gas_n2;
      annotation(
        Diagram(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}));
    end Gas_stream;
  end Interfaces;

  package Icons
    partial block FeedSource1
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "CattleManure"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {93, 45, 0}, fillColor = {71, 34, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {-2, 0}, lineColor = {90, 44, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.24365, -0.168094}, points = {{4, -54}, {4, -68}, {88, -68}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {98, 47, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end FeedSource1;

    partial block FeedSource2
      annotation(
        Icon(graphics = {Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, extent = {{-54, 54}, {56, -54}}), Line(origin = {-1.66, 0.42}, points = {{4, -54}, {4, -68}, {88, -68}}), Rectangle(origin = {-1, 35.11}, lineColor = {238, 158, 119}, fillColor = {238, 158, 119}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Rectangle(origin = {-2, 0}, lineColor = {238, 158, 119}, fillColor = {238, 158, 119}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-0.21, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}), Polygon(origin = {0, 4}, lineColor = {238, 158, 119}, fillColor = {238, 158, 119}, fillPattern = FillPattern.Solid, points = {{0, -56}, {-16, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {18, -54}, {2, -56}, {2, -56}, {0, -54}, {0, -56}})}));
    end FeedSource2;

    partial block FeedSource3
      annotation(
        Icon(graphics = {Text(origin = {0, 36.42}, extent = {{-80, 51.58}, {80, 31.58}}, textString = "Expired Yogurt"), Line(origin = {-0.207555, 0}, points = {{-4, -54}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {255, 255, 127}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {-2, 0}, lineColor = {255, 255, 127}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-2.58, -0.17}, points = {{4, -54}, {4, -68}, {88, -68}}), Polygon(origin = {0, 2}, lineColor = {255, 255, 127}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end FeedSource3;

    partial block FeedingTank
      annotation(
        Icon(graphics = {Rectangle(lineColor = {98, 106, 124}, fillColor = {186, 204, 220}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-60, 80}, {60, -80}}), Rectangle(origin = {0, -90}, lineColor = {145, 145, 145}, fillColor = {222, 222, 222}, fillPattern = FillPattern.Solid, lineThickness = 0.5, borderPattern = BorderPattern.Engraved, extent = {{-80, 10}, {80, -10}}, radius = 3), Ellipse(origin = {-2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}}, endAngle = 360), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Ellipse(origin = {2.69, 0}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}, endAngle = 360), Line(origin = {0.326594, -0.653188}, points = {{0, -34}, {0, 40}, {0, 98}}, thickness = 1), Line(points = {{10, -36}, {2, -36}}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, thickness = 0.5), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}, endAngle = 360), Ellipse(origin = {0.25, -87.49}, lineColor = {88, 88, 88}, fillColor = {159, 159, 159}, fillPattern = FillPattern.Solid, extent = {{-18.25, 11.49}, {18.25, -11.49}}, endAngle = 360), Line(origin = {-2, -89.55}, points = {{2, -9}, {8, 11}}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line(origin = {-11.1441, -80.7082}, points = {{-1, 1}, {3, -3}}), Line(origin = {3.2058, -79.2899}, points = {{-3, 3}, {-3, -3}}), Line(origin = {-12.61, -85.62}, points = {{-5, -3}, {3, -3}}), Line(origin = {11.7335, -74.6764}, points = {{-3, -9}, {1, -5}}), Line(origin = {15.39, -85.62}, points = {{-5, -3}, {3, -3}})}));
    end FeedingTank;

    partial block Digester
      annotation(
        Icon(graphics = {Ellipse(origin = {0, 52}, lineColor = {154, 149, 124}, fillColor = {229, 220, 200}, fillPattern = FillPattern.Solid, extent = {{-64, 36}, {64, -36}}), Polygon(origin = {-1, -24}, lineColor = {131, 65, 0}, fillColor = {163, 118, 80}, fillPattern = FillPattern.Solid, points = {{-63, 78}, {-63, -52}, {1, -70}, {65, -52}, {65, 64}, {65, 78}, {-63, 78}}), Ellipse(lineColor = {85, 0, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-2, -34}, {2, -38}}), Line(points = {{10, -36}, {2, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(points = {{-2, -36}, {-10, -36}}, color = {85, 0, 0}, thickness = 0.5), Line(origin = {0.33, -0.65}, points = {{0, -34}, {0, 40}, {0, 88}}, color = {85, 0, 0}, thickness = 1), Ellipse(origin = {2.69, 0}, lineColor = {85, 0, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, extent = {{7.31, -32}, {45.31, -40}}), Ellipse(origin = {-2.69, 0}, lineColor = {85, 0, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-45.31, -32}, {-7.31, -40}})}));
    end Digester;

    partial block BatchTest
      annotation(
        Diagram,
        Icon(graphics = {Polygon(lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, points = {{0, 60}, {18, 60}, {40, 0}, {-40, 0}, {-20, 60}, {0, 60}}), Line(origin = {-26.0362, 20.0139}, points = {{-7, 0}, {7, 0}, {7, 0}}), Rectangle(origin = {-1, 67}, lineColor = {255, 0, 127}, fillColor = {255, 85, 127}, fillPattern = FillPattern.Backward, borderPattern = BorderPattern.Raised, extent = {{-17, 7}, {17, -7}}, radius = 2), Line(origin = {-19.4512, 40.0139}, points = {{-7, 0}, {7, 0}, {7, 0}}), Polygon(lineColor = {85, 0, 0}, fillColor = {163, 118, 80}, fillPattern = FillPattern.Solid, points = {{-40, 0}, {40, 0}, {60, -60}, {-60, -60}, {-40, 0}, {-40, 0}}), Line(origin = {-46.1225, -39.7075}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-39.1978, -19.7632}, points = {{-7, 0}, {7, 0}, {7, 0}}), Line(origin = {-33.0557, 0.125385}, points = {{-7, 0}, {7, 0}, {7, 0}}), Rectangle(origin = {-19, 70}, lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-1, 10}, {1, -10}}), Rectangle(origin = {17, 70}, lineColor = {85, 170, 255}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-1, 10}, {1, -10}})}));
    end BatchTest;

    partial block SludgeDischarge
      annotation(
        Icon(graphics = {Rectangle(origin = {-5, 158}, lineColor = {163, 118, 80}, fillColor = {163, 118, 80}, fillPattern = FillPattern.Solid, extent = {{-31, -139}, {86, -258}}), Polygon(origin = {-6, 54}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-62, 18}, {-50, 26}, {-50, 10}, {-62, 18}}), Rectangle(origin = {-15.33, 54.67}, lineColor = {122, 122, 122}, fillColor = {192, 192, 192}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-76.67, 1.33}, {-30.67, -6.67}}), Line(origin = {-7.73, 64.53}, points = {{-34, -14}, {-30, -14}, {-24, -16}, {-20, -18}, {-16, -26}, {-12, -34}, {-12, -42}}, color = {163, 118, 80}, thickness = 1.75), Polygon(origin = {-8, 54}, fillColor = {125, 125, 125}, fillPattern = FillPattern.Solid, points = {{-72, 26}, {-72, 10}, {-60, 18}, {-72, 26}}), Line(origin = {-7.0234, 52.4685}, points = {{-60, 20}, {-60, 4}}, thickness = 1), Line(origin = {-13.5295, 33.93}, points = {{-24, -6}, {-24, -134}, {96, -134}, {96, -8}})}));
    end SludgeDischarge;

    partial block GasMeter
      annotation(
        Icon(graphics = {Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Ellipse(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-12, -12}, {12, 12}}, endAngle = 360), Ellipse(fillColor = {252, 255, 184}, fillPattern = FillPattern.Solid, extent = {{-70, -70}, {70, 70}}, endAngle = 360), Line(points = {{-22.9, 32.8}, {-40.2, 57.3}}), Ellipse(fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-7, -7}, {7, 7}}, endAngle = 360), Line(points = {{-37.6, 13.7}, {-65.8, 23.9}}), Line(visible = false, points = {{55, -85}, {-60, -85}}, color = {0, 128, 255}), Polygon(rotation = -17.5, fillColor = {64, 64, 64}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-5, 0}, {-2, 60}, {0, 65}, {2, 60}, {5, 0}, {-5, 0}}), Line(points = {{22.9, 32.8}, {40.2, 57.3}}), Line(points = {{37.6, 13.7}, {65.8, 23.9}}), Line(points = {{0, 70}, {0, 40}})}));
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

    partial block SinkDigestate
      annotation(
        Icon(graphics = {Line(origin = {-2.08353, -148.606}, rotation = 180, points = {{-4, -94}, {-4, -74}, {86, -74}}, thickness = 0.5), Rectangle(origin = {-1, 35.11}, lineColor = {93, 45, 0}, fillColor = {71, 34, 0}, fillPattern = FillPattern.Solid, extent = {{-3, -79.11}, {3, -109.11}}), Ellipse(fillColor = {218, 218, 218}, fillPattern = FillPattern.Solid, extent = {{-54, 54}, {56, -54}}), Rectangle(origin = {0, -142}, rotation = 180, lineColor = {90, 44, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, extent = {{4, -74}, {88, -68}}), Line(origin = {-175.934, -2.54243}, points = {{172, -52}, {172, -66}, {88, -66}}, thickness = 0.5), Polygon(origin = {0, 2}, lineColor = {98, 47, 0}, fillColor = {75, 36, 0}, fillPattern = FillPattern.Solid, points = {{-4, -56}, {-12, -54}, {-24, -50}, {-30, -46}, {-38, -40}, {-44, -32}, {-48, -26}, {-50, -20}, {52, -20}, {50, -26}, {46, -32}, {46, -32}, {40, -40}, {40, -40}, {32, -46}, {32, -46}, {26, -50}, {16, -54}, {2, -56}, {2, -56}, {-2, -58}, {-4, -56}})}));
    end SinkDigestate;
  end Icons;

  package BlockLibrary
    model Feed_Source_NIR
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.Feed_variables_NIR;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput Q annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[26] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Simulating choices
      parameter Integer nXin = 26;
      parameter Integer nW = 1;
      parameter Boolean steady = true "setti parametro";
      //To simulate a solid matrix with parameters: Carbonates/Phosphates/S_an_in/Ca/Mg = 0.0
      //Feed input characteristics (Ari+Dave)
      //As %TS. Sugars directly mapped in S_su. Soluble proteins as S_aa.
      Real TS_in(fixed = false, start = 0) "gTS/kg";
      Real VS_in(fixed = false, start = 0) "gVS/kg";
      Real Alk_in(fixed = false, start = 0) "mgCaCO3/L";
      Real Ammonium_in(fixed = false, start = 0) "mgN/L";
      Real Fosfates_in(fixed = false, start = 0) "mgP/L";
      Real Ca_in(fixed = false, start = 0) "mol/L";
      Real Mg_in(fixed = false, start = 0) "mol/L";
      Real ac_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real pro_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real bu_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real va_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real Ssu_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real Saa_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real Sfa_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real tBMP_VS_in(fixed = false, start = 0) "NmLCH4/gVS";
      //Other input variables
      Real CP_in;
      Real EE_in;
      Real Cellulose_in;
      Real Hemicellulose_in;
      Real Lignin_in;
      Real Starch_in;
      Real BD_pr;
      Real BD_li;
      Real BD_cell;
      Real BD_hemicell;
      //Other internal variables
      Real BD_ch;
      Real NDF_in;
      Real CH_in;
      Real tBMPth_vs;
      Real BD_vs;
      Real tBMPerror;
      //To be calculated
      //Not sure about MW_XP. Da correggere nel caso in cui ci fosse Xc!!
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[2]*COD_VS_LI + f_si[3]*COD_VS_PR, 1/6*COD_VS_PR + 1/6*COD_VS_LI + 1/6*COD_VS_CH + 1/6*COD_VS[25] + 1/6*COD_VS[13] + 1/6*COD_VS_LIG, COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[2]*MW_LI + f_si[3]*MW_PR, 1/6*MW_PR + 1/6*MW_LI + 1/6*MW_CH + 1/6*MW[25] + 1/6*MW[13] + 1/6*MW_LIG, MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76, MW_LIG} "g/mol";
    equation
//Inputs
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
//The followings are as %TS (S and X)
      Ssu_in = if steady == true then su else inlet[13];
      Saa_in = if steady == true then aa else inlet[14];
      Sfa_in = if steady == true then fa else inlet[15];
      tBMP_VS_in = if steady == true then tbmp_vs else inlet[16] "Introdurre check con biodegradabilità macromolecole";
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
// Particulate calculated based on Dave data
//Computation of physical properties
      u = 1 - TS_in/1000 "fraction of moisture content";
      v = VS_in/TS_in "fraction of volatile content";
      d = 1/(u/1000 + (1 - u)*(v/1050 + (1 - v)/2500)) "g/L, density";
//Other internal variables
      BD_ch*CH_in = 100*(Ssu_in + Starch_in + BD_cell*Cellulose_in/100 + BD_hemicell*Hemicellulose_in/100);
      NDF_in = Cellulose_in + Hemicellulose_in + Lignin_in;
      CH_in = Ssu_in + Starch_in + NDF_in;
      tBMPth_vs = (tBMPth_pr*CP_in + tBMPth_li*EE_in + tBMPth_ch*(CH_in - Ssu_in) + tBMPth_su*Ssu_in)/(VS_in*100/TS_in);
      BD_vs = (BD_ch*CH_in + BD_pr*CP_in + BD_li*EE_in)/(VS_in*100/TS_in);
      tBMPerror = BD_vs/100*tBMPth_vs - tBMP_VS_in;
//
//Block variables
      outlet.Q = -Q "m3/d";
//Computation of soluble gas
      outlet.S_h2 = h2 "gCOD/L";
      outlet.S_ch4 = ch4 "gCOD/L";
//Computation of biomasses
      outlet.X_su = xsu "gCOD/L";
      outlet.X_aa = xaa "gCOD/L";
      outlet.X_fa = xfa "gCOD/L";
      outlet.X_c4 = xc4 "gCOD/L";
      outlet.X_pro = xpro "gCOD/L";
      outlet.X_ac = xac "gCOD/L";
      outlet.X_h2 = xh2 "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      outlet.S_ac = ac_in "gCOD/L";
      outlet.S_pro = pro_in "gCOD/L";
      outlet.S_bu = bu_in "gCOD/L";
      outlet.S_va = va_in "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      outlet.S_su = Ssu_in*TS_in/100*COD_VS[1] "gCOD/L";
//Correggere S_aa per TKN e BSA?
      outlet.S_aa = Saa_in*TS_in/100*COD_VS[2] "gCOD/L";
      outlet.S_fa = Sfa_in*TS_in/100*COD_VS[3] "gCOD/L";
//Introdurre ripartizione di undeg tra Xi e Si
      outlet.S_i[end] = si "gCOD/L";
      outlet.S_i[1] = outlet.S_i[end] "gCOD/L";
      outlet.S_i[2] = outlet.S_i[end] "gCOD/L";
      outlet.S_i[3] = outlet.S_i[end] "gCOD/L";
      f_si[1] = outlet.S_i[1]/outlet.S_i[end];
      f_si[2] = outlet.S_i[2]/outlet.S_i[end];
      f_si[3] = outlet.S_i[3]/outlet.S_i[end];
//
//Computation of variables X_c and X_i (Biernacki)
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
//
      outlet.X_c[end] = 0;
      outlet.X_c[1] = outlet.X_c[end];
      outlet.X_c[2] = outlet.X_c[end];
      outlet.X_c[3] = outlet.X_c[end];
      outlet.X_c[4] = outlet.X_c[end];
      outlet.X_c[5] = outlet.X_c[end];
      outlet.X_c[6] = outlet.X_c[end];
//
//  outlet.X_i[end] = 0;
//Da cambiare COD_VS lignina. Posso anche scriverlo come (1-BDch)*CH_in se non ho differenze tra COD_VS lignina e altri
      outlet.X_i[1] = TS_in/100*((100 - BD_cell)/100*Cellulose_in*COD_VS[15] + (100 - BD_hemicell)/100*Hemicellulose_in*COD_VS[15]);
      outlet.X_i[2] = TS_in/100*((100 - BD_pr)/100*CP_in*COD_VS[16]);
      outlet.X_i[3] = TS_in/100*((100 - BD_li)/100*EE_in*COD_VS[17]);
      outlet.X_i[end] = sum(outlet.X_i[i] for i in 1:3);
      f_xi[1] = outlet.X_i[1]/outlet.X_i[end];
      f_xi[2] = outlet.X_i[2]/outlet.X_i[end];
      f_xi[3] = outlet.X_i[3]/outlet.X_i[end];
      outlet.X_lig = TS_in/100*Lignin_in*COD_VS_LIG;
//Proporzioni per ripartire slowly, intermediate e rapidly?
      outlet.X_ch[2] = BD_hemicell*Hemicellulose_in*TS_in*COD_VS[15]/10^4;
      outlet.X_ch[1] = Starch_in*TS_in*COD_VS[15]/10^2;
      outlet.X_ch[3] = BD_cell*Cellulose_in*TS_in*COD_VS[15]/10^4;
//Input sempre da TKN. Proporzioni per ripartire slowly e rapidly?
      outlet.X_pr[2] = f_pr_s*(CP_in - Saa_in)*TS_in*BD_pr*COD_VS[16]/10^4;
      outlet.X_pr[1] = f_pr_r*(CP_in - Saa_in)*TS_in*BD_pr*COD_VS[16]/10^4;
//
      outlet.X_li = EE_in*TS_in*BD_li*COD_VS[17]/10^4;
//
      outlet.X_p = 0;
//
      Alk_mol = Alk_in/100*2/1000 "mol/L";
      S_hco3 = max(0, if liquid == false then outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h) else Alk_mol - (S_acm + S_prom + S_bum + S_vam) - S_oh - (outlet.S_in - S_nh4) + S_h - S_hpo4 - 2*S_po4 + S_h3po4 - 2*S_co3) "mol/L";
      outlet.S_ic = if liquid == false then tic/12/1000 else (S_hco3*(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h))/Ka_co2 "mol/L";
      outlet.S_in = Ammonium_in/14/1000 "mol/L";
      outlet.S_ip = Fosfates_in/30.973762/1000 "mol/L";
      outlet.S_an = an "mol/L";
      outlet.S_cat = if liquid == false then cat else (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 "mol/L";
      outlet.S_ca = Ca_in;
      outlet.S_mg = Mg_in;
      outlet.ash = TS_in - VS_in;
//
//Aggiungere Xp!
//Sommare a TAC E TAN i sali? Quando misuro diluisco...
//Occhio a conversioni cod/vs solubili!!
//Lumped Feed characteristic
      TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_li/COD_VS_LI + outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3))/COD_VS_CH + outlet.S_aa/COD_VS[2] + sum(outlet.X_pr[2] for i in 1:2)/COD_VS_PR + outlet.S_fa/COD_VS[3] + outlet.X_li/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]*(1/6/COD_VS_CH + 1/6/COD_VS_PR + 1/6/COD_VS_LI + 1/6/COD_VS[25] + 1/6/COD_VS[13] + 1/6/COD_VS_LIG) + outlet.X_lig/COD_VS_LIG "Volatile Solid content in the digester as gVS/L";
//
      TAN = outlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig "Total COD concentration as gCOD/L";
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*1/6*f_xi[1] + outlet.X_c[end]*1/6*f_si[1] + outlet.X_c[end]*1/6 + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (1/6*outlet.X_c[end] + outlet.X_lig)/COD_VS_LIG "Total CH concentration as gGlu/L";
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*1/6*f_xi[2] + outlet.X_c[end]*1/6*f_si[2] + outlet.X_c[end]*1/6 + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*1/6*f_xi[2] + outlet.X_c[end]*1/6*f_si[2] + outlet.X_c[end]*1/6 + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*1/6*f_xi[3] + outlet.X_c[end]*1/6*f_si[3] + outlet.X_c[end]*1/6 + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (outlet.S_su + outlet.S_i[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (outlet.S_fa + outlet.S_i[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
//
//Common equations
//Computation of ionic components
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
//
      S_h = 10^(-pH) "mol/L";
      S_oh = Ka_h2o/S_h "mol/L";
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac) "mol/L";
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro) "mol/L";
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu) "mol/L";
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va) "mol/L";
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4) "mol/L";
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4)) "mol/L";
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h) "mol/L";
//
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS,LOG_NLS_V,LOG_STATS", s = "dassl", variableFilter = ".*"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ");
    end Feed_Source_NIR;

    model Feed_Source_Direct
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.Feed_variables_Direct;
      extends ADM1_P.Settable_composites;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput Q annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[31] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Other parameters (to easily simulate parallel steady states)
      //Flores S_an_in: 0
      //To simulate a solid matrix with parameters: Carbonates/Phosphates/S_an_in/Ca/Mg = 0.0
      //Simulating choices
      parameter Integer nXin = 31;
      parameter Integer nW = 1;
      parameter Boolean steady = true "setti parametro";
      parameter Boolean inputpH;
      //Not sure about MW_XP
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_ch_si*COD_VS_CH + f_li_si*COD_VS_LI + f_pr_si*COD_VS_PR, f_pr_xc*COD_VS_PR + f_li_xc*COD_VS_LI + f_ch_xc*COD_VS_CH + f_xi_xc*COD_VS[25] + f_si_xc*COD_VS[13] + f_lig_xc*COD_VS_LIG, COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_ch_xi*COD_VS_CH + f_pr_xi*COD_VS_PR + f_li_xi*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_ch_si*MW_CH + f_li_si*MW_LI + f_pr_si*MW_PR, f_pr_xc*MW_PR + f_li_xc*MW_LI + f_ch_xc*MW_CH + f_xi_xc*MW[25] + f_si_xc*MW[13] + f_lig_xc*MW_LIG, MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_ch_xi*MW_CH + f_pr_xi*MW_PR + f_li_xi*MW_LI, 76, MW_LIG} "g/mol";
    equation
//Block variables
      outlet.Q = -Q "m3/d";
//Computation of soluble gas
      outlet.S_h2 = if steady == true then h2 else inlet[8] "gCOD/L";
      outlet.S_ch4 = if steady == true then ch4 else inlet[9] "gCOD/L";
//Computation of biomasses
      outlet.X_su = if steady == true then xsu else inlet[18] "gCOD/L";
      outlet.X_aa = if steady == true then xaa else inlet[19] "gCOD/L";
      outlet.X_fa = if steady == true then xfa else inlet[20] "gCOD/L";
      outlet.X_c4 = if steady == true then xc4 else inlet[21] "gCOD/L";
      outlet.X_pro = if steady == true then xpro else inlet[22] "gCOD/L";
      outlet.X_ac = if steady == true then xac else inlet[23] "gCOD/L";
      outlet.X_h2 = if steady == true then xh2 else inlet[24] "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      outlet.S_ac = if steady == true then ac else inlet[7] "gCOD/L";
      outlet.S_pro = if steady == true then pro else inlet[6] "gCOD/L";
      outlet.S_bu = if steady == true then bu else inlet[5] "gCOD/L";
      outlet.S_va = if steady == true then va else inlet[4] "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      outlet.S_su = if steady == true then su else inlet[1] "gCOD/L";
//Correggere S_aa per TKN e BSA?
      outlet.S_aa = if steady == true then aa else inlet[2] "gCOD/L";
      outlet.S_fa = if steady == true then fa else inlet[3] "gCOD/L";
      outlet.S_i[end] = if steady == true then si else inlet[13] "gCOD/L";
      outlet.S_i[1] = outlet.S_i[end]*f_ch_si "gCOD/L";
      outlet.S_i[2] = outlet.S_i[end]*f_pr_si "gCOD/L";
      outlet.S_i[3] = outlet.S_i[end]*f_li_si "gCOD/L";
//
//Computation of variables X_c and X_i (Biernacki)
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
//
      outlet.X_c[end] = if steady == true then xc else inlet[14];
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
      outlet.X_c[6] = outlet.X_c[end]*f_lig_xc;
//
      outlet.X_i[end] = if steady == true then xi else inlet[25];
      outlet.X_i[1] = outlet.X_i[end]*f_ch_xi;
      outlet.X_i[2] = outlet.X_i[end]*f_pr_xi;
      outlet.X_i[3] = outlet.X_i[end]*f_li_xi;
//
      outlet.X_ch[2] = if steady == true then xch else inlet[15];
      outlet.X_ch[1] = 0;
      outlet.X_ch[3] = 0;
//Input sempre da TKN
      outlet.X_pr[2] = if steady == true then xpr else inlet[16];
      outlet.X_pr[1] = 0;
//
      outlet.X_li = if steady == true then xli else inlet[17];
//
      outlet.X_p = 0;
      outlet.X_lig = 0;
//
      pH = ph;
      S_hco3 = outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h);
      outlet.S_ic = if steady == true then tic/12/1000 else inlet[10]/12/1000;
      outlet.S_in = if steady == true then tan/14/1000 else inlet[11]/14/1000 "mol/L";
      outlet.S_ip = if steady == true then ortop/31/1000 else inlet[12]/31/1000 "mol/L";
      outlet.S_an = if steady == true then an else inlet[29] "mol/L";
      outlet.S_cat = if inputpH == true then (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 elseif steady == true and inputpH == false then cat else inlet[28] "mol/L";
      outlet.S_ca = if steady == true then ca else inlet[30];
      outlet.S_mg = if steady == true then mg else inlet[31];
      outlet.ash = ash;
      Alk_mol = S_hco3 + (S_acm + S_prom + S_bum + S_vam) + S_oh + (outlet.S_in - S_nh4) - S_h + S_hpo4 + 2*S_po4 - S_h3po4 + 2*S_co3 "mol/L";
//
//Aggiungere Xp!!
//Sommare a TAC E TAN i sali? Quando misuro diluisco...
//Lumped Feed characteristic
      TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_li/COD_VS_LI + outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3))/COD_VS_CH + outlet.S_aa/COD_VS[2] + sum(outlet.X_pr[2] for i in 1:2)/COD_VS_PR + outlet.S_fa/COD_VS[3] + outlet.X_li/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13] + f_lig_xc/COD_VS_LIG) "Volatile Solid content in the digester as gVS/L";
//
      TAN = outlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig "Total COD concentration as gCOD/L";
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_xi_xc*f_ch_xi + outlet.X_c[end]*f_si_xc*f_ch_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (outlet.X_lig + outlet.X_c[end]*f_lig_xc)/COD_VS_LIG "Total CH concentration as gGlu/L";
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_pr_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_xi_xc*f_li_xi + outlet.X_c[end]*f_si_xc*f_li_si + outlet.X_c[end]*f_li_xc + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (outlet.S_su + outlet.S_i[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (outlet.S_fa + outlet.S_i[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
//
//Common equations
//Computation of ionic components
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
//
      S_h = 10^(-pH) "mol/L";
      S_oh = Ka_h2o/S_h "mol/L";
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac) "mol/L";
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro) "mol/L";
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu) "mol/L";
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va) "mol/L";
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4) "mol/L";
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4)) "mol/L";
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h) "mol/L";
//
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Direct;

    model Feed_Source_Catenacci
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.Feed_variables_Catenacci;
      extends ADM1_P.Settable_composites;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.Lumped_variables;
      extends ADM1_P.Icons.FeedSource2;
      Modelica.Blocks.Interfaces.RealInput Q annotation(
        Placement(visible = true, transformation(origin = {-72, -26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -58}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[21] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Simulating choices
      parameter Integer nXin = 21;
      parameter Integer nW = 1;
      parameter Boolean steady = true "setti parametro";
      //Feed input characteristics (Ari+Dave) (pH is declared in Common)
      Real TS_in(fixed = false, start = 0) "gTS/kg";
      Real VS_in(fixed = false, start = 0) "gVS/kg";
      Real Alk_in(fixed = false, start = 0) "mgCaCO3/L";
      Real Ammonium_in(fixed = false, start = 0) "mgN/L";
      Real Fosfates_in(fixed = false, start = 0) "mgP/L";
      Real Ca_in(fixed = false, start = 0) "mol/L";
      Real Mg_in(fixed = false, start = 0) "mol/L";
      Real ac_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real pro_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real bu_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real va_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real tBMP_VS_in(fixed = false, start = 0) "NmLCH4/gVS";
      //
      Real pVS_in "gVSp/kgp";
      Real sVS_in "gVSs/kgs";
      Real tCH_in "gGlu/m3";
      Real tPR_in "gN/kg or gBSA/kg";
      Real pLI_pVS_in "gLI/kgVSp";
      Real sCOD_in "gCOD/L";
      Real sCH_in "gGlu/m3";
      Real sPR_in "gN/m3 or gBSA/m3";
      parameter Boolean TKN "Sludge vs Yogurth";
      //Not sure about MW_XP
      Real COD_VS[nC] = {32*6/180, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_ch_si*COD_VS_CH + f_li_si*COD_VS_LI + f_pr_si*COD_VS_PR, f_pr_xc*COD_VS_PR + f_li_xc*COD_VS_LI + f_ch_xc*COD_VS_CH + f_xi_xc*COD_VS[25] + f_si_xc*COD_VS[13] + f_lig_xc*COD_VS_LIG, COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_ch_xi*COD_VS_CH + f_pr_xi*COD_VS_PR + f_li_xi*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_ch_si*MW_CH + f_li_si*MW_LI + f_pr_si*MW_PR, f_pr_xc*MW_PR + f_li_xc*MW_LI + f_ch_xc*MW_CH + f_xi_xc*MW[25] + f_si_xc*MW[13] + f_lig_xc*MW_LIG, MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_ch_xi*MW_CH + f_pr_xi*MW_PR + f_li_xi*MW_LI, 76, MW_LIG} "g/mol";
    equation
//Inputs
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
      tBMP_VS_in = if steady == true then tbmp_vs else inlet[13] "Introdurre check con biodegradabilità macromolecole";
// Variabili che dovrebbero essere "if Catenacci then inlet else calcola"
      pVS_in = if steady == true then 0 else inlet[14];
      sVS_in = if steady == true then 0 else inlet[15];
      tCH_in = if steady == true then 0 else inlet[16];
      tPR_in = if steady == true then 0 else inlet[17];
      pLI_pVS_in = if steady == true then 0 else inlet[18];
      sCOD_in = if steady == true then 0 else inlet[19];
      sCH_in = if steady == true then sCH else inlet[20];
      sPR_in = if steady == true then sPR else inlet[21];
//
//Computation of physical properties
      u = 1 - TS_in/1000 "fraction of moisture content";
      v = VS_in/TS_in "fraction of volatile content";
      d = 1/(u/1000 + (1 - u)*(v/1050 + (1 - v)/2500)) "g/L, density";
      alpha = if pVS_in < 1e-10 then 0 else (pVS_in - VS_in)/(pVS_in - sVS_in);
//Computation of COD components
      pLI_VS_in = pLI_pVS_in*(1 - alpha)*pVS_in/VS_in;
//
      tLI_in = pLI_VS_in*VS_in*d/1000 + outlet.S_fa*1000/COD_VS[17];
//
      COD_VFA = outlet.S_ac + outlet.S_pro + outlet.S_bu + outlet.S_va "gCOD/L, COD associated to VFA";
      tCOD = if TKN == true then COD_VFA + tCH_in*COD_VS[15]/1000 + (tPR_in*d/1000 - Ammonium_in)*COD_VS[16]*N_PR/1000 + tLI_in*COD_VS[17]/1000 else COD_VFA + tCH_in*COD_VS[15]/1000 + tPR_in*COD_VS_PR_BCA/1000 + tLI_in*COD_VS[17]/1000 "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOD = tCOD - COD_VFA - outlet.S_su - outlet.S_fa - outlet.S_aa "gCOD/L, particulate COD";
      tBMP_COD = tBMP_VS_in/tCOD*VS_in*d/1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
      fd_tCOD = if tBMP_COD < 1e-10 then 1 else tBMP_COD/(R*100*273.15/101325/2/32*10^6*(1 - f_newbio_BMP)) "Problema dello Yogurth: se BMP nullo, significa tutto degradabile";
      tCOD*fd_tCOD = COD_VFA + outlet.S_aa + outlet.S_su + outlet.S_fa + pCOD*fd_pCOD;
//
//Block variables
      outlet.Q = -Q "m3/d";
//Computation of soluble gas
      outlet.S_h2 = h2 "gCOD/L";
      outlet.S_ch4 = ch4 "gCOD/L";
//Computation of biomasses
      outlet.X_su = xsu "gCOD/L";
      outlet.X_aa = xaa "gCOD/L";
      outlet.X_fa = xfa "gCOD/L";
      outlet.X_c4 = xc4 "gCOD/L";
      outlet.X_pro = xpro "gCOD/L";
      outlet.X_ac = xac "gCOD/L";
      outlet.X_h2 = xh2 "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      outlet.S_ac = ac_in*COD_VS[7]/1000 "gCOD/L";
      outlet.S_pro = pro_in*COD_VS[6]/1000 "gCOD/L";
      outlet.S_bu = bu_in*COD_VS[5]/1000 "gCOD/L";
      outlet.S_va = va_in*COD_VS[4]/1000 "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      outlet.S_su = sCH_in/1000*COD_VS[1] "gCOD/L";
      outlet.S_aa = if TKN == true then sPR_in/1000*COD_VS_PR else sPR_in/1000*COD_VS_PR_BCA "gCOD/L";
      outlet.S_fa = max(0, sCOD_in/1000 - COD_VFA - (outlet.S_su + outlet.S_aa)) "gCOD/L";
      outlet.S_i[end] = si "gCOD/L";
      outlet.S_i[1] = outlet.S_i[end]*f_ch_si "gCOD/L";
      outlet.S_i[2] = outlet.S_i[end]*f_pr_si "gCOD/L";
      outlet.S_i[3] = outlet.S_i[end]*f_li_si "gCOD/L";
//
//Computation of variables X_c and X_i (Biernacki)
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
//
      outlet.X_c[end] = pCOD*f_Xc_in;
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
      outlet.X_c[6] = outlet.X_c[end]*f_lig_xc;
//
      outlet.X_i[end] = pCOD*(1 - fd_pCOD) - outlet.X_c[end]*f_xi_xc;
      outlet.X_i[1] = outlet.X_i[end]*f_ch_xi;
      outlet.X_i[2] = outlet.X_i[end]*f_pr_xi;
      outlet.X_i[3] = outlet.X_i[end]*f_li_xi;
//
      outlet.X_ch[1] = (1 - f_Xch_s)*((tCH_in - sCH_in)*COD_VS[15]/1000 - (outlet.X_i[end]*f_ch_xi + outlet.X_c[end]*f_ch_xc + outlet.X_c[end]*f_xi_xc*f_ch_xi)) "rapidly";
      outlet.X_ch[2] = (f_Xch_s)*((tCH_in - sCH_in)*COD_VS[15]/1000 - (outlet.X_i[end]*f_ch_xi + outlet.X_c[end]*f_ch_xc + outlet.X_c[end]*f_xi_xc*f_ch_xi)) "medium";
      outlet.X_ch[3] = 0 "slowly";
//Input sempre da TKN
      outlet.X_pr[1] = if TKN == true then (1 - f_Xpr_s)*((tPR_in*d/1000 - Ammonium_in)*COD_VS_PR*N_PR/1000 - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) else (1 - f_Xpr_s)*((tPR_in - sPR_in)/1000*COD_VS_PR_BCA - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) "rapidly";
      outlet.X_pr[2] = if TKN == true then (f_Xpr_s)*((tPR_in*d/1000 - Ammonium_in)*COD_VS_PR*N_PR/1000 - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) else (f_Xpr_s)*((tPR_in - sPR_in)/1000*COD_VS_PR_BCA - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) "slowly";
//
      outlet.X_li = tLI_in*COD_VS[17]/1000 - outlet.S_fa - (outlet.X_i[end]*f_li_xi + outlet.X_c[end]*f_li_xc + outlet.X_c[end]*f_xi_xc*f_li_xi);
//
      outlet.X_p = 0;
      outlet.X_lig = 0;
//
      Alk_mol = Alk_in/100*2/1000 "mol/L";
      S_hco3 = if Alk_in < 1e-10 then outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h) else Alk_mol - (S_acm + S_prom + S_bum + S_vam) - S_oh - (outlet.S_in - S_nh4) + S_h - S_hpo4 - 2*S_po4 + S_h3po4 - 2*S_co3 "mol/L";
      outlet.S_ic = if Alk_in < 1e-10 then tic/12/1000 else (S_hco3*(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h))/Ka_co2 "mol/L";
      outlet.S_in = Ammonium_in/14/1000 "mol/L";
      outlet.S_ip = Fosfates_in/31/1000 "mol/L";
      outlet.S_an = an "mol/L";
      outlet.S_cat = (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 "mol/L";
      outlet.S_ca = Ca_in;
      outlet.S_mg = Mg_in;
      outlet.ash = TS_in - VS_in;
//
//Aggiungere Xp!!
//Sommare a TAC E TAN i sali? Quando misuro diluisco...
//Lumped Feed characteristic
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      TVFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = TVFA/Alk "Ratio between acidity and alkalinity";
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_li/COD_VS_LI + outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3))/COD_VS_CH + outlet.S_aa/COD_VS[2] + sum(outlet.X_pr[2] for i in 1:2)/COD_VS_PR + outlet.S_fa/COD_VS[3] + outlet.X_li/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13] + f_lig_xc/COD_VS_LIG) "Volatile Solid content in the digester as gVS/L";
//
      TAN = outlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig "Total COD concentration as gCOD/L";
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_xi_xc*f_ch_xi + outlet.X_c[end]*f_si_xc*f_ch_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (outlet.X_lig + outlet.X_c[end]*f_lig_xc)/COD_VS_LIG "Total CH concentration as gGlu/L";
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_pr_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_xi_xc*f_li_xi + outlet.X_c[end]*f_si_xc*f_li_si + outlet.X_c[end]*f_li_xc + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (outlet.S_su + outlet.S_i[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (outlet.S_fa + outlet.S_i[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
//
//Common equations
//Computation of ionic components
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
//
      S_h = 10^(-pH) "mol/L";
      S_oh = Ka_h2o/S_h "mol/L";
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac) "mol/L";
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro) "mol/L";
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu) "mol/L";
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va) "mol/L";
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4) "mol/L";
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4)) "mol/L";
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h) "mol/L";
//
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Catenacci;

    model Probe_SingleVFAs
      extends ADM1_P.Icons.Probe_measurements;
      Modelica.Blocks.Sources.CombiTimeTable SingleVFAs_measured(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/ProbeSingleVFAs_meas_new_release.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
        Placement(visible = true, transformation(origin = {-86, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y_Hac_meas annotation(
        Placement(visible = true, transformation(origin = {0, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(extent = {{-40, -106}, {-20, -86}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_HPro_meas annotation(
        Placement(visible = true, transformation(origin = {18, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {-10, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_HBu_meas annotation(
        Placement(visible = true, transformation(origin = {36, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {10, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput y_HVa_meas annotation(
        Placement(visible = true, transformation(origin = {54, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {30, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    equation
      connect(y_Hac_meas, SingleVFAs_measured.y[1]) annotation(
        Line(points = {{0, -94}, {-75, -94}, {-75, 24}}, color = {0, 0, 127}));
      connect(y_HPro_meas, SingleVFAs_measured.y[2]) annotation(
        Line(points = {{18, -94}, {0, -94}}, color = {0, 0, 127}));
      connect(y_HBu_meas, SingleVFAs_measured.y[3]) annotation(
        Line(points = {{36, -94}, {-75, -94}, {-75, 24}}, color = {0, 0, 127}));
      connect(y_HVa_meas, SingleVFAs_measured.y[4]) annotation(
        Line(points = {{54, -94}, {0, -94}}, color = {0, 0, 127}));
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Probe_SingleVFAs;

    model Probe_T_
      extends ADM1_P.Icons.ProbeT;
      Modelica.Blocks.Interfaces.RealOutput outlet annotation(
        Placement(visible = true, transformation(origin = {96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet annotation(
        Placement(visible = true, transformation(origin = {-100, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
      inlet = outlet;
    end Probe_T_;

    model Gas_Meter_stream
      extends ADM1_P.Icons.GasMeter;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.OtherVariables_GasMeter;
      ADM1_P.Interfaces.Gas_stream Biogas_In annotation(
        Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      //  Modelica.Blocks.Interfaces.RealInput CH4_perc_exp annotation(
      //    Placement(visible = true, transformation(origin = {-44, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {-27, 79}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      //  Modelica.Blocks.Interfaces.RealInput CO2_perc_exp annotation(
      //    Placement(visible = true, transformation(origin = {30, 84}, extent = {{-20, -20}, {20, 20}}, rotation = 270), iconTransformation(origin = {27, 79}, extent = {{-11, -11}, {11, 11}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealOutput[3] y annotation(
        Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      Biogas_In.p_gas_h2o = inStream(Biogas_In.p_gas_h2o);
      Biogas_In.p_gas_h2 = inStream(Biogas_In.p_gas_h2);
      Biogas_In.p_gas_ch4 = inStream(Biogas_In.p_gas_ch4);
      Biogas_In.p_gas_co2 = inStream(Biogas_In.p_gas_co2);
      Biogas_In.p_gas_nh3 = inStream(Biogas_In.p_gas_nh3);
      Biogas_In.p_gas_n2 = inStream(Biogas_In.p_gas_n2);
      Biogas_In.P_gas = Biogas_In.p_gas_n2 + Biogas_In.p_gas_ch4 + Biogas_In.p_gas_co2 + Biogas_In.p_gas_h2 + Biogas_In.p_gas_nh3 + Biogas_In.p_gas_h2o;
//
      x_ch4 = Biogas_In.p_gas_ch4/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_co2 = Biogas_In.p_gas_co2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_h2 = Biogas_In.p_gas_h2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_nh3 = Biogas_In.p_gas_nh3/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_n2 = Biogas_In.p_gas_n2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      Q_ch4_N = Biogas_In.Q_gas_N*x_ch4*1000 "Methane rate [L/d] at standard conditions; occhio wet/dry!!";
      Q_co2_N = Biogas_In.Q_gas_N*x_co2*1000 "Carbon dioxide rate [L/d] at standard conditions";
      Q_h2_N = Biogas_In.Q_gas_N*x_h2*1000 "Hydrogen rate [L/d] at standard conditions";
      Q_nh3_N = Biogas_In.Q_gas_N*x_nh3*1000 "Ammonia rate [L/d] at standard conditions";
      Q_n2_N = Biogas_In.Q_gas_N*x_n2*1000 "Nitrogen rate [L/d] at standard conditions";
      y[:] = {Biogas_In.Q_gas_N, x_ch4, x_co2}; 
    end Gas_Meter_stream;

    model MPP
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.StateVariablesADM1_mpp;
      parameter Boolean precipitation = true;
      //Inputs from biological
      Real a_ca;
      Real a_co3;
      Real a_mg;
      Real a_po4;
      Real a_nh4;
      Real T_op;
      Real Q;
      Modelica.Blocks.Interfaces.RealInput In[7] annotation(
        Placement(visible = true, transformation(origin = {72, 2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Out[9] annotation(
        Placement(visible = true, transformation(origin = {56, -46}, extent = {{-16, -16}, {16, 16}}, rotation = 0), iconTransformation(origin = {88, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
//Inputs
      a_ca = In[1];
      a_co3 = In[2];
      a_mg = In[3];
      a_po4 = In[4];
      a_nh4 = In[5];
      T_op = In[6];
      Q = In[7];
//
//   24*3600*der(a_ca) = Q/V_liq*0.007 - 3*rp1*24*60 + 3*rd1*24*60;
//   24*3600*der(a_co3) = Q/V_liq*0.001;
//   24*3600*der(a_mg) = Q/V_liq*0.013 - rp2*24*60 + rd2*24*60;
//   24*3600*der(a_po4) = Q/V_liq*3.8e-5 - rp2*24*60 -2*rp1*24*60 + rd2*24*60 + 2*rd1*24*60;
//   24*3600*der(a_nh4) = Q/V_liq*0.1 - rp2*24*60 + rd2*24*60;
//   T_op = 35 + 273.15;
//   Q = 0;
//MPP
      arg_log_acp = max(1e-16, a_ca^3*a_po4^2/Ksp_acp);
      arg_log_stru = max(1e-16, a_nh4*a_po4*a_mg/Ksp_stru);
      arg_log_ccm = max(1e-16, a_ca*a_co3/Ksp_ccm);
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log(arg_log_acp);
      SI_stru = log(arg_log_stru);
      SI_ccm = log(arg_log_ccm);
      rp1 = if precipitation == false then 0.0 else (1 + sign(SI_acp))/2*kcryst_acp/(24*60)*X_acp*((exp(SI_acp))^(1/5) - 1)^2;
      rp2 = if precipitation == false then 0.0 else (1 + sign(SI_stru))/2*kcryst_stru/(24*60)*X_stru*((exp(SI_stru))^(1/3) - 1)^2;
      rd1 = if precipitation == false then 0.0 else (1 - sign(SI_acp))/2*kcryst_acp/(24*60)*X_acp*((exp(SI_acp))^(1/5) - 1)^2;
      rd2 = if precipitation == false then 0.0 else (1 - sign(SI_stru))/2*kcryst_stru/(24*60)*X_stru*((exp(SI_stru))^(1/3) - 1)^2;
      rp3 = if noEvent(precipitation == false) then 0.0 else (1 + sign(SI_ccm))/2*kcryst_ccm*X_ccm*((a_ca*a_co3/Ksp_ccm)^(1/2) - 1)^2;
      rd3 = if noEvent(precipitation == false) then 0.0 else (1 - sign(SI_ccm))/2*kcryst_ccm*X_ccm*((a_ca*a_co3/Ksp_ccm)^(1/2) - 1)^2;
      24*3600*der(X_ccm) = Q/V_liq*(-X_ccm) + rp3 - rd3;
      24*3600*der(X_acp) = Q/V_liq*(-X_acp) + rp1*24*60 - rd1*24*60;
      24*3600*der(X_stru) = Q/V_liq*(-X_stru) + rp2*24*60 - rd2*24*60;
//
//Outputs
      rp1*24*60 = Out[1];
      rd1*24*60 = Out[2];
      rp2*24*60 = Out[3];
      rd2*24*60 = Out[4];
      rp3*24*60 = Out[5];
      rd3*24*60 = Out[6];
      X_stru = Out[7];
      X_acp = Out[8];
      X_ccm = Out[9];
      annotation(
        experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 0.2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end MPP;

    model Feeding_Tank_stream
      //To be updated
      Real f_xc[5];
      Real f_xi[3];
      Real f_si[3];
      Real T_op;
      extends ADM1_P.Icons.FeedingTank;
      extends ADM1_P.Lumped_variables;
      extends ADM1_P.ParametersADM1_stoichiometric;
      parameter Integer X = 1;
      parameter Integer nW;
      parameter Boolean noXc;
      Interfaces.Feed_stream_vec inlet(X = X, nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.Feed_stream_vec outlet(X = X, nW = nW) annotation(
        Placement(visible = true, transformation(origin = {98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Decomposed.pH_batch_input PH annotation(
        Placement(visible = true, transformation(origin = {0, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[3]*COD_VS_LI + f_si[2]*COD_VS_PR, f_xc[2]*COD_VS_PR + f_xc[3]*COD_VS_LI + f_xc[1]*COD_VS_CH + f_xc[4]*COD_VS[nC] + f_xc[5]*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[3]*MW_LI + f_si[2]*MW_PR, f_xc[2]*MW_PR + f_xc[3]*MW_LI + f_xc[1]*MW_CH + f_xc[4]*MW[25] + f_xc[5]*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76} "g/mol";
    equation
      for i in 1:5 loop
        f_xc[i] = if noEvent(noXc == true) then 1/5 else inlet.X_c[i]/inlet.X_c[end];
      end for;
      for i in 1:3 loop
        f_xi[i] = if noEvent(inlet.X_i[end] - 0 < 1e-10) then 1/3 else inlet.X_i[i]/inlet.X_i[end];
      end for;
      for i in 1:3 loop
        f_si[i] = if noEvent(inlet.S_i[end] - 0 < 1e-10) then 1/3 else inlet.S_i[i]/inlet.S_i[end];
      end for;
//Acting as a mixer
      inlet.Q + outlet.Q = 0;
      inlet.dummy = outlet.dummy;
      for i in 1:size(outlet.X_i, 1) loop
        outlet.X_i[i] = inStream(inlet.X_i[i]) "dummy never used";
      end for;
      for i in 1:size(outlet.S_i, 1) loop
        outlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      outlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
      outlet.S_cat = inStream(inlet.S_cat);
      outlet.S_ca = inStream(inlet.S_ca);
      outlet.S_mg = inStream(inlet.S_mg);
      outlet.S_an = inStream(inlet.S_an);
      for i in 1:size(outlet.X_c, 1) loop
        outlet.X_c[i] = inStream(inlet.X_c[i]);
      end for;
      for i in 1:size(outlet.X_ch, 1) loop
        outlet.X_ch[i] = inStream(inlet.X_ch[i]);
      end for;
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
//
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
      inlet.S_cat = 0;
      inlet.S_ca = 0;
      inlet.S_mg = 0;
      inlet.S_an = 0;
//TO BE MODIFIED
      for i in 1:size(inlet.X_c, 1) loop
        inlet.X_c[i] = 0;
      end for;
//TO BE MODIFIED
      for i in 1:size(inlet.X_ch, 1) loop
        inlet.X_ch[i] = 0;
      end for;
      inlet.X_pr = 0;
      inlet.X_li = 0;
      inlet.X_su = 0;
      inlet.X_aa = 0;
      inlet.X_fa = 0;
      inlet.X_c4 = 0;
      inlet.X_pro = 0;
      inlet.X_ac = 0;
      inlet.X_h2[1] = 0;
//TO BE MODIFIED
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = 0;
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = 0;
      end for;
      inlet.X_acp = 0;
      inlet.X_stru = 0;
      inlet.X_ccm = 0;
//
      outlet.Q = PH.Q;
      outlet.S_ip = PH.S_ip;
      outlet.S_ic = PH.S_ic;
      outlet.S_in = PH.S_in;
      outlet.S_va = PH.S_va;
      outlet.S_bu = PH.S_bu;
      outlet.S_pro = PH.S_pro;
      outlet.S_ac = PH.S_ac;
      outlet.S_cat = PH.S_cat;
      outlet.S_an = PH.S_an;
      outlet.S_ca = PH.S_ca;
      outlet.S_mg = PH.S_mg;
      T_op = 25 + 273.15;
      T_op = PH.T_op;
//Lumped characteristics
      TAC = (PH.S_hco3 + 2*PH.S_co3 + PH.S_oh + PH.S_acm/COD_VS[7]/MW[7] + PH.S_prom/COD_VS[6]/MW[6] + PH.S_bum/COD_VS[5]/MW[5] + PH.S_vam/COD_VS[4]/MW[4] - PH.S_h + PH.S_nh3 + PH.S_hpo4 + 2*PH.S_po4 - PH.S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (S_ac/COD_VS[7]/MW[7] + S_pro/COD_VS[6]/MW[6] + S_bu/COD_VS[5]/MW[5] + S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
//
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13]) "Volatile Solid content in the digester as gVS/L";
//
      TAN = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su "Total COD concentration as gCOD/L";
      CH_tot = (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH "Total CH concentration as gGlu/L";
      PR_tot_BCA = (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (S_fa + X_li + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
//
//Acting as a double source
//  inlet.Q=2;
//  outlet1.Q + inlet.Q=1;
//  inlet.Q + outlet1.Q + outlet2.Q = 0;
//  //outlet.X_i=inStream(inlet.X_i);
//  outlet1.X_i=2;
//  outlet2.X_i=2;
//  inlet.X_i=0 "dummy never used";
//  outlet1.X_h2=cccc + 123;
//  cccc = inStream(inlet.X_h2);
//  outlet2.X_h2={-50};
//  inlet.X_h2={0} "dummy never used";
      annotation(
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
    end Feeding_Tank_stream;

    model Sink_vec
      extends ADM1_P.Settable_composites;
      extends ADM1_P.Lumped_variables;
      extends ADM1_P.ParametersADM1_stoichiometric;
      parameter Integer nW = 1;
      //Acting as a sink
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y[4] annotation(
        Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_ch_si*COD_VS_CH + f_li_si*COD_VS_LI + f_pr_si*COD_VS_PR, f_pr_xc*COD_VS_PR + f_li_xc*COD_VS_LI + f_ch_xc*COD_VS_CH + f_xi_xc*COD_VS[25] + f_si_xc*COD_VS[13] + f_lig_xc*COD_VS_LIG, COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_ch_xi*COD_VS_CH + f_pr_xi*COD_VS_PR + f_li_xi*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_ch_si*MW_CH + f_li_si*MW_LI + f_pr_si*MW_PR, f_pr_xc*MW_PR + f_li_xc*MW_LI + f_ch_xc*MW_CH + f_xi_xc*MW[25] + f_si_xc*MW[13] + f_lig_xc*MW_LIG, MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_ch_xi*MW_CH + f_pr_xi*MW_PR + f_li_xi*MW_LI, 76, MW_LIG} "g/mol";
    equation
//These dummy equations are never used
      inlet.dummy = 1;
      inlet.X_i = inStream(inlet.X_i) "dummy never used";
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      inlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
//
      y = {TAC, VFA, VS, TAN};
//Block variables
      TAC = 1e-3 "Alkalinity as mgCaCO3/L";
//
      VFA = (inlet.S_ac/COD_VS[7]/MW[7] + inlet.S_pro/COD_VS[6]/MW[6] + inlet.S_bu/COD_VS[5]/MW[5] + inlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
////Aggiungere Xp!!
      VS = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_li/COD_VS_LI + inlet.S_su/COD_VS[1] + (sum(inlet.X_ch[i] for i in 1:3))/COD_VS_CH + inlet.S_aa/COD_VS[2] + sum(inlet.X_pr[2] for i in 1:2)/COD_VS_PR + inlet.S_fa/COD_VS[3] + inlet.X_li/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_i[end]/COD_VS[25] + inlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13] + f_lig_xc/COD_VS_LIG) "Volatile Solid content in the digester as gVS/L";
//
      TAN = inlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c[end] + inlet.X_c4 + sum(inlet.X_ch[i] for i in 1:3) + inlet.X_fa + inlet.X_h2 + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_pro + inlet.X_su + inlet.X_lig "Total COD concentration as gCOD/L";
      COD_sol = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va;
      CH_tot = inlet.S_su/COD_VS[1] + (sum(inlet.X_ch[i] for i in 1:3) + inlet.X_c[end]*f_xi_xc*f_ch_xi + inlet.X_c[end]*f_si_xc*f_ch_si + inlet.X_c[end]*f_ch_xc + inlet.S_i[1] + inlet.X_i[1] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (inlet.X_lig + inlet.X_c[end]*f_lig_xc)/COD_VS_LIG "Total CH concentration as gGlu/L";
      PR_tot_BCA = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_xi_xc*f_pr_xi + inlet.X_c[end]*f_si_xc*f_pr_si + inlet.X_c[end]*f_ch_xc + inlet.S_i[2] + inlet.X_i[2] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_xi_xc*f_pr_xi + inlet.X_c[end]*f_si_xc*f_pr_si + inlet.X_c[end]*f_pr_xc + inlet.S_i[2] + inlet.X_i[2] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (inlet.S_fa + inlet.X_li + inlet.X_c[end]*f_xi_xc*f_li_xi + inlet.X_c[end]*f_si_xc*f_li_si + inlet.X_c[end]*f_li_xc + inlet.S_i[3] + inlet.X_i[3] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_li)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (inlet.S_su + inlet.S_i[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (inlet.S_aa + inlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (inlet.S_aa + inlet.S_i[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (inlet.S_fa + inlet.S_i[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Sink_vec;

    partial model PartialDigester
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.StateVariablesADM1;
      extends ADM1_P.VariablesADM1_bio;
      extends ADM1_P.VariablesADM1_mpp;
      extends ADM1_P.VariablesADM1_pH;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //I perform calculations with calculated f_xc and f_xi (avoids source-sink). On that, I calculate here "Real" elemental content of Xc, Xi and Si. Still I can define f's and COD/VS_out in the output variables to do some tricks to meet output measurments?
      //Simulation choices
      parameter Integer nW = 1 "to be eliminated";
      parameter Boolean ideality;
      parameter Boolean precipitation;
      parameter Boolean noXc "to be eliminated";
      parameter Boolean multihyd "to be eliminated";
      Real n1, n6, n13;
      //Real r_add[3];
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[3]*COD_VS_LI + f_si[2]*COD_VS_PR, f_xc[2]*COD_VS_PR + f_xc[3]*COD_VS_LI + f_xc[1]*COD_VS_CH + f_xc[4]*COD_VS[nC] + f_xc[5]*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[3]*MW_LI + f_si[2]*MW_PR, f_xc[2]*MW_PR + f_xc[3]*MW_LI + f_xc[1]*MW_CH + f_xc[4]*MW[25] + f_xc[5]*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76, MW_LIG} "g/mol";
    equation
//Composite fractioning from feed mixing and consequent elemental compositions
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
//I calculation
      I - 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4])) = ionic_force;
//  I = 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4]));
//I = 0.32541;
      ionic_force + 5*der(ionic_force) = 0;
//Ideality vs non-ideality
      g_mono = if noEvent(ideality == true) then 1.0 else 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_bi = if noEvent(ideality == true) then 1.0 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_tri = if noEvent(ideality == true) then 1.0 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      a_h2o = if noEvent(ideality == true) then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/COD_VS[4]/MW[4] + S_bum/COD_VS[5]/MW[5] + S_prom/COD_VS[6]/MW[6] + S_acm/COD_VS[7]/MW[7] + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//Activitites calculation = f(S_tot,i)
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
      a_oh = Ka_h2o*convKa*a_h2o/a_h;
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
//MPP submodel
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
      rp1 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rp2 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rd1 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rd2 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rp3 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rd3 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rp4 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      rd4 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      24*3600*der(X_ccm) = Q/V_liq*(1e-6 - X_ccm) + rp3*24*60 - rd3*24*60 + r_ccm;
      24*3600*der(X_acp) = Q/V_liq*(1e-6 - X_acp) + rp1*24*60 - rd1*24*60 + r_acp;
      24*3600*der(X_stru) = Q/V_liq*(1e-6 - X_stru) + rp2*24*60 - rd2*24*60 + r_stru;
      24*3600*der(X_mag) = Q/V_liq*(1e-6 - X_mag) + rp4*24*60 - rd4*24*60 + r_mag;
      r_stru = if noEvent(Functions.regSign(X_stru) + 1 < 1e-100) then -1000*X_stru else 0;
      r_acp = if noEvent(Functions.regSign(X_acp) + 1 < 1e-100) then -1000*X_acp else 0;
      r_ccm = if noEvent(Functions.regSign(X_ccm) + 1 < 1e-100) then -1000*X_ccm else 0;
      r_mag = if noEvent(Functions.regSign(X_mag) + 1 < 1e-10) then -1000*X_mag else 0;
//
//TEMPERATURE DEPENDENT PARAMETERS
      for i in 1:size(k_hyd, 1) loop
        k_hyd_T[i] = k_hyd[i]*exp(th_k_hyd*(T_op - Tref_khyd[i]));
      end for;
//Acidity constants with temperature correction
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
      KH_nh3 = KH_nh3_Tref;
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac*exp(th_k_m_ac*(T_op - T_ref_k));
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
//
//INHIBITION
      pH = -log10(a_h);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1/(1 + Ks_IN/S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1/(1 + Ks_IP/S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-i_XC[1]) + f_xc[5]*i_SI[1] + f_xc[1]*i_CH[1] + f_xc[2]*i_PR[1] + f_xc[3]*i_LI[1] + f_xc[4]*i_XI[1];
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
      v13 = (-i_BM[1]) + i_PR[1]*f_pr_xb + i_CH[1]*f_ch_xb + i_LI[1]*f_li_xb + i_XP[1]*f_xi_xb + i_SI[1]*f_si_xb;
//RATES
//Biochemical process rates
      r1 = if noEvent(noXc == true) then 0 else k_dis*X_c;
//DOVRANNO ESSERE SCRITTI COME SOTTO
      for i in 1:3 loop
        r2[i] = k_hyd_T[i + 2]*X_ch[i];
      end for;
//r2 = k_hyd_T[4]*X_ch;
      for i in 1:2 loop
        r3[i] = k_hyd_T[i + 5]*X_pr[i];
      end for;
//r3 = k_hyd_T[7]*X_pr;
      r4 = k_hyd_T[8]*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4*S_va/(S_va + Ks_c4)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4*S_bu/(S_bu + Ks_c4)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
//
//Acid-base rates
//  ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
//  ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
//  ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
//  ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
//  ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h + Ka_hco3*Ka_co2/S_h) - Ka_co2*S_ic);
//  ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
//  ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h + (S_h)^2/Ka_h3po4) - Ka_h2po4*S_ip);
//  ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + (S_h)^2/Ka_h2po4 + (S_h)^3/(Ka_h3po4*Ka_h2po4)) - Ka_hpo4*S_ip);
//  ra14 = k_AB_IP*(S_h2po4*(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2)) - Ka_h3po4*S_ip);
//  ra15 = k_AB_co2*(S_co3*((S_h^2)/Ka_co2 + S_h + Ka_hco3) - Ka_hco3*S_ic);
//
//Gas transfer rates
      rt8 = kla_h2*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla_ch4*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla_co2*(S_co2 - KH_co2*p_gas_co2);
      rt12 = kla_nh3*(S_nh3 - KH_nh3*p_gas_nh3);
//
//
//Particulate matter
      24*3600*der(X_c) = Q/V_liq*(X_c_in[end] - X_c) - r1;
// NB non si chiamerà più f_xi_xb ma fp, però stesso ruolo...occhio a source sink C,N,P.
      24*3600*der(X_p) = Q/V_liq*(X_p_in - X_p) + f_xi_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//  for i in 1:3 loop
//  r_add = {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
//  24*3600*der(X_ch[i]) = if noEvent(noXc == true) then Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + r_add[i] else Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + {0,f_xc[1]*r1,0};
//  end for;
      24*3600*der(X_ch[1]) = Q/V_liq*(X_ch_in[1] - X_ch[1]) - r2[1];
      24*3600*der(X_ch[3]) = Q/V_liq*(X_ch_in[3] - X_ch[3]) - r2[3];
//24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + {0,f_xc[1]*r1,0} + {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
      24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + f_xc[1]*r1 + f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//24*3600*der(X_pr) = Q/V_liq*(X_pr_in - X_pr) - r3 + {0,f_xc[2]*r1} + {0,f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19)};
      24*3600*der(X_pr[1]) = Q/V_liq*(X_pr_in[1] - X_pr[1]) - r3[1];
      24*3600*der(X_pr[2]) = Q/V_liq*(X_pr_in[2] - X_pr[2]) - r3[2] + f_xc[2]*r1 + f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li) = Q/V_liq*(X_li_in - X_li) - r4 + f_xc[3]*r1 + f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i) = Q/V_liq*(X_i_in[end] - X_i) + f_xc[4]*r1;
//
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
      24*3600*der(S_ip) = Q/V_liq*(S_ip_in - S_ip) + i_LI[5]*r4 - Y_su*i_BM[5]*r5 - Y_aa*i_BM[5]*r6 - Y_fa*i_BM[5]*r7 - Y_c4*i_BM[5]*r8 - Y_c4*i_BM[5]*r9 - Y_pro*i_BM[5]*r10 - Y_ac*i_BM[5]*r11 - Y_h2*i_BM[5]*r12 + (i_BM[5] - i_XP[5]*f_xi_xb - i_SI[5]*f_si_xb - i_LI[5]*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (i_XC[5] - f_xc[4]*i_XI[5] - f_xc[5]*i_SI[5] - f_xc[3]*i_LI[5])*r1 - 2*(rp1 - rd1)*24*60 - (rp2 - rd2)*24*60;
//
      n1 = (i_XC[4] - f_xc[4]*i_XI[4] - f_xc[5]*i_SI[4] - f_xc[2]*i_PR[4]);
      n6 = (i_PR[4] - Y_aa*i_BM[4]);
      n13 = (i_BM[4] - i_XP[4]*f_xi_xb - i_SI[4]*f_si_xb - i_PR[4]*f_pr_xb);
//Biomasses
      24*3600*der(X_su) = Q/V_liq*(X_su_in - X_su) + Y_su*r5 - r13;
      24*3600*der(X_aa) = Q/V_liq*(X_aa_in - X_aa) + Y_aa*r6 - r14;
      24*3600*der(X_fa) = Q/V_liq*(X_fa_in - X_fa) + Y_fa*r7 - r15;
      24*3600*der(X_c4) = Q/V_liq*(X_c4_in - X_c4) + Y_c4*r8 + Y_c4*r9 - r16;
      24*3600*der(X_pro) = Q/V_liq*(X_pro_in - X_pro) + Y_pro*r10 - r17;
      24*3600*der(X_ac) = Q/V_liq*(X_ac_in - X_ac) + Y_ac*r11 - r18;
      24*3600*der(X_h2) = Q/V_liq*(X_h2_in - X_h2) + Y_h2*r12 - r19;
//
//Cations and anions
      24*3600*der(S_cat) = Q/V_liq*(S_cat_in - S_cat);
      24*3600*der(S_ca) = Q/V_liq*(S_ca_in - S_ca) - 3*(rp1 - rd1)*24*60 - (rp3 - rd3)*24*60;
      24*3600*der(S_mg) = Q/V_liq*(S_mg_in - S_mg) - (rp2 - rd2)*24*60 - (rp4 - rd4)*24*60;
      24*3600*der(S_an) = Q/V_liq*(S_an_in - S_an);
      24*3600*der(ash) = Q/V_liq*(ash_in - ash);
      24*3600*der(X_lig) = Q/V_liq*(X_lig_in - X_lig) + f_xc[6]*r1;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3 - S_co3;
//S_oh = Ka_h2o * convKa / S_h;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
//AE
//S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      charge = 1*(S_h + S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/(COD_VS[7]*MW[7]) - S_prom/(COD_VS[6]*MW[6]) - S_bum/(COD_VS[5]*MW[5]) - S_vam/(COD_VS[4]*MW[4]) - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3 - S_oh);
//S_h = 7e-8;
//charge = 0;
//charge = Theta + S_h - S_oh;
//charge_error = 0;
      charge + 5*der(charge) = 0;
//      der(charge_error) = charge^2;
//S_h = S_oh - Theta;
//S_h = 7.17353e-8;
//ODE; DA RISCRIVERE CON CO3 NON-IDEALITA'?
//der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh4/(Ka_nh4+S_h)^2 + S_h/(Ka_nh4+S_h)*der(S_in) = (der(S_ac/Ac_conv)*Ka_ac/(S_h+Ka_ac)-der(S_h)*Ka_ac*S_ac/Ac_conv/(S_h+Ka_ac)^2) + (der(S_pro/Pro_conv)*Ka_pro/(S_h+Ka_pro)-der(S_h)*Ka_pro*S_pro/Pro_conv/(S_h+Ka_pro)^2) + (der(S_bu/Bu_conv)*Ka_bu/(S_h+Ka_bu)-der(S_h)*Ka_bu*S_bu/Bu_conv/(S_h+Ka_bu)^2) + (der(S_va/Va_conv)*Ka_va/(S_h+Ka_va)-der(S_h)*Ka_va*S_va/Va_conv/(S_h+Ka_va)^2) + der(S_an) + Ka_co2/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*((S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)*(S_h*der(S_ic)+S_ic*der(S_h))-(S_ic*S_h*der(S_h)*(Ka_co2+2*S_h))) + 2*Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*(der(S_ic)*(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)-S_ic*der(S_h)*(2*S_h+Ka_co2))- Ka_h2o*convKa/(S_h)^2*der(S_h) + 3*(Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*(der(S_ip)*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + 2*(Ka_h3po4*Ka_h2po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((S_ip*der(S_h)+ S_h*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + (Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((2*S_ip*S_h*der(S_h)+ S_h^2*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h^2*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h))));
//GAS PHASE EQUATIONS
      24*3600*der(S_gas_h2) = (-S_gas_h2*Q_gas/V_gas) + rt8*V_liq/V_gas;
      24*3600*der(S_gas_ch4) = (-S_gas_ch4*Q_gas/V_gas) + rt9*V_liq/V_gas;
      24*3600*der(S_gas_co2) = (-S_gas_co2*Q_gas/V_gas) + rt10*V_liq/V_gas;
      24*3600*der(S_gas_nh3) = (-S_gas_nh3*Q_gas/V_gas) + rt12*V_liq/V_gas;
//24*3600*der(S_gas_nh3) = 0;
//////Sommare a TAC E TAN i sali? Quando misuro diluisco..
// Carachteristics of digestate
      TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm/(COD_VS[7]*MW[7]) + S_prom/(COD_VS[6]*MW[6]) + S_bum/(COD_VS[5]*MW[5]) + S_vam/(COD_VS[4]*MW[4]) - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (S_ac/(COD_VS[7]*MW[7]) + S_pro/(COD_VS[6]*MW[6]) + S_bu/(COD_VS[5]*MW[5]) + S_va/(COD_VS[4]*MW[4]))*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
//
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13] + f_xc[6]/COD_VS_LIG) + X_lig/COD_VS_LIG + X_p/COD_VS[26] "Volatile Solid content in the digester as gVS/L";
//
      TAN = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_lig + X_p "Total COD concentration as gCOD/L";
      COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
//Che conversione COD/VS applicare a carboidrati in Si?
//Che composizione macromolecolare considerare per Xp?
      CH_tot = S_su/COD_VS[1] + (X_lig + f_xc[6]*X_c)/COD_VS_LIG + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1] + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH + X_p "Total CH concentration as gGlu/L";
      PR_tot_BCA = S_aa/COD_VS[2] + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = S_aa/COD_VS[2]/N_PR + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = S_fa/COD_VS[3] + (X_li + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3] + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
//States vector
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002));
    end PartialDigester;

    model Batch
      extends ADM1_P.BlockLibrary.PartialDigester;
      extends ADM1_P.Icons.Digester;
      Real Xpr_start;
      Real Sample_time = 86400*11;
      Real delta_prova = 86400*10;
      Modelica.Blocks.Interfaces.RealInput start annotation(
        Placement(visible = true, transformation(origin = {-106, -2}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-72, -2}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
    equation
//Xpr_start = Digester_stream_onehyd_vec.FeedMix_In.X_pr[end];
      Xpr_start = start;
      when time == Sample_time then
        reinit(X_pr, Xpr_start);
      end when;
//  when time > Sample_time + delta_prova then
//    terminate("dhn");
//  end when;
//   when change(clk) then
//      reinit(x,u);
//   end when;
//algorithm
//   when change(clk) and not running then
//      time_last_reinit := time;
//      running          := true;
//   end when;
//   when running and time-time_last_reinit>=deltat then
//      running          := false;
//   end when;
    end Batch;

    model Digester
      extends ADM1_P.OtherVariables_MassBalance;
      extends ADM1_P.BlockLibrary.PartialDigester;
      extends ADM1_P.Icons.Digester;
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {74, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas(nominal = 1e-6) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
      Real[43] x;
    equation
      Q = inlet.Q;
//Inputs
      inlet.dummy = outlet.dummy;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = inStream(inlet.X_i[i]) "dummy never used";
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      inlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
//
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = inlet.X_i[i] "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = inlet.S_i[i] "dummy never used";
      end for;
      X_h2_in = inlet.X_h2 "dummy never used";
      S_su_in = inlet.S_su;
      S_aa_in = inlet.S_aa;
      S_fa_in = inlet.S_va;
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
      ash_in = inlet.ash;
      X_lig_in = inlet.X_lig;
//
//WATER PHASE EQUATIONS
//Per ora densità unitaria digestato. Passo con stream o no?
//  inlet.Q + sum(Biogas_Out.Q_i*MWi)/22.4 + outlet.Q = 0;
      inlet.Q + outlet.Q = 0;
// Gaseous boundary conditions
      p_gas_h2 = S_gas_h2*R*T_op/COD_VS[8]/MW[8];
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_VS[9]/MW[9];
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o + p_gas_nh3;
      Q_gas = u;
//Q_gas = if noEvent(P_gas > P_atm) then 1000*(P_gas - P_atm) else 0 "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*T0/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//CONVERSION FOR INTERFACE "DIGESTATE"
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
//TO BE MODIFIED
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
//TO BE MODIFIED
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
      outlet.X_p = X_p;
      outlet.ash = ash;
      outlet.X_lig = X_lig;
      x = cat(1, {X_su, X_aa, X_fa, X_c4, X_pro, X_ac, X_h2, X_c, X_i}, X_ch, X_pr, {X_li, X_p, S_i, S_su, S_aa, S_fa, S_va, S_bu, S_pro, S_ac, S_h2, S_ch4, S_ic, S_in, S_ip, S_cat, S_ca, S_mg, S_an, ash, X_lig, S_gas_h2, S_gas_ch4, S_gas_co2, S_gas_nh3, X_acp, X_stru, X_ccm, X_mag});
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = max(1e-30, V_liq/Q) "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
//
//MASS BALANCES
      VS_in = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_ch_xb/COD_VS_CH + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_pr_xb/COD_VS_PR + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_li_xb/COD_VS_LI + inlet.S_su/COD_VS[1] + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1))/COD_VS_CH + inlet.S_aa/COD_VS[2] + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))/COD_VS_PR + inlet.S_fa/COD_VS[3] + inlet.X_li/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_c[end]/COD_VS[14] + inlet.X_i[end]/COD_VS[25] + inlet.X_lig/COD_VS_LIG "Volatile Solid content in the digester as gVS/L";
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_p + X_aa + X_ac + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_c + X_lig "Particulate COD concentration";
      COD_balance_in = inlet.Q*(inlet.X_p + inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + X_lig);
      COD_balance_out = outlet.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
//      24*3600*der(V_in_cum) = inlet.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = inlet.Q*(i_LIG[1]*inlet.X_lig + i_XP[1]*inlet.X_p + inlet.S_ic + i_XC[1]*inlet.X_c[end] + i_SI[1]*inlet.S_i[end] + i_XI[1]*inlet.X_i[end] + i_CH[1]*sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + i_PR[1]*sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + i_LI[1]*inlet.X_li + C_su*inlet.S_su + i_PR[1]*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + i_BM[1]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + X_ccm_in);
      IC_balance_out = outlet.Q*(i_LIG[1]*X_lig + i_XP[1]*X_p + S_ic + i_SI[1]*S_i + i_XI[1]*X_i + i_CH[1]*sum(X_ch[i] for i in 1:size(X_ch, 1)) + i_PR[1]*sum(X_pr[i] for i in 1:size(X_pr, 1)) + i_LI[1]*X_li + C_su*S_su + i_PR[1]*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + i_BM[1]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + i_XC[1]*X_c + X_ccm);
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_co2/P_gas/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = inlet.Q*(i_XP[4]*inlet.X_p + inlet.S_in + i_SI[4]*inlet.S_i[end] + i_XI[4]*inlet.X_i[end] + i_PR[4]*(inlet.S_aa + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))) + i_BM[4]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[4]*inlet.X_c[end]);
      IN_balance_out = outlet.Q*(i_XP[4]*X_p + S_in + i_SI[4]*S_i + i_XI[4]*X_i + i_PR[4]*(S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1))) + i_BM[4]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru + i_XC[4]*X_c);
      IN_balance_gas = Biogas_Out.Q_gas_N*(p_gas_nh3/P_gas/R/273.15*1.01325);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
      24*3600*der(IN_balance_gas_cum) = IN_balance_gas;
//Inorganic Phosforous Balance
      IP_balance_in = inlet.Q*(i_XP[5]*inlet.X_p + inlet.S_ip + i_SI[5]*inlet.S_i[end] + i_XI[5]*inlet.X_i[end] + i_LI[5]*inlet.X_li + i_BM[5]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[5]*inlet.X_c[end]);
      IP_balance_out = outlet.Q*(i_XP[5]*X_p + S_ip + i_SI[5]*S_i + i_XI[5]*X_i + i_LI[5]*X_li + i_BM[5]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru + X_c*i_XC[5]);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
      24*3600*der(Vcum) = inlet.Q;
      24*3600*der(Vcum_ch4) = Q_gas_N*p_gas_ch4/P_gas;
//Residual BMP calculation
      resBMP_vs = ((LI_tot - (S_i*f_si[3] + X_i*f_xi[3] + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3])/COD_VS_LI)*tBMPth_li + (CH_tot - (X_lig + f_xc[6]*X_c)/COD_VS_LIG - (S_i*f_si[1] + X_i*f_xi[1] + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1])/COD_VS_CH)*tBMPth_ch + (PR_tot_TKN - (S_i*f_si[2] + X_i*f_xi[2] + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2])/COD_VS_PR)*tBMPth_pr)/VS;
    end Digester;

    model Open
      extends ADM1_P.BlockLibrary.PartialDigester;
      extends ADM1_P.Icons.SludgeDischarge;
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {74, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
    equation
      Q = inlet.Q;
//Inputs
      inlet.dummy = outlet.dummy;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = inStream(inlet.X_i[i]) "dummy never used";
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      inlet.X_h2 = inStream({inlet.X_h2[1]}) "copiare da digester dummy never used";
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
      inlet.ash = inStream(inlet.ash);
//
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = inlet.X_i[i] "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = inlet.S_i[i] "dummy never used";
      end for;
      X_h2_in = {inlet.X_h2[1]} "dummy never used";
      S_su_in = inlet.S_su;
      S_aa_in = inlet.S_aa;
      S_fa_in = inlet.S_va;
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
      for i in 1:size(X_ch_in, 1) loop
        X_ch_in[i] = inlet.X_ch[i];
      end for;
      X_pr_in = inlet.X_pr;
      X_li_in = inlet.X_li;
      X_su_in = inlet.X_su;
      X_aa_in = inlet.X_aa;
      X_fa_in = inlet.X_fa;
      X_c4_in = inlet.X_c4;
      X_pro_in = inlet.X_pro;
      X_ac_in = inlet.X_ac;
      X_stru_in = inlet.X_stru;
      X_acp_in = inlet.X_acp;
      X_ccm_in = inlet.X_ccm;
      ash_in = inlet.ash;
//
//WATER PHASE EQUATIONS
//Per ora densità unitaria digestato. Passo con stream o no?
//  inlet.Q + sum(Biogas_Out.Q_i*MWi)/22.4 + outlet.Q = 0;
      inlet.Q + outlet.Q = 0;
// Gaseous boundary conditions
      p_gas_h2 = 1e-10;
      p_gas_ch4 = 1e-10;
      p_gas_co2 = 0.0004;
      p_gas_nh3 = 1e-10;
      P_gas = P_atm;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = 0 "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//CONVERSION FOR INTERFACE "DIGESTATE"
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
//TO BE MODIFIED
      for i in 1:size(outlet.X_c, 1) loop
        outlet.X_c[i] = X_c;
      end for;
//TO BE MODIFIED
      for i in 1:size(outlet.X_ch, 1) loop
        outlet.X_ch[i] = X_ch;
      end for;
      outlet.X_pr = X_pr;
      outlet.X_li = X_li;
      outlet.X_su = X_su;
      outlet.X_aa = X_aa;
      outlet.X_fa = X_fa;
      outlet.X_c4 = X_c4;
      outlet.X_pro = X_pro;
      outlet.X_ac = X_ac;
      outlet.X_h2[1] = X_h2;
//TO BE MODIFIED
      for i in 1:size(outlet.X_i, 1) loop
        outlet.X_i[i] = X_i;
      end for;
      for i in 1:size(outlet.S_i, 1) loop
        outlet.S_i[i] = S_i;
      end for;
      outlet.X_acp = X_acp;
      outlet.X_stru = X_stru;
      outlet.X_ccm = X_ccm;
      outlet.ash = inlet.ash;
//
////DIGESTER'S OPERATIVE PARAMETERS
//  HRT = V_liq/Q "Hyraulic Retention Time [d]";
//  OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
////
////MASS BALANCES
////COD Balance
//  COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
//  COD_X = X_aa + X_ac + X_c4 + X_ch + X_fa + X_h2 + X_i + X_li + X_pr + X_pro + X_su + X_c "Particulate COD concentration";
//  COD_balance_in = inlet.Q*(inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2[1] + inlet.X_pro + inlet.X_su + inlet.X_ch[end] + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + inlet.X_pr);
//  COD_balance_out = outlet.Q*(COD_S + COD_X);
//  COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
//  24*3600*der(V_in_cum) = inlet.Q;
//  24*3600*der(COD_balance_in_cum) = COD_balance_in;
//  24*3600*der(COD_balance_out_cum) = COD_balance_out;
//  24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
////Inorganic Carbon Balance
//  IC_balance_in = inlet.Q*(inlet.S_ic + C_xc*inlet.X_c[end] + C_si*inlet.S_i[end] + C_xi*inlet.X_i[end] + C_ch*inlet.X_ch[end] + C_pr*inlet.X_pr + C_li*inlet.X_li + C_su*inlet.S_su + C_aa*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + C_bac*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2[1]));
//  IC_balance_out = outlet.Q*(S_ic + C_si*S_i + C_xi*X_i + C_ch*X_ch + C_pr*X_pr + C_li*X_li + C_su*S_su + C_aa*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + C_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + C_xc*X_c);
//  IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_co2/P_gas/R/273.15*1.01325);
//  24*3600*der(IC_balance_in_cum) = IC_balance_in;
//  24*3600*der(IC_balance_out_cum) = IC_balance_out;
//  24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
////Inorganic Nitrogen Balance
//  IN_balance_in = inlet.Q*(inlet.S_in + N_i*(inlet.S_i[end] + inlet.X_i[end]) + N_aa*(inlet.S_aa + inlet.X_pr) + N_bac*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2[1]) + N_xc*inlet.X_c[end]);
//  IN_balance_out = outlet.Q*(S_in + N_i*(S_i + X_i) + N_aa*(S_aa + X_pr) + N_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru + N_xc*X_c);
//  IN_balance_gas = Biogas_Out.Q_gas_N*(p_gas_nh3/P_gas/R/273.15*1.01325);
//  24*3600*der(IN_balance_in_cum) = IN_balance_in;
//  24*3600*der(IN_balance_out_cum) = IN_balance_out;
//  24*3600*der(IN_balance_gas_cum) = IN_balance_gas;
////Inorganic Phosforous Balance
//  IP_balance_in = inlet.Q*(inlet.S_ip + P_i*(inlet.S_i[end] + inlet.X_i[end]) + P_li*inlet.X_li + P_bac*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2[1]) + P_xc*inlet.X_c[end]);
//  IP_balance_out = outlet.Q*(S_ip + P_i*(S_i + X_i) + P_li*X_li + P_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru + X_c*P_xc);
//  24*3600*der(IP_balance_in_cum) = IP_balance_in;
//  24*3600*der(IP_balance_out_cum) = IP_balance_out;
//  24*3600*der(Vcum) = inlet.Q;
//  24*3600*der(Vcum_ch4) = Q_gas_N*p_gas_ch4/P_gas;
    end Open;

    model CHP
      Interfaces.Gas_stream inlet annotation(
        Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.OtherVariables_GasMeter;
      parameter Real LHV_ch4(unit = "MJ/Sm3") = 32.8;
      parameter Real eta_el = 0.4 "Variabile tra 36% e 42%";
      Real P(unit = "kW");
      Real P_day(unit = "kWh/d");
      Real E(unit = "KWh");
      Real Q_in;
      //Da aggiungere termine entalpico dato da temperatura
    equation
      inlet.p_gas_h2o = inStream(inlet.p_gas_h2o);
      inlet.p_gas_h2 = inStream(inlet.p_gas_h2);
      inlet.p_gas_ch4 = inStream(inlet.p_gas_ch4);
      inlet.p_gas_co2 = inStream(inlet.p_gas_co2);
      inlet.P_gas = inlet.p_gas_ch4 + inlet.p_gas_co2 + inlet.p_gas_h2 + inlet.p_gas_h2o;
//
      x_ch4 = inlet.p_gas_ch4/(inlet.P_gas - inlet.p_gas_h2o);
      x_co2 = inlet.p_gas_co2/(inlet.P_gas - inlet.p_gas_h2o);
      x_h2 = inlet.p_gas_h2/(inlet.P_gas - inlet.p_gas_h2o);
      Q_ch4_N = inlet.Q_gas_N*x_ch4*1000 "Methane rate [L/d] at standard conditions";
      Q_co2_N = inlet.Q_gas_N*x_co2*1000 "Carbon dioxide rate [L/d] at standard conditions";
      Q_h2_N = inlet.Q_gas_N*x_h2*1000 "Hydrogen rate [L/d] at standard conditions";
      Q_in = Q_ch4_N/1000/1.0549*LHV_ch4*1000/3600 "Input heat as [kWh/d]";
      P_day = eta_el*Q_in "Output electricity as [kWh/d]";
      P = P_day/24 "[kW]";
      86400*der(E) = P_day "Output electricity as [kWh]";
    end CHP;

    model Gas_source
      Interfaces.Gas_stream outlet annotation(
        Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real p_gas_h2o;
      Real p_gas_h2;
      Real p_gas_co2;
      Real p_gas_ch4;
      Real Q_gas_N;
    equation
//
      p_gas_h2o = 0.01;
      p_gas_h2 = 0.01;
      p_gas_co2 = 0.29;
      p_gas_ch4 = 0.69;
      Q_gas_N = 10041;
//
      outlet.p_gas_h2o = p_gas_h2o;
      outlet.p_gas_h2 = p_gas_h2;
      outlet.p_gas_ch4 = p_gas_ch4;
      outlet.p_gas_co2 = p_gas_co2;
      outlet.Q_gas_N + Q_gas_N = 0;
    end Gas_source;

    model Recycle
      //Acting as a sink
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {96, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {112, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-94, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(origin = {-90, 2}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
      parameter Integer nW = 1;
      parameter Real recycledQ;
    equation
      inlet.Q = recycledQ;
      outlet.Q + inlet.Q = 0;
      inlet.X_i = fill(0, size(inlet.X_i, 1)) "dummy never used";
      inlet.X_h2 = 0 "dummy never used";
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
//
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
//Block variables
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Recycle;

    package Decomposed
      model pH_batch_input
        extends ADM1_P.ParametersADM1_physiochemical;
        extends ADM1_P.ParametersADM1_operational;
        extends ADM1_P.VariablesADM1_pH;
        //Look inside "ADM1_P.VariablesADM1_pH" for README
        //Inputs from biological (states i.e. TOT in IWA) + T [K]
        input Real S_ip;
        input Real S_ic;
        input Real S_in;
        input Real S_va;
        input Real S_bu;
        input Real S_pro;
        input Real S_ac;
        input Real S_cat;
        input Real S_an;
        input Real S_ca;
        input Real S_mg;
        input Real T_op;
        parameter Boolean ideality;
      equation
//
//Acidity constants with temperature correction
        Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
        Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
        Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
        Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
        Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
        Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
        Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//
//Coefficients for ideality correction (Ideality vs Non-ideality)
        g_mono = if ideality == true then 1.0 else smooth(1, if noEvent(I < 0) then 1 else (10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I))));
        g_bi = if ideality == true then 1.0 else smooth(1, if noEvent(I < 0) then 1 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I)));
        g_tri = if ideality == true then 1.0 else smooth(1, if noEvent(I < 0) then 1 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I)));
        a_h2o = if ideality == true then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/Va_conv + S_bum/Bu_conv + S_prom/Pro_conv + S_acm/Ac_conv + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//
//Activitites calculation = f(x,z) i.e. f(TOT,a_h)
//  a_h = homotopy(actual = max(1e-16, g_mono*S_h), simplified = 1e-7);
        a_h = g_mono*S_h;
        a_ca = g_bi*S_ca;
        a_mg = g_bi*S_mg;
        a_nh4 = a_h/Ka_nh4*S_in/(1 + a_h/(Ka_nh4*g_mono));
        a_hco3 = Ka_co2/a_h*S_ic/(1 + Ka_co2/(a_h*g_mono) + Ka_co2*Ka_hco3/(g_bi*(a_h)^2));
        a_co3 = S_ic*a_h*Ka_co2*Ka_hco3/(a_h^3 + Ka_co2*Ka_hco3*a_h/g_bi + Ka_co2*a_h^2/g_mono);
        a_hpo4 = S_ip*a_h*Ka_h3po4*Ka_h2po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
        a_po4 = S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
        a_h2po4 = S_ip*a_h^2*Ka_h3po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
        a_acm = S_ac/Ac_conv*a_h^2*Ka_ac/(a_h^3 + Ka_ac*a_h^2/g_mono);
        a_prom = S_pro/Pro_conv*a_h^2*Ka_pro/(a_h^3 + Ka_pro*a_h^2/g_mono);
        a_bum = S_bu/Bu_conv*a_h^2*Ka_bu/(a_h^3 + Ka_bu*a_h^2/g_mono);
        a_vam = S_va/Va_conv*a_h^2*Ka_va/(a_h^3 + Ka_va*a_h^2/g_mono);
        a_oh = Ka_h2o*convKa*a_h2o/a_h;
//
//Concentration calculation ([S] in IWA)
        S_nh4 = a_nh4/g_mono;
        S_hco3 = a_hco3/g_mono;
        S_hpo4 = a_hpo4/g_bi;
        S_po4 = a_po4/g_tri;
        S_h2po4 = a_h2po4/g_mono;
        S_co3 = a_co3/g_bi;
        S_acm = a_acm/g_mono*Ac_conv;
        S_prom = a_prom/g_mono*Pro_conv;
        S_bum = a_bum/g_mono*Bu_conv;
        S_vam = a_vam/g_mono*Va_conv;
        S_oh = a_oh/g_mono;
//
//Mass balances Nc -1 between total components (x) and their speciated chemical species (z)
        S_nh4 = S_in - S_nh3;
        S_co2 = S_ic - S_hco3 - S_co3;
        S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
//
//Algebraic equations that shall be chosen for tearing + additional dummy states
//Charge balance
        charge = 1*(S_h + S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/Ac_conv - S_prom/Pro_conv - S_bum/Bu_conv - S_vam/Va_conv - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3 - S_oh);
        charge + 5*der(charge) = 0;
//Ionic force definition
        10000*(I - 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv))) = ionic_force;
        ionic_force + 5*der(ionic_force) = 0;
//  der(charge_error) = charge^2;
//
//Output equations y
        TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
        pH = -log10(a_h);
//  initial equation
//  S_ca = 0.007;
//  S_mg= 0.013;
//  S_cat = 0;
//  S_an = 0.0045;
//  S_h = -( S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/Ac_conv - S_prom/Pro_conv - S_bum/Bu_conv - S_vam/Va_conv - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3 - S_oh);
        annotation(
          experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
          __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
          __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
      end pH_batch_input;

      model MPP_input
        extends ADM1_P.ParametersADM1_physiochemical;
        extends ADM1_P.ParametersADM1_operational;
        extends ADM1_P.VariablesADM1_mpp;
        parameter Boolean precipitation;
        //Inputs from biological
        input Real a_ca;
        input Real a_co3;
        input Real a_mg;
        input Real a_po4;
        input Real a_nh4;
        input Real T_op;
        input Real Q;
      equation
//MPP
        arg_log_acp = noEvent(max(1e-16, a_ca^3*a_po4^2/Ksp_acp));
        arg_log_stru = noEvent(max(1e-16, a_nh4*a_po4*a_mg/Ksp_stru));
        arg_log_ccm = noEvent(max(1e-16, a_ca*a_co3/Ksp_ccm));
        Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
        Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
        Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
        SI_acp = log(arg_log_acp);
        SI_stru = log(arg_log_stru);
        SI_ccm = log(arg_log_ccm);
        rp1 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
        rp2 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
        rd1 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
        rd2 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
        rp3 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
        rd3 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
        24*3600*der(X_ccm) = Q/V_liq*(-X_ccm) + rp3*24*60 - rd3*24*60 + r_ccm;
        24*3600*der(X_acp) = Q/V_liq*(-X_acp) + rp1*24*60 - rd1*24*60 + r_acp;
        24*3600*der(X_stru) = Q/V_liq*(-X_stru) + rp2*24*60 - rd2*24*60 + r_stru;
        r_stru = if noEvent(Functions.regSign(X_stru) + 1 < 1e-10) then -1000*X_stru else 0;
        r_acp = if noEvent(Functions.regSign(X_acp) + 1 < 1e-10) then -1000*X_acp else 0;
        r_ccm = if noEvent(Functions.regSign(X_ccm) + 1 < 1e-10) then -1000*X_ccm else 0;
        annotation(
          experiment(StartTime = 0, StopTime = 4000, Tolerance = 1e-06, Interval = 0.2),
          __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
          __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
      end MPP_input;

      model pH_batch_ODE
        extends ADM1_P.ParametersADM1_physiochemical;
        extends ADM1_P.ParametersADM1_operational;
        extends ADM1_P.VariablesADM1_pH;
        ADM1_P.Types.MolConcRate ra14(nominal = 1e-40);
        ADM1_P.Types.MolConcRate ra15(nominal = 1e-40);
        //Inputs from biological
        input Real Q;
        input Real S_ip;
        input Real S_ic;
        input Real S_in;
        input Real S_va;
        input Real S_bu;
        input Real S_pro;
        input Real S_ac;
        input Real S_cat;
        input Real S_an;
        input Real S_ca;
        input Real S_mg;
        input Real T_op;
        parameter Boolean ideality;
      equation
//Ideality vs Non-ideality
        g_mono = if ideality == true then 1.0 else 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
        g_bi = if ideality == true then 1.0 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
        g_tri = if ideality == true then 1.0 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
        a_h2o = if ideality == true then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/Va_conv + S_bum/Bu_conv + S_prom/Pro_conv + S_acm/Ac_conv + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//MPP
//Acidity constants with temperature correction
        Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
        Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
        Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
        Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
        Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
        Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
        Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//I calculation
//  I = 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv));
        I = 1;
        ionic_force = 0;
//Activitites calculation = f(S_tot,i)
//  a_h = homotopy(actual = max(1e-16, g_mono*S_h), simplified = 1e-7);
//  a_ca = g_bi*S_ca;
//  a_mg = g_bi*S_mg;
//  a_nh4 = a_h/Ka_nh4*S_in/(1 + a_h/(Ka_nh4*g_mono));
//  a_hco3 = Ka_co2/a_h*S_ic/(1 + Ka_co2/(a_h*g_mono) + Ka_co2*Ka_hco3/(g_bi*(a_h)^2));
//  a_co3 = S_ic*a_h*Ka_co2*Ka_hco3/(a_h^3 + Ka_co2*Ka_hco3*a_h/g_bi + Ka_co2*a_h^2/g_mono);
//  a_hpo4 = S_ip*a_h*Ka_h3po4*Ka_h2po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
//  a_po4 = S_ip*Ka_h3po4*Ka_h2po4*Ka_hpo4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
//  a_h2po4 = S_ip*a_h^2*Ka_h3po4/(a_h^3 + Ka_h3po4/g_mono*a_h^2 + Ka_h3po4*Ka_h2po4/g_bi*a_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/g_tri);
//  a_acm = S_ac/Ac_conv*a_h^2*Ka_ac/(a_h^3 + Ka_ac*a_h^2/g_mono);
//  a_prom = S_pro/Pro_conv*a_h^2*Ka_pro/(a_h^3 + Ka_pro*a_h^2/g_mono);
//  a_bum = S_bu/Bu_conv*a_h^2*Ka_bu/(a_h^3 + Ka_bu*a_h^2/g_mono);
//  a_vam = S_va/Va_conv*a_h^2*Ka_va/(a_h^3 + Ka_va*a_h^2/g_mono);
//  a_oh = Ka_h2o*convKa*a_h2o/a_h;
        a_h = 0;
        a_ca = 0;
        a_mg = 0;
        a_nh4 = 0;
        a_hco3 = 0;
        a_co3 = 0;
        a_hpo4 = 0;
        a_po4 = 0;
        a_h2po4 = 0;
        a_acm = 0;
        a_prom = 0;
        a_bum = 0;
        a_vam = 0;
        a_oh = 0;
//Concentration calculation
//S_oh = a_oh/g_mono;
//Acid-base dynamics
        ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
        ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
        ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
        ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
        ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h + Ka_hco3*Ka_co2/S_h) - Ka_co2*S_ic);
        ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
        ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h + (S_h)^2/Ka_h3po4) - Ka_h2po4*S_ip);
        ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + (S_h)^2/Ka_h2po4 + (S_h)^3/(Ka_h3po4*Ka_h2po4)) - Ka_hpo4*S_ip);
        ra14 = k_AB_IP*(S_h2po4*(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2)) - Ka_h3po4*S_ip);
        ra15 = k_AB_co2*(S_co3*((S_h^2)/Ka_co2 + S_h + Ka_hco3) - Ka_hco3*S_ic);
//Cations and anions
        24*3600*der(S_vam) = -ra4;
        24*3600*der(S_bum) = -ra5;
        24*3600*der(S_prom) = -ra6;
        24*3600*der(S_acm) = -ra7;
        24*3600*der(S_hco3) = -ra10;
        24*3600*der(S_nh3) = -ra11;
        24*3600*der(S_hpo4) = -ra12;
        24*3600*der(S_po4) = -ra13;
        24*3600*der(S_h2po4) = -ra14;
        24*3600*der(S_co3) = -ra15;
        S_nh4 = S_in - S_nh3;
        S_co2 = S_ic - S_hco3 - S_co3;
        S_oh = Ka_h2o*convKa/S_h;
        S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
        charge = S_h + S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/Ac_conv - S_prom/Pro_conv - S_bum/Bu_conv - S_vam/Va_conv - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3 - S_oh;
        Theta = 0;
//charge = Theta + S_h - S_oh;
//charge_error = 0;
        charge + 5*der(charge) = 0;
        der(charge_error) = charge^2;
//S_h = S_oh - Theta;
//S_h = 5.62396e-13;
//S_h = 0.0562341;
        pH = -log10(S_h);
//
        TAC = 0;
//  TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm/Ac_conv + S_prom/Pro_conv + S_bum/Bu_conv + S_vam/Va_conv - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
        annotation(
          experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
          __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
          __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
      end pH_batch_ODE;
    equation

    end Decomposed;

    model Feed_null
      parameter Integer nW = 1;
      //Acting as a sink
      ADM1_P.Interfaces.Feed_stream_vec inlet(X = 1, nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput Spilling annotation(
        Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
//These dummy equations are never used
      inlet.Q = -10;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = 0;
      end for;
      inlet.X_h2 = {0};
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
      inlet.S_i = 0;
      inlet.S_cat = 0;
      inlet.S_ca = 0;
      inlet.S_mg = 0;
      inlet.S_an = 0;
      for i in 1:size(inlet.X_c, 1) loop
        inlet.X_c[i] = 0;
      end for;
      for i in 1:3 loop
        inlet.X_ch[i] = 0;
      end for;
      inlet.X_pr = 0;
      inlet.X_li = 0;
      inlet.X_su = 0;
      inlet.X_aa = 0;
      inlet.X_fa = 0;
      inlet.X_c4 = 0;
      inlet.X_pro = 0;
      inlet.X_ac = 0;
      inlet.X_pr = Spilling;
//Block variables
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 2),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_null;

    model Batch_
      extends ADM1_P.BlockLibrary.PartialDigester;
      extends ADM1_P.Icons.Digester;
      extends ADM1_P.StateVariablesADM1_reinit;
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      //Add any sort of balance check (for gas)?
      //Additional parameters for batch test
      parameter SI.Volume V_inoculum = 339.03/1e6;
      parameter SI.Volume V_water = 445.01/1e6;
      //Restart variable declaration (when no reinit is present var_restart = parameter var_start). Equations to be specified in the upper level!
    equation
//Inputs
      Q = 0;
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = 0 "dummy never used";
      end for;
      X_h2_in = 0 "dummy never used";
      S_su_in = 0;
      S_aa_in = 0;
      S_fa_in = 0;
      S_bu_in = 0;
      S_pro_in = 0;
      S_va_in = 0;
      S_ac_in = 0;
      S_h2_in = 0;
      S_ch4_in = 0;
      S_ic_in = 0;
      S_in_in = 0;
      S_ip_in = 0;
      S_cat_in = 0;
      S_ca_in = 0;
      S_mg_in = 0;
      S_an_in = 0;
      for i in 1:size(X_c_in, 1) loop
        X_c_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(X_ch_in, 1) loop
        X_ch_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(X_pr_in, 1) loop
        X_pr_in[i] = 0 "dummy never used";
      end for;
      X_li_in = 0;
      X_su_in = 0;
      X_aa_in = 0;
      X_fa_in = 0;
      X_c4_in = 0;
      X_pro_in = 0;
      X_ac_in = 0;
      X_stru_in = 0;
      X_acp_in = 0;
      X_ccm_in = 0;
      X_p_in = 0;
      ash_in = 0;
      X_lig_in = 0;
//
// Gaseous boundary conditions
      p_gas_h2 = S_gas_h2*R*T_op/COD_VS[8]/MW[8];
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_VS[9]/MW[9];
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o + p_gas_nh3;
      Q_gas = if noEvent(P_gas > P_atm) then 100*(P_gas - P_atm) else 0;
//Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//
//  24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm;
      24*3600*der(CH4_cum) = 10^6*(rt9*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm);
    end Batch_;

    model PartialDigester_
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.StateVariablesADM1;
      extends ADM1_P.VariablesADM1_bio;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //I perform calculations with calculated f_xc and f_xi (avoids source-sink). On that, I calculate here "Real" elemental content of Xc, Xi and Si. Still I can define f's and COD/VS_out in the output variables to do some tricks to meet output measurments?
      //Simulation choices
      parameter Integer nW = 1 "to be eliminated";
      parameter Boolean ideality;
      parameter Boolean precipitation;
      parameter Boolean noXc "to be eliminated";
      parameter Boolean multihyd "to be eliminated";
      //Real r_add[3];
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[3]*COD_VS_LI + f_si[2]*COD_VS_PR, f_xc[2]*COD_VS_PR + f_xc[3]*COD_VS_LI + f_xc[1]*COD_VS_CH + f_xc[4]*COD_VS[nC] + f_xc[5]*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[3]*MW_LI + f_si[2]*MW_PR, f_xc[2]*MW_PR + f_xc[3]*MW_LI + f_xc[1]*MW_CH + f_xc[4]*MW[25] + f_xc[5]*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76, MW_LIG} "g/mol";
      //Inputs from pH
      input Real pH;
      input Real S_vam;
      input Real S_bum;
      input Real S_prom;
      input Real S_acm;
      input Real S_hco3;
      input Real S_co3;
      input Real S_nh3;
      input Real S_hpo4;
      input Real S_h3po4;
      input Real S_po4;
      input Real S_nh4;
      input Real S_co2;
      input Real S_oh;
      input Real S_h;
      input Real S_h2po4;
      //From MPP
      input Real rp1;
      input Real rp2;
      input Real X_acp;
      input Real X_stru;
      input Real rd1;
      input Real rd2;
      input Real rp3;
      input Real rd3;
      input Real X_ccm;
      Decomposed.pH_batch_input PH(I(fixed = false, start = 0.0838762), S_h(fixed = false, start = 1.30448e-7), a_h(fixed = false), charge(fixed = true), ideality = false, ionic_force(fixed = true)) annotation(
        Placement(visible = true, transformation(origin = {-40, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Decomposed.MPP_input MPP(X_acp(start = 0.00223456), X_ccm(start = -9.1725e-37), X_stru(start = 0.0127967), precipitation = true) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
//Composite fractioning from feed mixing and consequent elemental compositions
      for i in 1:6 loop
        f_xc[i] = if noEvent(noXc == true) then 1/5 else X_c_in[i]/X_c_in[end];
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
//
//TEMPERATURE DEPENDENT PARAMETERS
      for i in 1:size(k_hyd, 1) loop
        k_hyd_T[i] = k_hyd[i]*exp(th_k_hyd*(T_op - Tref_khyd[i]));
      end for;
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
      KH_nh3 = KH_nh3_Tref;
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac*exp(th_k_m_ac*(T_op - T_ref_k));
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
//
//INHIBITION
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1/(1 + Ks_IN/S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1/(1 + Ks_IP/S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-i_XC[1]) + f_xc[5]*i_SI[1] + f_xc[1]*i_CH[1] + f_xc[2]*i_PR[1] + f_xc[3]*i_LI[1] + f_xc[4]*i_XI[1];
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
      v13 = (-i_BM[1]) + i_PR[1]*f_pr_xb + i_CH[1]*f_ch_xb + i_LI[1]*f_li_xb + i_XI[1]*f_xi_xb + i_SI[1]*f_si_xb;
//RATES
//Biochemical process rates
      r1 = if noEvent(noXc == true) then 0 else k_dis*X_c;
//DOVRANNO ESSERE SCRITTI COME SOTTO
      for i in 1:3 loop
        r2[i] = k_hyd_T[i + 2]*X_ch[i];
      end for;
//r2 = k_hyd_T[4]*X_ch;
      for i in 1:2 loop
        r3[i] = k_hyd_T[i + 5]*X_pr[i];
      end for;
//r3 = k_hyd_T[7]*X_pr;
      r4 = k_hyd_T[8]*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4*S_va/(S_va + Ks_c4)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4*S_bu/(S_bu + Ks_c4)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
//
//Gas transfer rates
      rt8 = kla_h2*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla_ch4*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla*(S_co2 - KH_co2*p_gas_co2);
      rt12 = kla_nh3*(S_nh3 - KH_nh3*p_gas_nh3);
//
//Particulate matter
      24*3600*der(X_c) = Q/V_liq*(X_c_in[end] - X_c) - r1;
// NB non si chiamerà più f_xi_xb ma fp, però stesso ruolo...occhio a source sink C,N,P.
      24*3600*der(X_p) = Q/V_liq*(X_p_in - X_p) + f_xi_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//  for i in 1:3 loop
//  r_add = {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
//  24*3600*der(X_ch[i]) = if noEvent(noXc == true) then Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + r_add[i] else Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + {0,f_xc[1]*r1,0};
//  end for;
      24*3600*der(X_ch[1]) = Q/V_liq*(X_ch_in[1] - X_ch[1]);
      24*3600*der(X_ch[3]) = Q/V_liq*(X_ch_in[3] - X_ch[3]);
//24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + {0,f_xc[1]*r1,0} + {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
      24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + f_xc[1]*r1 + f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//24*3600*der(X_pr) = Q/V_liq*(X_pr_in - X_pr) - r3 + {0,f_xc[2]*r1} + {0,f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19)};
      24*3600*der(X_pr[1]) = Q/V_liq*(X_pr_in[1] - X_pr[1]);
      24*3600*der(X_pr[2]) = Q/V_liq*(X_pr_in[2] - X_pr[2]) - r3[2] + f_xc[2]*r1 + f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li) = Q/V_liq*(X_li_in - X_li) - r4 + f_xc[3]*r1 + f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i) = Q/V_liq*(X_i_in[end] - X_i) + f_xc[4]*r1;
      24*3600*der(ash) = Q/V_liq*(ash_in - ash);
      24*3600*der(X_lig) = Q/V_liq*(X_lig_in - X_lig) + f_xc[6]*r1;
//
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
      24*3600*der(S_ic) = Q/V_liq*(S_ic_in - S_ic) - (v1*r1 + v2*sum(r2[i] for i in 1:size(r2, 1)) + v3*sum(r3[i] for i in 1:size(r3, 1)) + v4*r4 + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10 - (rp3 - rd3)*24*60;
      24*3600*der(S_in) = Q/V_liq*(S_in_in - S_in) - Y_su*i_BM[4]*r5 + (i_PR[4] - Y_aa*i_BM[4])*r6 - Y_fa*i_BM[4]*r7 - Y_c4*i_BM[4]*r8 - Y_c4*i_BM[4]*r9 - Y_pro*i_BM[4]*r10 - Y_ac*i_BM[4]*r11 - Y_h2*i_BM[4]*r12 + (i_BM[4] - i_XI[4]*f_xi_xb - i_SI[4]*f_si_xb - i_PR[4]*f_pr_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (i_XC[4] - f_xc[4]*i_XI[4] - f_xc[5]*i_SI[4] - f_xc[2]*i_PR[4])*r1 - (rp2 - rd2)*24*60 - rt12;
      24*3600*der(S_ip) = Q/V_liq*(S_ip_in - S_ip) + i_LI[5]*r4 - Y_su*i_BM[5]*r5 - Y_aa*i_BM[5]*r6 - Y_fa*i_BM[5]*r7 - Y_c4*i_BM[5]*r8 - Y_c4*i_BM[5]*r9 - Y_pro*i_BM[5]*r10 - Y_ac*i_BM[5]*r11 - Y_h2*i_BM[5]*r12 + (i_BM[5] - i_SI[5]*f_xi_xb - i_SI[5]*f_si_xb - i_LI[5]*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (i_XC[5] - f_xc[4]*i_XI[5] - f_xc[5]*i_SI[5] - f_xc[3]*i_LI[5])*r1 - 2*(rp1 - rd1)*24*60 - (rp2 - rd2)*24*60;
//
//Biomasses
      24*3600*der(X_su) = Q/V_liq*(X_su_in - X_su) + Y_su*r5 - r13;
      24*3600*der(X_aa) = Q/V_liq*(X_aa_in - X_aa) + Y_aa*r6 - r14;
      24*3600*der(X_fa) = Q/V_liq*(X_fa_in - X_fa) + Y_fa*r7 - r15;
      24*3600*der(X_c4) = Q/V_liq*(X_c4_in - X_c4) + Y_c4*r8 + Y_c4*r9 - r16;
      24*3600*der(X_pro) = Q/V_liq*(X_pro_in - X_pro) + Y_pro*r10 - r17;
      24*3600*der(X_ac) = Q/V_liq*(X_ac_in - X_ac) + Y_ac*r11 - r18;
      24*3600*der(X_h2) = Q/V_liq*(X_h2_in - X_h2) + Y_h2*r12 - r19;
//
//Cations and anions
      24*3600*der(S_cat) = Q/V_liq*(S_cat_in - S_cat);
      24*3600*der(S_ca) = Q/V_liq*(S_ca_in - S_ca) - 3*(rp1 - rd1)*24*60 - (rp3 - rd3)*24*60;
      24*3600*der(S_mg) = Q/V_liq*(S_mg_in - S_mg) - (rp2 - rd2)*24*60;
      24*3600*der(S_an) = Q/V_liq*(S_an_in - S_an);
//
//GAS PHASE EQUATIONS
      24*3600*der(S_gas_h2) = (-S_gas_h2*Q_gas/V_gas) + rt8*V_liq/V_gas;
      24*3600*der(S_gas_ch4) = (-S_gas_ch4*Q_gas/V_gas) + rt9*V_liq/V_gas;
      24*3600*der(S_gas_co2) = (-S_gas_co2*Q_gas/V_gas) + rt10*V_liq/V_gas;
      24*3600*der(S_gas_nh3) = (-S_gas_nh3*Q_gas/V_gas) + rt12*V_liq/V_gas;
//24*3600*der(S_gas_nh3) = 0;
//////Sommare a TAC E TAN i sali? Quando misuro diluisco..
// Carachteristics of digestate
      TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4] - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (S_ac/COD_VS[7]/MW[7] + S_pro/COD_VS[6]/MW[6] + S_bu/COD_VS[5]/MW[5] + S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
//
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13] + f_xc[6]/COD_VS_LIG) + X_lig/COD_VS_LIG "Volatile Solid content in the digester as gVS/L";
//
      TAN = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_lig "Total COD concentration as gCOD/L";
      COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
//Che conversione COD/VS applicare a carboidrati in Si?
      CH_tot = S_su/COD_VS[1] + (X_lig + f_xc[6]*X_c)/COD_VS_LIG + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1] + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH "Total CH concentration as gGlu/L";
      PR_tot_BCA = S_aa/COD_VS[2] + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = S_aa/COD_VS[2]/N_PR + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = S_fa/COD_VS[3] + (X_li + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3] + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
      resBMP_vs = ((LI_tot - (S_i*f_si[3] + X_i*f_xi[3] + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3])/COD_VS_LI)*tBMPth_li + (CH_tot - (X_lig + f_xc[6]*X_c)/COD_VS_LIG - (S_i*f_si[1] + X_i*f_xi[1] + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1])/COD_VS_CH)*tBMPth_ch + (PR_tot_TKN - (S_i*f_si[2] + X_i*f_xi[2] + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2])/COD_VS_PR)*tBMPth_pr)/VS;
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002));
    end PartialDigester_;

    model Digester_
      extends ADM1_P.OtherVariables_MassBalance;
      extends ADM1_P.BlockLibrary.PartialDigester_;
      extends ADM1_P.Icons.Digester;
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {74, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
    equation
      Q = inlet.Q;
//Inputs
      inlet.dummy = outlet.dummy;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = inStream(inlet.X_i[i]) "dummy never used";
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      inlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
//
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = inlet.X_i[i] "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = inlet.S_i[i] "dummy never used";
      end for;
      X_h2_in = inlet.X_h2 "dummy never used";
      S_su_in = inlet.S_su;
      S_aa_in = inlet.S_aa;
      S_fa_in = inlet.S_va;
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
      ash_in = inlet.ash;
      X_lig_in = inlet.X_lig;
//
      PH.T_op = T_op;
      PH.S_ip = S_ip;
      PH.S_ic = S_ic;
      PH.S_in = S_in;
      PH.S_va = S_va;
      PH.S_bu = S_bu;
      PH.S_pro = S_pro;
      PH.S_ac = S_ac;
      PH.S_cat = S_cat;
      PH.S_an = S_an;
      PH.S_ca = S_ca;
      PH.S_mg = S_mg;
      pH = PH.pH;
      S_vam = PH.S_vam;
      S_bum = PH.S_bum;
      S_prom = PH.S_prom;
      S_acm = PH.S_acm;
      S_hco3 = PH.S_hco3;
      S_co3 = PH.S_co3;
      S_nh3 = PH.S_nh3;
      S_hpo4 = PH.S_hpo4;
      S_h3po4 = PH.S_h3po4;
      S_po4 = PH.S_po4;
      S_nh4 = PH.S_nh4;
      S_co2 = PH.S_co2;
      S_oh = PH.S_oh;
      S_h = PH.S_h;
      S_h2po4 = PH.S_h2po4;
//From MPP
      MPP.T_op = T_op;
      MPP.Q = Q;
      MPP.a_ca = PH.a_ca;
      MPP.a_co3 = PH.a_co3;
      MPP.a_mg = PH.a_mg;
      MPP.a_po4 = PH.a_po4;
      MPP.a_nh4 = PH.a_nh4;
      MPP.rp1 = rp1;
      MPP.rd1 = rd1;
      MPP.rp2 = rp2;
      MPP.rd2 = rd2;
      MPP.rp3 = rp3;
      MPP.rd3 = rd3;
      MPP.X_stru = X_stru;
      MPP.X_acp = X_acp;
      MPP.X_ccm = X_ccm;
//
//WATER PHASE EQUATIONS
//Per ora densità unitaria digestato. Passo con stream o no?
//  inlet.Q + sum(Biogas_Out.Q_i*MWi)/22.4 + outlet.Q = 0;
      inlet.Q + outlet.Q = 0;
// Gaseous boundary conditions
      p_gas_h2 = S_gas_h2*R*T_op/COD_VS[8]/MW[8];
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_VS[9]/MW[9];
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o + p_gas_nh3;
      Q_gas = u;
//Q_gas = if noEvent(P_gas > P_atm) then 1000*(P_gas - P_atm) else 0 "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//CONVERSION FOR INTERFACE "DIGESTATE"
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
//TO BE MODIFIED
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
//TO BE MODIFIED
      for i in 1:size(outlet.X_i, 1) loop
        outlet.X_i[i] = X_i;
      end for;
      for i in 1:size(outlet.S_i, 1) loop
        outlet.S_i[i] = S_i;
      end for;
      outlet.X_acp = X_acp;
      outlet.X_stru = X_stru;
      outlet.X_ccm = X_ccm;
      outlet.X_p = X_p;
      outlet.ash = ash;
      outlet.X_lig = X_lig;
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq/Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
//
//MASS BALANCES
      VS_in = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_ch_xb/COD_VS_CH + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_pr_xb/COD_VS_PR + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_li_xb/COD_VS_LI + inlet.S_su/COD_VS[1] + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1))/COD_VS_CH + inlet.S_aa/COD_VS[2] + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))/COD_VS_PR + inlet.S_fa/COD_VS[3] + inlet.X_li/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_c[end]/COD_VS[14] + inlet.X_i[end]/COD_VS[25] + inlet.X_lig/COD_VS_LIG "Volatile Solid content in the digester as gVS/L";
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_p + X_aa + X_ac + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_c + X_lig "Particulate COD concentration";
      COD_balance_in = inlet.Q*(inlet.X_p + inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + X_lig);
      COD_balance_out = outlet.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
//      24*3600*der(V_in_cum) = inlet.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = inlet.Q*(i_LIG[1]*inlet.X_lig + i_XP[1]*inlet.X_p + inlet.S_ic + i_XC[1]*inlet.X_c[end] + i_SI[1]*inlet.S_i[end] + i_XI[1]*inlet.X_i[end] + i_CH[1]*sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + i_PR[1]*sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + i_LI[1]*inlet.X_li + C_su*inlet.S_su + i_PR[1]*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + i_BM[1]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + X_ccm_in);
      IC_balance_out = outlet.Q*(i_LIG[1]*X_lig + i_XP[1]*X_p + S_ic + i_SI[1]*S_i + i_XI[1]*X_i + i_CH[1]*sum(X_ch[i] for i in 1:size(X_ch, 1)) + i_PR[1]*sum(X_pr[i] for i in 1:size(X_pr, 1)) + i_LI[1]*X_li + C_su*S_su + i_PR[1]*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + i_BM[1]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + i_XC[1]*X_c + X_ccm);
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_co2/P_gas/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = inlet.Q*(i_XP[4]*inlet.X_p + inlet.S_in + i_SI[4]*inlet.S_i[end] + i_XI[4]*inlet.X_i[end] + i_PR[4]*(inlet.S_aa + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))) + i_BM[4]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[4]*inlet.X_c[end]);
      IN_balance_out = outlet.Q*(i_XP[4]*X_p + S_in + i_SI[4]*S_i + i_XI[4]*X_i + i_PR[4]*(S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1))) + i_BM[4]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru + i_XC[4]*X_c);
      IN_balance_gas = Biogas_Out.Q_gas_N*(p_gas_nh3/P_gas/R/273.15*1.01325);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
      24*3600*der(IN_balance_gas_cum) = IN_balance_gas;
//Inorganic Phosforous Balance
      IP_balance_in = inlet.Q*(i_XP[5]*inlet.X_p + inlet.S_ip + i_SI[5]*inlet.S_i[end] + i_XI[5]*inlet.X_i[end] + i_LI[5]*inlet.X_li + i_BM[5]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[5]*inlet.X_c[end]);
      IP_balance_out = outlet.Q*(i_XP[5]*X_p + S_ip + i_SI[5]*S_i + i_XI[5]*X_i + i_LI[5]*X_li + i_BM[5]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru + X_c*i_XC[5]);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
      24*3600*der(Vcum) = inlet.Q;
      24*3600*der(Vcum_ch4) = Q_gas_N*p_gas_ch4/P_gas;
    end Digester_;

    model ScrewPress
      Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-80, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.Feed_stream_vec liquidoutlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {76, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.Feed_stream_vec solidoutlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-34, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-34, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      //Sempre da applicare sul carico
      parameter Real eta_liq(unit = "-") = 0.9 "defined as liquidoutlet.Q/inlet.Q";
      parameter Real eta_ts(unit = "_") = 0.665 "defined as liquidoutlet.Q*Liquid.TS/(inlet.Q*inlet.TS)";
      parameter Real eta_tan(unit = "_") = 0.89;
      parameter Real eta_ca(unit = "_") = 0.8;
      parameter Real eta_mg(unit = "_") = 0.74;
      parameter Integer nW = 1;
      //Devo connettere internamente per evitare di scrivere bilancio di massa per ogni specie? I miei parametri sono mass-baased.
    equation
//Inlet
      inlet.dummy = 1;
      inlet.X_i = inStream(inlet.X_i) "dummy never used";
      inlet.S_i = inStream(inlet.S_i) "dummy never used";
      inlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
//Liquid Outlet
      liquidoutlet.Q = -eta_liq*inlet.Q;
      liquidoutlet.X_i*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_i "dummy never used";
      liquidoutlet.S_i = inlet.S_i "dummy never used";
      liquidoutlet.X_h2*liquidoutlet.Q = -eta_ts*inlet.Q*inlet.X_h2 "dummy never used";
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
//Solid Outlet
      solidoutlet.Q + liquidoutlet.Q + inlet.Q = 0;
      solidoutlet.X_i*solidoutlet.Q + inlet.X_i*inlet.Q = -liquidoutlet.X_i*liquidoutlet.Q "dummy never used";
      solidoutlet.S_i*solidoutlet.Q + inlet.S_i*inlet.Q = -liquidoutlet.S_i*liquidoutlet.Q "dummy never used";
      solidoutlet.X_h2*solidoutlet.Q + inlet.X_h2*inlet.Q = -liquidoutlet.X_h2*liquidoutlet.Q "dummy never used";
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
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(origin = {0, -6}, extent = {{-100, 100}, {100, 60}}, textString = "ScrewPress"), Polygon(origin = {0, -38}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Line(origin = {1.09038, -17.0811}, points = {{-71.0904, -56.9189}, {-61.0904, -48.9189}, {-79.0904, -20.9189}, {54.9096, 63.0811}, {78.9096, 29.0811}, {78.9096, 11.0811}, {72.9096, 11.0811}, {72.9096, 23.0811}, {-57.0904, -56.9189}, {-47.0904, -64.9189}, {-29.0904, -64.9189}, {72.9096, 23.0811}, {72.9096, 11.0811}}), Line(origin = {0.727027, -14.0048}, points = {{-70.727, -33.9952}, {-60.727, -49.9952}, {71.273, 32.0048}, {59.273, 50.0048}, {-70.727, -33.9952}, {-60.727, -49.9952}, {-44.727, -39.9952}}), Polygon(origin = {1, -16}, fillColor = {108, 82, 2}, fillPattern = FillPattern.VerticalCylinder, points = {{-71, -58}, {-61, -50}, {-79, -22}, {55, 62}, {79, 28}, {79, 10}, {73, 10}, {73, 22}, {-67, -64}, {-71, -58}, {-67, -64}, {-71, -58}}), Polygon(origin = {0, -13}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-70, -35}, {-62, -47}, {72, 33}, {62, 47}, {-70, -35}, {-64, -31}, {-70, -35}}), Polygon(origin = {-52, -47}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {-36, -78}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, points = {{-20, 4}, {-10, -4}, {-4, -4}, {-4, -6}, {0, -6}, {0, -4}, {8, -4}, {20, 6}, {-16, 6}, {-16, 6}, {-20, 4}}), Polygon(origin = {14, -30}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Polygon(origin = {28, -22}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Polygon(origin = {-32, -33}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {-10, -19}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {10, -7}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {30, 5}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {52, 19}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}})}),
        Documentation(info = "Icon for a secondary clarifier"));
    end ScrewPress;

    partial model PartialDigester_AC_noV
      extends ADM1_P.ParametersADM1_operational;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Additional_PARVAR_AC;
      extends ADM1_P.StateVariablesADM1;
      extends ADM1_P.VariablesADM1_bio;
      extends ADM1_P.VariablesADM1_mpp;
      extends ADM1_P.VariablesADM1_pH;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //I perform calculations with calculated f_xc and f_xi (avoids source-sink). On that, I calculate here "Real" elemental content of Xc, Xi and Si. Still I can define f's and COD/VS_out in the output variables to do some tricks to meet output measurments?
      //Simulation choices
      parameter Integer nW = 1 "to be eliminated";
      parameter Boolean ideality;
      parameter Boolean precipitation;
      parameter Boolean noXc "to be eliminated";
      parameter Boolean multihyd "to be eliminated";
      Real n1, n6, n13;
      //Real r_add[3];
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[3]*COD_VS_LI + f_si[2]*COD_VS_PR, f_xc[2]*COD_VS_PR + f_xc[3]*COD_VS_LI + f_xc[1]*COD_VS_CH + f_xc[4]*COD_VS[nC] + f_xc[5]*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[3]*MW_LI + f_si[2]*MW_PR, f_xc[2]*MW_PR + f_xc[3]*MW_LI + f_xc[1]*MW_CH + f_xc[4]*MW[25] + f_xc[5]*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76, MW_LIG} "g/mol";
    equation
//Composite fractioning from feed mixing and consequent elemental compositions
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
//I calculation
      I - 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4])) = ionic_force;
//  I = 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4]));
//I = 0.32541;
      ionic_force + 5*der(ionic_force) = 0;
//Ideality vs non-ideality
      g_mono = if noEvent(ideality == true) then 1.0 else 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_bi = if noEvent(ideality == true) then 1.0 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_tri = if noEvent(ideality == true) then 1.0 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      a_h2o = if noEvent(ideality == true) then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/COD_VS[4]/MW[4] + S_bum/COD_VS[5]/MW[5] + S_prom/COD_VS[6]/MW[6] + S_acm/COD_VS[7]/MW[7] + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//Activitites calculation = f(S_tot,i)
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
      a_oh = Ka_h2o*convKa*a_h2o/a_h;
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
//MPP submodel
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
      rp1 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rp2 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rd1 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rd2 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rp3 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rd3 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rp4 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      rd4 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      24*3600*der(X_ccm) = Q/V_liq*(1e-6 - X_ccm) + rp3*24*60 - rd3*24*60 + r_ccm;
      24*3600*der(X_acp) = Q/V_liq*(1e-6 - X_acp) + rp1*24*60 - rd1*24*60 + r_acp;
      24*3600*der(X_stru) = Q/V_liq*(1e-6 - X_stru) + rp2*24*60 - rd2*24*60 + r_stru;
      24*3600*der(X_mag) = Q/V_liq*(1e-6 - X_mag) + rp4*24*60 - rd4*24*60 + r_mag;
      r_stru = if noEvent(Functions.regSign(X_stru) + 1 < 1e-100) then -1000*X_stru else 0;
      r_acp = if noEvent(Functions.regSign(X_acp) + 1 < 1e-100) then -1000*X_acp else 0;
      r_ccm = if noEvent(Functions.regSign(X_ccm) + 1 < 1e-100) then -1000*X_ccm else 0;
      r_mag = if noEvent(Functions.regSign(X_mag) + 1 < 1e-10) then -1000*X_mag else 0;
//
//TEMPERATURE DEPENDENT PARAMETERS
      for i in 1:size(k_hyd, 1) loop
        k_hyd_T[i] = k_hyd[i]*exp(th_k_hyd*(T_op - Tref_khyd[i]));
      end for;
//Acidity constants with temperature correction
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
      KH_nh3 = KH_nh3_Tref;
      KH_n2 = KH_n2_Tref;
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
//k_m_c4_T = k_m_c4 * exp(th_k_m_c4*(T_op - T_ref_k)); not found
      k_m_ac_T = k_m_ac*exp(th_k_m_ac*(T_op - T_ref_k));
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
//
//INHIBITION
      pH = -log10(a_h);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1/(1 + Ks_IN/S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1/(1 + Ks_IP/S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-i_XC[1]) + f_xc[5]*i_SI[1] + f_xc[1]*i_CH[1] + f_xc[2]*i_PR[1] + f_xc[3]*i_LI[1] + f_xc[4]*i_XI[1];
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
      v13 = (-i_BM[1]) + i_PR[1]*f_pr_xb + i_CH[1]*f_ch_xb + i_LI[1]*f_li_xb + i_XP[1]*f_xi_xb + i_SI[1]*f_si_xb;
//RATES
//Biochemical process rates
      r1 = if noEvent(noXc == true) then 0 else k_dis*X_c;
//DOVRANNO ESSERE SCRITTI COME SOTTO
      for i in 1:3 loop
        r2[i] = k_hyd_T[i + 2]*X_ch[i];
      end for;
//r2 = k_hyd_T[4]*X_ch;
      for i in 1:2 loop
        r3[i] = k_hyd_T[i + 5]*X_pr[i];
      end for;
//r3 = k_hyd_T[7]*X_pr;
      r4 = k_hyd_T[8]*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4*S_va/(S_va + Ks_c4)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4*S_bu/(S_bu + Ks_c4)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
//
//Acid-base rates
//  ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
//  ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
//  ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
//  ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
//  ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h + Ka_hco3*Ka_co2/S_h) - Ka_co2*S_ic);
//  ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
//  ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h + (S_h)^2/Ka_h3po4) - Ka_h2po4*S_ip);
//  ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + (S_h)^2/Ka_h2po4 + (S_h)^3/(Ka_h3po4*Ka_h2po4)) - Ka_hpo4*S_ip);
//  ra14 = k_AB_IP*(S_h2po4*(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2)) - Ka_h3po4*S_ip);
//  ra15 = k_AB_co2*(S_co3*((S_h^2)/Ka_co2 + S_h + Ka_hco3) - Ka_hco3*S_ic);
//
//Gas transfer rates
      rt8 = kla_h2*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla_ch4*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla_co2*(S_co2 - KH_co2*p_gas_co2);
      rt11 = kla_n2*(S_n2 - KH_n2*p_gas_n2);
      rt12 = kla_nh3*(S_nh3 - KH_nh3*p_gas_nh3);
//
//
//Particulate matter
      24*3600*der(X_c) = Q/V_liq*(X_c_in[end] - X_c) - r1;
// NB non si chiamerà più f_xi_xb ma fp, però stesso ruolo...occhio a source sink C,N,P.
      24*3600*der(X_p) = Q/V_liq*(X_p_in - X_p) + f_xi_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//  for i in 1:3 loop
//  r_add = {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
//  24*3600*der(X_ch[i]) = if noEvent(noXc == true) then Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + r_add[i] else Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + {0,f_xc[1]*r1,0};
//  end for;
      24*3600*der(X_ch[1]) = Q/V_liq*(X_ch_in[1] - X_ch[1]) - r2[1];
      24*3600*der(X_ch[3]) = Q/V_liq*(X_ch_in[3] - X_ch[3]) - r2[3];
//24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + {0,f_xc[1]*r1,0} + {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
      24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + f_xc[1]*r1 + f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//24*3600*der(X_pr) = Q/V_liq*(X_pr_in - X_pr) - r3 + {0,f_xc[2]*r1} + {0,f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19)};
      24*3600*der(X_pr[1]) = Q/V_liq*(X_pr_in[1] - X_pr[1]) - r3[1];
      24*3600*der(X_pr[2]) = Q/V_liq*(X_pr_in[2] - X_pr[2]) - r3[2] + f_xc[2]*r1 + f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li) = Q/V_liq*(X_li_in - X_li) - r4 + f_xc[3]*r1 + f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i) = Q/V_liq*(X_i_in[end] - X_i) + f_xc[4]*r1;
//
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
      24*3600*der(S_ip) = Q/V_liq*(S_ip_in - S_ip) + i_LI[5]*r4 - Y_su*i_BM[5]*r5 - Y_aa*i_BM[5]*r6 - Y_fa*i_BM[5]*r7 - Y_c4*i_BM[5]*r8 - Y_c4*i_BM[5]*r9 - Y_pro*i_BM[5]*r10 - Y_ac*i_BM[5]*r11 - Y_h2*i_BM[5]*r12 + (i_BM[5] - i_XP[5]*f_xi_xb - i_SI[5]*f_si_xb - i_LI[5]*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (i_XC[5] - f_xc[4]*i_XI[5] - f_xc[5]*i_SI[5] - f_xc[3]*i_LI[5])*r1 - 2*(rp1 - rd1)*24*60 - (rp2 - rd2)*24*60;
//
      n1 = (i_XC[4] - f_xc[4]*i_XI[4] - f_xc[5]*i_SI[4] - f_xc[2]*i_PR[4]);
      n6 = (i_PR[4] - Y_aa*i_BM[4]);
      n13 = (i_BM[4] - i_XP[4]*f_xi_xb - i_SI[4]*f_si_xb - i_PR[4]*f_pr_xb);
      24*3600*der(S_n2) = Q/V_liq*(S_n2_in - S_n2);
//Biomasses
      24*3600*der(X_su) = Q/V_liq*(X_su_in - X_su) + Y_su*r5 - r13;
      24*3600*der(X_aa) = Q/V_liq*(X_aa_in - X_aa) + Y_aa*r6 - r14;
      24*3600*der(X_fa) = Q/V_liq*(X_fa_in - X_fa) + Y_fa*r7 - r15;
      24*3600*der(X_c4) = Q/V_liq*(X_c4_in - X_c4) + Y_c4*r8 + Y_c4*r9 - r16;
      24*3600*der(X_pro) = Q/V_liq*(X_pro_in - X_pro) + Y_pro*r10 - r17;
      24*3600*der(X_ac) = Q/V_liq*(X_ac_in - X_ac) + Y_ac*r11 - r18;
      24*3600*der(X_h2) = Q/V_liq*(X_h2_in - X_h2) + Y_h2*r12 - r19;
//
//Cations and anions
      24*3600*der(S_cat) = Q/V_liq*(S_cat_in - S_cat);
      24*3600*der(S_ca) = Q/V_liq*(S_ca_in - S_ca) - 3*(rp1 - rd1)*24*60 - (rp3 - rd3)*24*60;
      24*3600*der(S_mg) = Q/V_liq*(S_mg_in - S_mg) - (rp2 - rd2)*24*60 - (rp4 - rd4)*24*60;
      24*3600*der(S_an) = Q/V_liq*(S_an_in - S_an);
      24*3600*der(ash) = Q/V_liq*(ash_in - ash);
      24*3600*der(X_lig) = Q/V_liq*(X_lig_in - X_lig) + f_xc[6]*r1;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3 - S_co3;
//S_oh = Ka_h2o * convKa / S_h;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
//AE
//S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      charge = 1*(S_h + S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/(COD_VS[7]*MW[7]) - S_prom/(COD_VS[6]*MW[6]) - S_bum/(COD_VS[5]*MW[5]) - S_vam/(COD_VS[4]*MW[4]) - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3 - S_oh);
//S_h = 7e-8;
//charge = 0;
//charge = Theta + S_h - S_oh;
//charge_error = 0;
      charge + 5*der(charge) = 0;
//      der(charge_error) = charge^2;
//S_h = S_oh - Theta;
//S_h = 7.17353e-8;
//ODE; DA RISCRIVERE CON CO3 NON-IDEALITA'?
//der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh4/(Ka_nh4+S_h)^2 + S_h/(Ka_nh4+S_h)*der(S_in) = (der(S_ac/Ac_conv)*Ka_ac/(S_h+Ka_ac)-der(S_h)*Ka_ac*S_ac/Ac_conv/(S_h+Ka_ac)^2) + (der(S_pro/Pro_conv)*Ka_pro/(S_h+Ka_pro)-der(S_h)*Ka_pro*S_pro/Pro_conv/(S_h+Ka_pro)^2) + (der(S_bu/Bu_conv)*Ka_bu/(S_h+Ka_bu)-der(S_h)*Ka_bu*S_bu/Bu_conv/(S_h+Ka_bu)^2) + (der(S_va/Va_conv)*Ka_va/(S_h+Ka_va)-der(S_h)*Ka_va*S_va/Va_conv/(S_h+Ka_va)^2) + der(S_an) + Ka_co2/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*((S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)*(S_h*der(S_ic)+S_ic*der(S_h))-(S_ic*S_h*der(S_h)*(Ka_co2+2*S_h))) + 2*Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*(der(S_ic)*(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)-S_ic*der(S_h)*(2*S_h+Ka_co2))- Ka_h2o*convKa/(S_h)^2*der(S_h) + 3*(Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*(der(S_ip)*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + 2*(Ka_h3po4*Ka_h2po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((S_ip*der(S_h)+ S_h*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + (Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((2*S_ip*S_h*der(S_h)+ S_h^2*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h^2*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h))));
//GAS PHASE EQUATIONS
      24*3600*der(S_gas_h2) = (-S_gas_h2*Q_gas/V_gas) + rt8*V_liq/V_gas;
      24*3600*der(S_gas_ch4) = (-S_gas_ch4*Q_gas/V_gas) + rt9*V_liq/V_gas;
      24*3600*der(S_gas_co2) = (-S_gas_co2*Q_gas/V_gas) + rt10*V_liq/V_gas;
      24*3600*der(S_gas_n2) = (-S_gas_n2*Q_gas/V_gas) + rt11*V_liq/V_gas;
      24*3600*der(S_gas_nh3) = (-S_gas_nh3*Q_gas/V_gas) + rt12*V_liq/V_gas;
//24*3600*der(S_gas_nh3) = 0;
//////Sommare a TAC E TAN i sali? Quando misuro diluisco..
// Carachteristics of digestate
      TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm/(COD_VS[7]*MW[7]) + S_prom/(COD_VS[6]*MW[6]) + S_bum/(COD_VS[5]*MW[5]) + S_vam/(COD_VS[4]*MW[4]) - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (S_ac/(COD_VS[7]*MW[7]) + S_pro/(COD_VS[6]*MW[6]) + S_bu/(COD_VS[5]*MW[5]) + S_va/(COD_VS[4]*MW[4]))*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
//
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13] + f_xc[6]/COD_VS_LIG) + X_lig/COD_VS_LIG + X_p/COD_VS[26] "Volatile Solid content in the digester as gVS/L";
//
      TAN = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_lig + X_p "Total COD concentration as gCOD/L";
      COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
//Che conversione COD/VS applicare a carboidrati in Si?
//Che composizione macromolecolare considerare per Xp?
      CH_tot = S_su/COD_VS[1] + (X_lig + f_xc[6]*X_c)/COD_VS_LIG + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1] + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH + X_p "Total CH concentration as gGlu/L";
      PR_tot_BCA = S_aa/COD_VS[2] + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = S_aa/COD_VS[2]/N_PR + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = S_fa/COD_VS[3] + (X_li + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3] + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
//States vector
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002));
    end PartialDigester_AC_noV;

    partial model PartialDigester_AC
      extends ADM1_P.ParametersADM1_operational_AC;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.ParametersADM1_kinetic;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Additional_PARVAR_AC;
      extends ADM1_P.StateVariablesADM1;
      extends ADM1_P.VariablesADM1_bio;
      extends ADM1_P.VariablesADM1_mpp;
      extends ADM1_P.VariablesADM1_pH;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -60}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //I perform calculations with calculated f_xc and f_xi (avoids source-sink). On that, I calculate here "Real" elemental content of Xc, Xi and Si. Still I can define f's and COD/VS_out in the output variables to do some tricks to meet output measurments?
      //Simulation choices
      parameter Integer nW = 1 "to be eliminated";
      parameter Boolean ideality;
      parameter Boolean precipitation;
      parameter Boolean noXc "to be eliminated";
      parameter Boolean multihyd "to be eliminated";
      Real Q_out;
      Real n1, n6, n13;
      //Real r_add[3];
      Real COD_VS[nC] = {32*6/180, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[3]*COD_VS_LI + f_si[2]*COD_VS_PR, f_xc[2]*COD_VS_PR + f_xc[3]*COD_VS_LI + f_xc[1]*COD_VS_CH + f_xc[4]*COD_VS[nC] + f_xc[5]*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[3]*MW_LI + f_si[2]*MW_PR, f_xc[2]*MW_PR + f_xc[3]*MW_LI + f_xc[1]*MW_CH + f_xc[4]*MW[25] + f_xc[5]*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76, MW_LIG} "g/mol";
      Modelica.Blocks.Interfaces.RealInput V_liq annotation(
        Placement(visible = true, transformation(origin = {-72, -24}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -40}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
//Composite fractioning from feed mixing and consequent elemental compositions
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
//I calculation
      I - 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4])) = ionic_force;
//  I = 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4]));
//I = 0.32541;
      ionic_force + 5*der(ionic_force) = 0;
//Ideality vs non-ideality
      g_mono = if noEvent(ideality == true) then 1.0 else 10^(-0.51*1^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_bi = if noEvent(ideality == true) then 1.0 else 10^(-0.51*2^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      g_tri = if noEvent(ideality == true) then 1.0 else 10^(-0.51*3^2*(I^0.5/(1 + I^0.5) - 0.24*I));
      a_h2o = if noEvent(ideality == true) then 1.0 else 1 - 0.017*(S_nh4 + S_hco3 + S_co3 + S_h2po4 + S_hpo4 + S_po4 + S_vam/COD_VS[4]/MW[4] + S_bum/COD_VS[5]/MW[5] + S_prom/COD_VS[6]/MW[6] + S_acm/COD_VS[7]/MW[7] + S_ca + S_mg + S_cat + S_an) "MINTEQ: derivation using Raoult's law";
//Activitites calculation = f(S_tot,i)
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
      a_oh = Ka_h2o*convKa*a_h2o/a_h;
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
//MPP submodel
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
      rp1 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rp2 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rd1 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rd2 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rp3 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rd3 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rp4 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      rd4 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_mag))/2*kcryst_mag/(24*60)*(X_mag - 0)*((10^(SI_mag))^(1/2) - 1)^2;
      24*3600*der(X_ccm) = Q/V_liq*(1e-6 - X_ccm) + rp3*24*60 - rd3*24*60 + r_ccm;
      24*3600*der(X_acp) = Q/V_liq*(1e-6 - X_acp) + rp1*24*60 - rd1*24*60 + r_acp;
      24*3600*der(X_stru) = Q/V_liq*(1e-6 - X_stru) + rp2*24*60 - rd2*24*60 + r_stru;
      24*3600*der(X_mag) = Q/V_liq*(1e-6 - X_mag) + rp4*24*60 - rd4*24*60 + r_mag;
      r_stru = if noEvent(Functions.regSign(X_stru) + 1 < 1e-100) then -1000*X_stru else 0;
      r_acp = if noEvent(Functions.regSign(X_acp) + 1 < 1e-100) then -1000*X_acp else 0;
      r_ccm = if noEvent(Functions.regSign(X_ccm) + 1 < 1e-100) then -1000*X_ccm else 0;
      r_mag = if noEvent(Functions.regSign(X_mag) + 1 < 1e-10) then -1000*X_mag else 0;
//
//TEMPERATURE DEPENDENT PARAMETERS
      for i in 1:size(k_hyd, 1) loop
        k_hyd_T[i] = k_hyd[i]*exp(th_k_hyd*(T_op - Tref_khyd[i]));
      end for;
//Acidity constants with temperature correction
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "HPO4 acidity constant with temperature correction - unit = M";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
//Non-dimensional Henry's law constant with temperature correction (calculated from original KH in M.bar-1)
      KH_ch4 = coeffHch4*exp(deltaH0_KH_ch4/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CH4 - unit = Mliq/bar";
      KH_co2 = coeffHco2*exp(deltaH0_KH_co2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for CO2 - unit = Mliq/bar";
      KH_h2 = coeffHh2*exp(deltaH0_KH_h2/(R*100)*(1/T_ref - 1/T_op)) "Henry's law constant for H2 - unit = Mliq/bar";
      KH_nh3 = KH_nh3_Tref;
      KH_n2 = KH_n2_Tref;
//Others with temperature correction
      p_gas_h2o = coeffph20_p*exp(coeffph20_T*(1/T_ref - 1/T_op)) "partial pressure of H2O (empirical formula) - unit = bar";
//
//Kinetic
      k_m_su_T = k_m_su*exp(th_k_m_su*(T_op - T_ref_k));
      k_m_aa_T = k_m_aa*exp(th_k_m_aa*(T_op - T_ref_k));
      k_m_fa_T = k_m_fa*exp(th_k_m_fa*(T_op - T_ref_k));
      k_m_pro_T = k_m_pro*exp(th_k_m_pro*(T_op - T_ref_k));
      k_m_c4_T = k_m_c4*exp(th_k_m_c4*(T_op - T_ref_k));
      k_m_ac_T = k_m_ac*exp(th_k_m_ac*(T_op - T_ref_k));
      k_m_h2_T = k_m_h2*exp(th_k_m_h2*(T_op - T_ref_k));
      Ks_su_T = Ks_su*exp(th_Ks_su*(T_op - T_ref_k));
      Ks_aa_T = Ks_aa*exp(th_Ks_aa*(T_op - T_ref_k));
      Ks_fa_T = Ks_fa*exp(th_Ks_fa*(T_op - T_ref_k));
      Ks_pro_T = Ks_pro*exp(th_Ks_pro*(T_op - T_ref_k));
      Ks_c4_T = Ks_c4*exp(th_Ks_c4*(T_op - T_ref_k));
      Ks_ac_T = Ks_ac*exp(th_Ks_ac*(T_op - T_ref_k));
      Ks_h2_T = Ks_h2*exp(th_Ks_h2*(T_op - T_ref_k));
      k_dec_su_T = k_dec_su*exp(th_k_dec_su*(T_op - T_ref_k));
      k_dec_aa_T = k_dec_aa*exp(th_k_dec_aa*(T_op - T_ref_k));
      k_dec_fa_T = k_dec_fa*exp(th_k_dec_fa*(T_op - T_ref_k));
      k_dec_pro_T = k_dec_pro*exp(th_k_dec_pro*(T_op - T_ref_k));
      k_dec_c4_T = k_dec_c4*exp(th_k_dec_c4*(T_op - T_ref_k));
      k_dec_ac_T = k_dec_ac*exp(th_k_dec_ac*(T_op - T_ref_k));
      k_dec_h2_T = k_dec_h2*exp(th_k_dec_h2*(T_op - T_ref_k));
//
//INHIBITION
      pH = -log10(a_h);
      I_pH_aa = if noEvent(pH < pH_UL_aa) then exp(-3*((pH - pH_UL_aa)/(pH_UL_aa - pH_LL_aa))^2) else 1.0 "pH inhibition of acetogens and acidogens (lower inhibition only used here)";
      I_pH_ac = if noEvent(pH < pH_UL_ac) then exp(-3*((pH - pH_UL_ac)/(pH_UL_ac - pH_LL_ac))^2) else 1.0 "pH inhibition of acetate degrading organisms";
      I_pH_h2 = if noEvent(pH < pH_UL_h2) then exp(-3*((pH - pH_UL_h2)/(pH_UL_h2 - pH_LL_h2))^2) else 1.0 "pH inhibition of hydrogen degrading organisms";
      I_in_lim = 1/(1 + Ks_IN/S_in) "function to limit growth due to lack of inorganic nitrogen";
      I_ip_lim = 1/(1 + Ks_IP/S_ip) "function to limit growth due to lack of inorganic phosforous";
      I_h2_fa = 1/(1 + S_h2/Ki_h2_fa) "hydrogen inhibition for LCFA degradation";
      I_h2_c4 = 1/(1 + S_h2/Ki_h2_c4) "hydrogen inhibition for C4+ degradation";
      I_h2_pro = 1/(1 + S_h2/Ki_h2_pro) "hydrogen inhibition for propionate degradation";
      I_nh3 = 1/(1 + S_nh3/Ki_nh3_ac) "NH3 inhibition of acetoclastic methanogenesis";
      I_5 = I_pH_aa*I_in_lim*I_ip_lim;
      I_6 = I_pH_aa*I_in_lim*I_ip_lim;
      I_7 = I_pH_aa*I_in_lim*I_h2_fa*I_ip_lim;
      I_8 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_9 = I_pH_aa*I_in_lim*I_h2_c4*I_ip_lim;
      I_10 = I_pH_aa*I_in_lim*I_h2_pro*I_ip_lim;
      I_11 = I_pH_ac*I_in_lim*I_nh3*I_ip_lim;
      I_12 = I_pH_h2*I_in_lim*I_ip_lim;
//INORGANIC CARBON COEFFICIENTS ON PROCESSES
      v1 = (-i_XC[1]) + f_xc[5]*i_SI[1] + f_xc[1]*i_CH[1] + f_xc[2]*i_PR[1] + f_xc[3]*i_LI[1] + f_xc[4]*i_XI[1];
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
      v13 = (-i_BM[1]) + i_PR[1]*f_pr_xb + i_CH[1]*f_ch_xb + i_LI[1]*f_li_xb + i_XP[1]*f_xi_xb + i_SI[1]*f_si_xb;
//RATES
//Biochemical process rates
      r1 = if noEvent(noXc == true) then 0 else k_dis*X_c;
//DOVRANNO ESSERE SCRITTI COME SOTTO
      for i in 1:3 loop
        r2[i] = k_hyd_T[i + 2]*X_ch[i];
      end for;
//r2 = k_hyd_T[4]*X_ch;
      for i in 1:2 loop
        r3[i] = k_hyd_T[i + 5]*X_pr[i];
      end for;
//r3 = k_hyd_T[7]*X_pr;
      r4 = k_hyd_T[8]*X_li;
      r5 = k_m_su_T*S_su/(S_su + Ks_su_T)*X_su*I_5;
      r6 = k_m_aa_T*S_aa/(S_aa + Ks_aa_T)*X_aa*I_6;
      r7 = k_m_fa_T*S_fa/(S_fa + Ks_fa_T)*X_fa*I_7;
      r8 = k_m_c4_T*S_va/(S_va + Ks_c4_T)*X_c4*S_va/(S_bu + S_va + epsilon)*I_8;
      r9 = k_m_c4_T*S_bu/(S_bu + Ks_c4_T)*X_c4*S_bu/(S_bu + S_va + epsilon)*I_9;
      r10 = k_m_pro_T*S_pro/(S_pro + Ks_pro_T)*X_pro*I_10;
      r11 = k_m_ac_T*S_ac/(S_ac + Ks_ac_T)*X_ac*I_11;
      r12 = k_m_h2_T*S_h2/(S_h2 + Ks_h2_T)*X_h2*I_12;
      r13 = k_dec_su_T*X_su;
      r14 = k_dec_aa_T*X_aa;
      r15 = k_dec_fa_T*X_fa;
      r16 = k_dec_c4_T*X_c4;
      r17 = k_dec_pro_T*X_pro;
      r18 = k_dec_ac_T*X_ac;
      r19 = k_dec_h2_T*X_h2;
//
//Acid-base rates
//  ra4 = k_AB_va*(S_vam*(Ka_va + S_h) - Ka_va*S_va);
//  ra5 = k_AB_bu*(S_bum*(Ka_bu + S_h) - Ka_bu*S_bu);
//  ra6 = k_AB_pro*(S_prom*(Ka_pro + S_h) - Ka_pro*S_pro);
//  ra7 = k_AB_ac*(S_acm*(Ka_ac + S_h) - Ka_ac*S_ac);
//  ra10 = k_AB_co2*(S_hco3*(Ka_co2 + S_h + Ka_hco3*Ka_co2/S_h) - Ka_co2*S_ic);
//  ra11 = k_AB_IN*(S_nh3*(Ka_nh4 + S_h) - Ka_nh4*S_in);
//  ra12 = k_AB_IP*(S_hpo4*(Ka_h2po4 + S_h + Ka_h2po4*Ka_hpo4/S_h + (S_h)^2/Ka_h3po4) - Ka_h2po4*S_ip);
//  ra13 = k_AB_IP*(S_po4*(Ka_hpo4 + S_h + (S_h)^2/Ka_h2po4 + (S_h)^3/(Ka_h3po4*Ka_h2po4)) - Ka_hpo4*S_ip);
//  ra14 = k_AB_IP*(S_h2po4*(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2)) - Ka_h3po4*S_ip);
//  ra15 = k_AB_co2*(S_co3*((S_h^2)/Ka_co2 + S_h + Ka_hco3) - Ka_hco3*S_ic);
//
//Gas transfer rates
      rt8 = kla_h2*(S_h2 - 16*KH_h2*p_gas_h2);
      rt9 = kla_ch4*(S_ch4 - 64*KH_ch4*p_gas_ch4);
      rt10 = kla_co2*(S_co2 - KH_co2*p_gas_co2);
      rt11 = kla_n2*(S_n2 - KH_n2*p_gas_n2);
      rt12 = kla_nh3*(S_nh3 - KH_nh3*p_gas_nh3);
//
//
//Particulate matter
      24*3600*der(X_c)*V_liq + 24*3600*der(V_liq)*X_c = (Q*X_c_in[end] + Q_out*X_c) - V_liq*r1;
// NB non si chiamerà più f_xi_xb ma fp, però stesso ruolo...occhio a source sink C,N,P.
      24*3600*der(X_p)*V_liq + 24*3600*der(V_liq)*X_p = (Q*X_p_in + Q_out*X_p) + V_liq*f_xi_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//  for i in 1:3 loop
//  r_add = {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
//  24*3600*der(X_ch[i]) = if noEvent(noXc == true) then Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + r_add[i] else Q/V_liq*(X_ch_in[i] - X_ch[i]) - r2[i] + {0,f_xc[1]*r1,0};
//  end for;
      24*3600*der(X_ch[1])*V_liq + 24*3600*der(V_liq)*X_ch[1] = (Q*X_ch_in[1] + Q_out*X_ch[1]) - V_liq*r2[1];
      24*3600*der(X_ch[3])*V_liq + 24*3600*der(V_liq)*X_ch[3] = (Q*X_ch_in[3] + Q_out*X_ch[3]) - V_liq*r2[3];
//24*3600*der(X_ch[2]) = Q/V_liq*(X_ch_in[2] - X_ch[2]) - r2[2] + {0,f_xc[1]*r1,0} + {0,f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19),0};
      24*3600*der(X_ch[2])*V_liq + 24*3600*der(V_liq)*X_ch[2] = (Q*X_ch_in[2] + Q_out*X_ch[2]) - V_liq*r2[2] + V_liq*f_xc[1]*r1 + V_liq*f_ch_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
//24*3600*der(X_pr) = Q/V_liq*(X_pr_in - X_pr) - r3 + {0,f_xc[2]*r1} + {0,f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19)};
      24*3600*der(X_pr[1])*V_liq + 24*3600*der(V_liq)*X_pr[1] = (Q*X_pr_in[1] + Q_out*X_pr[1]) - V_liq*r3[1];
      24*3600*der(X_pr[2])*V_liq + 24*3600*der(V_liq)*X_pr[2] = (Q*X_pr_in[2] + Q_out*X_pr[2]) - V_liq*r3[2] + V_liq*f_xc[2]*r1 + V_liq*f_pr_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_li)*V_liq + 24*3600*der(V_liq)*X_li = (Q*X_li_in + Q_out*X_li) - V_liq*r4 + V_liq*f_xc[3]*r1 + V_liq*f_li_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19);
      24*3600*der(X_i)*V_liq + 24*3600*der(V_liq)*X_i = (Q*X_i_in[end] + Q_out*X_i) + V_liq*f_xc[4]*r1;
//
//Soluble matter
      24*3600*der(S_i)*V_liq + 24*3600*der(V_liq)*S_i = (Q*S_i_in[end] + Q_out*S_i) + V_liq*f_si_xb*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + V_liq*f_xc[5]*r1;
      24*3600*der(S_su)*V_liq + 24*3600*der(V_liq)*S_su = (Q*S_su_in + Q_out*S_su) + V_liq*sum(r2[i] for i in 1:size(r2, 1)) + V_liq*(1 - f_fa_li)*r4 - V_liq*r5;
      24*3600*der(S_aa)*V_liq + 24*3600*der(V_liq)*S_aa = (Q*S_aa_in + Q_out*S_aa) + V_liq*sum(r3[i] for i in 1:size(r3, 1)) - V_liq*r6;
      24*3600*der(S_fa)*V_liq + 24*3600*der(V_liq)*S_fa = (Q*S_fa_in + Q_out*S_fa) + V_liq*f_fa_li*r4 - V_liq*r7;
      24*3600*der(S_va)*V_liq + 24*3600*der(V_liq)*S_va = (Q*S_va_in + Q_out*S_va) + V_liq*(1 - Y_aa)*f_va_aa*r6 - V_liq*r8;
      24*3600*der(S_bu)*V_liq + 24*3600*der(V_liq)*S_bu = (Q*S_bu_in + Q_out*S_bu) + V_liq*(1 - Y_su)*f_bu_su*r5 + V_liq*(1 - Y_aa)*f_bu_aa*r6 - V_liq*r9;
      24*3600*der(S_pro)*V_liq + 24*3600*der(V_liq)*S_pro = (Q*S_pro_in + Q_out*S_pro) + V_liq*(1 - Y_su)*f_pro_su*r5 + V_liq*(1 - Y_aa)*f_pro_aa*r6 + V_liq*(1 - Y_c4)*0.54*r8 - V_liq*r10;
      24*3600*der(S_ac)*V_liq + 24*3600*der(V_liq)*S_ac = (Q*S_ac_in + Q_out*S_ac) + V_liq*(1 - Y_su)*f_ac_su*r5 + V_liq*(1 - Y_aa)*f_ac_aa*r6 + V_liq*(1 - Y_fa)*0.7*r7 + V_liq*(1 - Y_c4)*0.31*r8 + V_liq*(1 - Y_c4)*0.8*r9 + V_liq*(1 - Y_pro)*0.57*r10 - V_liq*r11;
      24*3600*der(S_h2)*V_liq + 24*3600*der(V_liq)*S_h2 = (Q*S_h2_in + Q_out*S_h2) + V_liq*(1 - Y_su)*f_h2_su*r5 + V_liq*(1 - Y_aa)*f_h2_aa*r6 + V_liq*(1 - Y_fa)*0.3*r7 + V_liq*(1 - Y_c4)*0.15*r8 + V_liq*(1 - Y_c4)*0.2*r9 + V_liq*(1 - Y_pro)*0.43*r10 - V_liq*r12 - V_liq*rt8;
      24*3600*der(S_ch4)*V_liq + 24*3600*der(V_liq)*S_ch4 = (Q*S_ch4_in + Q_out*S_ch4) + V_liq*((1 - Y_ac)*r11 + (1 - Y_h2)*r12 - rt9);
      24*3600*der(S_ic)*V_liq + 24*3600*der(V_liq)*S_ic = (Q*S_ic_in + Q_out*S_ic) + V_liq*(-1*(v1*r1 + v2*sum(r2[i] for i in 1:size(r2, 1)) + v3*sum(r3[i] for i in 1:size(r3, 1)) + v4*r4 + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10 - (rp3 - rd3)*24*60 - (rp4 - rd4)*24*60);
      24*3600*der(S_in)*V_liq + 24*3600*der(V_liq)*S_in = (Q*S_in_in + Q_out*S_in) - V_liq*Y_su*i_BM[4]*r5 + V_liq*n6*r6 - V_liq*Y_fa*i_BM[4]*r7 - V_liq*Y_c4*i_BM[4]*r8 - V_liq*Y_c4*i_BM[4]*r9 - V_liq*Y_pro*i_BM[4]*r10 - V_liq*Y_ac*i_BM[4]*r11 - V_liq*Y_h2*i_BM[4]*r12 + V_liq*n13*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + V_liq*n1*r1 - V_liq*(rp2 - rd2)*24*60 - V_liq*rt12;
      24*3600*der(S_ip)*V_liq + 24*3600*der(V_liq)*S_ip = (Q*S_ip_in + Q_out*S_ip) + V_liq*(i_LI[5]*r4 - Y_su*i_BM[5]*r5 - Y_aa*i_BM[5]*r6 - Y_fa*i_BM[5]*r7 - Y_c4*i_BM[5]*r8 - Y_c4*i_BM[5]*r9 - Y_pro*i_BM[5]*r10 - Y_ac*i_BM[5]*r11 - Y_h2*i_BM[5]*r12 + (i_BM[5] - i_XP[5]*f_xi_xb - i_SI[5]*f_si_xb - i_LI[5]*f_li_xb)*(r13 + r14 + r15 + r16 + r17 + r18 + r19) + (i_XC[5] - f_xc[4]*i_XI[5] - f_xc[5]*i_SI[5] - f_xc[3]*i_LI[5])*r1 - 2*(rp1 - rd1)*24*60 - (rp2 - rd2)*24*60);
//
      n1 = (i_XC[4] - f_xc[4]*i_XI[4] - f_xc[5]*i_SI[4] - f_xc[2]*i_PR[4]);
      n6 = (i_PR[4] - Y_aa*i_BM[4]);
      n13 = (i_BM[4] - i_XP[4]*f_xi_xb - i_SI[4]*f_si_xb - i_PR[4]*f_pr_xb);
      24*3600*der(S_n2)*V_liq + 24*3600*der(V_liq)*S_n2 = (Q*S_n2_in + Q_out*S_n2);
//Biomasses
      24*3600*der(X_su)*V_liq + 24*3600*der(V_liq)*X_su = (Q*X_su_in + Q_out*X_su) + V_liq*Y_su*r5 - V_liq*r13;
      24*3600*der(X_aa)*V_liq + 24*3600*der(V_liq)*X_aa = (Q*X_aa_in + Q_out*X_aa) + V_liq*Y_aa*r6 - V_liq*r14;
      24*3600*der(X_fa)*V_liq + 24*3600*der(V_liq)*X_fa = (Q*X_fa_in + Q_out*X_fa) + V_liq*Y_fa*r7 - V_liq*r15;
      24*3600*der(X_c4)*V_liq + 24*3600*der(V_liq)*X_c4 = (Q*X_c4_in + Q_out*X_c4) + V_liq*Y_c4*r8 + V_liq*Y_c4*r9 - V_liq*r16;
      24*3600*der(X_pro)*V_liq + 24*3600*der(V_liq)*X_pro = (Q*X_pro_in + Q_out*X_pro) + V_liq*Y_pro*r10 - V_liq*r17;
      24*3600*der(X_ac)*V_liq + 24*3600*der(V_liq)*X_ac = (Q*X_ac_in + Q_out*X_ac) + V_liq*Y_ac*r11 - V_liq*r18;
      24*3600*der(X_h2)*V_liq + 24*3600*der(V_liq)*X_h2 = (Q*X_h2_in + Q_out*X_h2) + V_liq*Y_h2*r12 - V_liq*r19;
//
//Cations and anions
      24*3600*der(S_cat)*V_liq + 24*3600*der(V_liq)*S_cat = (Q*S_cat_in + Q_out*S_cat);
      24*3600*der(S_ca)*V_liq + 24*3600*der(V_liq)*S_ca = (Q*S_ca_in + Q_out*S_ca) + V_liq*(-3*(rp1 - rd1)*24*60 - (rp3 - rd3)*24*60);
      24*3600*der(S_mg)*V_liq + 24*3600*der(V_liq)*S_mg = (Q*S_mg_in + Q_out*S_mg) + V_liq*(-(rp2 - rd2)*24*60 - (rp4 - rd4)*24*60);
      24*3600*der(S_an)*V_liq + 24*3600*der(V_liq)*S_an = (Q*S_an_in + Q_out*S_an);
      24*3600*der(ash)*V_liq + 24*3600*der(V_liq)*ash = (Q*ash_in + Q_out*ash);
      24*3600*der(X_lig)*V_liq + 24*3600*der(V_liq)*X_lig = (Q*X_lig_in + Q_out*X_lig) + V_liq*f_xc[6]*r1;
      S_nh4 = S_in - S_nh3;
      S_co2 = S_ic - S_hco3 - S_co3;
//S_oh = Ka_h2o * convKa / S_h;
      S_h3po4 = S_ip - S_hpo4 - S_po4 - S_h2po4;
//AE
//S_h = (-Theta / 2) + 1 / 2 * sqrt(Theta ^ 2 + 4 * Ka_h2o);
      charge = 1*(S_h + S_cat + S_nh4 + 2*S_ca + 2*S_mg - S_hco3 - S_acm/(COD_VS[7]*MW[7]) - S_prom/(COD_VS[6]*MW[6]) - S_bum/(COD_VS[5]*MW[5]) - S_vam/(COD_VS[4]*MW[4]) - S_an - 2*S_hpo4 - S_h2po4 - 3*S_po4 - 2*S_co3 - S_oh);
//S_h = 7e-8;
//charge = 0;
//charge = Theta + S_h - S_oh;
//charge_error = 0;
      charge + 5*der(charge) = 0;
//      der(charge_error) = charge^2;
//S_h = S_oh - Theta;
//S_h = 7.17353e-8;
//ODE; DA RISCRIVERE CON CO3 NON-IDEALITA'?
//der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh4/(Ka_nh4+S_h)^2 + S_h/(Ka_nh4+S_h)*der(S_in) = (der(S_ac/Ac_conv)*Ka_ac/(S_h+Ka_ac)-der(S_h)*Ka_ac*S_ac/Ac_conv/(S_h+Ka_ac)^2) + (der(S_pro/Pro_conv)*Ka_pro/(S_h+Ka_pro)-der(S_h)*Ka_pro*S_pro/Pro_conv/(S_h+Ka_pro)^2) + (der(S_bu/Bu_conv)*Ka_bu/(S_h+Ka_bu)-der(S_h)*Ka_bu*S_bu/Bu_conv/(S_h+Ka_bu)^2) + (der(S_va/Va_conv)*Ka_va/(S_h+Ka_va)-der(S_h)*Ka_va*S_va/Va_conv/(S_h+Ka_va)^2) + der(S_an) + Ka_co2/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*((S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)*(S_h*der(S_ic)+S_ic*der(S_h))-(S_ic*S_h*der(S_h)*(Ka_co2+2*S_h))) + 2*Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*(der(S_ic)*(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)-S_ic*der(S_h)*(2*S_h+Ka_co2))- Ka_h2o*convKa/(S_h)^2*der(S_h) + 3*(Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*(der(S_ip)*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + 2*(Ka_h3po4*Ka_h2po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((S_ip*der(S_h)+ S_h*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + (Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((2*S_ip*S_h*der(S_h)+ S_h^2*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h^2*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h))));
//GAS PHASE EQUATIONS
      24*3600*der(S_gas_h2)*(V_tot - V_liq) + 24*3600*der(V_tot - V_liq)*S_gas_h2 = (-S_gas_h2*Q_gas) + rt8*V_liq;
      24*3600*der(S_gas_ch4)*(V_tot - V_liq) + 24*3600*der(V_tot - V_liq)*S_gas_ch4 = (-S_gas_ch4*Q_gas) + rt9*V_liq;
      24*3600*der(S_gas_co2)*(V_tot - V_liq) + 24*3600*der(V_tot - V_liq)*S_gas_co2 = (-S_gas_co2*Q_gas) + rt10*V_liq;
      24*3600*der(S_gas_n2)*(V_tot - V_liq) + 24*3600*der(V_tot - V_liq)*S_gas_n2 = (-S_gas_n2*Q_gas) + rt11*V_liq;
      24*3600*der(S_gas_nh3)*(V_tot - V_liq) + 24*3600*der(V_tot - V_liq)*S_gas_nh3 = (-S_gas_nh3*Q_gas) + rt12*V_liq;

      24*3600*der(Vcum) = Q;
      24*3600*der(Vcum_ch4) = 10^6*(rt9*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm);
      24*3600*der(Vcum_ch4_L) = 10^3*(rt9*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm);
//////Sommare a TAC E TAN i sali? Quando misuro diluisco..
//States vector
// Carachteristics of digestate
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm/(COD_VS[7]*MW[7]) + S_prom/(COD_VS[6]*MW[6]) + S_bum/(COD_VS[5]*MW[5]) + S_vam/(COD_VS[4]*MW[4]) - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      TVFA = (S_ac/(COD_VS[7]) + S_pro/(COD_VS[6]) + S_bu/(COD_VS[5]) + S_va/(COD_VS[4]))*1000 "VFA as mg/L";
//
      FOS_TAC = TVFA/Alk "Ratio between acidity and alkalinity";
//
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS[15] + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS[16] + (S_fa + X_li)/COD_VS[17] + S_i/COD_VS[13] + X_i/COD_VS[25] + X_p/COD_VS[26] "Volatile Solid content in the digester as gVS/L";
//        VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + S_su/COD_VS[1] + sum(X_ch[i] for i in 1:size(X_ch, 1))/COD_VS_CH + S_aa/COD_VS[2] + sum(X_pr[i] for i in 1:size(X_pr, 1))/COD_VS_PR + S_fa/COD_VS[3] + X_li/COD_VS_LI + S_i[end]/COD_VS[13] + X_c[end]/COD_VS[14] + X_i[end]/COD_VS[25] + X_lig/COD_VS_LIG + X_p/COD_VS[26] "Volatile Solid content in the digester as gVS/L";
//
      TAN = S_in*14*1000 "mgN/L";
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_p "Total COD concentration as gCOD/L";
      COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
//Che conversione COD/VS applicare a carboidrati in Si?
//Che composizione macromolecolare considerare per Xp?
//  CH_tot = S_su/COD_VS[1] + (f_xc[6]*X_c + X_lig)/COD_VS_LIG + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1] + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH "X_p Total CH concentration as gGlu/L";
//
      CH_tot = (S_su + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb) + X_p*(f_ch_xb)/(f_ch_xb + f_pr_xb + f_li_xb))/COD_VS[15]*1000 "X_p Total CH concentration as mgGlu/L";
//
//  PR_tot_BCA = S_aa/COD_VS[2] + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_BCA = (S_aa + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb) + X_p*(f_pr_xb)/(f_ch_xb + f_pr_xb + f_li_xb))/COD_VS_PR_BCA*1000 "Total PR concentration as mgBSA/L";
//
//  PR_tot_TKN = S_aa/COD_VS[2]/N_PR + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      PR_tot_TKN = (S_aa + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb) + X_p*(f_pr_xb)/(f_ch_xb + f_pr_xb + f_li_xb))/COD_VS[16]/N_PR*1000 "Total PR concentration as gN/L";
//
//  LI_tot = S_fa/COD_VS[3] + (X_li + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3] + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
      LI_tot = (S_fa + X_li + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb + X_p*(f_li_xb)/(f_ch_xb + f_pr_xb + f_li_xb))/COD_VS[17]*1000 "Total LI concentration as glipid/L";
      CH_sol = (S_su + S_i*f_si[1])/COD_VS[15] "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS[16]/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS[17] "Soluble LI concentration as glipid/L";
      annotation(
        Diagram,
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-08, Interval = 0.002));
    end PartialDigester_AC;

    model Digester_AC
      extends ADM1_P.OtherVariables_MassBalance;
      extends ADM1_P.BlockLibrary.PartialDigester_AC;
      extends ADM1_P.Icons.Digester;
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {74, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {46, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput P_gas(nominal = 1e-6) annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-6, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 270), iconTransformation(origin = {4, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 270)));
      Real[43] x;
    equation
      Q = inlet.Q;
      Q_out = outlet.Q;
//Inputs
      inlet.dummy = outlet.dummy;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = inStream(inlet.X_i[i]) "dummy never used";
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      inlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
//
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = inlet.X_i[i] "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = inlet.S_i[i] "dummy never used";
      end for;
      X_h2_in = inlet.X_h2 "dummy never used";
      S_su_in = inlet.S_su;
      S_aa_in = inlet.S_aa;
      S_fa_in = inlet.S_va;
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
      S_n2_in = 0;
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
      ash_in = inlet.ash;
      X_lig_in = inlet.X_lig;
//
//WATER PHASE EQUATIONS
//Per ora densità unitaria digestato. Passo con stream o no?
//  inlet.Q + sum(Biogas_Out.Q_i*MWi)/22.4 + outlet.Q = 0;
// sum((Biogas_Out.Q_i*MWi/22.4) for i in 1:size(X_pr, 1))
//  24*3600*der(V_feed_cum) = inlet.Q;
//  24*3600*der(V_liq) = inlet.Q + outlet.Q - Q_gas_N/(P_gas - p_gas_h2o)/0.0224*(p_gas_ch4*MW[]+p_gas_co2*MW[]+p_gas_h2*MW[]+p_gas_nh3*MW[]+p_gas_n2*MW[]);
//  24*3600*der(V_liq) = inlet.Q + outlet.Q - Q_gas*p_gas_h2o/P_gas;
      24*3600*der(V_liq) = inlet.Q + outlet.Q;
//  inlet.Q + outlet.Q = 0;
// Gaseous boundary conditions
      p_gas_h2 = S_gas_h2*R*T_op/COD_VS[8]/MW[8];
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_VS[9]/MW[9];
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      p_gas_n2 = S_gas_n2*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o + p_gas_nh3 + p_gas_n2;
      Q_gas = u;
//Q_gas = if noEvent(P_gas > P_atm) then 1000*(P_gas - P_atm) else 0 "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.p_gas_n2 = p_gas_n2;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//CONVERSION FOR INTERFACE "DIGESTATE"
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
//TO BE MODIFIED
      for i in 1:size(outlet.X_c, 1) loop
        outlet.X_c[i] = X_c "*f_xc[i] giusto?";
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
//TO BE MODIFIED
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
      outlet.X_p = X_p;
      outlet.ash = ash;
      outlet.X_lig = X_lig;
      x = cat(1, {X_su, X_aa, X_fa, X_c4, X_pro, X_ac, X_h2, X_c, X_i}, X_ch, X_pr, {X_li, X_p, S_i, S_su, S_aa, S_fa, S_va, S_bu, S_pro, S_ac, S_h2, S_ch4, S_ic, S_in, S_ip, S_cat, S_ca, S_mg, S_an, ash, X_lig, S_gas_h2, S_gas_ch4, S_gas_co2, S_gas_nh3, X_acp, X_stru, X_ccm, X_mag});
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = max(1e-30, V_liq/Q) "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
//
//MASS BALANCES
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_p + X_aa + X_ac + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_c + X_lig "Particulate COD concentration";
      COD_balance_in = inlet.Q*(inlet.X_p + inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + X_lig);
      COD_balance_out = outlet.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
//  24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
//      24*3600*der(V_in_cum) = inlet.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = inlet.Q*(i_LIG[1]*inlet.X_lig + i_XP[1]*inlet.X_p + inlet.S_ic + i_XC[1]*inlet.X_c[end] + i_SI[1]*inlet.S_i[end] + i_XI[1]*inlet.X_i[end] + i_CH[1]*sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + i_PR[1]*sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + i_LI[1]*inlet.X_li + C_su*inlet.S_su + i_PR[1]*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + i_BM[1]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + X_ccm_in);
      IC_balance_out = outlet.Q*(i_LIG[1]*X_lig + i_XP[1]*X_p + S_ic + i_SI[1]*S_i + i_XI[1]*X_i + i_CH[1]*sum(X_ch[i] for i in 1:size(X_ch, 1)) + i_PR[1]*sum(X_pr[i] for i in 1:size(X_pr, 1)) + i_LI[1]*X_li + C_su*S_su + i_PR[1]*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + i_BM[1]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + i_XC[1]*X_c + X_ccm);
      IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_co2/P_gas/R/273.15*1.01325);
      24*3600*der(IC_balance_in_cum) = IC_balance_in;
      24*3600*der(IC_balance_out_cum) = IC_balance_out;
      24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
//Inorganic Nitrogen Balance
      IN_balance_in = inlet.Q*(i_XP[4]*inlet.X_p + inlet.S_in + i_SI[4]*inlet.S_i[end] + i_XI[4]*inlet.X_i[end] + i_PR[4]*(inlet.S_aa + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1))) + i_BM[4]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[4]*inlet.X_c[end]);
      IN_balance_out = outlet.Q*(i_XP[4]*X_p + S_in + i_SI[4]*S_i + i_XI[4]*X_i + i_PR[4]*(S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1))) + i_BM[4]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru + i_XC[4]*X_c);
      IN_balance_gas = Biogas_Out.Q_gas_N*(p_gas_nh3/P_gas/R/273.15*1.01325);
      24*3600*der(IN_balance_in_cum) = IN_balance_in;
      24*3600*der(IN_balance_out_cum) = IN_balance_out;
      24*3600*der(IN_balance_gas_cum) = IN_balance_gas;
//Inorganic Phosforous Balance
      IP_balance_in = inlet.Q*(i_XP[5]*inlet.X_p + inlet.S_ip + i_SI[5]*inlet.S_i[end] + i_XI[5]*inlet.X_i[end] + i_LI[5]*inlet.X_li + i_BM[5]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + i_XC[5]*inlet.X_c[end]);
      IP_balance_out = outlet.Q*(i_XP[5]*X_p + S_ip + i_SI[5]*S_i + i_XI[5]*X_i + i_LI[5]*X_li + i_BM[5]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru + X_c*i_XC[5]);
      24*3600*der(IP_balance_in_cum) = IP_balance_in;
      24*3600*der(IP_balance_out_cum) = IP_balance_out;
    end Digester_AC;

    model Batch_AC
      extends ADM1_P.BlockLibrary.PartialDigester_AC;
      extends ADM1_P.Icons.BatchTest;
      extends ADM1_P.StateVariablesADM1_reinit_AC;
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      //Add any sort of balance check (for gas)?
      //Additional parameters for batch test
      parameter SI.Volume V_inoculum = 339.03/1e6;
      parameter SI.Volume V_add = 445.01/1e6;
      //Restart variable declaration (when no reinit is present var_restart = parameter var_start). Equations to be specified in the upper level!
    equation
//Inputs
      Q = 0;
      Q_out = 0;
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = 0 "dummy never used";
      end for;
      X_h2_in = 0 "dummy never used";
      S_su_in = 0;
      S_aa_in = 0;
      S_fa_in = 0;
      S_bu_in = 0;
      S_pro_in = 0;
      S_va_in = 0;
      S_ac_in = 0;
      S_h2_in = 0;
      S_ch4_in = 0;
      S_ic_in = 0;
      S_in_in = 0;
      S_ip_in = 0;
      S_cat_in = 0;
      S_ca_in = 0;
      S_mg_in = 0;
      S_an_in = 0;
      for i in 1:size(X_c_in, 1) loop
        X_c_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(X_ch_in, 1) loop
        X_ch_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(X_pr_in, 1) loop
        X_pr_in[i] = 0 "dummy never used";
      end for;
      X_li_in = 0;
      X_su_in = 0;
      X_aa_in = 0;
      X_fa_in = 0;
      X_c4_in = 0;
      X_pro_in = 0;
      X_ac_in = 0;
      X_stru_in = 0;
      X_acp_in = 0;
      X_ccm_in = 0;
      X_p_in = 0;
      ash_in = 0;
      X_lig_in = 0;
      S_n2_in = 0;
//
// Gaseous boundary conditions
      p_gas_h2 = S_gas_h2*R*T_op/COD_VS[8]/MW[8];
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_VS[9]/MW[9];
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      p_gas_n2 = S_gas_n2*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o + p_gas_nh3 + p_gas_n2;
      Q_gas = if noEvent(P_gas > P_atm) then 100*(P_gas - (P_atm + 0.003)) else 0;
//Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//
//  24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm;
//  24*3600*der(Vcum_ch4) = 10^6*(rt9*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm);
//24*3600*der(Vcum) = inlet.Q;
// Carachteristics of digestate
//  TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm/(COD_VS[7]*MW[7]) + S_prom/(COD_VS[6]*MW[6]) + S_bum/(COD_VS[5]*MW[5]) + S_vam/(COD_VS[4]*MW[4]) - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
////
//  VFA = (S_ac/(COD_VS[7]*MW[7]) + S_pro/(COD_VS[6]*MW[6]) + S_bu/(COD_VS[5]*MW[5]) + S_va/(COD_VS[4]*MW[4]))*60*1000 "VFA as mgCH3COOH/L";
////
//  FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
////
//  VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13] + f_xc[6]/COD_VS_LIG) + X_lig/COD_VS_LIG + X_p/COD_VS[26] "Volatile Solid content in the digester as gVS/L";
//
//  TAN = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
//  COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_lig + X_p "Total COD concentration as gCOD/L";
//  COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
////Che conversione COD/VS applicare a carboidrati in Si?
////Che composizione macromolecolare considerare per Xp?
//  CH_tot = S_su/COD_VS[1] + (X_lig + f_xc[6]*X_c)/COD_VS_LIG + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1] + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH  "X_p Total CH concentration as gGlu/L";
//  PR_tot_BCA = S_aa/COD_VS[2] + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
//  PR_tot_TKN = S_aa/COD_VS[2]/N_PR + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
//  LI_tot = S_fa/COD_VS[3] + (X_li + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3] + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
//  CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
//  PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
//  PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
//  LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
    end Batch_AC;

    model Open_AC
      extends ADM1_P.BlockLibrary.PartialDigester_AC;
      extends ADM1_P.Icons.SludgeDischarge;
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-106, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {74, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {96, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Gas_stream Biogas_Out annotation(
        Placement(visible = true, transformation(origin = {52, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      //  Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
      //    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 88}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      Real P_gas;
    equation
      Q = inlet.Q;
      Q_out = outlet.Q;
//Inputs
      inlet.dummy = outlet.dummy;
      for i in 1:size(inlet.X_i, 1) loop
        inlet.X_i[i] = inStream(inlet.X_i[i]) "dummy never used";
      end for;
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      inlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
//
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = inlet.X_i[i] "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = inlet.S_i[i] "dummy never used";
      end for;
      X_h2_in = inlet.X_h2 "dummy never used";
      S_su_in = inlet.S_su;
      S_aa_in = inlet.S_aa;
      S_fa_in = inlet.S_va;
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
      S_n2_in = 0;
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
      ash_in = inlet.ash;
      X_lig_in = inlet.X_lig;
//
//WATER PHASE EQUATIONS
//Per ora densità unitaria digestato. Passo con stream o no?
//  inlet.Q + sum(Biogas_Out.Q_i*MWi)/22.4 + outlet.Q = 0;
      inlet.Q + outlet.Q = 0;
// Gaseous boundary conditions
      p_gas_h2 = 1e-10;
      p_gas_ch4 = 1e-10;
      p_gas_co2 = 0.0004;
      p_gas_nh3 = 1e-10;
      p_gas_n2 = 0.79;
      P_gas = P_atm;
//Q_gas = k_p * (P_gas - P_atm)
      Q_gas = 0 "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//CONVERSION FOR INTERFACE "GAS"
      Biogas_Out.p_gas_h2o = p_gas_h2o;
      Biogas_Out.p_gas_h2 = p_gas_h2;
      Biogas_Out.p_gas_ch4 = p_gas_ch4;
      Biogas_Out.p_gas_co2 = p_gas_co2;
      Biogas_Out.p_gas_nh3 = p_gas_nh3;
      Biogas_Out.p_gas_n2 = p_gas_n2;
      Biogas_Out.Q_gas_N + Q_gas_N = 0;
//
//CONVERSION FOR INTERFACE "DIGESTATE"
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
//TO BE MODIFIED
      for i in 1:size(outlet.X_c, 1) loop
        outlet.X_c[i] = X_c "*f_xc[i]giusto?";
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
//TO BE MODIFIED
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
      outlet.X_p = X_p;
      outlet.ash = ash;
      outlet.X_lig = X_lig;
//
////DIGESTER'S OPERATIVE PARAMETERS
//  HRT = V_liq/Q "Hyraulic Retention Time [d]";
//  OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
////
////MASS BALANCES
////COD Balance
//  COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
//  COD_X = X_aa + X_ac + X_c4 + X_ch + X_fa + X_h2 + X_i + X_li + X_pr + X_pro + X_su + X_c "Particulate COD concentration";
//  COD_balance_in = inlet.Q*(inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2[1] + inlet.X_pro + inlet.X_su + inlet.X_ch[end] + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + inlet.X_pr);
//  COD_balance_out = outlet.Q*(COD_S + COD_X);
//  COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
//24*3600*der(Vcum_ch4) = 10^6*(rt9*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm);
//  24*3600*der(V_in_cum) = inlet.Q;
//  24*3600*der(COD_balance_in_cum) = COD_balance_in;
//  24*3600*der(COD_balance_out_cum) = COD_balance_out;
//  24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
////Inorganic Carbon Balance
//  IC_balance_in = inlet.Q*(inlet.S_ic + C_xc*inlet.X_c[end] + C_si*inlet.S_i[end] + C_xi*inlet.X_i[end] + C_ch*inlet.X_ch[end] + C_pr*inlet.X_pr + C_li*inlet.X_li + C_su*inlet.S_su + C_aa*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + C_bac*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2[1]));
//  IC_balance_out = outlet.Q*(S_ic + C_si*S_i + C_xi*X_i + C_ch*X_ch + C_pr*X_pr + C_li*X_li + C_su*S_su + C_aa*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + C_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + C_xc*X_c);
//  IC_balance_gas = Biogas_Out.Q_gas_N*(C_ch4*p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_co2/P_gas/R/273.15*1.01325);
//  24*3600*der(IC_balance_in_cum) = IC_balance_in;
//  24*3600*der(IC_balance_out_cum) = IC_balance_out;
//  24*3600*der(IC_balance_gas_cum) = IC_balance_gas;
////Inorganic Nitrogen Balance
//  IN_balance_in = inlet.Q*(inlet.S_in + N_i*(inlet.S_i[end] + inlet.X_i[end]) + N_aa*(inlet.S_aa + inlet.X_pr) + N_bac*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2[1]) + N_xc*inlet.X_c[end]);
//  IN_balance_out = outlet.Q*(S_in + N_i*(S_i + X_i) + N_aa*(S_aa + X_pr) + N_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + X_stru + N_xc*X_c);
//  IN_balance_gas = Biogas_Out.Q_gas_N*(p_gas_nh3/P_gas/R/273.15*1.01325);
//  24*3600*der(IN_balance_in_cum) = IN_balance_in;
//  24*3600*der(IN_balance_out_cum) = IN_balance_out;
//  24*3600*der(IN_balance_gas_cum) = IN_balance_gas;
////Inorganic Phosforous Balance
//  IP_balance_in = inlet.Q*(inlet.S_ip + P_i*(inlet.S_i[end] + inlet.X_i[end]) + P_li*inlet.X_li + P_bac*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2[1]) + P_xc*inlet.X_c[end]);
//  IP_balance_out = outlet.Q*(S_ip + P_i*(S_i + X_i) + P_li*X_li + P_bac*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + 2*X_acp + X_stru + X_c*P_xc);
//  24*3600*der(IP_balance_in_cum) = IP_balance_in;
//  24*3600*der(IP_balance_out_cum) = IP_balance_out;
//  24*3600*der(Vcum) = inlet.Q;
//  24*3600*der(Vcum_ch4) = Q_gas_N*p_gas_ch4/P_gas;
    end Open_AC;

    model Sink_AC
      extends ADM1_P.Icons.SinkDigestate;
      extends ADM1_P.Settable_composites;
      extends ADM1_P.Lumped_variables;
      extends ADM1_P.ParametersADM1_stoichiometric;
      parameter Integer nW = 1;
      //Acting as a sink
      ADM1_P.Interfaces.Feed_stream_vec inlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y[4] annotation(
        Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_ch_si*COD_VS_CH + f_li_si*COD_VS_LI + f_pr_si*COD_VS_PR, f_pr_xc*COD_VS_PR + f_li_xc*COD_VS_LI + f_ch_xc*COD_VS_CH + f_xi_xc*COD_VS[25] + f_si_xc*COD_VS[13] + f_lig_xc*COD_VS_LIG, COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_ch_xi*COD_VS_CH + f_pr_xi*COD_VS_PR + f_li_xi*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_ch_si*MW_CH + f_li_si*MW_LI + f_pr_si*MW_PR, f_pr_xc*MW_PR + f_li_xc*MW_LI + f_ch_xc*MW_CH + f_xi_xc*MW[25] + f_si_xc*MW[13] + f_lig_xc*MW_LIG, MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_ch_xi*MW_CH + f_pr_xi*MW_PR + f_li_xi*MW_LI, 76, MW_LIG} "g/mol";
    equation
//These dummy equations are never used
      inlet.dummy = 1;
      inlet.X_i = inStream(inlet.X_i) "dummy never used";
      for i in 1:size(inlet.S_i, 1) loop
        inlet.S_i[i] = inStream(inlet.S_i[i]) "dummy never used";
      end for;
      inlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
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
      inlet.X_p = inStream(inlet.X_p);
      inlet.ash = inStream(inlet.ash);
      inlet.X_lig = inStream(inlet.X_lig);
//
      y = {Alk, TVFA, VS, TAN};
//Block variables
      Alk = 1e-3 "Alkalinity as mgCaCO3/L";
//
      TVFA = (inlet.S_ac/COD_VS[7]/MW[7] + inlet.S_pro/COD_VS[6]/MW[6] + inlet.S_bu/COD_VS[5]/MW[5] + inlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = TVFA/Alk "Ratio between acidity and alkalinity";
////Aggiungere Xp!!
      VS = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_li/COD_VS_LI + inlet.S_su/COD_VS[1] + (sum(inlet.X_ch[i] for i in 1:3))/COD_VS_CH + inlet.S_aa/COD_VS[2] + sum(inlet.X_pr[2] for i in 1:2)/COD_VS_PR + inlet.S_fa/COD_VS[3] + inlet.X_li/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_i[end]/COD_VS[25] + inlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13] + f_lig_xc/COD_VS_LIG) "Volatile Solid content in the digester as gVS/L";
//
      TAN = inlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c[end] + inlet.X_c4 + sum(inlet.X_ch[i] for i in 1:3) + inlet.X_fa + inlet.X_h2 + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_pro + inlet.X_su + inlet.X_lig "Total COD concentration as gCOD/L";
      COD_sol = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va;
      CH_tot = inlet.S_su/COD_VS[1] + (sum(inlet.X_ch[i] for i in 1:3) + inlet.X_c[end]*f_xi_xc*f_ch_xi + inlet.X_c[end]*f_si_xc*f_ch_si + inlet.X_c[end]*f_ch_xc + inlet.S_i[1] + inlet.X_i[1] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_ch)/COD_VS_CH + (inlet.X_lig + inlet.X_c[end]*f_lig_xc)/COD_VS_LIG "Total CH concentration as gGlu/L";
      PR_tot_BCA = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_xi_xc*f_pr_xi + inlet.X_c[end]*f_si_xc*f_pr_si + inlet.X_c[end]*f_ch_xc + inlet.S_i[2] + inlet.X_i[2] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_xi_xc*f_pr_xi + inlet.X_c[end]*f_si_xc*f_pr_si + inlet.X_c[end]*f_pr_xc + inlet.S_i[2] + inlet.X_i[2] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (inlet.S_fa + inlet.X_li + inlet.X_c[end]*f_xi_xc*f_li_xi + inlet.X_c[end]*f_si_xc*f_li_si + inlet.X_c[end]*f_li_xc + inlet.S_i[3] + inlet.X_i[3] + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_li)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (inlet.S_su + inlet.S_i[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (inlet.S_aa + inlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (inlet.S_aa + inlet.S_i[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (inlet.S_fa + inlet.S_i[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
//  24*3600*der(Vcum_ch4) = 10^6*(rt9*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm);
//    24*3600*der(Vcum) = inlet.Q;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Sink_AC;

    model Feed_Source_Catenacci_VS
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.Feed_variables_Catenacci;
      extends ADM1_P.Settable_composites;
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.Lumped_variables;
      extends ADM1_P.Icons.FeedSource2;
      Modelica.Blocks.Interfaces.RealInput Q annotation(
        Placement(visible = true, transformation(origin = {-72, -26}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -58}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput inlet[21] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Simulating choices
      parameter Integer nXin = 21;
      parameter Integer nW = 1;
      parameter Boolean steady = true "setti parametro";
      //Feed input characteristics (Ari+Dave) (pH is declared in Common)
      Real TS_in(fixed = false, start = 0) "gTS/kg";
      Real VS_in(fixed = false, start = 0) "gVS/kg";
      Real Alk_in(fixed = false, start = 0) "mgCaCO3/L";
      Real Ammonium_in(fixed = false, start = 0) "mgN/L";
      Real Fosfates_in(fixed = false, start = 0) "mgP/L";
      Real Ca_in(fixed = false, start = 0) "mol/L";
      Real Mg_in(fixed = false, start = 0) "mol/L";
      Real ac_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real pro_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real bu_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real va_in(fixed = false, start = 0) "if Catenacci mg_i/L else gCOD/L";
      Real tBMP_VS_in(fixed = false, start = 0) "NmLCH4/gVS";
      //
      Real pVS_in "gVSp/kgp";
      Real sVS_in "gVSs/kgs";
      Real tCH_in "gGlu/m3";
      Real tPR_in "gN/kg or gBSA/kg";
      Real pLI_pVS_in "gLI/kgVSp";
      Real sCOD_in "gCOD/L";
      Real sCH_in "gGlu/m3";
      Real sPR_in "gN/m3 or gBSA/m3";
      parameter Boolean TKN "Sludge vs Yogurth";
      //Not sure about MW_XP
      Real COD_VS[nC] = {32*6/180, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_ch_si*COD_VS_CH + f_li_si*COD_VS_LI + f_pr_si*COD_VS_PR, f_pr_xc*COD_VS_PR + f_li_xc*COD_VS_LI + f_ch_xc*COD_VS_CH + f_xi_xc*COD_VS[25] + f_si_xc*COD_VS[13] + f_lig_xc*COD_VS_LIG, COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_ch_xi*COD_VS_CH + f_pr_xi*COD_VS_PR + f_li_xi*COD_VS_LI, 1.54, COD_VS_LIG} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_ch_si*MW_CH + f_li_si*MW_LI + f_pr_si*MW_PR, f_pr_xc*MW_PR + f_li_xc*MW_LI + f_ch_xc*MW_CH + f_xi_xc*MW[25] + f_si_xc*MW[13] + f_lig_xc*MW_LIG, MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_ch_xi*MW_CH + f_pr_xi*MW_PR + f_li_xi*MW_LI, 76, MW_LIG} "g/mol";
    equation
//Inputs
      TS_in = if steady == true then ts else inlet[1];
      VS_in = if steady == true then vs_ts*(TS_in)/100 else inlet[2]*(TS_in)/100;
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
      tBMP_VS_in = if steady == true then tbmp_vs else inlet[13] "Introdurre check con biodegradabilità macromolecole";
// Variabili che dovrebbero essere "if Catenacci then inlet else calcola"
      pVS_in = if steady == true then 0 else inlet[14];
      sVS_in = if steady == true then 0 else inlet[15];
      tCH_in = if steady == true then 0 else inlet[16];
      tPR_in = if steady == true then 0 else inlet[17];
      pLI_pVS_in = if steady == true then 0 else inlet[18];
      sCOD_in = if steady == true then 0 else inlet[19];
      sCH_in = if steady == true then sCH else inlet[20];
      sPR_in = if steady == true then sPR else inlet[21];
//
//Computation of physical properties
      u = 1 - TS_in/1000 "fraction of moisture content";
      v = VS_in/TS_in "fraction of volatile content";
      d = 1/(u/1000 + (1 - u)*(v/1050 + (1 - v)/2500)) "g/L, density";
      alpha = if pVS_in < 1e-10 then 0 else (pVS_in - VS_in)/(pVS_in - sVS_in);
//Computation of COD components
      pLI_VS_in = pLI_pVS_in*(1 - alpha)*pVS_in/VS_in;
//
      tLI_in = 174.04*VS_in*d/1000 "mg LI/L, con valore medio 174.04 mg LI/g VS";
//
      COD_VFA = outlet.S_ac + outlet.S_pro + outlet.S_bu + outlet.S_va "gCOD/L, COD associated to VFA";
      tCOD = if TKN == true then COD_VFA + 173.70*VS_in*d/1000*COD_VS[15]/1000 + (65.43*VS_in*d/1000 - Ammonium_in)*COD_VS[16]*N_PR/1000 + tLI_in*COD_VS[17]/1000 else COD_VFA + tCH_in*COD_VS[15]/1000 + tPR_in*COD_VS_PR_BCA/1000 + tLI_in*COD_VS[17]/1000 "gCOD/L, total COD as sum of total CH, PR, LI and VFA -- con valore medio 173.7 mg Glu/g VS";
      pCOD = tCOD - COD_VFA - outlet.S_su - outlet.S_fa - outlet.S_aa "gCOD/L, particulate COD";
      tBMP_COD = (tBMP_VS_in)/tCOD*VS_in*d/1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
      fd_tCOD = if tBMP_COD < 1e-10 then 1 else tBMP_COD/(R*100*273.15/101325/2/32*10^6*(1 - f_newbio_BMP)) "Problema dello Yogurth: se BMP nullo, significa tutto degradabile";
      tCOD*fd_tCOD = COD_VFA + outlet.S_aa + outlet.S_su + outlet.S_fa + pCOD*fd_pCOD;
//
//Block variables
      outlet.Q = -Q "m3/d";
//Computation of soluble gas
      outlet.S_h2 = h2 "gCOD/L";
      outlet.S_ch4 = ch4 "gCOD/L";
//Computation of biomasses
      outlet.X_su = xsu "gCOD/L";
      outlet.X_aa = xaa "gCOD/L";
      outlet.X_fa = xfa "gCOD/L";
      outlet.X_c4 = xc4 "gCOD/L";
      outlet.X_pro = xpro "gCOD/L";
      outlet.X_ac = xac "gCOD/L";
      outlet.X_h2 = xh2 "gCOD/L";
//Computation of variables S_ac, S_pro, S_bu, S_va (Weinrich)
      outlet.S_ac = ac_in*COD_VS[7]/1000 "gCOD/L";
      outlet.S_pro = pro_in*COD_VS[6]/1000 "gCOD/L";
      outlet.S_bu = bu_in*COD_VS[5]/1000 "gCOD/L";
      outlet.S_va = va_in*COD_VS[4]/1000 "gCOD/L";
//Computation of variables S_su, S_aa, S_fa, S_i
      outlet.S_su = sCH_in/1000*COD_VS[1] "gCOD/L";
      outlet.S_aa = if TKN == true then sPR_in/1000*COD_VS_PR else sPR_in/1000*COD_VS_PR_BCA "gCOD/L";
      outlet.S_fa = max(0, sCOD_in/1000 - COD_VFA - (outlet.S_su + outlet.S_aa)) "gCOD/L";
      outlet.S_i[end] = si "gCOD/L";
      outlet.S_i[1] = outlet.S_i[end]*f_ch_si "gCOD/L";
      outlet.S_i[2] = outlet.S_i[end]*f_pr_si "gCOD/L";
      outlet.S_i[3] = outlet.S_i[end]*f_li_si "gCOD/L";
//
//Computation of variables X_c and X_i (Biernacki)
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
//
      outlet.X_c[end] = pCOD*f_Xc_in;
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
      outlet.X_c[6] = outlet.X_c[end]*f_lig_xc;
//
      outlet.X_i[end] = pCOD*(1 - fd_pCOD) - outlet.X_c[end]*f_xi_xc;
      outlet.X_i[1] = outlet.X_i[end]*f_ch_xi;
      outlet.X_i[2] = outlet.X_i[end]*f_pr_xi;
      outlet.X_i[3] = outlet.X_i[end]*f_li_xi;
//
      outlet.X_ch[1] = (1 - f_Xch_s)*((173.70*VS_in*d/1000 - sCH_in)*COD_VS[15]/1000 - (outlet.X_i[end]*f_ch_xi + outlet.X_c[end]*f_ch_xc + outlet.X_c[end]*f_xi_xc*f_ch_xi)) "rapidly";
      outlet.X_ch[2] = (f_Xch_s)*((173.70*VS_in*d/1000 - sCH_in)*COD_VS[15]/1000 - (outlet.X_i[end]*f_ch_xi + outlet.X_c[end]*f_ch_xc + outlet.X_c[end]*f_xi_xc*f_ch_xi)) "medium";
      outlet.X_ch[3] = 0 "slowly";
//Input sempre da TKN
      outlet.X_pr[1] = if TKN == true then (1 - f_Xpr_s)*((65.43*VS_in*d/1000 - Ammonium_in)*COD_VS[16]*N_PR/1000 - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) else (1 - f_Xpr_s)*((tPR_in - sPR_in)/1000*COD_VS_PR_BCA - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) "rapidly";
      outlet.X_pr[2] = if TKN == true then (f_Xpr_s)*((65.43*VS_in*d/1000 - Ammonium_in)*COD_VS[16]*N_PR/1000 - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) else (f_Xpr_s)*((tPR_in - sPR_in)/1000*COD_VS_PR_BCA - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi)) "slowly";
//
      outlet.X_li = tLI_in*COD_VS[17]/1000 - outlet.S_fa - (outlet.X_i[end]*f_li_xi + outlet.X_c[end]*f_li_xc + outlet.X_c[end]*f_xi_xc*f_li_xi);
//
      outlet.X_p = 0;
      outlet.X_lig = 0;
//
      Alk_mol = Alk_in/100*2/1000 "mol/L";
      S_hco3 = if Alk_in < 1e-10 then outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h) else Alk_mol - (S_acm + S_prom + S_bum + S_vam) - S_oh - (outlet.S_in - S_nh4) + S_h - S_hpo4 - 2*S_po4 + S_h3po4 - 2*S_co3 "mol/L";
      outlet.S_ic = if Alk_in < 1e-10 then tic/12/1000 else (S_hco3*(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h))/Ka_co2 "mol/L";
      outlet.S_in = Ammonium_in/14/1000 "mol/L";
      outlet.S_ip = Fosfates_in/31/1000 "mol/L";
      outlet.S_an = an "mol/L";
      outlet.S_cat = (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 "mol/L";
      outlet.S_ca = Ca_in;
      outlet.S_mg = Mg_in;
      outlet.ash = TS_in - VS_in;
//
//Aggiungere Xp!!
//Sommare a TAC E TAN i sali? Quando misuro diluisco...
//Lumped Feed characteristic
      Alk = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      TVFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = TVFA/Alk "Ratio between acidity and alkalinity";
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_li/COD_VS_LI + outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3))/COD_VS_CH + outlet.S_aa/COD_VS[2] + sum(outlet.X_pr[2] for i in 1:2)/COD_VS_PR + outlet.S_fa/COD_VS[3] + outlet.X_li/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13] + f_lig_xc/COD_VS_LIG) "Volatile Solid content in the digester as gVS/L";
//
      TAN = outlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su + outlet.X_lig "Total COD concentration as gCOD/L";
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = outlet.S_su/COD_VS[1] + (sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_xi_xc*f_ch_xi + outlet.X_c[end]*f_si_xc*f_ch_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS[15] + (outlet.X_lig + outlet.X_c[end]*f_lig_xc)/COD_VS_LIG "Total CH concentration as gGlu/L";
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_ch_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_xi_xc*f_pr_xi + outlet.X_c[end]*f_si_xc*f_pr_si + outlet.X_c[end]*f_pr_xc + outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS[16]/N_PR "Total PR concentration as gN/L";
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_xi_xc*f_li_xi + outlet.X_c[end]*f_si_xc*f_li_si + outlet.X_c[end]*f_li_xc + outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS[17] "Total LI concentration as glipid/L";
      CH_sol = (outlet.S_su + outlet.S_i[1])/COD_VS[15] "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (outlet.S_aa + outlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (outlet.S_aa + outlet.S_i[2])/COD_VS[16]/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (outlet.S_fa + outlet.S_i[3])/COD_VS[17] "Soluble LI concentration as glipid/L";
//
//Common equations
//Computation of ionic components
      Ka_co2 = 10^(-pKa_co2)*exp(deltaH0_Ka_co2/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
      Ka_nh4 = 10^(-pKa_nh3)*exp(deltaH0_Ka_nh4/(R*100)*(1/T_ref - 1/T_op))*convKa "NH4+ acidity constant with temperature correction - unit = M";
      Ka_h2o = 10^(-pKa_h2o)*exp(deltaH0_Ka_h2o/(R*100)*(1/T_ref - 1/T_op))*convKa "water acidity constant with temperature correction - unit = M^2";
      Ka_h2po4 = 10^(-pKa_h2po4)*exp(deltaH0_Ka_h2po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_hpo4 = 10^(-pKa_hpo4)*exp(deltaH0_Ka_hpo4/(R*100)*(1/T_ref - 1/T_op))*convKa "H2PO4 acidity constant with temperature correction - unit = M^2";
      Ka_h3po4 = 10^(-pKa_h3po4)*exp(deltaH0_Ka_h3po4/(R*100)*(1/T_ref - 1/T_op))*convKa "H3PO4 acidity constant with temperature correction - unit = M";
      Ka_hco3 = 10^(-pKa_hco3)*exp(deltaH0_Ka_hco3/(R*100)*(1/T_ref - 1/T_op))*convKa "CO2 acidity constant with temperature correction - unit = M";
//
      S_h = 10^(-pH) "mol/L";
      S_oh = Ka_h2o/S_h "mol/L";
      S_acm = Ka_ac*outlet.S_ac/COD_VS[7]/MW[7]/(S_h + Ka_ac) "mol/L";
      S_prom = Ka_pro*outlet.S_pro/COD_VS[6]/MW[6]/(S_h + Ka_pro) "mol/L";
      S_bum = Ka_bu*outlet.S_bu/COD_VS[5]/MW[5]/(S_h + Ka_bu) "mol/L";
      S_vam = Ka_va*outlet.S_va/COD_VS[4]/MW[4]/(S_h + Ka_va) "mol/L";
      S_hpo4 = Ka_h2po4*outlet.S_ip/(Ka_hpo4*Ka_h2po4/S_h + Ka_h2po4 + S_h + (S_h^2)/Ka_h3po4) "mol/L";
      S_po4 = Ka_hpo4*outlet.S_ip/(Ka_hpo4 + S_h + S_h^2/Ka_h2po4 + S_h^3/(Ka_h2po4*Ka_h3po4)) "mol/L";
      S_h3po4 = outlet.S_ip - S_hpo4 - S_po4 - S_h2po4;
      S_co2 = outlet.S_ic - S_hco3 - S_co3;
      S_co3 = outlet.S_ic*Ka_hco3/((S_h^2)/Ka_co2 + S_h + Ka_hco3);
      S_nh3 = outlet.S_in - S_nh4;
      S_h2po4 = outlet.S_ip*Ka_h3po4/(S_h + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^2));
      S_nh4 = outlet.S_in*S_h/(Ka_nh4 + S_h) "mol/L";
//
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Catenacci_VS;
    
    model BMP_AC
      extends ADM1_P.BlockLibrary.PartialDigester_AC;
      extends ADM1_P.Icons.BatchTest;
      extends ADM1_P.StateVariablesADM1_reinit_AC;
      extends ADM1_P.Settable_composites;
      extends ADM1_P.Variables_BMPtest;
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
      //Add any sort of balance check (for gas)?
      //Additional parameters for batch test
      parameter SI.Volume V_inoculum = 550/1e6;
      parameter SI.Volume V_add = 132/1e6;
      parameter SI.Volume V_feed = 118/1e6;
      parameter Real BMP_B0 = 296.7 "NmL CH4/g VS";
      parameter Real BMP_VS = 22.1 "g VS/kg";
      parameter Real BMP_d = 1006 "g/L";
      parameter Real BMP_CH_VS = 173.7 "mg Glu/g VS";
      parameter Real BMP_PR_VS = 62.02 "mg Norg/g VS";  
      parameter Real BMP_LI_VS = 174.0 "mg Lip/g VS";  
      parameter Real BMP_Ac = 0.75 "g COD/L";
      parameter Real BMP_Pro = 0.33 "g COD/L";
      parameter Real BMP_Bu = 0.16 "g COD/L";
      parameter Real BMP_Va = 0.07 "g COD/L";
      parameter Real BMP_TAN = 72.0 "mg N/L";
      parameter Real BMP_STP = 31.5 "mg P/L";
      parameter Real BMP_pH = 5.60 "-";
      parameter Real BMP_Alk = 2624 "mg CaCO3/L";
      //Variables for Feed
      Real COD_CH_feed;
      Real COD_PR_feed;
      Real COD_LI_feed;
      Real CODtot_feed;
      Real fd_feed;
      Real S_h_feed;
      Real S_oh_feed;
      Real S_acm_feed;
      Real S_prom_feed;
      Real S_bum_feed;
      Real S_vam_feed;
      Real S_h3po4_feed;
      Real S_h2po4_feed;
      Real S_hpo4_feed; 
      Real S_po4_feed;
      Real S_nh4_feed;
      Real S_hco3_feed;
      Real S_co3_feed;
      //Restart variable declaration (when no reinit is present var_restart = parameter var_start). Equations to be specified in the upper level!
    equation
//Inputs
      Q = 0;
      Q_out = 0;
      for i in 1:size(X_i_in, 1) loop
        X_i_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(S_i_in, 1) loop
        S_i_in[i] = 0 "dummy never used";
      end for;
      X_h2_in = 0 "dummy never used";
      S_su_in = 0;
      S_aa_in = 0;
      S_fa_in = 0;
      S_bu_in = 0;
      S_pro_in = 0;
      S_va_in = 0;
      S_ac_in = 0;
      S_h2_in = 0;
      S_ch4_in = 0;
      S_ic_in = 0;
      S_in_in = 0;
      S_ip_in = 0;
      S_cat_in = 0;
      S_ca_in = 0;
      S_mg_in = 0;
      S_an_in = 0;
      for i in 1:size(X_c_in, 1) loop
        X_c_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(X_ch_in, 1) loop
        X_ch_in[i] = 0 "dummy never used";
      end for;
      for i in 1:size(X_pr_in, 1) loop
        X_pr_in[i] = 0 "dummy never used";
      end for;
      X_li_in = 0;
      X_su_in = 0;
      X_aa_in = 0;
      X_fa_in = 0;
      X_c4_in = 0;
      X_pro_in = 0;
      X_ac_in = 0;
      X_stru_in = 0;
      X_acp_in = 0;
      X_ccm_in = 0;
      X_p_in = 0;
      ash_in = 0;
      X_lig_in = 0;
      S_n2_in = 0;
//
      COD_CH_feed = BMP_CH_VS*BMP_VS*BMP_d*COD_VS_CH/1e6;
      COD_PR_feed = BMP_PR_VS*BMP_VS*BMP_d*COD_VS_PR*N_PR/1e6;
      COD_LI_feed = BMP_LI_VS*BMP_VS*BMP_d*COD_VS_LI/1e6;
      CODtot_feed = COD_CH_feed+COD_PR_feed+COD_LI_feed+BMP_Ac+BMP_Pro+BMP_Bu+BMP_Va;
      fd_feed = BMP_B0*BMP_VS*BMP_d/1000/CODtot_feed/(350*(1-f_newbio_BMP)); 
      X_su_feed = 0;
      X_aa_feed = 0;
      X_fa_feed = 0;
      X_c4_feed = 0;
      X_pro_feed = 0;
      X_ac_feed = 0;
      X_h2_feed = 0;
      X_c_feed = 0;
      X_i_feed = (1-fd_feed)*CODtot_feed;
      X_ch1_feed = (1-f_Xch_s)*(COD_CH_feed-X_i_feed*f_ch_xi);
      X_ch2_feed = f_Xch_s*(COD_CH_feed-X_i_feed*f_ch_xi);
      X_pr1_feed = (1-f_Xpr_s)*(COD_PR_feed-X_i_feed*f_pr_xi);
      X_pr2_feed = f_Xpr_s*(COD_PR_feed-X_i_feed*f_pr_xi);
      X_li_feed = COD_LI_feed-X_i_feed*f_li_xi;
      X_p_feed = 0;
      S_i_feed = 0;
      S_su_feed = 0;
      S_aa_feed = 0;
      S_fa_feed = 0;
      S_va_feed = BMP_Va;
      S_bu_feed = BMP_Bu;
      S_pro_feed = BMP_Pro;
      S_ac_feed = BMP_Ac;
      S_h2_feed = 0;
      S_ch4_feed = 0;
      S_ca_feed = 0;
      S_mg_feed = 0;
      S_h_feed = 10^(-BMP_pH) "mol/L";
      S_oh_feed = Ka_h2o/S_h_feed "mol/L";
      S_acm_feed = Ka_ac*S_ac_feed/COD_VS[7]/MW[7]/(S_h_feed + Ka_ac) "mol/L";
      S_prom_feed = Ka_pro*S_pro_feed/COD_VS[6]/MW[6]/(S_h_feed + Ka_pro) "mol/L";
      S_bum_feed = Ka_bu*S_bu_feed/COD_VS[5]/MW[5]/(S_h_feed + Ka_bu) "mol/L";
      S_vam_feed = Ka_va*S_va_feed/COD_VS[4]/MW[4]/(S_h_feed + Ka_va) "mol/L";
      S_in_feed = BMP_TAN/MW_i[4]/1000;
      S_nh4_feed = S_in_feed*S_h_feed/(Ka_nh4 + S_h_feed) "mol/L";  
      S_ip_feed = BMP_STP/MW_i[5]/1000;
      S_po4_feed = Ka_hpo4*S_ip_feed/(Ka_hpo4 + S_h_feed + S_h_feed^2/Ka_h2po4 + S_h_feed^3/(Ka_h2po4*Ka_h3po4)) "mol/L";
      S_hpo4_feed = Ka_h2po4*S_ip_feed/(Ka_hpo4*Ka_h2po4/S_h_feed + Ka_h2po4 + S_h_feed + (S_h_feed^2)/Ka_h3po4) "mol/L";
      S_h2po4_feed = S_ip_feed*Ka_h3po4/(S_h_feed + Ka_h3po4 + Ka_h3po4*Ka_h2po4/S_h_feed + Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h_feed^2));
      S_h3po4_feed = S_ip_feed - S_hpo4_feed - S_po4_feed - S_h2po4_feed;
//  no S_co2_feed = S_ic_feed - S_hco3_feed - S_co3_feed;
      S_co3_feed = S_ic_feed*Ka_hco3/((S_h_feed^2)/Ka_co2 + S_h_feed + Ka_hco3);
//  no  S_nh3_feed = S_in_feed - S_nh4_feed;
//  no Alk_mol = BMP_Alk/100*2/1000 "mol/L";
      S_hco3_feed = BMP_Alk/100*2/1000 - (S_acm_feed + S_prom_feed + S_bum_feed + S_vam_feed) - S_oh_feed - (S_in_feed - S_nh4_feed) + S_h_feed - S_hpo4_feed - 2*S_po4_feed + S_h3po4_feed - 2*S_co3_feed "mol/L";
      S_ic_feed = (S_hco3_feed*(S_h_feed + Ka_co2 + Ka_hco3*Ka_co2/S_h_feed))/Ka_co2 "mol/L";
      S_an_feed = 0.02 "mol/L";
      S_cat_feed = -S_nh4_feed - S_h_feed - 2*S_ca_feed - 2*S_mg_feed + S_an_feed + S_hco3_feed + S_oh_feed + S_acm_feed + S_prom_feed + S_bum_feed + S_vam_feed + 2*S_hpo4_feed + S_h2po4_feed + 3*S_po4_feed + 2*S_co3_feed "mol/L";
      ash_feed = 0;
      X_lig_feed = 0;
//
// Gaseous boundary conditions
      p_gas_h2 = S_gas_h2*R*T_op/COD_VS[8]/MW[8];
      p_gas_ch4 = S_gas_ch4*R*T_op/COD_VS[9]/MW[9];
      p_gas_co2 = S_gas_co2*R*T_op;
      p_gas_nh3 = S_gas_nh3*R*T_op;
      p_gas_n2 = S_gas_n2*R*T_op;
      P_gas = p_gas_h2 + p_gas_ch4 + p_gas_co2 + p_gas_h2o + p_gas_nh3 + p_gas_n2;
      Q_gas = if noEvent(P_gas > P_atm) then 100*(P_gas - (P_atm + 0.003)) else 0;
//Q_gas = u "Biogas rate [m3/d] P_atm o P_atm + P_guardia";
      Q_gas_N = Q_gas*273.15/T_op/P_atm*P_gas "Biogas rate [m3/d] at standard conditions";
//
//  24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm;
//  24*3600*der(Vcum_ch4) = 10^6*(rt9*V_liq/COD_VS[9]/MW[9]*R*273.15/P_atm);
//24*3600*der(Vcum) = inlet.Q;
// Carachteristics of digestate
//  TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm/(COD_VS[7]*MW[7]) + S_prom/(COD_VS[6]*MW[6]) + S_bum/(COD_VS[5]*MW[5]) + S_vam/(COD_VS[4]*MW[4]) - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
////
//  VFA = (S_ac/(COD_VS[7]*MW[7]) + S_pro/(COD_VS[6]*MW[6]) + S_bu/(COD_VS[5]*MW[5]) + S_va/(COD_VS[4]*MW[4]))*60*1000 "VFA as mgCH3COOH/L";
////
//  FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
////
//  VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13] + f_xc[6]/COD_VS_LIG) + X_lig/COD_VS_LIG + X_p/COD_VS[26] "Volatile Solid content in the digester as gVS/L";
//
//  TAN = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
//  COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_lig + X_p "Total COD concentration as gCOD/L";
//  COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
////Che conversione COD/VS applicare a carboidrati in Si?
////Che composizione macromolecolare considerare per Xp?
//  CH_tot = S_su/COD_VS[1] + (X_lig + f_xc[6]*X_c)/COD_VS_LIG + (sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[4]*f_xi[1] + X_c*f_xc[5]*f_si[1] + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH  "X_p Total CH concentration as gGlu/L";
//  PR_tot_BCA = S_aa/COD_VS[2] + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
//  PR_tot_TKN = S_aa/COD_VS[2]/N_PR + (sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[4]*f_xi[2] + X_c*f_xc[5]*f_si[2] + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
//  LI_tot = S_fa/COD_VS[3] + (X_li + X_c*f_xc[4]*f_xi[3] + X_c*f_xc[5]*f_si[3] + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
//  CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
//  PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
//  PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
//  LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
    end BMP_AC;
  end BlockLibrary;

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
    type Henry = Real(final quantity = "Henry constant", final unit = "mol/(m3.Pa)", final displayUnit = "mol/(m3.Pa)", min = 0);
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
  end Types;

  package Calibration
    //within Calibration;

    model sampler_with_oclk
      parameter SI.Time Ts = 0.5;
      parameter Integer n = 1;
      Modelica.Blocks.Interfaces.RealInput[n] u annotation(
        Placement(visible = true, transformation(origin = {-148, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      discrete Modelica.Blocks.Interfaces.RealOutput[n] y annotation(
        Placement(visible = true, transformation(origin = {124, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput clk(start = false) annotation(
        Placement(visible = true, transformation(origin = {-10, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Boolean c(start = false);
      //  Real u=sin(time);
    equation
      clk = c;
    algorithm
      when sample(0, Ts) then
        for i in 1:size(y, 1) loop
          y[i] := u[i];
        end for;
        c := not pre(c);
      end when;
      annotation(
        experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-6, Interval = 0.04),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
    end sampler_with_oclk;

    model Trigger
      parameter SI.Time Ts = 0.1;
      parameter Real xstart = 1;
      parameter Real deltat = 0.1;
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-148, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(
        Placement(visible = true, transformation(origin = {124, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanInput clk annotation(
        Placement(visible = true, transformation(origin = {-10, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Real x(start = xstart);
      discrete Real time_last_reinit;
      Modelica.Blocks.Interfaces.BooleanOutput running(start = false) annotation(
        Placement(visible = true, transformation(origin = {72, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    equation
      der(x) = -0.5*x;
      y = 2*x;
      when change(clk) then
        reinit(x, u);
      end when;
    algorithm
      when change(clk) and not running then
        time_last_reinit := time;
        running := true;
      end when;
      when running and time - time_last_reinit >= deltat then
        running := false;
      end when;
    end Trigger;

    model TFidentification
      parameter Real mu = 1.55590983;
      parameter Real T = 1.53713749;
      parameter Real tau = 1.6591039;
      Real ISE(start = 0, fixed = true);
      Modelica.Blocks.Sources.RealExpression u(y = if sin(time/10) > 0 then 1 else 0) annotation(
        Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction P(a = {1, 4, 3, 4, 1}, b = {1.5}) annotation(
        Placement(visible = true, transformation(origin = {-32, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder Mrat(T = T, k = mu) annotation(
        Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Nonlinear.FixedDelay Mdel(delayTime = tau) annotation(
        Placement(visible = true, transformation(origin = {-10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      der(ISE) = (P.y - Mdel.y)^2;
      connect(u.y, P.u) annotation(
        Line(points = {{-118, 30}, {-84, 30}, {-84, 58}, {-44, 58}}, color = {0, 0, 127}));
      connect(u.y, Mrat.u) annotation(
        Line(points = {{-118, 30}, {-100, 30}, {-100, 10}, {-82, 10}}, color = {0, 0, 127}));
      connect(Mrat.y, Mdel.u) annotation(
        Line(points = {{-58, 10}, {-22, 10}}, color = {0, 0, 127}));
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.2),
        uses(Modelica(version = "4.0.0")));
    end TFidentification;

    model Identification_discrete_meas
      //Measurments from sapling or combiTimeTable?
      parameter Boolean combi = true;
      //Measurments from sampling
      parameter Real Ts = 5;
      parameter Integer n_sample = 20 "round(simulation_time/Ts)-1";
      //Measurments from combiTimeTable
      parameter Real meas[6, 3] = [1, 1, 283.69; 2, 21, 296.66; 3, 40, 290.00; 4, 66, 255.93; 5, 85, 265.09; 6, 98, 226.60];
      parameter Integer n_meas = if combi == true then size(combiTimeTable.table[2:end, :], 1) else size(t_sampling, 1);
      Real t_meas[n_meas] = if combi == true then meas[:, 2] else t_sampling;
      Real v_meas[n_meas] = if combi == true then meas[:, 3] else y;
      parameter Real table[7, 3] = [0, 0, 0; meas];
      //Parameters to be identified
      parameter Real mu = 266.856;
      parameter Real T = 0.1077115;
      //Variable declaration
      Real ISE(start = 0, fixed = true);
      Integer i_curr;
      Real err(start = 0, fixed = true);
      Real y[20];
      Real t_sampling[n_sample];
      Modelica.Blocks.Sources.RealExpression u(y = if time > 1 then 1 else 0) annotation(
        Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.TransferFunction P(a = {1, 10}, b = {3000}) annotation(
        Placement(visible = true, transformation(origin = {-32, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Continuous.FirstOrder Mrat(T = T, k = mu) annotation(
        Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = table[:, 2:3]) annotation(
        Placement(visible = true, transformation(origin = {-186, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod = 1, sigma = 10) annotation(
        Placement(visible = true, transformation(origin = {-32, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add add annotation(
        Placement(visible = true, transformation(origin = {6, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      for i in 1:size(t_sampling, 1) loop
        t_sampling[i] = Ts*i;
      end for;
      connect(u.y, P.u) annotation(
        Line(points = {{-118, 30}, {-84, 30}, {-84, 58}, {-44, 58}}, color = {0, 0, 127}));
      connect(u.y, Mrat.u) annotation(
        Line(points = {{-118, 30}, {-100, 30}, {-100, 10}, {-82, 10}}, color = {0, 0, 127}));
      connect(P.y, add.u1) annotation(
        Line(points = {{-20, 58}, {-6, 58}}, color = {0, 0, 127}));
      connect(normalNoise.y, add.u2) annotation(
        Line(points = {{-20, 40}, {-6, 40}, {-6, 46}}, color = {0, 0, 127}));
    initial algorithm
//ISE := 0;
      i_curr := 1;
//err :=0;
    algorithm
//      when sample(0,Ts) then
//      y[i_curr] := add.y;
//      i_curr := i_curr +1;
//      end when;
//
      when time >= t_meas[i_curr] then
        y[i_curr] := add.y;
        err := Mrat.y - v_meas[i_curr];
        ISE := ISE + err^2;
        i_curr := i_curr + 1;
      end when;
//
//      when time >= t_meas[i_curr] then
//      err := Mrat.y - v_meas[i_curr];
//      ISE := ISE+err^2;
//      i_curr := i_curr +1;
////      if i_curr>6 then
////      terminate("Terminate");
////      end if;
//      end when;
      annotation(
        Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
        experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.2),
        uses(Modelica(version = "4.0.0")));
    end Identification_discrete_meas;
  end Calibration;

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
  end Functions;

  model Test_pH_submodel
    Modelica.Blocks.Sources.CombiTimeTable pH_Inputs(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_pH.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_pH", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Decomposed.pH_batch_input PH(I(fixed = false), S_h(fixed = false, start = 1.21e-7), g_mono(fixed = false, start = 0.75), ideality = false) annotation(
      Placement(visible = true, transformation(origin = {6, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Real T_op = 25 + 273.15;
  equation
    PH.T_op = T_op;
    PH.S_ip = pH_Inputs.y[2];
    PH.S_ic = pH_Inputs.y[3];
    PH.S_in = pH_Inputs.y[4];
    PH.S_va = pH_Inputs.y[5];
    PH.S_bu = pH_Inputs.y[6];
    PH.S_pro = pH_Inputs.y[7];
    PH.S_ac = pH_Inputs.y[8];
    PH.S_cat = pH_Inputs.y[9];
    PH.S_an = pH_Inputs.y[10];
    PH.S_ca = pH_Inputs.y[11];
    PH.S_mg = pH_Inputs.y[12];
    annotation(
      experiment(StartTime = 0, StopTime = 100000, Tolerance = 1e-09, Interval = 100),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=aliasConflicts, -d=dumpLoops, -d=stateselection",
      __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_STATS", s = "dassl", noHomotopyOnFirstTry = "()"));
  end Test_pH_submodel;

  model Test_CHP
    BlockLibrary.CHP chp annotation(
      Placement(visible = true, transformation(origin = {4, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Gas_source gas_source annotation(
      Placement(visible = true, transformation(origin = {-48, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(gas_source.outlet, chp.inlet) annotation(
      Line(points = {{-38, 2}, {-6, 2}, {-6, -2}}));
    annotation(
      experiment(StartTime = 0, StopTime = 2592000, Tolerance = 1e-6, Interval = 187.5),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Test_CHP;

  model Test_stream_fractions2
    BlockLibrary.Feed_Source_real_stream feed2(BD_ch = 40, BD_li = 90, BD_pr = 70, Flores = false, RC = 65, RL = 10, RP = 25, other_cat_an = 0, steady = false, weender = false) annotation(
      Placement(visible = true, transformation(origin = {-66, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_CattleSlurry.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-128, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feeding_Tank_stream feeding_Tank_stream annotation(
      Placement(visible = true, transformation(origin = {-4, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2}), smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = [0, 130; 732, 130], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-102, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink sink annotation(
      Placement(visible = true, transformation(origin = {44, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Recycle sink2 annotation(
      Placement(visible = true, transformation(origin = {-2, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(feed2.outlet, feeding_Tank_stream.inlet) annotation(
      Line(points = {{-58, -8}, {-36, -8}, {-36, 6}, {-14, 6}}));
    connect(combiTimeTable1.y[1], feed2.inlet[1]) annotation(
      Line(points = {{-90, 20}, {-74, 20}, {-74, -6}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Input_CattleSlurry.y, feed2.inlet[2:end]) annotation(
      Line(points = {{-116, 10}, {-74, 10}, {-74, -6}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feeding_Tank_stream.outlet, sink.inlet) annotation(
      Line(points = {{6, 6}, {34, 6}, {34, -6}}));
    connect(feeding_Tank_stream.outlet, sink2.inlet) annotation(
      Line(points = {{6, 6}, {12, 6}, {12, -22}, {-20, -22}, {-20, -40}, {-12, -40}}));
    connect(sink2.outlet, feeding_Tank_stream.inlet) annotation(
      Line(points = {{8, -40}, {20, -40}, {20, -60}, {-26, -60}, {-26, -4}, {-14, -4}, {-14, 6}}));
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Test_stream_fractions2;

  model Flores
    parameter Integer nXin = 22;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), S_aa(start = 0.0404762), S_ac(start = 0.0520021), S_acm(fixed = false), S_an(fixed = true, start = 0.0072), S_bu(start = 0.00836587), S_bum(fixed = false), S_ca(start = 0.000296306), S_cat(fixed = true, start = 0.00340943), S_ch4(start = 0.053897), S_co3(fixed = false), S_fa(start = 0.134095), S_gas_ch4(start = 1.52775), S_gas_co2(start = 0.0143493), S_gas_h2(start = 4.25722e-5), S_gas_nh3(start = 4.06451e-7), S_h(fixed = false), S_h2(start = 9.39812e-7), S_h2po4(fixed = false), S_hco3(fixed = false), S_hpo4(fixed = false), S_i(start = 0.0466531), S_ic(start = 0.0687574), S_in(start = 0.0752701), S_ip(start = 0.00753641), S_mg(start = 0.000203301), S_nh3(fixed = false), S_po4(fixed = false), S_pro(start = 0.0411581), S_prom(fixed = false), S_su(start = 0.0525503), S_va(start = 0.00625806), S_vam(fixed = false), V_gas = 300, X_aa(start = 0.449969), X_ac(start = 0.626662), X_acp(start = 0.00223456), X_c4(start = 0.196025), X_ccm(start = 1e-37), X_ch(start = {0, 1.46853, 0}), X_fa(start = 0.458134), X_h2(start = 0.302821), X_i(start = 12.332), X_li(start = 2.0589), X_p(start = 0.0786126), X_pr(start = {0, 2.14312}), X_pro(start = 0.0934595), X_stru(start = 0.0127967), X_su(start = 0.61859), ideality = false, k_dis = 1.2, multihyd = false, noXc = true, precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 43000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 73000, strict = false, xi_start = 1870.14, yMax = 10000, yMin = 0, y_start = 2805.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 308.15; 732, 308.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec(f_ch_xc = 0.3, f_li_xc = 0.05, f_pr_xc = 0.25, f_xi_xc = 0.3, nW = nW) annotation(
      Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Direct inflow(aa = 0.008, ac = 0.027, an = 0.0072, bu = 0.002, ca = 0.007, cat = 0.0034, ch4 = 0.00001, fa = 0, h2 = 0.00000001, inputpH = false, mg = 0.013, ortop = 713, ph = 7.2, pro = 0.01, si = 0.027, steady = true, su = 0.016, tan = 700, tic = 384, va = 0.002, xch = 9.082, xi = 12.332, xli = 12.768, xpr = 9.543) annotation(
      Placement(visible = true, transformation(origin = {-54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Input_Flores.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 190; 732, 190], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-170, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Sine sine1(amplitude = 0, f = 1e-8, offset = 190, startTime = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-152, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp(duration = 4000000, height = -189.9, offset = 190, startTime = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-178, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Calibration.sampler_with_oclk sampler_with_oclk(Ts(displayUnit = "Ms") = 2000000, n = 4) annotation(
      Placement(visible = true, transformation(origin = {126, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//  Feed1.y[1] = feed1.Flow_in;
//  Feed1.y[2] = feed1.Xi_in;
//  Feed1.y[3] = feed1.Xh2_in;
//  Feed2.y[1] = feed2.Flow_in;
//  Feed2.y[2] = feed2.Xi_in;
//  Feed2.y[3] = feed2.Xh2_in;
//
//  pH_batch_.Q = sludge_Discharge_stream.Digestate_In.Q;
//  pH_batch_.S_ip = pH_batch_.In[2];
//  pH_batch_.S_ic = pH_batch_.In[3];
//  pH_batch_.S_in = pH_batch_.In[4];
//  pH_batch_.S_va = pH_batch_.In[5];
//  pH_batch_.S_bu = pH_batch_.In[6];
//  pH_batch_.S_pro = pH_batch_.In[7];
//  pH_batch_.S_ac = pH_batch_.In[8];
//  pH_batch_.S_cat = pH_batch_.In[9];
//  pH_batch_.S_an = pH_batch_.In[10];
//  pH_batch_.S_ca = pH_batch_.In[11];
//  pH_batch_.S_mg = pH_batch_.In[12];
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, inflow.T_op) annotation(
      Line(points = {{-94, -74}, {-68, -74}, {-68, -28}, {-61, -28}}, color = {0, 0, 127}));
    connect(inflow.outlet, digester.inlet) annotation(
      Line(points = {{-45, -29}, {12, -29}, {12, 22}, {28, 22}}));
    connect(digester.outlet, sink_vec.inlet) annotation(
      Line(points = {{56, 2}, {76, 2}, {76, 0}}));
    connect(combiTimeTable1.y, inflow.inlet) annotation(
      Line(points = {{-210, 6}, {-210, -24}, {-61, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(step.y, PID_Pgas.u_m) annotation(
      Line(points = {{-44, 50}, {-6, 50}, {-6, 60}}, color = {0, 0, 127}));
    connect(timeTable2.y, inflow.Q) annotation(
      Line(points = {{-158, 26}, {-62, 26}, {-62, -26}}, color = {0, 0, 127}));
    connect(sink_vec.y[1:end], sampler_with_oclk.u[1:end]) annotation(
      Line(points = {{96, 0}, {114, 0}, {114, -28}}, color = {0, 0, 127}, thickness = 0.5));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=dumpLoops",
      __OpenModelica_simulationFlags(lv = "LOG_NLS_HOMOTOPY,LOG_NLS_NEWTON_DIAG,LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram);
  end Flores;

  model SAntonio_double
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = (1527 - 1350)*2, V_liq = 1350*2, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 150, multihyd = true, noXc = true, precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Ti = 37537, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 120000, strict = false, yMax = 30000, yMin = 0, y_start = 1500) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 316.15; 732, 316.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec1(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {136, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable5(table = [0, 280.15; 160, 300.15; 190, 300.15; 365, 280; 525, 300; 555, 300; 732, 280.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {58, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable6(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {82, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Digester postidigester(I(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 1.6*706.5*(6 - 4.5), V_liq = 706.5*4.5, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, multihyd = true, noXc = true, precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {96, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 120000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 37537, strict = false, yMax = 10000, yMin = 0, y_start = 1500) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 300, offset = 1400, startTime(displayUnit = "ks") = 86400*20) annotation(
      Placement(visible = true, transformation(origin = {180, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Recycle recycle(recycledQ = 100) annotation(
      Placement(visible = true, transformation(origin = {58, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_NIR maize(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, liquid = false, steady = false, tan = 764) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_NIR slurry(an = 0.02, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, liquid = true, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_Manure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 12.8; 732, 12.8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_CattleSlurry_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 37; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_NIR manure(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, liquid = false, ortop = 441, steady = false, tan = 520) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 130; 732, 130], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//  Feed1.y[1] = feed1.Flow_in;
//  Feed1.y[2] = feed1.Xi_in;
//  Feed1.y[3] = feed1.Xh2_in;
//  Feed2.y[1] = feed2.Flow_in;
//  Feed2.y[2] = feed2.Xi_in;
//  Feed2.y[3] = feed2.Xh2_in;
//
//  pH_batch_.Q = sludge_Discharge_stream.Digestate_In.Q;
//  pH_batch_.S_ip = pH_batch_.In[2];
//  pH_batch_.S_ic = pH_batch_.In[3];
//  pH_batch_.S_in = pH_batch_.In[4];
//  pH_batch_.S_va = pH_batch_.In[5];
//  pH_batch_.S_bu = pH_batch_.In[6];
//  pH_batch_.S_pro = pH_batch_.In[7];
//  pH_batch_.S_ac = pH_batch_.In[8];
//  pH_batch_.S_cat = pH_batch_.In[9];
//  pH_batch_.S_an = pH_batch_.In[10];
//  pH_batch_.S_ca = pH_batch_.In[11];
//  pH_batch_.S_mg = pH_batch_.In[12];
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(digester.outlet, postidigester.inlet) annotation(
      Line(points = {{56, 2}, {80, 2}, {80, 24}, {88, 24}}));
    connect(postidigester.outlet, sink_vec1.inlet) annotation(
      Line(points = {{104, 14}, {126, 14}, {126, -10}}));
    connect(timeTable1.y, postidigester.T_op) annotation(
      Line(points = {{-30, -78}, {88, -78}, {88, 14}}, color = {0, 0, 127}));
    connect(postidigester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{100, 28}, {82, 28}, {82, 52}, {50, 52}}));
    connect(limPID.u_s, postidigester.P_gas) annotation(
      Line(points = {{118, 54}, {94, 54}, {94, 30}}, color = {0, 0, 127}));
    connect(limPID.y, postidigester.u) annotation(
      Line(points = {{142, 54}, {160, 54}, {160, 30}, {96, 30}}, color = {0, 0, 127}));
    connect(step1.y, PID_Pgas.u_m) annotation(
      Line(points = {{-36, 86}, {-32, 86}, {-32, 42}, {-6, 42}, {-6, 60}}, color = {0, 0, 127}));
    connect(step1.y, limPID.u_m) annotation(
      Line(points = {{-36, 86}, {-30, 86}, {-30, 38}, {130, 38}, {130, 42}}, color = {0, 0, 127}));
    connect(postidigester.outlet, recycle.inlet) annotation(
      Line(points = {{104, 14}, {100, 14}, {100, -18}, {70, -18}}));
    connect(timeTable2.y, maize.Q) annotation(
      Line(points = {{-103, -20}, {-103, -34}, {-85, -34}, {-85, -52}}, color = {0, 0, 127}));
    connect(timeTable.y, manure.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(timeTable.y, maize.T_op) annotation(
      Line(points = {{-94, -74}, {-85, -74}, {-85, -54}}, color = {0, 0, 127}));
    connect(timeTable.y, slurry.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(combiTimeTable2.y, manure.inlet) annotation(
      Line(points = {{-151, 60}, {-83, 60}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable.y, slurry.inlet) annotation(
      Line(points = {{-153, 12}, {-83, 12}, {-83, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable4.y, manure.Q) annotation(
      Line(points = {{-103, 82}, {-103, 44}, {-83, 44}}, color = {0, 0, 127}));
    connect(combiTimeTable1.y, maize.inlet) annotation(
      Line(points = {{-155, -40}, {-85, -40}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable3.y, slurry.Q) annotation(
      Line(points = {{-101, 32}, {-101, 18}, {-83, 18}, {-83, 0}}, color = {0, 0, 127}));
    connect(manure.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {-46, 42}, {-46, 22}, {28, 22}}));
    connect(slurry.outlet, digester.inlet) annotation(
      Line(points = {{-68, -2}, {28, -2}, {28, 22}}));
    connect(maize.outlet, digester.inlet) annotation(
      Line(points = {{-70, -54}, {28, -54}, {28, 22}}));
    connect(recycle.outlet, digester.inlet) annotation(
      Line(points = {{50, -18}, {28, -18}, {28, 22}}));
    annotation(
      experiment(StartTime = 0, StopTime = 3.1536e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end SAntonio_double;

  model BSM2_multiple
    parameter Integer nXin = 30;
    //extends ADM1_P.Simulation_conditions(nW=2);
    parameter Integer nW = 3;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    Flores Normal annotation(
      Placement(visible = true, transformation(origin = {-64, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Flores mod(timeTable2(table = [0, 95; 732, 95]), inflow.xch = 18, inflow.xpr = 19, inflow.xli = 24, inflow.xi = 24) annotation(
      Placement(visible = true, transformation(origin = {36, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+06, Tolerance = 1e-09, Interval = 50.0002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end BSM2_multiple;

  model Test_MPP
    extends ADM1_P.ParametersADM1_physiochemical;
    extends ADM1_P.ParametersADM1_operational;
    ADM1_P.BlockLibrary.Decomposed.MPP_input mPP_input(precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {6, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter Real S_ic_start = 384/1000/12;
    parameter Real S_in_start = 700/1000/14;
    parameter Real S_ip_start = 713/1000/31;
    parameter Real S_ca_start = 0.007;
    parameter Real S_mg_start = 0.013;
    parameter Real S_cat_start = 1e-10;
    parameter Real S_an_start = 0.0045;
    Types.MolarDensity_M S_ca(fixed = true, start = S_ca_start, nominal = 1e-40);
    Types.MolarDensity_M S_ic(fixed = true, start = S_ic_start, nominal = 1e-40);
    Types.MolarDensity_M S_mg(fixed = true, start = S_mg_start, nominal = 1e-40);
    Types.MolarDensity_M S_ip(fixed = true, start = S_ip_start, nominal = 1e-40);
    Types.MolarDensity_M S_in(fixed = true, start = S_in_start, nominal = 1e-40);
    Types.MolarDensity_M S_va(fixed = true, start = 0.002, nominal = 1e-40);
    Types.MolarDensity_M S_bu(fixed = true, start = 0.002, nominal = 1e-40);
    Types.MolarDensity_M S_pro(fixed = true, start = 0.01, nominal = 1e-40);
    Types.MolarDensity_M S_ac(fixed = true, start = 0.027, nominal = 1e-40);
    Types.MolarDensity_M S_cat(fixed = true, start = S_cat_start, nominal = 1e-40);
    Types.MolarDensity_M S_an(fixed = true, start = S_an_start, nominal = 1e-40);
    Real T_op;
    Real Q;
    Types.MolConcRate rp1(nominal = 1e-40) "mol/L*d";
    Types.MolConcRate rp2(nominal = 1e-40) "mol/L*d";
    Types.MolConcRate rd1(nominal = 1e-40) "mol/L*d";
    Types.MolConcRate rd2(nominal = 1e-40) "mol/L*d";
    Types.MolConcRate rp3(nominal = 1e-40) "mol/L*d";
    Types.MolConcRate rd3(nominal = 1e-40) "mol/L*d";
    BlockLibrary.Decomposed.pH_batch_input PH(I(fixed = false, start = 0.12), S_h(fixed = true, start = 7e-8), a_h(fixed = false, start = 7e-10), g_mono(fixed = false, start = 0.76), ideality = true) annotation(
      Placement(visible = true, transformation(origin = {2, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//PH.Q = Q;
    PH.T_op = T_op;
    PH.S_ip = S_ip;
    PH.S_ic = S_ic;
    PH.S_in = S_in;
    PH.S_va = S_va;
    PH.S_bu = S_bu;
    PH.S_pro = S_pro;
    PH.S_ac = S_ac;
    PH.S_cat = S_cat;
    PH.S_an = S_an;
    PH.S_ca = S_ca;
    PH.S_mg = S_mg;
//
    mPP_input.a_ca = PH.a_ca;
    mPP_input.a_co3 = PH.a_co3;
    mPP_input.a_mg = PH.a_mg;
    mPP_input.a_po4 = PH.a_po4;
    mPP_input.a_nh4 = PH.a_nh4;
    mPP_input.T_op = PH.T_op;
    mPP_input.Q = Q;
    mPP_input.rp1 = rp1;
    mPP_input.rp2 = rp2;
    mPP_input.rp3 = rp3;
    mPP_input.rd1 = rd1;
    mPP_input.rd2 = rd2;
    mPP_input.rd3 = rd3;
//  24*3600*der(a_ca) = Q/V_liq*0.007 - 3*rp1*24*60 + 3*rd1*24*60 - rp3*24*60 + rd3*24*60;
//  24*3600*der(a_co3) = Q/V_liq*0.001 - rp3*24*60 + rd3*24*60;
//  24*3600*der(a_mg) = Q/V_liq*0.013 - rp2*24*60 + rd2*24*60;
//  24*3600*der(a_po4) = Q/V_liq*3.8e-5 - rp2*24*60 - 2*rp1*24*60 + rd2*24*60 + 2*rd1*24*60;
//  24*3600*der(a_nh4) = Q/V_liq*0.1 - rp2*24*60 + rd2*24*60;
    24*3600*der(S_ca) = Q/V_liq*(S_ca_start - S_ca) - 3*rp1*24*60 + 3*rd1*24*60 - rp3*24*60 + rd3*24*60;
    24*3600*der(S_ic) = Q/V_liq*(S_ic_start - S_ic) - rp3*24*60 + rd3*24*60;
    24*3600*der(S_mg) = Q/V_liq*(S_mg_start - S_mg) - rp2*24*60 + rd2*24*60;
    24*3600*der(S_ip) = Q/V_liq*(S_ip_start - S_ip) - rp2*24*60 - 2*rp1*24*60 + rd2*24*60 + 2*rd1*24*60;
    24*3600*der(S_in) = Q/V_liq*(S_in_start - S_in) - rp2*24*60 + rd2*24*60;
    24*3600*der(S_cat) = Q/V_liq*(S_cat_start - S_cat);
    24*3600*der(S_an) = Q/V_liq*(S_an_start - S_an);
    24*3600*der(S_va) = Q/V_liq*(0.002 - S_va);
    24*3600*der(S_pro) = Q/V_liq*(0.01 - S_pro);
    24*3600*der(S_bu) = Q/V_liq*(0.002 - S_bu);
    24*3600*der(S_ac) = Q/V_liq*(0.027 - S_ac);
    T_op = 25 + 273.15;
    Q = 0;
    annotation(
      experiment(StartTime = 0, StopTime = 6e+07, Tolerance = 1e-06, Interval = 1000),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_STATS", s = "dassl"));
  end Test_MPP;

  model Batch
    parameter Integer nXin = 22;
    parameter Integer nW = 3;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Batch_ digester(S_h(fixed = true, start = 7.17353e-8), X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, multihyd = false, nW = nW, noXc = true, open = false, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {8, 26}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 308.15; 732, 308.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//  Feed1.y[1] = feed1.Flow_in;
//  Feed1.y[2] = feed1.Xi_in;
//  Feed1.y[3] = feed1.Xh2_in;
//  Feed2.y[1] = feed2.Flow_in;
//  Feed2.y[2] = feed2.Xi_in;
//  Feed2.y[3] = feed2.Xh2_in;
//
//  pH_batch_.Q = sludge_Discharge_stream.Digestate_In.Q;
//  pH_batch_.S_ip = pH_batch_.In[2];
//  pH_batch_.S_ic = pH_batch_.In[3];
//  pH_batch_.S_in = pH_batch_.In[4];
//  pH_batch_.S_va = pH_batch_.In[5];
//  pH_batch_.S_bu = pH_batch_.In[6];
//  pH_batch_.S_pro = pH_batch_.In[7];
//  pH_batch_.S_ac = pH_batch_.In[8];
//  pH_batch_.S_cat = pH_batch_.In[9];
//  pH_batch_.S_an = pH_batch_.In[10];
//  pH_batch_.S_ca = pH_batch_.In[11];
//  pH_batch_.S_mg = pH_batch_.In[12];
//
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {-5, -78}, {-5, 15}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 8.64e+06, Tolerance = 1e-06, Interval = 100),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Batch;

  model Sgo
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    Real Sample_time = 86400*11;
    Real delta_prova = 86400*10;
    //  ADM1_P.BlockLibrary.Digester digester(X_su_start = 0.156028,
    //X_aa_start = 0.435487,
    //X_fa_start = 0.273309,
    //X_c4_start = 0.175828,
    //X_pro_start = 0.0599003,
    //X_ac_start = 0.431741,
    //X_h2_start = 0.175683,
    //X_c_start = 0.291302,
    //X_i_start = 10.8967,
    //X_ch_start = {1.02655e-67,0.229839,0.000260655},
    //X_pr_start = {6.05665e-68,1.33439},
    //X_li_start = 1.27877,
    //X_p_start = 0.487235,
    //S_i_start = 0.0154883,
    //S_su_start = 0.0393944,
    //S_aa_start = 0.0415751,
    //S_fa_start = 0.146442,
    //S_va_start = 0.0065279,
    //S_bu_start = 0.0073302,
    //S_pro_start = 0.0393866,
    //S_ac_start = 0.0462823,
    //S_h2_start = 9.716e-07,
    //S_ch4_start = 0.0395999,
    //S_ic_start = 0.0978747,
    //S_in_start = 0.0486144,
    //S_ip_start = 0.0041804,
    //S_cat_start = 0.105552,
    //S_ca_start = 6.80009e-06,
    //S_mg_start = 7.20234e-06,
    //S_an_start = 0.061095,
    //ash_start = 7.86867,
    //X_lig_start = 0.266717,
    //S_gas_h2_start = 4.5979e-05,
    //S_gas_ch4_start = 1.18341,
    //S_gas_co2_start = 0.0197639,
    //S_gas_nh3_start = 2.89279e-07,
    //X_acp_start = 1.98538e-19,
    //X_stru_start = -4.81656e-20,
    //X_ccm_start = -4.07459e-15,
    //X_mag_start = 716434e-12,
    //f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester digester(X_su_start = 0.156028, X_aa_start = 0.435487, X_fa_start = 0.273309, X_c4_start = 0.175828, X_pro_start = 0.0599003, X_ac_start = 0.431741, X_h2_start = 0.175683, X_c_start = 0.291302, X_i_start = 10.8967, X_ch_start = {1.02655e-67, 0.229839, 0.000260655}, X_pr_start = {6.05665e-68, 1.33439}, X_li_start = 1.27877, X_p_start = 0.487235, S_i_start = 0.0154883, S_su_start = 0.0393944, S_aa_start = 0.0415751, S_fa_start = 0.146442, S_va_start = 0.0065279, S_bu_start = 0.0073302, S_pro_start = 0.0393866, S_ac_start = 0.0462823, S_h2_start = 9.716e-07, S_ch4_start = 0.0395999, S_ic_start = 0.0978747, S_in_start = 0.0486144, S_ip_start = 0.0041804, S_cat_start = 0.105552, S_ca_start = 6.80009e-06, S_mg_start = 7.20234e-06, S_an_start = 0.061095, ash_start = 7.86867, X_lig_start = 0.266717, S_gas_h2_start = 4.5979e-05, S_gas_ch4_start = 1.18341, S_gas_co2_start = 0.0197639, S_gas_nh3_start = 2.89279e-07, X_acp_start = 1.98538e-19, X_stru_start = -4.81656e-20, X_ccm_start = -4.07459e-15, X_mag_start = 716434e-12, V_gas = 0.077 - 0.051, V_liq = 0.051, f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    //  ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Td = 0.1, Ti = 11000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 11, strict = false, xi_start = 0.00303443, yMax = 10000, yMin = 0, y_start = 0.29) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci feed_Source_Ari(COD_VS_CH = 32*6/180, COD_VS_LI = 2.9, COD_VS_PR = 1.42, TKN = true, an = 0.04, f_ch_xc = 0.2, f_ch_xi = 0.25, f_li_xc = 0.3, f_pr_xc = 0.3, f_si_xc = 0.0, f_xi_xc = 0.2, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sludge_dynamic.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-78, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-116, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci feed_Source_Ari_vec_(COD_VS_CH = 32*6/180, COD_VS_LI = 2.9, COD_VS_PR = 1.42, TKN = false, an = 0.04, f_Xc_in = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable3(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed2_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-144, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable5(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/yogurt.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-142, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Batch_ batch(S_aa_start = 0.0, S_ac_start = 0.0, S_an_start = 0.0401246, S_bu_start = 0.0, S_ca_start = 3.34468e-05, S_cat_start = 0.0878918, S_ch4_start = 0.0, S_fa_start = 0.0, S_gas_ch4_start = 0.0, S_gas_co2_start = 0.0, S_gas_h2_start = 0.0, S_gas_nh3_start = 0.0, S_h2_start = 0.0, S_i_start = 0.0, S_ic_start = 0.104869, S_in_start = 0.0502896, S_ip_start = 0.00285736, S_mg_start = 5.67098e-05, S_pro_start = 0.0, S_su_start = 0.0, S_va_start = 0.0, V_gas = 100/1e6, V_liq = 800.04/1e6, X_aa_start = 0.0, X_ac_start = 0.0, X_acp_start = 3.18652e-18, X_c4_start = 0.0, X_c_start = 0.0, X_ccm_start = 7.41794e-16, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0.0, X_h2_start = 0.0, X_i_start = 0.0, X_li_start = 0.0, X_lig_start = 0.0, X_mag_start = 3.80165e-11, X_p_start = 0.0, X_pr_start = {0.0, 0.0}, X_pro_start = 0.0, X_stru_start = 2.46417e-18, X_su_start = 0, ash_start = 0.0, ideality = false, k_dis = 0.5, k_hyd_xprs = 0.3, kla = 13, multihyd = false, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant temperature(k = 37 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {28, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant temperature_feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-144, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable acetato(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/Acetato_20220401_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 11*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-116, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//Calculation of batch (re)initial conditions
    batch.Xsu_restart = digester.X_su*batch.V_inoculum/batch.V_liq;
    batch.Xaa_restart = digester.X_aa*batch.V_inoculum/batch.V_liq;
    batch.Xfa_restart = digester.X_fa*batch.V_inoculum/batch.V_liq;
    batch.Xc4_restart = digester.X_c4*batch.V_inoculum/batch.V_liq;
    batch.Xpro_restart = digester.X_pro*batch.V_inoculum/batch.V_liq;
    batch.Xac_restart = digester.X_ac*batch.V_inoculum/batch.V_liq;
    batch.Xh2_restart = digester.X_h2*batch.V_inoculum/batch.V_liq;
    batch.Xc_restart = digester.X_c*batch.V_inoculum/batch.V_liq;
    batch.Xi_restart = digester.X_i*batch.V_inoculum/batch.V_liq;
    batch.Xch_restart = digester.X_ch*batch.V_inoculum/batch.V_liq;
    batch.Xpr_restart = digester.X_pr*batch.V_inoculum/batch.V_liq;
    batch.Xli_restart = digester.X_li*batch.V_inoculum/batch.V_liq;
    batch.Xp_restart = digester.X_p*batch.V_inoculum/batch.V_liq;
    batch.Si_restart = digester.S_i*batch.V_inoculum/batch.V_liq;
    batch.Ssu_restart = digester.S_su*batch.V_inoculum/batch.V_liq;
    batch.Saa_restart = digester.S_su*batch.V_inoculum/batch.V_liq;
    batch.Sfa_restart = digester.S_fa*batch.V_inoculum/batch.V_liq;
    batch.Sva_restart = digester.S_va*batch.V_inoculum/batch.V_liq;
    batch.Sbu_restart = digester.S_bu*batch.V_inoculum/batch.V_liq;
    batch.Spro_restart = digester.S_pro*batch.V_inoculum/batch.V_liq;
    batch.Sac_restart = (digester.S_ac*batch.V_inoculum + 1.488/1000)/batch.V_liq;
//batch.Sac_restart = (digester.S_ac*batch.V_inoculum)/batch.V_liq;
    batch.Sh2_restart = digester.S_h2*batch.V_inoculum/batch.V_liq;
    batch.Sch4_restart = digester.S_ch4*batch.V_inoculum/batch.V_liq;
    batch.Sic_restart = (digester.S_ic*batch.V_inoculum + 0.00860234*batch.V_water)/batch.V_liq;
    batch.Sin_restart = digester.S_in*batch.V_inoculum/batch.V_liq;
    batch.Sip_restart = digester.S_ip*batch.V_inoculum/batch.V_liq;
    batch.Scat_restart = (digester.S_cat*batch.V_inoculum + 0.008088*batch.V_water)/batch.V_liq;
    batch.Sca_restart = digester.S_ca*batch.V_inoculum/batch.V_liq;
    batch.Smg_restart = digester.S_mg*batch.V_inoculum/batch.V_liq;
    batch.San_restart = digester.S_an*batch.V_inoculum/batch.V_liq;
    batch.ash_restart = digester.ash*batch.V_inoculum/batch.V_liq;
    batch.Xlig_restart = digester.X_lig*batch.V_inoculum/batch.V_liq;
//Not used, to be erased
    batch.Sgas_h2_restart = digester.S_gas_h2*batch.V_inoculum/batch.V_liq;
    batch.Sgas_ch4_restart = digester.S_gas_ch4*batch.V_inoculum/batch.V_liq;
    batch.Sgas_co2_restart = digester.S_gas_co2*batch.V_inoculum/batch.V_liq;
    batch.Sgas_nh3_restart = digester.S_gas_nh3*batch.V_inoculum/batch.V_liq;
//Reinitialization of batch test
    when time > Sample_time then
      reinit(batch.X_su, batch.Xsu_restart);
      reinit(batch.X_aa, batch.Xaa_restart);
      reinit(batch.X_fa, batch.Xfa_restart);
      reinit(batch.X_c4, batch.Xc4_restart);
      reinit(batch.X_pro, batch.Xpro_restart);
      reinit(batch.X_ac, batch.Xac_restart);
      reinit(batch.X_h2, batch.Xh2_restart);
      reinit(batch.X_c, batch.Xc_restart);
      reinit(batch.X_i, batch.Xi_restart);
      reinit(batch.X_ch, batch.Xch_restart);
      reinit(batch.X_pr, batch.Xpr_restart);
      reinit(batch.X_li, batch.Xli_restart);
      reinit(batch.X_p, batch.Xp_restart);
      reinit(batch.S_i, batch.Si_restart);
      reinit(batch.S_su, batch.Ssu_restart);
      reinit(batch.S_aa, batch.Saa_restart);
      reinit(batch.S_fa, batch.Sfa_restart);
      reinit(batch.S_va, batch.Sva_restart);
      reinit(batch.S_bu, batch.Sbu_restart);
      reinit(batch.S_pro, batch.Spro_restart);
      reinit(batch.S_ac, batch.Sac_restart);
      reinit(batch.S_h2, batch.Sh2_restart);
      reinit(batch.S_ch4, batch.Sch4_restart);
      reinit(batch.S_ic, batch.Sic_restart);
      reinit(batch.S_in, batch.Sin_restart);
      reinit(batch.S_ip, batch.Sip_restart);
      reinit(batch.S_cat, batch.Scat_restart);
      reinit(batch.S_ca, batch.Sca_restart);
      reinit(batch.S_mg, batch.Smg_restart);
      reinit(batch.S_an, batch.San_restart);
      reinit(batch.ash, batch.ash_restart);
      reinit(batch.X_lig, batch.Xlig_restart);
//    reinit(batch.S_gas_h2, batch.Sgas_h2_restart);
//    reinit(batch.S_gas_ch4, batch.Sgas_ch4_restart);
//    reinit(batch.S_gas_co2, batch.Sgas_co2_restart);
//    reinit(batch.S_gas_nh3, batch.Sgas_nh3_restart);
    end when;
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(feed_Source_Ari.outlet, digester.inlet) annotation(
      Line(points = {{-51, -31}, {12, -31}, {12, 22}, {28, 22}}));
    connect(digester.outlet, sink_vec.inlet) annotation(
      Line(points = {{56, 2}, {76, 2}, {76, 0}}));
    connect(Input_CattleSlurry.y, feed_Source_Ari.inlet) annotation(
      Line(points = {{-102, -20}, {-68, -20}, {-68, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable3.y[1], feed_Source_Ari_vec_.Q) annotation(
      Line(points = {{-132, 6}, {-68, 6}, {-68, 2}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable5.y, feed_Source_Ari_vec_.inlet) annotation(
      Line(points = {{-130, 26}, {-68, 26}, {-68, 2}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source_Ari_vec_.outlet, digester.inlet) annotation(
      Line(points = {{-52, 0}, {4, 0}, {4, 22}, {28, 22}}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(combiTimeTable1.y[1], feed_Source_Ari.Q) annotation(
      Line(points = {{-104, -40}, {-68, -40}, {-68, -28}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable.y[1], PID_Pgas.u_m) annotation(
      Line(points = {{-66, 40}, {-6, 40}, {-6, 60}}, color = {0, 0, 127}));
    connect(temperature.y, batch.T_op) annotation(
      Line(points = {{40, -68}, {124, -68}, {124, 20}}, color = {0, 0, 127}));
    connect(temperature.y, digester.T_op) annotation(
      Line(points = {{40, -68}, {28, -68}, {28, 4}}, color = {0, 0, 127}));
    connect(temperature_feed.y, feed_Source_Ari.T_op) annotation(
      Line(points = {{-132, -70}, {-68, -70}, {-68, -30}}, color = {0, 0, 127}));
    connect(temperature_feed.y, feed_Source_Ari_vec_.T_op) annotation(
      Line(points = {{-132, -70}, {-68, -70}, {-68, 0}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 8.4672e+06, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Sgo;

  model SAntonio
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), S_h(fixed = false, start = 7.17353e-8), V_gas = (1527 - 1350)*2 + 1.6*706.5*(6 - 4.5), V_liq = 1350*2 + 706.5*4.5, ideality = false, k_dis = 1.2, k_m_ac = 5.6, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 150, multihyd = true, noXc = true, precipitation = true, X_su_start = 3.04574, X_aa_start = 0.676713, X_fa_start = 0.340877, X_c4_start = 0.557882, X_pro_start = 0.364899, X_ac_start = 1.54797, X_h2_start = 0.727122, X_c_start = 6.67249e-31, X_i_start = 37.9831, X_ch_start = {1.16131, 0.953183, 14.2649}, X_pr_start = {0.212074, 1.19624}, X_li_start = 1.01542, X_p_start = 0.592068, S_i_start = 0.148017, S_su_start = 0.0298359, S_aa_start = 0.0316045, S_fa_start = 0.0565356, S_va_start = 0.00462295, S_bu_start = 0.0083791, S_pro_start = 0.0653043, S_ac_start = 0.390935, S_h2_start = 8.29422e-07, S_ch4_start = 0.0571826, S_ic_start = 0.230907, S_in_start = 0.144649, S_ip_start = 0.00477577, S_cat_start = 0.112651, S_ca_start = 3.19958e-05, S_mg_start = 5.45205e-05, S_an_start = 0.0144606, ash_start = 19.6506, X_lig_start = 14.4374, S_gas_h2_start = 2.85625e-05, S_gas_ch4_start = 1.27507, S_gas_co2_start = 0.0164602, S_gas_nh3_start = 3.42815e-06, X_acp_start = 0, X_stru_start = 0.0093448, X_ccm_start = 0.00502918, X_mag_start = 0) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 42 + 273.15; 732, 42 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR maize(tan = 764, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 37; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sAntonio_CattleSlurry_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 130; 732, 130], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR slurry(an = 0.02, nW = nW, nXin = nXin, steady = false, liquid = true) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 12.8; 732, 12.8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR manure(tan = 520, ortop = 441, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sAntonio_Manure_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec1(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {136, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable5(table = [0, 280.15; 160, 300.15; 190, 300.15; 365, 280; 525, 300; 555, 300; 732, 280.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {58, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable6(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {82, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 300, offset = 13231, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {40, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 43200, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 73000, strict = false, xi_start = 0.162259, yMax = 20000, yMin = 0, y_start = 13000) annotation(
      Placement(visible = true, transformation(origin = {8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable7(table = [0, 0; 150, 37; 240, 0; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-240, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable3(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sAntonio_TomatoPeels_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_TomatoPeels", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-268, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR tomatopeels(liquid = false, steady = false, tan = 764) annotation(
      Placement(visible = true, transformation(origin = {-204, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable8(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-232, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable4(extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 150, 37; 240, 0; 732, 37], tableOnFile = false, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-250, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable5(extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 37; 150, 0; 240, 37; 732, 37], tableOnFile = false, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-128, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step2(height = 2, offset = 12.8, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-148, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.Calibration.sampler_with_oclk sampler_with_oclk(Ts(displayUnit = "Ms") = 500000, n = 3) annotation(
      Placement(visible = true, transformation(origin = {170, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse(amplitude = 20, nperiod = 3, offset = 130, period(displayUnit = "Ms") = 1000000, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-222, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, maize.T_op) annotation(
      Line(points = {{-94, -74}, {-85, -74}, {-85, -54}}, color = {0, 0, 127}));
    connect(maize.outlet, digester.inlet) annotation(
      Line(points = {{-69, -55}, {12, -55}, {12, 22}, {28, 22}}));
    connect(combiTimeTable1.y, maize.inlet) annotation(
      Line(points = {{-155, -40}, {-85, -40}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable.y, slurry.inlet) annotation(
      Line(points = {{-153, 12}, {-83, 12}, {-83, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable2.y, manure.inlet) annotation(
      Line(points = {{-151, 60}, {-83, 60}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(manure.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {28, 42}, {28, 22}}));
    connect(slurry.outlet, digester.inlet) annotation(
      Line(points = {{-68, -2}, {28, -2}, {28, 22}}));
    connect(timeTable.y, slurry.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(timeTable.y, manure.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(digester.outlet, sink_vec1.inlet) annotation(
      Line(points = {{56, 2}, {126, 2}, {126, -10}}));
    connect(limPID.y, digester.u) annotation(
      Line(points = {{20, 68}, {42, 68}, {42, 30}}, color = {0, 0, 127}));
    connect(digester.P_gas, limPID.u_s) annotation(
      Line(points = {{40, 30}, {34, 30}, {34, 48}, {-14, 48}, {-14, 68}, {-4, 68}}, color = {0, 0, 127}));
    connect(step.y, limPID.u_m) annotation(
      Line(points = {{-36, 86}, {-24, 86}, {-24, 32}, {8, 32}, {8, 56}}, color = {0, 0, 127}));
    connect(timeTable8.y, tomatopeels.T_op) annotation(
      Line(points = {{-221, -34}, {-212, -34}, {-212, -14}}, color = {0, 0, 127}));
    connect(combiTimeTable3.y, tomatopeels.inlet) annotation(
      Line(points = {{-257, -8}, {-209, -8}, {-209, -12}, {-211, -12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable4.y[1], tomatopeels.Q) annotation(
      Line(points = {{-239, 38}, {-239, -12}, {-212, -12}}, color = {0, 0, 127}));
    connect(step2.y, manure.Q) annotation(
      Line(points = {{-136, 84}, {-84, 84}, {-84, 44}}, color = {0, 0, 127}));
    connect(tomatopeels.outlet, sink_vec1.inlet) annotation(
      Line(points = {{-196, -14}, {126, -14}, {126, -10}}));
    connect(timeTable2.y, maize.Q) annotation(
      Line(points = {{-102, -20}, {-86, -20}, {-86, -52}}, color = {0, 0, 127}));
    connect(Gas_Meter.y, sampler_with_oclk.u) annotation(
      Line(points = {{68, 52}, {158, 52}, {158, -32}}, color = {0, 0, 127}, thickness = 0.5));
    connect(pulse.y, slurry.Q) annotation(
      Line(points = {{-210, 68}, {-192, 68}, {-192, 0}, {-84, 0}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 3.1536e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram);
  end SAntonio;

  model Test_pH_ODE
    Modelica.Blocks.Sources.CombiTimeTable pH_Inputs(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_pH.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_pH", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-56, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Probe_T_ probe_T annotation(
      Placement(visible = true, transformation(origin = {-48, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 298.15; 732, 298.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-50, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Decomposed.pH_batch_ODE pH_ODE(S_acm(fixed = true, start = 0.067), S_bum(fixed = true, start = 0.022), S_co3(fixed = true, start = 6.6e-2), S_h(fixed = false, start = 5.6239e-8), S_h2po4(fixed = true, start = 1.5e-7), S_hco3(fixed = true, start = 8e-4), S_hpo4(fixed = true, start = 1.7e-2), S_nh3(fixed = true, start = 0.00064), S_nh4(fixed = false, start = 0.039780083), S_po4(fixed = true, start = 6.6e-3), S_prom(fixed = true, start = 0.067), S_vam(fixed = true, start = 0), ideality = true, k_AB_IN = 1e20, k_AB_IP = 1e10, k_AB_co2 = 1e20) annotation(
      Placement(visible = true, transformation(origin = {6, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Real T_op = 25 + 273.15;
  equation
    pH_ODE.Q = pH_Inputs.y[1];
    pH_ODE.T_op = T_op;
    pH_ODE.S_ip = pH_Inputs.y[2];
//pH_ODE.S_ip = 0;
//pH_ODE.S_ic = 0;
    pH_ODE.S_ic = pH_Inputs.y[3];
    pH_ODE.S_in = pH_Inputs.y[4];
    pH_ODE.S_va = pH_Inputs.y[5];
    pH_ODE.S_bu = pH_Inputs.y[6];
    pH_ODE.S_pro = pH_Inputs.y[7];
    pH_ODE.S_ac = pH_Inputs.y[8];
    pH_ODE.S_cat = pH_Inputs.y[9];
    pH_ODE.S_an = pH_Inputs.y[10];
    pH_ODE.S_ca = pH_Inputs.y[11];
    pH_ODE.S_mg = pH_Inputs.y[12];
//when time > 1 then
//reinit(pH_ODE.S_hco3,pH_batch_.S_hco3);
//end when;
//  Real Q = 190;
//  Real S_ip = 0.0245873 "0.0245876; non-ideal 0.0245873";
//  Real S_ic = 0.0681754 "0.0705643; 0.0681753";
//  Real S_in = 0.0638248 "0.0638276; 0.0638248";
//  Real S_va = 0.00566393 "0.00566393; 0.00566393";
//  Real S_bu = 0.00864898 "0.00864898; 0.00860289";
//  Real S_pro = 0.0411192 "0.0411192;";
//  Real S_ac = 0.0482464 "0.0601097; 0.0482464";
//  Real S_cat = -0.00451935 "";
//  Real S_an = 1.72667e-10 "3.4e-11; 1.72667e-10";
//  Real S_ca = 0.007 "";
//  Real S_mg = 0.013 "";
    connect(probe_T.inlet, timeTable1.y) annotation(
      Line(points = {{-56, -48}, {-38, -48}, {-38, -76}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 1000, Tolerance = 1e-09, Interval = 0.1),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_NLS_V,LOG_STATS", s = "dassl"));
  end Test_pH_ODE;

  model Flores_partial
    parameter Integer nXin = 22;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester_ digester(S_aa(start = 0.0404762), S_ac(start = 0.0520021), S_acm(fixed = false), S_an(fixed = true, start = 0.0072), S_bu(start = 0.00836587), S_bum(fixed = false), S_ca(start = 0.000296306), S_cat(fixed = true, start = 0.00340943), S_ch4(start = 0.053897), S_co3(fixed = false), S_fa(start = 0.134095), S_gas_ch4(start = 1.52775), S_gas_co2(start = 0.0143493), S_gas_h2(start = 4.25722e-5), S_gas_nh3(start = 4.06451e-7), S_h2(start = 9.39812e-7), S_h2po4(fixed = false), S_hco3(fixed = false), S_hpo4(fixed = false), S_i(start = 0.0466531), S_ic(start = 0.0687574), S_in(start = 0.0752701), S_ip(start = 0.00753641), S_mg(start = 0.000203301), S_nh3(fixed = false), S_po4(fixed = false), S_pro(start = 0.0411581), S_prom(fixed = false), S_su(start = 0.0525503), S_va(start = 0.00625806), S_vam(fixed = false), X_aa(start = 0.449969), X_ac(start = 0.626662), X_c4(start = 0.196025), X_ch(start = {0, 1.46853, 0}), X_fa(start = 0.458134), X_h2(start = 0.302821), X_i(start = 12.332), X_li(start = 2.0589), X_p(start = 0.0786126), X_pr(start = {0, 2.14312}), X_pro(start = 0.0934595), X_su(start = 0.61859), ideality = false, k_dis = 1.2, multihyd = false, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 43000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 73000, strict = false, xi_start = 1870.14, yMax = 10000, yMin = 0, y_start = 2805.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 308.15; 732, 308.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-105, -75}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec(f_ch_xc = 0.3, f_li_xc = 0.05, f_pr_xc = 0.25, f_xi_xc = 0.3, nW = nW) annotation(
      Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Direct feed_Source_Ari(inputpH = false, ph = 7.2, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 190; 732, 190], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-170, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Sine sine1(amplitude = 0, f = 1e-8, offset = 190, startTime = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-152, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-56, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp(duration = 4000000, height = -189.9, offset = 190, startTime = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-178, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, feed_Source_Ari.T_op) annotation(
      Line(points = {{-94, -74}, {-68, -74}, {-68, -28}, {-61, -28}}, color = {0, 0, 127}));
    connect(feed_Source_Ari.outlet, digester.inlet) annotation(
      Line(points = {{-45, -29}, {12, -29}, {12, 22}, {28, 22}}));
    connect(digester.outlet, sink_vec.inlet) annotation(
      Line(points = {{56, 2}, {76, 2}, {76, 0}}));
    connect(combiTimeTable1.y, feed_Source_Ari.inlet) annotation(
      Line(points = {{-210, 6}, {-210, -24}, {-61, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(step.y, PID_Pgas.u_m) annotation(
      Line(points = {{-44, 50}, {-6, 50}, {-6, 60}}, color = {0, 0, 127}));
    connect(timeTable2.y, feed_Source_Ari.Q) annotation(
      Line(points = {{-158, 26}, {-62, 26}, {-62, -26}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=dumpLoops",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS_HOMOTOPY,LOG_NLS_NEWTON_DIAG,LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram);
  end Flores_partial;

  model Test_separator
    Modelica.Blocks.Sources.CombiTimeTable timeTable(columns = integer({2}), smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = [0, 0.0035*86400; 732, 0.0035*86400], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-48, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {94, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/sludge_complete.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-64, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_Ari_vec_ feed_Source_Ari_vec_(Catenacci = true, Flores = false, S_an_in = 0.04, TKN = true, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nXin = 30, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-2, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.ScrewPress screwPress(eta_liq = 0.5) annotation(
      Placement(visible = true, transformation(origin = {42, 1}, extent = {{-20, -19}, {20, 19}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec solid annotation(
      Placement(visible = true, transformation(origin = {38, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Input_CattleSlurry.y, feed_Source_Ari_vec_.inlet[2:end]) annotation(
      Line(points = {{-53, -22}, {-10, -22}, {-10, -12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable.y[1], feed_Source_Ari_vec_.inlet[1]) annotation(
      Line(points = {{-37, -16}, {-26.5, -16}, {-26.5, -12}, {-10, -12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable1.y, feed_Source_Ari_vec_.T_op) annotation(
      Line(points = {{-94, -74}, {-10, -74}, {-10, -14}}, color = {0, 0, 127}));
    connect(feed_Source_Ari_vec_.outlet, screwPress.inlet) annotation(
      Line(points = {{6, -14}, {26, -14}}));
    connect(screwPress.solidoutlet, solid.inlet) annotation(
      Line(points = {{36, -16}, {34, -16}, {34, -32}, {18, -32}, {18, -50}, {28, -50}}));
    connect(screwPress.liquidoutlet, sink_vec.inlet) annotation(
      Line(points = {{58, 0}, {84, 0}, {84, -18}}));
  end Test_separator;

  model Sgo_SS
    parameter Integer nXin = 30;
    parameter Integer nW = 3;
    Real Xpr_start;
    Real Sample_time = 86400*11;
    Real delta_prova = 86400*10;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, k_hyd_xchm = 0.2, k_hyd_xli = 0.2, k_hyd_xprs = 0.15, kla = 80, multihyd = false, nW = nW, noXc = false, p_gas_ch4(fixed = true, start = 0.65), p_gas_co2(fixed = true), p_gas_h2(fixed = true), precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Ari_vec_ feed_Source_Ari(COD_VS_CH = 32*6/180, COD_VS_LI = 2.9, COD_VS_PR = 1.42, Carbonates_in = 0, Catenacci = true, Flores = false, S_an_in = 0.04, TKN = true, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.3, f_xi_xc = 0.2, nW = nW, nXin = nXin, other_cat_an = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 308.15; 732, 308.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {88, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Batch_ batch(S_h(fixed = true, start = 7.17353e-8), X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, multihyd = false, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 0.06; 732, 0.06], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-134, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable4(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/sludge_complete.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-204, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step2(height = 0.02, offset = 0.3, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {76, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Ti = 11000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.NoInit, k = 11, strict = false, xi_start = 0.026, yMax = 10000, yMin = 0, y_start = 0.29) annotation(
      Placement(visible = true, transformation(origin = {26, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step3(height = 0.02, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-52, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Xpr_start = digester.X_pr[2];
    when time == Sample_time then
      reinit(batch.X_pr[2], Xpr_start);
    end when;
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(feed_Source_Ari.outlet, digester.inlet) annotation(
      Line(points = {{-51, -31}, {12, -31}, {12, 22}, {28, 22}}));
    connect(digester.outlet, sink_vec.inlet) annotation(
      Line(points = {{56, 2}, {76, 2}, {76, 0}}));
    connect(timeTable.y, feed_Source_Ari.T_op) annotation(
      Line(points = {{-99, -70}, {-67, -70}, {-67, -30}}, color = {0, 0, 127}));
//connect(Input_CattleSlurry.y, feed_Source_Ari.inlet[2:end]) annotation(
//  Line(points = {{-102, -20}, {-68, -20}, {-68, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable3.y, batch.T_op) annotation(
      Line(points = {{99, -74}, {124, -74}, {124, 19}}, color = {0, 0, 127}));
    connect(timeTable2.y, feed_Source_Ari.inlet[1]) annotation(
      Line(points = {{-122, -62}, {-68, -62}, {-68, -28}}, color = {0, 0, 127}));
    connect(combiTimeTable4.y, feed_Source_Ari.inlet[2:end]) annotation(
      Line(points = {{-192, -24}, {-68, -24}, {-68, -28}}, color = {0, 0, 127}, thickness = 0.5));
    connect(limPID.y, digester.u) annotation(
      Line(points = {{38, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(digester.P_gas, limPID.u_s) annotation(
      Line(points = {{40, 30}, {14, 30}, {14, 72}}, color = {0, 0, 127}));
    connect(step3.y, limPID.u_m) annotation(
      Line(points = {{-40, 44}, {26, 44}, {26, 60}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 3e+07, Tolerance = 1e-06, Interval = 3601.44),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", iif = "C:/Users/lenovo/Desktop/init_Sgo_SS.mat", iit = "3e+07"));
  end Sgo_SS;

  model Flores_null
    parameter Integer nXin = 22;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), S_aa(start = 0.0404762), S_ac(start = 0.0520021), S_acm(fixed = false), S_an(fixed = true, start = 0.0072), S_bu(start = 0.00836587), S_bum(fixed = false), S_ca(start = 0.000296306), S_cat(fixed = true, start = 0.00340943), S_ch4(start = 0.053897), S_co3(fixed = false), S_fa(start = 0.134095), S_gas_ch4(start = 1.52775), S_gas_co2(start = 0.0143493), S_gas_h2(start = 4.25722e-5), S_gas_nh3(start = 4.06451e-7), S_h(fixed = false), S_h2(start = 9.39812e-7), S_h2po4(fixed = false), S_hco3(fixed = false), S_hpo4(fixed = false), S_i(start = 0.0466531), S_ic(start = 0.0687574), S_in(start = 0.0752701), S_ip(start = 0.00753641), S_mg(start = 0.000203301), S_nh3(fixed = false), S_po4(fixed = false), S_pro(start = 0.0411581), S_prom(fixed = false), S_su(start = 0.0525503), S_va(start = 0.00625806), S_vam(fixed = false), V_gas = 300, X_aa(start = 0.449969), X_ac(start = 0.626662), X_acp(start = 0.00223456), X_c4(start = 0.196025), X_ccm(start = 1e-37), X_ch(start = {0, 1.46853, 0}), X_fa(start = 0.458134), X_h2(start = 0.302821), X_i(start = 12.332), X_li(start = 2.0589), X_p(start = 0.0786126), X_pr(start = {0, 2.14312}), X_pro(start = 0.0934595), X_stru(start = 0.0127967), X_su(start = 0.61859), ideality = false, k_dis = 1.2, multihyd = false, noXc = true, precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    BlockLibrary.Probe_P Probe_P annotation(
      Placement(visible = true, transformation(origin = {-56, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 43000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 73000, strict = false, xi_start = 1870.14, yMax = 10000, y_start = 2805.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 308.15; 732, 308.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec(f_ch_xc = 0.3, f_li_xc = 0.05, f_pr_xc = 0.25, f_xi_xc = 0.3, nW = nW) annotation(
      Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Ari_vec_ feed_Source_Ari(nXin = nXin, Alk = 17500, Ammonium = 700, Ca = 0.007, Carbonates_in = 384, Catenacci = false, Flores = true, Fosfates = 713, Mg = 0.013, S_an_in = 0.0072, Saa = 0, Sfa = 0, Si = 0.027, Ssu = 0, TKN = true, TS = 90, Xch = {0, 0, 0}, Xi = 0, Xli = 0, Xpr = {0, 0}, ac = 0, bu = 0, other_cat_an = 0.021, pH = 7.2, pro = 0, steady = true, tBMP_VS = 0, va = 0, vs_ts = 85.5) annotation(
      Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2_vec.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 190; 732, 190], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-170, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Sine sine1(amplitude = 0, f = 1e-8, offset = 190, startTime = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-152, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp(duration = 4000000, height = -189.0, offset = 190, startTime = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-178, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//  Feed1.y[1] = feed1.Flow_in;
//  Feed1.y[2] = feed1.Xi_in;
//  Feed1.y[3] = feed1.Xh2_in;
//  Feed2.y[1] = feed2.Flow_in;
//  Feed2.y[2] = feed2.Xi_in;
//  Feed2.y[3] = feed2.Xh2_in;
//
//  pH_batch_.Q = sludge_Discharge_stream.Digestate_In.Q;
//  pH_batch_.S_ip = pH_batch_.In[2];
//  pH_batch_.S_ic = pH_batch_.In[3];
//  pH_batch_.S_in = pH_batch_.In[4];
//  pH_batch_.S_va = pH_batch_.In[5];
//  pH_batch_.S_bu = pH_batch_.In[6];
//  pH_batch_.S_pro = pH_batch_.In[7];
//  pH_batch_.S_ac = pH_batch_.In[8];
//  pH_batch_.S_cat = pH_batch_.In[9];
//  pH_batch_.S_an = pH_batch_.In[10];
//  pH_batch_.S_ca = pH_batch_.In[11];
//  pH_batch_.S_mg = pH_batch_.In[12];
//
    connect(Probe_P.y_P, PID_Pgas.u_m) annotation(
      Line(points = {{-46, 72}, {-42, 72}, {-42, 50}, {-6, 50}, {-6, 60}}, color = {0, 0, 127}));
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, feed_Source_Ari.T_op) annotation(
      Line(points = {{-94, -74}, {-68, -74}, {-68, -26}}, color = {0, 0, 127}));
    connect(feed_Source_Ari.outlet, digester.inlet) annotation(
      Line(points = {{-52, -26}, {12, -26}, {12, 22}, {28, 22}}));
    connect(digester.outlet, sink_vec.inlet) annotation(
      Line(points = {{56, 2}, {76, 2}, {76, 0}}));
    connect(combiTimeTable1.y, feed_Source_Ari.inlet[2:end]) annotation(
      Line(points = {{-210, 6}, {-68, 6}, {-68, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(ramp.y, feed_Source_Ari.inlet[1]) annotation(
      Line(points = {{-166, -38}, {-68, -38}, {-68, -24}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=dumpLoops",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS_HOMOTOPY,LOG_NLS_NEWTON_DIAG,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Flores_null;

  model tryenum
    Real S[Types.Species];
    parameter Real param[size(S, 1)] = {ADM1_P.Feed_variables_Common.ac, ADM1_P.Feed_variables_Common.pro, ADM1_P.Feed_variables_Common.va};
  equation
    S = param;
  end tryenum;

  model Test_feed_direct
    parameter Integer nXin = 31;
    Modelica.Blocks.Sources.CombiTimeTable timeTable(columns = integer({2}), smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = [0, 0.0035*86400; 732, 0.0035*86400], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //  Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
    //    Placement(visible = true, transformation(origin = {-186, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Direct feed_Source(aa = 1, ac = 1, an = 1, bu = 1, ca = 1, cat = 1, ch4 = 1, fa = 1, h2 = 1, inputpH = true, mg = 1, nXin = 30, ortop = 1, ph = 7, pro = 1, si = 1, steady = false, su = 1, tan = 1, tic = 1, va = 1, xaa = 1, xac = 1, xc = 1, xc4 = 1, xch = 1, xfa = 1, xh2 = 1, xi = 1, xli = 1, xpr = 1, xpro = 1, xsu = 1) annotation(
      Placement(visible = true, transformation(origin = {-8, -2}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {60, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/sludge_complete_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-64, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//  for i in 1:size(feed_Source.inlet,1) loop
//  feed_Source.inlet[i]=0;
//  end for;
    connect(timeTable.y[1], feed_Source.Q) annotation(
      Line(points = {{-41, 24}, {-23.5, 24}, {-23.5, -8}, {-20, -8}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source.outlet, sink_vec.inlet) annotation(
      Line(points = {{6, -13}, {51, -13}, {51, -19}, {50.8, -19}}));
    connect(timeTable1.y, feed_Source.T_op) annotation(
      Line(points = {{-94, -74}, {-10, -74}, {-10, -12}, {-20, -12}}, color = {0, 0, 127}));
    connect(Input_CattleSlurry.y, feed_Source.inlet) annotation(
      Line(points = {{-52, -22}, {-20, -22}, {-20, -4}}, color = {0, 0, 127}, thickness = 0.5));
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Test_feed_direct;

  model Test_feed_Ari
    parameter Integer nXin = abs(Input_CattleSlurry.nout);
    Modelica.Blocks.Sources.CombiTimeTable timeTable(columns = integer({2}), smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = [0, 0.0035*86400; 732, 0.0035*86400], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-48, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //  Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
    //    Placement(visible = true, transformation(origin = {-186, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/sludge_complete_ss.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-64, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci feed_Source(TKN = true, nXin = 20, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-8, -2}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {60, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci water(TKN = true, nXin = 20, ph = 7.5, steady = true, tac = 404.4) annotation(
      Placement(visible = true, transformation(origin = {-8, 56}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  equation
    connect(Input_CattleSlurry.y, feed_Source.inlet) annotation(
      Line(points = {{-53, -22}, {-10, -22}, {-10, -8}, {-20, -8}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source.outlet, sink_vec.inlet) annotation(
      Line(points = {{6, -13}, {51, -13}, {51, -19}, {50.8, -19}}));
    connect(timeTable1.y, feed_Source.T_op) annotation(
      Line(points = {{-94, -74}, {-10, -74}, {-10, -12}, {-20, -12}}, color = {0, 0, 127}));
    connect(timeTable.y[1], feed_Source.Q) annotation(
      Line(points = {{-36, 2}, {-20, 2}, {-20, -8}}, color = {0, 0, 127}));
    connect(Input_CattleSlurry.y, water.inlet) annotation(
      Line(points = {{-53, -22}, {-10, -22}, {-10, -8}, {-20, -8}}, color = {0, 0, 127}, thickness = 0.5));
    connect(water.outlet, sink_vec.inlet) annotation(
      Line(points = {{6, -13}, {51, -13}, {51, -19}, {50.8, -19}}));
    connect(timeTable1.y, water.T_op) annotation(
      Line(points = {{-94, -74}, {-10, -74}, {-10, -12}, {-20, -12}}, color = {0, 0, 127}));
    connect(timeTable.y[1], water.Q) annotation(
      Line(points = {{-36, 2}, {-20, 2}, {-20, -8}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Test_feed_Ari;

  model Test_feed_NIR
    parameter Integer nXin = abs(Input_CattleSlurry.nout);
    Modelica.Blocks.Sources.CombiTimeTable timeTable(columns = integer({2}), smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = [0, 0.0035*86400; 732, 0.0035*86400], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-48, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //  Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
    //    Placement(visible = true, transformation(origin = {-186, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/sAntonio_MaizeSilage.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-64, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR feed_Source(liquid = false, nXin = 20, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-8, -2}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {60, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Input_CattleSlurry.y, feed_Source.inlet) annotation(
      Line(points = {{-53, -22}, {-10, -22}, {-10, -8}, {-20, -8}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source.outlet, sink_vec.inlet) annotation(
      Line(points = {{6, -13}, {51, -13}, {51, -19}, {50.8, -19}}));
    connect(timeTable1.y, feed_Source.T_op) annotation(
      Line(points = {{-94, -74}, {-10, -74}, {-10, -12}, {-20, -12}}, color = {0, 0, 127}));
    connect(timeTable.y[1], feed_Source.Q) annotation(
      Line(points = {{-36, 2}, {-20, 2}, {-20, -8}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Test_feed_NIR;

  model Fragea_openloop
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), Ki_nh3_ac = 0.01, S_an(fixed = false), S_cat(fixed = false), S_h(fixed = true, start = 7.17353e-8), S_ic(start = 0.1), S_in(start = 0.1), V_gas = 3000*2/3, V_liq = 3000*2, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = true, k_dis = 1.2, k_m_aa = 5.6, k_m_c4 = 14, k_m_fa = 5.6, k_m_pro = 14, k_m_su = 5.6, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.NoInit, k = 1.5, strict = false, yMax = 20000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 46 + 273.15; 732, 46 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR maizesilage(nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/Fragea_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 30; 732, 30], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/Fragea_PastaUovo_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_PastaUovo", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 8; 732, 8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR pastauovo(nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 4; 732, 4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR farinetta(tan = 520, ortop = 441, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/Fragea_Farinetta_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Farinetta", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec liquidstock(f_ch_xi = 0.9, f_pr_xi = 0.1) annotation(
      Placement(visible = true, transformation(origin = {162, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.ScrewPress screwPress(eta_liq = 0.9, eta_ts = 0.7) annotation(
      Placement(visible = true, transformation(origin = {117, 12}, extent = {{-15, -16}, {15, 16}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec solidstock(f_ch_xi = 0.9, f_pr_xi = 0.1) annotation(
      Placement(visible = true, transformation(origin = {136, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Direct digestato(ash = 20, inputpH = true, ph = 8.0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-194, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable3(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/Fragea_DigestatoL.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Digestato", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-230, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable7(table = [0, 38*3; 732, 38*3], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-220, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Recycle recycle(recycledQ = 38*8) annotation(
      Placement(visible = true, transformation(origin = {48, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {-166, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, maizesilage.T_op) annotation(
      Line(points = {{-94, -74}, {-85, -74}, {-85, -54}}, color = {0, 0, 127}));
    connect(maizesilage.outlet, digester.inlet) annotation(
      Line(points = {{-69, -55}, {12, -55}, {12, 22}, {28, 22}}));
    connect(combiTimeTable1.y, maizesilage.inlet) annotation(
      Line(points = {{-155, -40}, {-85, -40}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable2.y, maizesilage.Q) annotation(
      Line(points = {{-103, -20}, {-103, -34}, {-85, -34}, {-85, -52}}, color = {0, 0, 127}));
    connect(timeTable3.y, pastauovo.Q) annotation(
      Line(points = {{-101, 32}, {-101, 18}, {-83, 18}, {-83, 0}}, color = {0, 0, 127}));
    connect(combiTimeTable.y, pastauovo.inlet) annotation(
      Line(points = {{-153, 12}, {-83, 12}, {-83, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable2.y, farinetta.inlet) annotation(
      Line(points = {{-151, 60}, {-83, 60}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable4.y, farinetta.Q) annotation(
      Line(points = {{-103, 82}, {-103, 44}, {-83, 44}}, color = {0, 0, 127}));
    connect(farinetta.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {28, 42}, {28, 22}}));
    connect(pastauovo.outlet, digester.inlet) annotation(
      Line(points = {{-68, -2}, {28, -2}, {28, 22}}));
    connect(timeTable.y, pastauovo.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(timeTable.y, farinetta.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(step.y, PID_Pgas.u_m) annotation(
      Line(points = {{-36, 86}, {-34, 86}, {-34, 52}, {-6, 52}, {-6, 60}}, color = {0, 0, 127}));
    connect(screwPress.solidoutlet, solidstock.inlet) annotation(
      Line(points = {{111.9, -1.76}, {125.9, -1.76}, {125.9, -41.76}}));
    connect(screwPress.liquidoutlet, liquidstock.inlet) annotation(
      Line(points = {{128.4, 10.4}, {152.4, 10.4}}));
    connect(combiTimeTable3.y, digestato.inlet) annotation(
      Line(points = {{-219, -40}, {-219, -12}, {-202, -12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable7.y, digestato.Q) annotation(
      Line(points = {{-209, 24}, {-203, 24}, {-203, -14}}, color = {0, 0, 127}));
    connect(timeTable.y, digestato.T_op) annotation(
      Line(points = {{-94, -74}, {-202, -74}, {-202, -16}}, color = {0, 0, 127}));
    connect(digester.outlet, screwPress.inlet) annotation(
      Line(points = {{56, 2}, {80, 2}, {80, 0}, {106, 0}}));
    connect(screwPress.liquidoutlet, recycle.inlet) annotation(
      Line(points = {{128, 10}, {136, 10}, {136, -26}, {60, -26}}));
    connect(digestato.outlet, sink_vec.inlet) annotation(
      Line(points = {{-186, -16}, {-176, -16}, {-176, -80}}));
    connect(recycle.outlet, digester.inlet) annotation(
      Line(points = {{40, -26}, {-8, -26}, {-8, 22}, {28, 22}}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.1536e+07, Tolerance = 1e-06, Interval = 3600.07),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS_NEWTON_DIAG,LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram);
  end Fragea_openloop;

  model SAntonio_mutiple
    SAntonio normalHRTnormalFeed annotation(
      Placement(visible = true, transformation(origin = {-66, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    SAntonio modHRTmodFeed(digester.V_liq = 1350*4 + 706.5*4.5*2, digester.V_gas = (1527 - 1350)*4 + 1.6*706.5*(6 - 4.5)*2, timeTable2(table = [0, 67; 732, 67]), timeTable3(table = [0, 100; 732, 100])) annotation(
      Placement(visible = true, transformation(origin = {-66, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    SAntonio modHRTnormalFeed(digester.V_liq = 1350*4 + 706.5*4.5*2, digester.V_gas = (1527 - 1350)*4 + 1.6*706.5*(6 - 4.5)*2) annotation(
      Placement(visible = true, transformation(origin = {-66, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.SAntonio normalHRTmodFeed(timeTable2(table = [0, 67; 732, 67]), timeTable3(table = [0, 100; 732, 100])) annotation(
      Placement(visible = true, transformation(origin = {-68, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    annotation(
      experiment(StartTime = 0, StopTime = 3.1536e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "-LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end SAntonio_mutiple;

  model Fragea_openloop_
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), Ki_nh3_ac = 0.01, S_an(fixed = false), S_cat(fixed = false), S_h(fixed = true, start = 7.17353e-8), S_ic(start = 0.1), S_in(start = 0.1), V_gas = 3000*1/3, V_liq = 3000, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = true, k_dis = 1.2, k_hyd_xchr = 0.5, k_m_ac = 5.6, k_m_fa = 8, k_m_pro = 13, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.NoInit, k = 1.5, strict = false, yMax = 20000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable temperature_digester(table = [0, 46 + 273.15; 732, 46 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable temperature_data(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR maizesilage(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable maizesilage_data(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable maizesilage_flow(table = [0, 30; 732, 30], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pastauovo_data(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/Fragea_PastaUovo_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_PastaUovo", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable pastauovo_flow(table = [0, 8; 732, 8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR pastauovo(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable farinetta_flow(table = [0, 4; 732, 4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR farinetta(tan = 520, ortop = 441, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable farinetta_data(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/Fragea_Farinetta_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Farinetta", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec liquidstock(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {162, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step pressure_set(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-44, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.ScrewPress screwPress(eta_liq = 0.8425) annotation(
      Placement(visible = true, transformation(origin = {119, 10}, extent = {{-13, -14}, {13, 14}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec solidstock(nW) annotation(
      Placement(visible = true, transformation(origin = {136, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester postdigester(I(fixed = false), Ki_nh3_ac = 0.01, S_an(fixed = false), S_cat(fixed = false), S_h(fixed = true, start = 7.17353e-8), S_ic(start = 0.1), S_in(start = 0.1), V_gas = 3000*1/3, V_liq = 3000, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = true, k_dis = 1.2, k_hyd_xchr = 0.5, k_m_ac = 5.6, k_m_fa = 8, k_m_pro = 13, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {83, 13}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.NoInit, k = 1.5, strict = false, yMax = 20000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {84, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Recycle recycle(recycledQ = 38) annotation(
      Placement(visible = true, transformation(origin = {52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(temperature_digester.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(temperature_data.y, maizesilage.T_op) annotation(
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
    connect(temperature_data.y, pastauovo.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(temperature_data.y, farinetta.T_op) annotation(
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
    connect(Gas_Meter.Biogas_In, postdigester.Biogas_Out) annotation(
      Line(points = {{50, 52}, {54, 52}, {54, 36}, {90, 36}, {90, 26}}));
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
    annotation(
      experiment(StartTime = 0, StopTime = 6.1536e+07, Tolerance = 1e-06, Interval = 3600.07),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS_NEWTON_DIAG,LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram);
  end Fragea_openloop_;

  model SAntonio_
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = (1527 - 1350)*2 + 1.6*706.5*(6 - 4.5), V_liq = 1350*2 + 706.5*4.5, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, k_m_ac = 5.6, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 150, multihyd = true, noXc = true, precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 42 + 273.15; 732, 42 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR maize(tan = 764, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 37; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_CattleSlurry_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 130; 732, 130], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR slurry(an = 0.02, nW = nW, nXin = nXin, steady = false, liquid = true) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 12.8; 732, 12.8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR manure(tan = 520, ortop = 441, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_Manure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec1(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {136, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable5(table = [0, 280.15; 160, 300.15; 190, 300.15; 365, 280; 525, 300; 555, 300; 732, 280.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {58, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable6(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {82, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 300, offset = 13231, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {40, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 43200, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 73000, strict = false, xi_start = 0.181266, yMax = 20000, yMin = 0, y_start = 13000) annotation(
      Placement(visible = true, transformation(origin = {8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable7(table = [0, 0; 150, 37; 240, 0; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-240, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable3(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_TomatoPeels_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_TomatoPeels", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-292, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR tomatopeels(liquid = false, steady = false, tan = 764) annotation(
      Placement(visible = true, transformation(origin = {-204, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable8(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-232, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp(duration = 1184400, height = 37, startTime = 12960000) annotation(
      Placement(visible = true, transformation(origin = {-214, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp1(duration = 1184400, height = -37, offset = 37, startTime = 12960000) annotation(
      Placement(visible = true, transformation(origin = {-130, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid(amplitude = 37, falling = 1184400, nperiod = 1, period = 28576000, rising = 1184400, startTime = 12960000, width = 5407200) annotation(
      Placement(visible = true, transformation(origin = {-238, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Trapezoid trapezoid1(amplitude = -37, falling = 1184400, nperiod = 1, offset = 37, period = 28576000, rising = 1184400, startTime = 12960000, width = 5407200) annotation(
      Placement(visible = true, transformation(origin = {-144, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, maize.T_op) annotation(
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
    connect(timeTable.y, slurry.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(timeTable.y, manure.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(digester.outlet, sink_vec1.inlet) annotation(
      Line(points = {{56, 2}, {126, 2}, {126, -10}}));
    connect(limPID.y, digester.u) annotation(
      Line(points = {{20, 68}, {42, 68}, {42, 30}}, color = {0, 0, 127}));
    connect(digester.P_gas, limPID.u_s) annotation(
      Line(points = {{40, 30}, {34, 30}, {34, 48}, {-14, 48}, {-14, 68}, {-4, 68}}, color = {0, 0, 127}));
    connect(step.y, limPID.u_m) annotation(
      Line(points = {{-36, 86}, {-24, 86}, {-24, 32}, {8, 32}, {8, 56}}, color = {0, 0, 127}));
    connect(timeTable8.y, tomatopeels.T_op) annotation(
      Line(points = {{-221, -34}, {-212, -34}, {-212, -14}}, color = {0, 0, 127}));
    connect(combiTimeTable3.y, tomatopeels.inlet) annotation(
      Line(points = {{-281, 0}, {-211, 0}, {-211, -12}}, color = {0, 0, 127}, thickness = 0.5));
    connect(tomatopeels.outlet, digester.inlet) annotation(
      Line(points = {{-196, -14}, {28, -14}, {28, 22}}));
    connect(trapezoid.y, tomatopeels.Q) annotation(
      Line(points = {{-226, 58}, {-212, 58}, {-212, -12}}, color = {0, 0, 127}));
    connect(trapezoid1.y, maize.Q) annotation(
      Line(points = {{-132, -72}, {-86, -72}, {-86, -52}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 3.1536e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "-LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end SAntonio_;

  model AMOCO
    //Basato su Appendix A e B di A.Nigro tesi
    //Operational Parameters
    parameter Real V "L";
    parameter SI.PerUnit kLa;
    //Parameter input...come costruire matrice da concatenazione vettori?
    parameter Real feed1[7] = {1, 0, 1, 1, 1, 1, 1};
    parameter Real feed2[7] = {0, 1, 1, 1, 1, 1, 1};
    //  parameter Real xin = [1, 0; 0, 1];
    //  parameter Real xnd = [1, 0];
    //Uncertain parameters model
    parameter Types.Kinetic_d Kh[2] "idrolisi";
    parameter Real Knd[2] "stechiometric non degradable";
    parameter Types.Kinetic_d mu_max[2];
    parameter Types.Kinetic_d Kd[2];
    parameter SI.MassConcentration Ks[2];
    parameter SI.MassConcentration Ki;
    parameter Real K[4] "1: yield X1 on S1, 2: prod S2 on S1, 3: yield X2 on S2, 4: prod CH4 on VFA consumed";
    parameter Real K0[2] "stechiometric from particulate to soluble";
    //Initial conditions
    parameter SI.MassConcentration X_start[2];
    parameter SI.MassConcentration Xnd_start;
    parameter SI.MassConcentration Xb_start[2];
    parameter SI.MassConcentration S_start[2];
    //State Variables
    SI.MassConcentration X[2](each fixed = true, start = X_start) "Degradable particulate matters";
    SI.MassConcentration Xnd(fixed = true, start = Xnd_start) "Undegradable particulate matters";
    SI.MassConcentration Xb[2](each fixed = true, start = Xb_start) "Alive bacterial biomass, 1:acidogens, 2: methanogens";
    SI.MassConcentration S[2](each fixed = true, start = S_start) "Soluble organic matter, 1: organic solubles, 2:VFA";
    //Algebraic Variables
    Real Q;
    SI.MassConcentration X_in[2];
    SI.MassConcentration Xnd_in;
    SI.MassConcentration Xb_in[2];
    SI.MassConcentration S_in[2];
    Real x[7];
    //Outputs
    SI.MassConcentration VFA;
    Real Qch4;
    SI.MassConcentration VS;
    Modelica.Blocks.Interfaces.RealInput q[2](each start = 0.5) annotation(
      Placement(visible = true, transformation(origin = {-100, -12}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y[3] annotation(
      Placement(visible = true, transformation(origin = {98, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {90, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  equation
//Algebraic
    Q = sum(q[i] for i in 1:size(q, 1));
    X_in = [feed1[1], feed2[1]; feed1[2], feed2[2]]*q/Q;
    Xnd_in = {feed1[3], feed2[3]}*q/Q;
    Xb_in = [feed1[4], feed2[4]; feed1[5], feed2[5]]*q/Q;
    S_in = [feed1[4], feed2[4]; feed1[5], feed2[5]]*q/Q;
//States
    24*3600*der(X) = Q/V*(X_in - X) - Kh.*X;
    24*3600*der(Xnd) = Q/V*(Xnd_in - Xnd) + Kh[1]*Knd[1]*X[1] + Kh[2]*Knd[2]*X[2];
    24*3600*der(Xb) = Q/V*(Xb_in - Xb) + {mu_max[1]*S[1]/(S[1] + Ks[1]), mu_max[2]*S[2]/(S[2] + Ks[2] + S[2]^2/Ki)}.*Xb - Kd.*Xb;
    24*3600*der(S) = Q/V*(S_in - S) + [K0[1]*Kh[1], K0[2]*Kh[2]; 0, 0]*X + [-K[1]*mu_max[1]*S[1]/(S[1] + Ks[1]), 0; K[2]*mu_max[2]*S[1]/(S[1] + Ks[1]), -K[3]*mu_max[2]*S[2]/(S[2] + Ks[2] + S[2]^2/Ki)]*Xb;
    x = cat(1, X, {Xnd}, Xb, S);
//Outputs
    VFA = S[2];
    Qch4 = kLa*K[4]*mu_max[2]*S[2]/(S[2] + Ks[2] + S[2]^2/Ki)*Xb[2];
    VS = X[1] + X[2] + Xnd + Xb[1] + Xb[2];
    y = {VFA, Qch4, VS};
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end AMOCO;

  model try
    AMOCO amoco(K = {28.57, 27.15, 30.3, 0.0222}, K0 = {24.91, 13.81}, Kd = {0.235, 0.320}, Kh = {0.382, 0.249}, Ki = 10^5, Knd = {0.141, 0.557}, Ks = {7.1, 0.594}, S_start = {0, 0}, V = 17.2, X_start = {0, 0}, Xb_start = {1, 1}, Xnd_start = 0, kLa = 0.987, mu_max = {3.5, 0.74}) annotation(
      Placement(visible = true, transformation(origin = {38, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 0.5; 732, 0.5], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 0.5; 732, 0.0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-40, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(timeTable1.y, amoco.q[1]) annotation(
      Line(points = {{-30, -78}, {30, -78}, {30, 2}}, color = {0, 0, 127}));
    connect(timeTable.y, amoco.q[2]) annotation(
      Line(points = {{-28, 32}, {30, 32}, {30, 2}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 10000, Tolerance = 1e-6, Interval = 1),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*", l = "1000"));
  end try;

  model try2
    extends AMOCO(K = {28.57, 27.15, 30.3, 0.0222}, K0 = {24.91, 13.81}, Kd = {0.235, 0.320}, Kh = {0.382, 0.249}, Ki = 10^5, Knd = {0.141, 0.557}, Ks = {7.1, 0.594}, S_start = {0, 0}, V = 17.2, X_start = {0, 0}, Xb_start = {1, 1}, Xnd_start = 0, kLa = 0.987, mu_max = {3.5, 0.74});
    //Changed value from Kh[1] = 0.382 to 0.5 for calibration check 14/07/23
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 0.5; 0, 0.5], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 0.5; 0, 0.5], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-40, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*", l = "63244800"));
  end try2;

  model UIT
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Input/Output
    Modelica.Blocks.Interfaces.RealInput q[3](start = {1e-12, (1 - 0.22)*2.4e-4, 0.22*2.4e-4}) annotation(
      Placement(visible = true, transformation(origin = {-274, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-80, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_gas[4] annotation(
      Placement(visible = true, transformation(origin = {208, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {90, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput y_dig[6] annotation(
      Placement(visible = true, transformation(origin = {210, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {92, -56}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false, start = 0.32541), S_an(fixed = true), S_cat(fixed = true), S_h(fixed = false, start = 3.4547e-8), V_gas = 0.0344/2, V_liq = 0.024/2, charge(fixed = false), ideality = false, inlet(Q(nominal = 1e-12)), ionic_force(fixed = false), k_dis = 1.2, k_m_ac = 5.6, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 10, multihyd = true, noXc = true, precipitation = true, X_su_start = 2.61837, X_aa_start = 0.566877, X_fa_start = 0.288931, X_c4_start = 0.498118, X_pro_start = 0.316025, X_ac_start = 1.32145, X_h2_start = 0.621273, X_c_start = 0, X_i_start = 36.0924, X_ch_start = {0.82044, 0.712461, 10.3487}, X_pr_start = {0.140817, 0.868087}, X_li_start = 0.707873, X_p_start = 0.77594, S_i_start = 0.193985, S_su_start = 0.0246664, S_aa_start = 0.0260061, S_fa_start = 0.0444521, S_va_start = 0.00353521, S_bu_start = 0.00643617, S_pro_start = 0.050891, S_ac_start = 0.259353, S_h2_start = 6.87765e-07, S_ch4_start = 0.277401, S_ic_start = 0.255202, S_in_start = 0.157029, S_ip_start = 0.00496694, S_cat_start = 0.121528, S_ca_start = 3.28398e-05, S_mg_start = 5.62229e-05, S_an_start = 0.0156, ash_start = 14.1091, X_lig_start = 13.3149, S_gas_h2_start = 5.30538e-06, S_gas_ch4_start = 1.27265, S_gas_co2_start = 0.0164995, S_gas_nh3_start = 3.35695e-06, X_acp_start = 8.78817e-12, X_stru_start = 0.0100858, X_ccm_start = 0.00543116, X_mag_start = 1.41797e-09) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 42 + 273.15; 2000, 42 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 2000, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR maize(tan = 764, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-102, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sAntonio_CattleSlurry_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-100, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR slurry(an = 0.02, nW = nW, nXin = nXin, steady = false, liquid = true) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR tomatosouce(an = 0.02, f_pr_r = 1, f_pr_s = 0, liquid = true, nW = nW, nXin = nXin, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/UIT_TomatoSouce_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_TomatoSouce", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-102, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec1(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {136, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0.0, offset = 1.03500, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 43200, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 0.73000, strict = false, xi_start = 0.0235182, yMax = 20000, yMin = 0, y_start = 0.00646294) annotation(
      Placement(visible = true, transformation(origin = {8, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable3(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sAntonio_TomatoPeels_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_TomatoPeels", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-200, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR tomatopeels(liquid = false, steady = false, tan = 764) annotation(
      Placement(visible = true, transformation(origin = {-176, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable4(extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 150, 37; 240, 0; 2000, 37], tableOnFile = false, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-216, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable5(extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 37; 150, 0; 240, 37; 2000, 37], tableOnFile = false, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-128, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_vec sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {48, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//Input/Outputs
    q[1] = tomatosouce.Q;
    q[2] = slurry.Q;
    q[3] = maize.Q;
    y_gas = {Gas_Meter.Biogas_In.Q_gas_N, Gas_Meter.x_ch4, Gas_Meter.x_co2, Gas_Meter.Biogas_In.Q_gas_N*Gas_Meter.x_ch4};
    y_dig = {digester.pH, digester.VFA, digester.TAC, digester.TAN, digester.VS, digester.FOS_TAC};
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(timeTable.y, maize.T_op) annotation(
      Line(points = {{-94, -74}, {-85, -74}, {-85, -54}}, color = {0, 0, 127}));
    connect(maize.outlet, digester.inlet) annotation(
      Line(points = {{-69, -55}, {12, -55}, {12, 22}, {28, 22}}));
    connect(combiTimeTable1.y, maize.inlet) annotation(
      Line(points = {{-91, -38}, {-83, -38}, {-83, -52}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable.y, slurry.inlet) annotation(
      Line(points = {{-89, 6}, {-89, 0}, {-83, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable2.y, tomatosouce.inlet) annotation(
      Line(points = {{-91, 48}, {-81, 48}, {-81, 44}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(tomatosouce.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {28, 42}, {28, 22}}));
    connect(slurry.outlet, digester.inlet) annotation(
      Line(points = {{-68, -2}, {28, -2}, {28, 22}}));
    connect(timeTable.y, slurry.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(timeTable.y, tomatosouce.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(digester.outlet, sink_vec1.inlet) annotation(
      Line(points = {{56, 2}, {126, 2}, {126, -10}}));
    connect(limPID.y, digester.u) annotation(
      Line(points = {{20, 68}, {42, 68}, {42, 30}}, color = {0, 0, 127}));
    connect(digester.P_gas, limPID.u_s) annotation(
      Line(points = {{40, 30}, {34, 30}, {34, 48}, {-14, 48}, {-14, 68}, {-4, 68}}, color = {0, 0, 127}));
    connect(step.y, limPID.u_m) annotation(
      Line(points = {{-36, 86}, {-24, 86}, {-24, 32}, {8, 32}, {8, 56}}, color = {0, 0, 127}));
    connect(combiTimeTable3.y, tomatopeels.inlet) annotation(
      Line(points = {{-189, -10}, {-181, -10}, {-181, -16}, {-183, -16}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable4.y[1], tomatopeels.Q) annotation(
      Line(points = {{-205, -4}, {-205, -16}, {-184, -16}}, color = {0, 0, 127}));
    connect(timeTable.y, tomatopeels.T_op) annotation(
      Line(points = {{-94, -74}, {-184, -74}, {-184, -18}}, color = {0, 0, 127}));
    connect(tomatopeels.outlet, sink_vec.inlet) annotation(
      Line(points = {{-168, -18}, {-166, -18}, {-166, -60}, {38, -60}}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32447e+07, Tolerance = 1e-06, Interval = 3600.2),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT;

  model try_stream
    BlockLibrary.Sink_vec sink_vec annotation(
      Placement(visible = true, transformation(origin = {26, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-86, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_Direct inflow(aa = 0.008, ac = 0.027, an = 0.0072, bu = 0.002, ca = 0.007, cat = 0.0034, ch4 = 0.00001, fa = 0, h2 = 0.00000001, inputpH = false, mg = 0.013, ortop = 713, ph = 7.2, pro = 0.01, si = 0.027, steady = true, su = 0.016, tan = 700, tic = 384, va = 0.002, xch = 9.082, xi = 12.332, xli = 12.768, xpr = 9.543) annotation(
      Placement(visible = true, transformation(origin = {-54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 1e-6; 732, 1e-6], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-80, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-86, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-34, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-40, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Direct feed_Source_Direct(aa = 0.008, ac = 0.027, an = 0.0072, bu = 0.002, ca = 0.007, cat = 0.0034, ch4 = 0.00001, fa = 0, h2 = 0.00000001, inputpH = false, mg = 0.013, ortop = 713, ph = 7.2, pro = 0.01, si = 0.027, steady = true, su = 0.016, tan = 700, tic = 384, va = 0.002, xch = 9.082, xi = 12.332, xli = 12768, xpr = 9.543) annotation(
      Placement(visible = true, transformation(origin = {-8, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(timeTable.y, inflow.T_op) annotation(
      Line(points = {{-75, -50}, {-68, -50}, {-68, -28}, {-61, -28}}, color = {0, 0, 127}));
    connect(timeTable2.y, inflow.Q) annotation(
      Line(points = {{-69, 8}, {-61, 8}, {-61, -26}, {-62, -26}}, color = {0, 0, 127}));
    connect(combiTimeTable1.y, inflow.inlet) annotation(
      Line(points = {{-75, -22}, {-75, -24}, {-61, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(inflow.outlet, sink_vec.inlet) annotation(
      Line(points = {{-46, -28}, {16, -28}, {16, -4}}));
    connect(timeTable1.y, feed_Source_Direct.Q) annotation(
      Line(points = {{-23, 70}, {-15, 70}, {-15, 36}, {-16, 36}}, color = {0, 0, 127}));
    connect(timeTable3.y, feed_Source_Direct.T_op) annotation(
      Line(points = {{-29, 12}, {-22, 12}, {-22, 34}, {-15, 34}}, color = {0, 0, 127}));
    connect(combiTimeTable.y, feed_Source_Direct.inlet) annotation(
      Line(points = {{-29, 40}, {-29, 38}, {-15, 38}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source_Direct.outlet, sink_vec.inlet) annotation(
      Line(points = {{0, 34}, {16, 34}, {16, -4}}));
  protected
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram);
  end try_stream;

  model UIT_CL
    parameter Integer m = 0 + 1;
    parameter Integer n = 1 + 1;
    parameter Real beta[m] = {0.001162};
    parameter Real alpha[n] = {1, 1.149e-5};
    Real ISE(start = 0, fixed = true);
    //
    UIT uit(digester.X_su_start = 2.61837, digester.X_aa_start = 0.566877, digester.X_fa_start = 0.288931, digester.X_c4_start = 0.498118, digester.X_pro_start = 0.316025, digester.X_ac_start = 1.32145, digester.X_h2_start = 0.621273, digester.X_c_start = 0, digester.X_i_start = 36.0924, digester.X_ch_start = {0.82044, 0.712461, 10.3487}, digester.X_pr_start = {0.140817, 0.868087}, digester.X_li_start = 0.707873, digester.X_p_start = 0.77594, digester.S_i_start = 0.193985, digester.S_su_start = 0.0246664, digester.S_aa_start = 0.0260061, digester.S_fa_start = 0.0444521, digester.S_va_start = 0.00353521, digester.S_bu_start = 0.00643617, digester.S_pro_start = 0.050891, digester.S_ac_start = 0.259353, digester.S_h2_start = 6.87765e-07, digester.S_ch4_start = 0.277401, digester.S_ic_start = 0.255202, digester.S_in_start = 0.157029, digester.S_ip_start = 0.00496694, digester.S_cat_start = 0.121528, digester.S_ca_start = 3.28398e-05, digester.S_mg_start = 5.62229e-05, digester.S_an_start = 0.0156, digester.ash_start = 14.1091, digester.X_lig_start = 13.3149, digester.S_gas_h2_start = 5.30538e-06, digester.S_gas_ch4_start = 1.27265, digester.S_gas_co2_start = 0.0164995, digester.S_gas_nh3_start = 3.35695e-06, digester.X_acp_start = 8.78817e-12, digester.X_stru_start = 0.0100858, digester.X_ccm_start = 0.00543116, digester.X_mag_start = 1.41797e-09, limPID.xi_start = 0.0235182) annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable silage(table = [0, 0.22*2.4e-4; 732, 0.22*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-72, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable slurry(table = [0, (1 - 0.22)*2.4e-4; 732, (1 - 0.22)*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-70, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable tomatosouce(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {8, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction(a = alpha, b = beta) annotation(
      Placement(visible = true, transformation(origin = {44, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {152, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant gas_bar(k = 0.00830822) annotation(
      Placement(visible = true, transformation(origin = {118, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {-28, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2 annotation(
      Placement(visible = true, transformation(origin = {-34, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation(
      Placement(visible = true, transformation(origin = {-182, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction1(a = {1, 0}, b = 1e-2*alpha) annotation(
      Placement(visible = true, transformation(origin = {-142, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_gas(height = 0.001, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-232, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse_gas(amplitude = 0.001, nperiod = 2, offset = 0.00345899, period(displayUnit = "Ms") = 1000000, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-232, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {-182, 18}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_dig(height = 0.0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-232, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {152, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant dig_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {116, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = 0.01) annotation(
      Placement(visible = true, transformation(origin = {-120, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimIntegrator limIntegrator(k = 0.000001, outMax = 0.0053) annotation(
      Placement(visible = true, transformation(origin = {-152, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    der(ISE) = (add.y - transferFunction.y)^2;
//
    connect(add2.y, uit.q[3]) annotation(
      Line(points = {{-23, -12}, {3.5, -12}, {3.5, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(add1.y, uit.q[2]) annotation(
      Line(points = {{-17, 34}, {-2.5, 34}, {-2.5, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(tomatosouce.y, uit.q[1]) annotation(
      Line(points = {{19, 84}, {19, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(uit.y_gas[4], add.u1) annotation(
      Line(points = {{54, 4}, {85, 4}, {85, 46}, {140, 46}}, color = {0, 0, 127}));
    connect(gas_bar.y, add.u2) annotation(
      Line(points = {{129, 34}, {140, 34}}, color = {0, 0, 127}));
    connect(feedback.y, transferFunction1.u) annotation(
      Line(points = {{-173, -24}, {-165, -24}, {-165, -26}, {-155, -26}}, color = {0, 0, 127}));
    connect(transferFunction1.y, add2.u2) annotation(
      Line(points = {{-131, -26}, {-98.5, -26}, {-98.5, -18}, {-46, -18}}, color = {0, 0, 127}));
    connect(step_gas.y, feedback.u1) annotation(
      Line(points = {{-221, -22}, {-221, -24}, {-191, -24}}, color = {0, 0, 127}));
    connect(transferFunction1.y, transferFunction.u) annotation(
      Line(points = {{-131, -26}, {-19.5, -26}, {-19.5, -62}, {32, -62}}, color = {0, 0, 127}));
    connect(silage.y, add2.u1) annotation(
      Line(points = {{-60, 6}, {-46, 6}, {-46, -6}}, color = {0, 0, 127}));
    connect(slurry.y, add1.u1) annotation(
      Line(points = {{-58, 38}, {-40, 38}, {-40, 40}}, color = {0, 0, 127}));
    connect(step_dig.y, feedback1.u1) annotation(
      Line(points = {{-220, 18}, {-190, 18}}, color = {0, 0, 127}));
    connect(dig_bar.y, add3.u2) annotation(
      Line(points = {{127, -18}, {140, -18}}, color = {0, 0, 127}));
    connect(uit.y_dig[1], add3.u1) annotation(
      Line(points = {{54, -2}, {74, -2}, {74, -6}, {140, -6}}, color = {0, 0, 127}));
    connect(gain.y, add1.u2) annotation(
      Line(points = {{-109, 16}, {-40, 16}, {-40, 28}}, color = {0, 0, 127}));
    connect(gain.u, limIntegrator.y) annotation(
      Line(points = {{-132, 16}, {-135.5, 16}, {-135.5, 18}, {-141, 18}}, color = {0, 0, 127}));
    connect(feedback1.y, limIntegrator.u) annotation(
      Line(points = {{-172, 18}, {-164, 18}}, color = {0, 0, 127}));
    connect(feedback1.u2, add3.y) annotation(
      Line(points = {{-182, 26}, {-182, 66}, {186, 66}, {186, -12}, {164, -12}}, color = {0, 0, 127}));
    connect(feedback.u2, add.y) annotation(
      Line(points = {{-182, -32}, {-182, -68}, {186, -68}, {186, 40}, {164, 40}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_CL;

  model UIT_OL
    parameter Real feed_ratio = feed_ratio;
    parameter Real liquidcontrol_ratio = liquidcontrol_ratio;
    parameter Integer m = 0 + 1;
    parameter Integer n = 1 + 1;
    parameter Integer m2 = 1 + 1;
    parameter Integer n2 = 2 + 1;
    parameter Real beta[m] = {0.001162};
    parameter Real alpha[n] = {1, 1.149e-5};
    parameter Real beta2[m2] = {-0.004507, 1.624e-9};
    parameter Real alpha2[n2] = {1, 7.841e-5, 2.246e-11};
    Real ISE(start = 0, fixed = true);
    Real ISE_dig(start = 0, fixed = true);
    //
    UIT uit annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable silage(table = [0, feed_ratio*(1 - liquidcontrol_ratio)*2.4e-4; 2000, feed_ratio*(1 - liquidcontrol_ratio)*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-80, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable slurry(table = [0, (1 - feed_ratio)*(1 - liquidcontrol_ratio)*2.4e-4; 2000, (1 - feed_ratio)*(1 - liquidcontrol_ratio)*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-78, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable tomatosouce(table = [0, liquidcontrol_ratio*2.4e-4; 2000, liquidcontrol_ratio*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-78, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_slurry(height = 0, offset = 0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-120, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction tf_dig(a = alpha2, b = beta2) annotation(
      Placement(visible = true, transformation(origin = {70, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add Qch4(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {92, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Qch4_bar(k = 0.008036) annotation(
      Placement(visible = true, transformation(origin = {34, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {-48, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2 annotation(
      Placement(visible = true, transformation(origin = {-44, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_silage(height = 0, offset = 0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-122, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction tf_gas(a = alpha, b = beta) annotation(
      Placement(visible = true, transformation(origin = {62, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3(k1 = -1, k2 = +1) annotation(
      Placement(visible = true, transformation(origin = {92, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant pH_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {54, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Product product annotation(
      Placement(visible = true, transformation(origin = {132, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(
      Placement(visible = true, transformation(origin = {130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction tf_gasquality(a = {1, 1.43e-5, 6.047e-11, 8.008e-17, 3.006e-23}, b = {-7.016e-8, -1.696e-14, 1.931e-21}) annotation(
      Placement(visible = true, transformation(origin = {70, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant gasquality_bar(k = 1.21011) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add qasquality(k1 = -1) annotation(
      Placement(visible = true, transformation(origin = {174, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add5 annotation(
      Placement(visible = true, transformation(origin = {-44, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_tomatosouce(height = 0, offset = 0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0, offset = feed_ratio*(1 - liquidcontrol_ratio)*2.4e-4, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-108, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    der(ISE) = (Qch4.y - tf_gas.y)^2;
    der(ISE_dig) = (add3.y - tf_dig.y)^2;
//
    connect(slurry.y, add2.u1) annotation(
      Line(points = {{-67, 34}, {-56, 34}}, color = {0, 0, 127}));
    connect(add2.y, uit.q[2]) annotation(
      Line(points = {{-32, 28}, {36, 28}, {36, 6}}, color = {0, 0, 127}));
    connect(add1.y, uit.q[3]) annotation(
      Line(points = {{-36, -22}, {36, -22}, {36, 6}}, color = {0, 0, 127}));
    connect(uit.y_gas[4], Qch4.u1) annotation(
      Line(points = {{54, 4}, {54, 2}, {80, 2}, {80, -40}}, color = {0, 0, 127}));
    connect(Qch4_bar.y, Qch4.u2) annotation(
      Line(points = {{45, -52}, {80, -52}}, color = {0, 0, 127}));
    connect(step_silage.y, tf_gas.u) annotation(
      Line(points = {{-111, -80}, {50, -80}}, color = {0, 0, 127}));
    connect(step_slurry.y, add2.u2) annotation(
      Line(points = {{-108, 24}, {-82, 24}, {-82, 22}, {-56, 22}}, color = {0, 0, 127}));
    connect(step_slurry.y, tf_dig.u) annotation(
      Line(points = {{-108, 24}, {-100, 24}, {-100, 68}, {58, 68}}, color = {0, 0, 127}));
    connect(pH_bar.y, add3.u1) annotation(
      Line(points = {{66, 40}, {80, 40}}, color = {0, 0, 127}));
    connect(uit.y_dig[1], add3.u2) annotation(
      Line(points = {{54, -2}, {80, -2}, {80, 28}}, color = {0, 0, 127}));
    connect(uit.y_gas[2], division.u1) annotation(
      Line(points = {{54, 4}, {118, 4}, {118, 26}}, color = {0, 0, 127}));
    connect(uit.y_gas[3], division.u2) annotation(
      Line(points = {{54, 4}, {86, 4}, {86, 14}, {118, 14}}, color = {0, 0, 127}));
    connect(uit.y_gas[1], product.u1) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -10}}, color = {0, 0, 127}));
    connect(uit.y_gas[3], product.u2) annotation(
      Line(points = {{54, 4}, {120, 4}, {120, -22}}, color = {0, 0, 127}));
    connect(step_slurry.y, tf_gasquality.u) annotation(
      Line(points = {{-108, 24}, {-100, 24}, {-100, 92}, {58, 92}}, color = {0, 0, 127}));
    connect(gasquality_bar.y, qasquality.u1) annotation(
      Line(points = {{142, 54}, {162, 54}, {162, 34}}, color = {0, 0, 127}));
    connect(division.y, qasquality.u2) annotation(
      Line(points = {{142, 20}, {162, 20}, {162, 22}}, color = {0, 0, 127}));
    connect(add5.y, uit.q[1]) annotation(
      Line(points = {{-32, 62}, {36, 62}, {36, 6}}, color = {0, 0, 127}));
    connect(tomatosouce.y, add5.u1) annotation(
      Line(points = {{-66, 78}, {-56, 78}, {-56, 68}}, color = {0, 0, 127}));
    connect(step_tomatosouce.y, add5.u2) annotation(
      Line(points = {{-108, 60}, {-56, 60}, {-56, 56}}, color = {0, 0, 127}));
    connect(step.y, add1.u1) annotation(
      Line(points = {{-96, -12}, {-60, -12}, {-60, -16}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_OL;

  model UIT_linear_CL_gas
    parameter Integer m = 0 + 1;
    parameter Integer n = 1 + 1;
    parameter Real beta[m] = {0.001162};
    parameter Real alpha[n] = {1, 1.149e-5};
    Real ISE(start = 0, fixed = true);
    //
    Modelica.Blocks.Sources.TimeTable slurry(table = [0, (1 - 0.22)*2.4e-4; 732, (1 - 0.22)*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-76, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction tf_gas(a = alpha, b = beta, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {-14, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2 annotation(
      Placement(visible = true, transformation(origin = {-46, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation(
      Placement(visible = true, transformation(origin = {-188, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction R_gas(a = {1, 0}, b = 1e-2*alpha) annotation(
      Placement(visible = true, transformation(origin = {-114, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse(amplitude = 0.0001, nperiod = 2, offset = 0, period(displayUnit = "Ms") = 1000000, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-226, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.UIT_linear uIT_linear annotation(
      Placement(visible = true, transformation(origin = {-14, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant2(k = 0) annotation(
      Placement(visible = true, transformation(origin = {-100, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {-188, 48}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {1, 0}, b = 1e-2*alpha) annotation(
      Placement(visible = true, transformation(origin = {-114, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_silage(height = 0.0001, startTime = 0.5) annotation(
      Placement(visible = true, transformation(origin = {-226, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    der(ISE) = 0;
//
    connect(slurry.y, add2.u1) annotation(
      Line(points = {{-65, 12}, {-61.5, 12}, {-61.5, 10}, {-58, 10}}, color = {0, 0, 127}));
    connect(feedback.y, R_gas.u) annotation(
      Line(points = {{-179, -12}, {-126, -12}}, color = {0, 0, 127}));
    connect(feedback.u2, tf_gas.y) annotation(
      Line(points = {{-188, -20}, {-188, -74}, {136, -74}, {136, -14}, {-3, -14}}, color = {0, 0, 127}));
    connect(R_gas.y, add2.u2) annotation(
      Line(points = {{-103, -12}, {-55, -12}, {-55, -2}, {-58, -2}}, color = {0, 0, 127}));
    connect(R_gas.y, tf_gas.u) annotation(
      Line(points = {{-103, -12}, {-79.5, -12}, {-79.5, -14}, {-26, -14}}, color = {0, 0, 127}));
    connect(step_silage.y, feedback.u1) annotation(
      Line(points = {{-214, -14}, {-198, -14}, {-198, -12}, {-196, -12}}, color = {0, 0, 127}));
    connect(feedback1.y, transferFunction.u) annotation(
      Line(points = {{-179, 48}, {-126, 48}}, color = {0, 0, 127}));
    connect(feedback1.u2, uIT_linear.y[4]) annotation(
      Line(points = {{-188, 56}, {-188, 70}, {22, 70}, {22, 54}, {-4, 54}}, color = {0, 0, 127}));
    connect(transferFunction.y, uIT_linear.u[3]) annotation(
      Line(points = {{-102, 48}, {-24, 48}, {-24, 54}}, color = {0, 0, 127}));
    connect(constant2.y, uIT_linear.u[1]) annotation(
      Line(points = {{-88, 82}, {-24, 82}, {-24, 54}}, color = {0, 0, 127}));
    connect(constant2.y, uIT_linear.u[2]) annotation(
      Line(points = {{-88, 82}, {-24, 82}, {-24, 54}}, color = {0, 0, 127}));
    connect(step_silage.y, feedback1.u1) annotation(
      Line(points = {{-214, -14}, {-210, -14}, {-210, 48}, {-196, 48}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_linear_CL_gas;

  model UIT_linear_CL_dig
    parameter Integer m = 1 + 1;
    parameter Integer n = 2 + 1;
    parameter Real beta[m] = {-0.004507, 1.624e-9};
    parameter Real alpha[n] = {1, 7.841e-5, 2.246e-11};
    Real ISE(start = 0, fixed = true);
    //
    Modelica.Blocks.Sources.Step step(height = 0.001, offset = 0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-224, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse1(amplitude = 0.001, nperiod = 2, offset = 0, period(displayUnit = "Ms") = 1000000, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-214, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.StateSpace stateSpace(A = [-7.84100000000000e-05, -2.24600000000000e-11; 1, 0], B = [1; 0], C = [-0.0045, 1.6240e-09], D = [0], initType = Modelica.Blocks.Types.Init.NoInit) annotation(
      Placement(visible = true, transformation(origin = {30, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.MatrixGain matrixGain(K = [1.732, 1.0045]) annotation(
      Placement(visible = true, transformation(origin = {34, 34}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {-80, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction tf_dig(a = alpha, b = beta, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {0, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = -1) annotation(
      Placement(visible = true, transformation(origin = {-64, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.Integrator integrator annotation(
      Placement(visible = true, transformation(origin = {-98, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add(k1 = -1, k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {-12, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    matrixGain.u = stateSpace.x;
//
    der(ISE) = 0;
//
    connect(step.y, feedback2.u1) annotation(
      Line(points = {{-212, 24}, {-88, 24}, {-88, 62}}, color = {0, 0, 127}));
    connect(stateSpace.y[1], feedback2.u2) annotation(
      Line(points = {{41, 64}, {67, 64}, {67, 10}, {-80, 10}, {-80, 54}}, color = {0, 0, 127}));
    connect(integrator.y, gain.u) annotation(
      Line(points = {{-86, -28}, {-76, -28}}, color = {0, 0, 127}));
    connect(feedback2.y, integrator.u) annotation(
      Line(points = {{-70, 62}, {-56, 62}, {-56, 12}, {-122, 12}, {-122, -28}, {-110, -28}}, color = {0, 0, 127}));
    connect(matrixGain.y[1], add.u2) annotation(
      Line(points = {{24, 34}, {-24, 34}, {-24, 56}}, color = {0, 0, 127}));
    connect(add.y, stateSpace.u[1]) annotation(
      Line(points = {{0, 62}, {18, 62}, {18, 64}}, color = {0, 0, 127}));
    connect(pulse1.y, tf_dig.u) annotation(
      Line(points = {{-202, 76}, {-12, 76}, {-12, 88}}, color = {0, 0, 127}));
    connect(gain.y, add.u1) annotation(
      Line(points = {{-52, -28}, {-40, -28}, {-40, 68}, {-24, 68}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_linear_CL_dig;

  model UIT_linear "UIT"
    parameter Integer n = 46 "number of states";
    parameter Integer m = 3 "number of inputs";
    parameter Integer p = 10 "number of outputs";
    parameter Real x0[n] = fill(0, n);
    parameter Real u0[m] = {0, 0, 0};
    parameter Real A[n, n] = [1.22642002089152E-16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.24996537098912E-05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.43820028990994E-09, 1.28265352497717E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.25533452990606E-05, 0, 0, 0, 0, 0, 0, 0, 0, 1.39386708687961E-09, 2.77693989083969E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, -6.92504496039356E-17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.41840829819467E-06, 0, 0, 0, 0, -0.0290400358869326, 0, 0, 6.69422403665827E-10, 1.33365975268846E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 8.04531576139193E-17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7.23281779313205E-06, 2.99177853848494E-05, 0, 0, -0.0215770353740068, 0, 0, 9.34630675362712E-10, 1.8620225128757E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 6.33320447651111E-17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.27416426926048E-06, 0, -0.0431403856405784, 0, 0, 7.32196579813743E-10, 1.45872208639174E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, -6.07290762584833E-17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.47609964745542E-07, 1.91952248165389E-07, 2.74162932309173E-07, 2.14332430434749E-06, 0, 0, 2.94599256775511E-05, -3.33860757603328E-05, 5.73369031189694E-05, -3.06123111005053E-05, -6.10378619458924E-05, -6.10378406730159E-05, 0.000030799120999932, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.50571168752205E-07, 0; 0, 0, 0, 0, 0, 0, 1.29061126739261E-16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.539563542822886, 0, 0, 1.52762090824831E-09, 3.04341013974493E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, -2.31481482445988E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, -2.3148148246984E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, -1.2029366107135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 1.03184195327726E-07, 1.03184195354471E-07, 9.35518378770818E-08, 6.36574071028271E-08, 9.35518381063058E-08, 1.03184195329983E-07, 1.03184195175845E-07, 0, 0, 0, -4.33890026969816E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.0318293661858114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1.39228774378529E-05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 1.03184195327726E-07, 1.03184195354471E-07, 9.35518378770818E-08, 6.36574071028271E-08, 9.35518381063058E-08, 1.03184195329983E-07, 1.03184195175845E-07, 0, 0, 0, 0, 0, 0, -2.96976067358824E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 1.31325339508015E-07, 1.31325339464914E-07, 1.19065975479922E-07, 8.10185180431038E-08, 1.19065975909841E-07, 1.31325339466721E-07, 1.31325339267781E-07, 0, 0, 0, 0, 0, 0, 0, -4.33890027049319E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 3.00172204635739E-08, 3.00172204693266E-08, 2.72150800958464E-08, 1.85185184328389E-08, 2.72150801591075E-08, 3.00172204499699E-08, 3.001722044647E-08, 0, 0, 0, 0, 0, 0, 0, 0, -2.31481482437273E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 7.50430511589348E-09, 7.50430511733165E-09, 6.80377002396161E-09, 4.62962960820973E-09, 6.80377003977687E-09, 7.50430511249248E-09, 7.50430511161751E-09, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.31481482430039E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; -6.06696738410129E-06, 0, 0, 0, 0, 0, 0, 0, 0, 1.36913959573722E-05, 4.10741878832023E-06, 1.36913959530771E-07, 0, 0, 2.05370941161909E-07, 0, 0, -0.000625228018543014, 0, 0, 0, 0, 0, 0, 0, 0, 0, -6.4382006964735E-08, -1.28265352497717E-05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, -7.58370922938058E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.36913959537629E-05, 2.73827919061664E-06, 0, 0, 0, 0, -0.000157148297687337, 0, 0, 0, 0, 0, 0, 0, 0, -1.74233423975285E-08, -3.47117488779845E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, -9.52783304425799E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.90204784854114E-06, 0, 0, 0, 0, -5.72049531241473E-05, 0, 0, 0, 0, 0.484000598115557, 0, 0, -1.11570392140897E-08, -2.22276623023192E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 1.6047128730813E-06, 0, -1.82662349530213E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.32035983118221E-05, 0, -0.000414953888623318, 9.12394155328383E-05, 0, 0, 0.0851323385369743, 0, 0, -8.11094304490109E-13, -1.61626643679286E-10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 7.25123941911753E-07, 1.81402324792941E-06, 0, -5.88942590481317E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.000074699586117206, 3.75345024637589E-05, 0, 0.000294175443773728, -0.000590100653445231, 0, 0, 0.274484917696219, 0, 0, -2.69836235533878E-11, -5.37613088837603E-09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 1.46935883085668E-06, 3.4885062512399E-07, 0, 9.27194086422094E-07, -1.42917495693381E-05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.000151367911305641, 7.21817354889282E-06, 0, 0.000210513093868293, -4.63131273388976E-05, -8.20855882208723E-05, 0, 1.03529646597348, 0, 0, -3.89406578867482E-11, -7.75807889660575E-09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 2.22533330094086E-06, 2.79080499646636E-06, 6.26931414169686E-06, 4.9611263649732E-06, 7.82044536599555E-06, -1.21339347651799E-05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.00022924560479821, 5.77453883911425E-05, 3.74885443363381E-05, -0.000103322023913855, 0.000413155406437655, 3.93073085457232E-05, -4.30979675753636E-05, -1.13985309068068, 0, -0.000589198513548515, 0.000667778915289453, -0.00113530249863452, 0.000612246222004819, 0.00122075721941287, 0.00122075679060929, -0.000615982420080959, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5.01142337504411E-06, 0; 1.04045457114789E-06, 4.18620749696232E-07, 2.68684892103582E-06, 1.36476598323275E-06, 5.89963422219036E-06, 0, -1.01116123052052E-05, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.000107183781080351, 8.66180826818762E-06, 1.60665189932103E-05, 3.17087597569102E-06, 9.80306467053407E-05, 3.37893752765357E-05, 0, -9.63817887153011, 0, 0, 3.57775933810174E-13, 7.11299492087278E-11, 0, 0, 0, 0, 0, 0, 2.77669183859759E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 1.15272380262408E-05, 9.50491556363024E-06, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.80458936558208E-06, 3.64709280154303E-06, 5.20909574482813E-06, 4.07231617943242E-05, 8.45316217089223, -0.000086899140932641, 0.000559738587869083, -0.000634311506694027, 0.00109416916846319, -0.000581633910916208, -0.00115971936234322, -0.00115971894422351, 0.000585183299142765, 0, 0, 0, 2.33221824709914E-06, 0, 0, 0, 0, 0, 0, 0, 4.75442730452903E-06, 0; 4.54286798817149E-08, 3.18842555340166E-08, -5.44308700088013E-09, -2.43008070675688E-09, 1.2189030403875E-07, 1.82659693276148E-07, -1.65584234501333E-07, 0, 0, -6.84569826370136E-10, -2.05370952580288E-10, -6.8456981876224E-12, 0, 0, -2.20206391399451E-09, 0, 0, 4.56327983774364E-06, 6.3630414537912E-07, -3.86850900478677E-08, -3.69036588320123E-07, -4.85529103232851E-07, 2.31641854688389E-07, -3.08970799906634E-07, -0.156914891710642, 0, -5.60765745840155E-05, 4.91901012425566E-05, -9.44191976584255E-05, 5.21137032998623E-05, -0.00601038739048424, 0.000104595421877165, -5.17421407018106E-05, 0, 0, 0, 0, 0.00006957892141005, 0, 0, 0, -2.31438861449138E-07, 0.000163017102168545, 0, 4.57669377123755E-07, 0; -2.32723430516912E-09, 5.44370563373605E-08, -2.24133877035219E-09, -1.97475835415589E-09, -2.24133876554379E-09, -2.32723430409047E-09, -2.32723430480442E-09, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -3.7991493330106E-07, 1.09821939116414E-06, -2.07793848885102E-08, 3.53034937277891E-07, 3.34396514147225E-07, 7.174627158898E-07, 1.2812027642761E-06, -0.0027099092449407, 0, 7.92390633408155E-05, -8.76976881606148E-05, -3.47277786103091E-05, -8.09948018139478E-05, -0.000160149775908736, -0.0167971014355349, 8.28346869527536E-05, 0, 0, 0, 0, 0, 0.15462403669381, 0, -2.31458531247692E-07, 0, 0, 0, 1.8928192344952E-06, 0; -2.10732153892612E-10, -2.10732153751401E-10, -2.05868963613984E-10, -1.90775852327495E-10, -2.05868963530631E-10, -2.10732153928352E-10, -2.10732154165655E-10, 0, 0, 0, 0, 0, 0, 0, 1.40545265480327E-09, 0, 0, -4.28316095748192E-08, -8.60292742206974E-09, -2.34266785665247E-09, 2.65201939345071E-07, 3.30808246307453E-07, 4.99531577735543E-07, 8.77595560373382E-07, -0.000305515168274104, 0, 5.39239682522715E-05, -5.87746031101553E-05, -8.36829052863325E-05, -5.46894546244488E-05, -0.000107705955572295, -0.0167446512467473, 5.63688130967852E-05, 0, 0, 0, 0, 0, 0, 0.0526797601889166, -2.31458531247692E-07, 0, 0, 0, 1.67936516713514E-06, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.31481482454348E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.34747860997992E-08, 6.95379791796095E-08, 9.93206346051249E-08, 1.73935501473488E-07, 0, 0, 9.88622579362131E-06, -1.05627511237419E-05, 2.06649766662507E-05, -0.000010936492653184, -0.00613687936316571, -2.16519241821273E-05, 1.11575545667637E-05, 0, 0, 0, 0, 0, 0, 0.0790196581301038, 0, -2.31438861449138E-07, 0, 0, 2.21554015990618E-07, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.7025982863626E-07, 3.51442752094711E-07, 5.01963301697301E-07, 8.79064438534716E-07, 0, 0, 5.39441589411397E-05, -5.87974772755934E-05, -8.34105008767771E-05, -5.47104360021714E-05, -0.000107741399600311, -0.0167449281170549, 5.63899224370431E-05, 0, 0, 0, 0, 0, 0, 0, -2.31458531247692E-07, 0, 0.000163017102168545, 0, 1.67953793223106E-06, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.31481482446334E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.31481482432791E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.31481482429346E-07, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.000104060645952541, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1.34942034811888E-05, -1.06702167935302E-09, -6.82889606534797E-08, -6.8288885526788E-08, 0, 0, 0, 0, 0, 0, -2.60613587135703E-09; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.04658089190217E-05, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.00102133935562859, -0.000269135475587697, -0.0163810577861804, -0.0163810397276566, 0, 0, 0, 0, 0, 0, -0.000625156129111818; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.41132917877366E-07, 3.13567785989122E-07, 4.47866914151905E-07, 7.84327763462754E-07, 0, 0, 5.20087824722384E-05, -4.86571564747574E-05, 9.22967184209924E-05, -5.03787913035667E-05, -0.000100823606303259, -0.000100823597826737, 5.03127870369515E-05, 0, 0, -1.32413888311732E-05, -3.31839556520562E-06, -0.000272472141185816, -0.00021237574887033, 0, 0, 0, 0, 0, -1.11989282862649E-07, -8.10498032478416E-06; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -8.90500227615628E-08, -1.15800745678954E-07, -1.65396720269173E-07, -2.89651441092305E-07, 0, 0, -1.77725521954456E-05, 2.01430759922868E-05, -3.41996213961484E-05, 1.84677620309251E-05, 3.68228560385142E-05, 3.68228403976271E-05, -1.85804605054292E-05, 0, 0, -2.69405761578309E-09, -6.75151901307638E-10, -4.32094516123651E-08, -0.107888830830943, 0, 0, 0, 0, 0, -1.49860359668128E-07, -1.64901765598716E-09; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.08328731681212E-14, -2.70908440313976E-14, -3.86936619905785E-14, -6.77623710331097E-14, 0, 0, -4.15831507784194E-12, 4.06301734023201E-12, 5.98884708166301E-12, 4.20677897122625E-12, 3.2036741035674E-09, 8.27353856466746E-12, -4.34679722039995E-12, 0, 0, 0, 0, 0, 0, -0.0263401202235898, 0, 0, 0, 0, -1.40544113336556E-13, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2.70259775427311E-07, -3.51442682902406E-07, -5.01963202876437E-07, -8.79064265463853E-07, 0, 0, -5.39441491040595E-05, 5.87974667653499E-05, 8.34105214390694E-05, 5.47104251200468E-05, 0.000107741378065541, 0.0167446930600115, -5.63899113349531E-05, 0, 0, 0, 0, 0, 0, 0, -2.29512894912364E-11, 0, 0, 0, -1.67953771088366E-06, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5.34747235670405E-08, -6.95378979047857E-08, -9.93205185221537E-08, -1.73935298186196E-07, 0, 0, -9.88621331867605E-06, 1.05627389346894E-05, -2.06649946328145E-05, 1.09364800328474E-05, 0.00613663827065971, 2.16518993673356E-05, -1.11575415263612E-05, 0, 0, 0, 0, 0, 0, 0, 0, -4.2620985745079E-11, 0, 0, -2.2155558457015E-07, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -5.32089486256613E-14, -6.91923049115891E-14, -9.88269091833395E-14, -1.73070863065677E-13, 0, 0, -9.83708016274128E-12, 1.05102435476245E-11, -2.05622923713867E-11, 1.08821272035756E-11, 2.15442931995515E-11, 3.57555639239794E-09, -1.11020900527855E-11, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.000163248583660027, 0, -2.21347404655394E-13, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.2, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.2, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.78179364421817E-05, 9.47747052845093E-06, 0.000606554322686598, 0.00060655364921002, 0, 0, 0, 0, 0, 0, 0];
    parameter Real B[n, m] = [-0.00256739331183899, -0.0025254364448101, -0.00252543644009562; -0.000521501766467294, -0.000546756019590369, -0.000546756018822411; -0.000280808643482389, -0.00027867525817734, -0.000278675258017545; -0.00048138624596981, -0.000480438088460627, -0.000480438088522347; -0.000280808643482389, -0.000304807705660833, -0.000304807705559186; -0.00128369665591949, -0.0012745483524925, -0.0012745483502911; -0.000561617286964778, -0.00059922177446446, -0.000599221774222305; 0, 0, 0; 0.0262901076227424, -0.00700884630417883, 0.0248495454574918; -110.911391071444, 904.963330644561, 15172.7164121077; -0.000641848327959747, 0.00190637933875166, 0.0369710968256198; 4242.36070848274, -494.977092979004, 4073.45403218125; 0.00770217993551696, 0.00651078267307553, 0.0134311597089493; 0.00673940744357734, 0.00580932671844052, 0.0127297037555719; 0.0125160423952151, 0.00459892800009336, 0.0238786136082145; -0.000722079368954707, -0.00074839933119204, -0.000748399330791852; -0.000180519842238677, -0.00018709983279801, -0.000187099832697963; 0, -2.37908483624813E-05, 0.0031899243970215; 0, -2.50830052479484E-05, -2.50829990074153E-05; 0, -4.28743390332936E-05, -2.35842142298216E-05; 0, -3.40973174586045E-06, 1.58803919650414E-05; 0, -6.20772841409947E-06, 0.0001481132603368; 0, -4.90846638353117E-05, 0.000356007931753248; 0, 0.00715725944255785, 0.0100700680742822; 0, -6.58964283368486E-10, -6.81428974837692E-10; 0, -0.000267555176906181, -0.000267555201863311; -0.000240693122984894, -0.000114632476899545, -0.000246143714032955; -0.000110317681368083, -5.50052605216764E-05, -9.88213981370143E-05; 7.52166009327946E-06, 1.54499999084504E-05, -4.79064803986859E-06; -0.000115532699513924, 3.30605819427885E-05, -0.000117214788209843; 0, 6.7198690137348E-06, -3.16741987439487E-08; 3.13402503885642E-07, 1.24843528883782E-05, -5.42273570565105E-08; -0.000014842742645914, 4.24382722340249E-06, -0.000015046296230135; 0.0751732764838967, 0.000543846140179604, -0.00192818318693324; 0.0160205343325986, 0.00144326234934938, -0.00511702132942776; 0, 0, 0; 0, 0, 0; 0, 0, 0; 0, 0, 0; 9.56428539692978E-10, 9.64497696807162E-10, 9.64497696645269E-10; -9.40207511659932E-06, -9.72682833216004E-06, -9.72682833019959E-06; -5.17114131412887E-06, -5.23742297750315E-06, -5.23742297705106E-06; 9.56428539692978E-10, 9.63138532962851E-10, 9.63138532019894E-10; 0, 0, 0; 0, 0, 0; 0, 0, 0];
    parameter Real C[p, n] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.08013291288616, 0.270689752551196, 17.324035883144, 17.3240165088905, 0, 0, 0, 0, 0, 0, 0.646454046018065; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.936336415515002, 0.194744116177497, -15.0177135926686, -15.0177204948037, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.776913416652555, -0.194700599572702, 15.0204986318907, -12.4607883717558, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.57602589623544, 0.15088489962622, 9.23876419174689, 9.23875344025049, 0, 0, 0, 0, 0, 0, 0.353268446187493; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.110490355429359, -0.143680169964278, -0.205217493951797, -0.359387615350592, 0, 0, -22.0510638158843, 22.2126667784376, -42.3628158812389, 22.9986169574229, 45.9419828444932, 45.9419904214563, -23.0538729504286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -0.0532907051820075, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 288.094351151171, 374.574344753007, 535.135761326258, 936.719400750492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.000401081645062039, -0.000489227260553409, -3.50540577344652E-05, -6.98661635541003E-06, 0, 0, -1.41996612576906E-05, 49999.9999989029, -49999.9992747253, 50000.000025158, 100000.102397705, 100000.070569693, -49999.9997724365, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14000.0000055632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0.535371259582452, 0.535371255411586, 0.535371239168229, 0.535371257503648, 0.535371251402873, 0.535371261819603, 0.535371253961825, 0.637044195173075, 0.696557828569968, 0.84375000679682, 0.843749993492519, 0.843749999936609, 0.653443145358241, 0.653443106372013, 0.353266158283352, 0, 0.540904365759233, 0.843749979594859, 0.65344316578037, 0.353266189370206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.734375000088943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0223182816533861, 0.0290177719853881, 0.0414562484457918, 0.0725663934429966, 0, 0, 2.70837044862569E-11, -0.0821003293171416, 0.082100328284723, -0.082100329355586, -0.164200902990513, -0.164200816939322, 0.0821003289060736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    parameter Real D[p, m] = [0, 0, 0; 0, 0, 0; 0, 0, 0; 0, 0, 0; 0, 0, 0; 0, 0, 0; 0, 0, 0; 0, 0, 0; 14196.6580571449, -7179.5290320268, 25454.6934367587; 0, 0, 0];
    Real x[n](start = x0);
    Modelica.Blocks.Interfaces.RealOutput y[p] annotation(
      Placement(visible = true, transformation(origin = {102, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {102, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput u[m] annotation(
      Placement(visible = true, transformation(origin = {-100, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    Real 'x_digester.X_su' = x[1];
    Real 'x_digester.X_aa' = x[2];
    Real 'x_digester.X_fa' = x[3];
    Real 'x_digester.X_c4' = x[4];
    Real 'x_digester.X_pro' = x[5];
    Real 'x_digester.X_ac' = x[6];
    Real 'x_digester.X_h2' = x[7];
    Real 'x_digester.X_c' = x[8];
    Real 'x_digester.X_i' = x[9];
    Real 'x_digester.X_ch[1]' = x[10];
    Real 'x_digester.X_ch[2]' = x[11];
    Real 'x_digester.X_ch[3]' = x[12];
    Real 'x_digester.X_pr[1]' = x[13];
    Real 'x_digester.X_pr[2]' = x[14];
    Real 'x_digester.X_li' = x[15];
    Real 'x_digester.X_p' = x[16];
    Real 'x_digester.S_i' = x[17];
    Real 'x_digester.S_su' = x[18];
    Real 'x_digester.S_aa' = x[19];
    Real 'x_digester.S_fa' = x[20];
    Real 'x_digester.S_va' = x[21];
    Real 'x_digester.S_bu' = x[22];
    Real 'x_digester.S_pro' = x[23];
    Real 'x_digester.S_ac' = x[24];
    Real 'x_digester.S_h2' = x[25];
    Real 'x_digester.S_ch4' = x[26];
    Real 'x_digester.S_ic' = x[27];
    Real 'x_digester.S_in' = x[28];
    Real 'x_digester.S_ip' = x[29];
    Real 'x_digester.S_cat' = x[30];
    Real 'x_digester.S_ca' = x[31];
    Real 'x_digester.S_mg' = x[32];
    Real 'x_digester.S_an' = x[33];
    Real 'x_digester.ash' = x[34];
    Real 'x_digester.X_lig' = x[35];
    Real 'x_digester.S_gas_h2' = x[36];
    Real 'x_digester.S_gas_ch4' = x[37];
    Real 'x_digester.S_gas_co2' = x[38];
    Real 'x_digester.S_gas_nh3' = x[39];
    Real 'x_digester.X_acp' = x[40];
    Real 'x_digester.X_stru' = x[41];
    Real 'x_digester.X_ccm' = x[42];
    Real 'x_digester.X_mag' = x[43];
    Real 'x_digester.charge' = x[44];
    Real 'x_digester.ionic_force' = x[45];
    Real 'x_limPID.I.y' = x[46];
    Real 'u_q[1]' = u[1];
    Real 'u_q[2]' = u[2];
    Real 'u_q[3]' = u[3];
    Real 'y_y_gas[1]' = y[1];
    Real 'y_y_gas[2]' = y[2];
    Real 'y_y_gas[3]' = y[3];
    Real 'y_y_gas[4]' = y[4];
    Real 'y_y_dig[1]' = y[5];
    Real 'y_y_dig[2]' = y[6];
    Real 'y_y_dig[3]' = y[7];
    Real 'y_y_dig[4]' = y[8];
    Real 'y_y_dig[5]' = y[9];
    Real 'y_y_dig[6]' = y[10];
  equation
    der(x) = A*x + B*u;
    y = C*x + D*u;
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end UIT_linear;

  model UIT_OL_L_NL
    ADM1_P.UIT_linear uIT_linear annotation(
      Placement(visible = true, transformation(origin = {36, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.UIT uit annotation(
      Placement(visible = true, transformation(origin = {34, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant pH_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {46, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {88, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_slurry(height = 2.4e-5, startTime = 0.5) annotation(
      Placement(visible = true, transformation(origin = {-142, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant slurry_bar(k = (1 - 0.22)*2.4e-4) annotation(
      Placement(visible = true, transformation(origin = {-96, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant2(k = 0) annotation(
      Placement(visible = true, transformation(origin = {-100, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant silage_bar(k = 0.22*2.4e-4) annotation(
      Placement(visible = true, transformation(origin = {-98, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Qch4_bar(k = 0.00830822) annotation(
      Placement(visible = true, transformation(origin = {46, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add2(k1 = -1, k2 = +1) annotation(
      Placement(visible = true, transformation(origin = {88, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_silage(height = 1, startTime = 0.5) annotation(
      Placement(visible = true, transformation(origin = {-144, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3 annotation(
      Placement(visible = true, transformation(origin = {-12, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(step_slurry.y, add.u1) annotation(
      Line(points = {{-131, 56}, {-22, 56}}, color = {0, 0, 127}));
    connect(step_slurry.y, uIT_linear.u[2]) annotation(
      Line(points = {{-131, 56}, {-34, 56}, {-34, -64}, {26, -64}}, color = {0, 0, 127}));
    connect(slurry_bar.y, add.u2) annotation(
      Line(points = {{-85, 18}, {-22, 18}, {-22, 44}}, color = {0, 0, 127}));
    connect(add.y, uit.q[2]) annotation(
      Line(points = {{2, 50}, {5, 50}, {5, 49}, {26, 49}}, color = {0, 0, 127}));
    connect(uit.y_dig[1], add1.u1) annotation(
      Line(points = {{43, 42}, {76, 42}, {76, 40}}, color = {0, 0, 127}));
    connect(pH_bar.y, add1.u2) annotation(
      Line(points = {{58, 16}, {76, 16}, {76, 28}}, color = {0, 0, 127}));
    connect(constant2.y, uit.q[1]) annotation(
      Line(points = {{-89, 82}, {26, 82}, {26, 49}}, color = {0, 0, 127}));
    connect(constant2.y, uIT_linear.u[1]) annotation(
      Line(points = {{-88, 82}, {26, 82}, {26, -64}}, color = {0, 0, 127}));
    connect(Qch4_bar.y, add2.u1) annotation(
      Line(points = {{58, 82}, {76, 82}, {76, 70}}, color = {0, 0, 127}));
    connect(uit.y_gas[4], add2.u2) annotation(
      Line(points = {{44, 48}, {76, 48}, {76, 58}}, color = {0, 0, 127}));
    connect(step_silage.y, add3.u1) annotation(
      Line(points = {{-133, 0}, {-24, 0}}, color = {0, 0, 127}));
    connect(silage_bar.y, add3.u2) annotation(
      Line(points = {{-86, -38}, {-24, -38}, {-24, -12}}, color = {0, 0, 127}));
    connect(step_silage.y, uIT_linear.u[3]) annotation(
      Line(points = {{-132, 0}, {26, 0}, {26, -64}}, color = {0, 0, 127}));
    connect(add3.y, uit.q[3]) annotation(
      Line(points = {{0, -6}, {26, -6}, {26, 50}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end UIT_OL_L_NL;

  model UIT_CL_L_NL
    //Parameters tf Qch4
    parameter Integer m = 0 + 1;
    parameter Integer n = 1 + 1;
    parameter Real beta[m] = {0.001162};
    parameter Real alpha[n] = {1, 1.149e-5};
    //
    ADM1_P.UIT_linear uIT_linear annotation(
      Placement(visible = true, transformation(origin = {24, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.UIT uit annotation(
      Placement(visible = true, transformation(origin = {34, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant pH_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {46, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add pH(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {88, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant slurry_bar(k = (1 - 0.22)*2.4e-4) annotation(
      Placement(visible = true, transformation(origin = {-96, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add annotation(
      Placement(visible = true, transformation(origin = {-10, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant constant2(k = 0) annotation(
      Placement(visible = true, transformation(origin = {-100, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant silage_bar(k = 0.22*2.4e-4) annotation(
      Placement(visible = true, transformation(origin = {-98, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant Qch4_bar(k = 0.00830822) annotation(
      Placement(visible = true, transformation(origin = {46, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add Qch4(k1 = -1, k2 = +1) annotation(
      Placement(visible = true, transformation(origin = {88, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3 annotation(
      Placement(visible = true, transformation(origin = {-12, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain(k = 0.01) annotation(
      Placement(visible = true, transformation(origin = {-150, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimIntegrator limIntegrator(k = 0.000001) annotation(
      Placement(visible = true, transformation(origin = {-182, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction1(a = {1, 0}, b = 1e-2*alpha) annotation(
      Placement(visible = true, transformation(origin = {-170, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_gas(height = 0.001, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-260, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_dig(height = 0.0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-262, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback annotation(
      Placement(visible = true, transformation(origin = {-210, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {-212, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimIntegrator limIntegrator1(k = 0.000001) annotation(
      Placement(visible = true, transformation(origin = {-184, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Gain gain1(k = 0.01) annotation(
      Placement(visible = true, transformation(origin = {-152, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {-214, -72}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {1, 0}, b = 1e-2*alpha) annotation(
      Placement(visible = true, transformation(origin = {-172, -122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback3 annotation(
      Placement(visible = true, transformation(origin = {-212, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(slurry_bar.y, add.u2) annotation(
      Line(points = {{-85, 18}, {-22, 18}, {-22, 44}}, color = {0, 0, 127}));
    connect(add.y, uit.q[2]) annotation(
      Line(points = {{2, 50}, {5, 50}, {5, 49}, {26, 49}}, color = {0, 0, 127}));
    connect(uit.y_dig[1], pH.u1) annotation(
      Line(points = {{43, 42}, {76, 42}, {76, 40}}, color = {0, 0, 127}));
    connect(pH_bar.y, pH.u2) annotation(
      Line(points = {{58, 16}, {76, 16}, {76, 28}}, color = {0, 0, 127}));
    connect(constant2.y, uit.q[1]) annotation(
      Line(points = {{-89, 82}, {26, 82}, {26, 49}}, color = {0, 0, 127}));
    connect(constant2.y, uIT_linear.u[1]) annotation(
      Line(points = {{-88, 82}, {14, 82}, {14, -98}}, color = {0, 0, 127}));
    connect(Qch4_bar.y, Qch4.u1) annotation(
      Line(points = {{58, 82}, {76, 82}, {76, 70}}, color = {0, 0, 127}));
    connect(uit.y_gas[4], Qch4.u2) annotation(
      Line(points = {{44, 48}, {76, 48}, {76, 58}}, color = {0, 0, 127}));
    connect(silage_bar.y, add3.u2) annotation(
      Line(points = {{-86, -38}, {-24, -38}, {-24, -12}}, color = {0, 0, 127}));
    connect(add3.y, uit.q[3]) annotation(
      Line(points = {{0, -6}, {26, -6}, {26, 50}}, color = {0, 0, 127}));
    connect(feedback1.y, limIntegrator.u) annotation(
      Line(points = {{-203, 50}, {-195, 50}}, color = {0, 0, 127}));
    connect(step_dig.y, feedback1.u1) annotation(
      Line(points = {{-251, 50}, {-221, 50}}, color = {0, 0, 127}));
    connect(gain.u, limIntegrator.y) annotation(
      Line(points = {{-162, 50}, {-171, 50}}, color = {0, 0, 127}));
    connect(step_gas.y, feedback.u1) annotation(
      Line(points = {{-249, 4}, {-249, 2}, {-219, 2}}, color = {0, 0, 127}));
    connect(gain.y, add.u1) annotation(
      Line(points = {{-139, 50}, {-22, 50}, {-22, 56}}, color = {0, 0, 127}));
    connect(feedback.y, transferFunction1.u) annotation(
      Line(points = {{-200, 2}, {-182, 2}, {-182, 0}}, color = {0, 0, 127}));
    connect(transferFunction1.y, add3.u1) annotation(
      Line(points = {{-158, 0}, {-24, 0}}, color = {0, 0, 127}));
    connect(gain1.u, limIntegrator1.y) annotation(
      Line(points = {{-164, -72}, {-173, -72}}, color = {0, 0, 127}));
    connect(feedback3.y, transferFunction.u) annotation(
      Line(points = {{-203, -120}, {-185, -120}, {-185, -122}}, color = {0, 0, 127}));
    connect(feedback2.y, limIntegrator1.u) annotation(
      Line(points = {{-205, -72}, {-197, -72}}, color = {0, 0, 127}));
    connect(gain1.y, uIT_linear.u[2]) annotation(
      Line(points = {{-140, -72}, {14, -72}, {14, -98}}, color = {0, 0, 127}));
    connect(transferFunction.y, uIT_linear.u[3]) annotation(
      Line(points = {{-160, -122}, {14, -122}, {14, -98}}, color = {0, 0, 127}));
    connect(feedback2.u2, uIT_linear.y[5]) annotation(
      Line(points = {{-214, -64}, {-214, -54}, {60, -54}, {60, -98}, {34, -98}}, color = {0, 0, 127}));
    connect(uIT_linear.y[4], feedback3.u2) annotation(
      Line(points = {{34, -98}, {60, -98}, {60, -136}, {-212, -136}, {-212, -128}}, color = {0, 0, 127}));
    connect(Qch4.y, feedback.u2) annotation(
      Line(points = {{100, 64}, {116, 64}, {116, -18}, {-210, -18}, {-210, -6}}, color = {0, 0, 127}));
    connect(pH.y, feedback1.u2) annotation(
      Line(points = {{100, 34}, {116, 34}, {116, 98}, {-212, 98}, {-212, 58}}, color = {0, 0, 127}));
    connect(step_dig.y, feedback2.u1) annotation(
      Line(points = {{-250, 50}, {-236, 50}, {-236, -72}, {-222, -72}}, color = {0, 0, 127}));
    connect(step_gas.y, feedback3.u1) annotation(
      Line(points = {{-248, 4}, {-250, 4}, {-250, -120}, {-220, -120}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram);
  end UIT_CL_L_NL;

  model Multiple_UIT_OL
    //Delete "pulse" block to speed up the simulation
    parameter Real feed_ratio = 0.22;
    parameter Real liquidcontrol_ratio = 0.1;
    //  Modelica.Blocks.Sources.Pulse pulse_silage(amplitude = 0, nperiod = 0, offset = 0, period(displayUnit = "s") = 86400, startTime(displayUnit = "Ms") = 1000000, width = 300/86400*100) annotation(
    //    Placement(visible = true, transformation(origin = {-226, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    UIT_OL uit_ol(feed_ratio = feed_ratio, liquidcontrol_ratio = liquidcontrol_ratio, uit.digester.X_su_start = 2.51579, uit.digester.X_aa_start = 0.533597, uit.digester.X_fa_start = 0.311654, uit.digester.X_c4_start = 0.473614, uit.digester.X_pro_start = 0.302616, uit.digester.X_ac_start = 1.2754, uit.digester.X_h2_start = 0.604288, uit.digester.X_c_start = 0, uit.digester.X_i_start = 32.5011, uit.digester.X_ch_start = {0.738396, 0.745401, 9.31384}, uit.digester.X_pr_start = {0.137016, 0.794926}, uit.digester.X_li_start = 0.763383, uit.digester.X_p_start = 0.749283, uit.digester.S_i_start = 0.187321, uit.digester.S_su_start = 0.0246661, uit.digester.S_aa_start = 0.0260058, uit.digester.S_fa_start = 0.0444515, uit.digester.S_va_start = 0.00351407, uit.digester.S_bu_start = 0.00644113, uit.digester.S_pro_start = 0.0508903, uit.digester.S_ac_start = 0.206254, uit.digester.S_h2_start = 6.87757e-07, uit.digester.S_ch4_start = 0.269498, uit.digester.S_ic_start = 0.231575, uit.digester.S_in_start = 0.142396, uit.digester.S_ip_start = 0.00506317, uit.digester.S_cat_start = 0.111241, uit.digester.S_ca_start = 3.86498e-05, uit.digester.S_mg_start = 6.43172e-05, uit.digester.S_an_start = 0.01604, uit.digester.ash_start = 12.9512, uit.digester.X_lig_start = 11.9834, uit.digester.S_gas_h2_start = 5.46713e-06, uit.digester.S_gas_ch4_start = 1.27501, uit.digester.S_gas_co2_start = 0.0164631, uit.digester.S_gas_nh3_start = 2.81158e-06, uit.digester.X_acp_start = 9.40062e-12, uit.digester.X_stru_start = 0.00972212, uit.digester.X_ccm_start = 0.00520435, uit.digester.X_mag_start = 1.38408e-9, uit.limPID.xi_start = 0.0227054, step_slurry(height = 0), step_silage(height = 0), step_tomatosouce(height = 2.4e-5), uit.digester.precipitation = true, uit.digester.ideality = false) annotation(
      Placement(visible = true, transformation(origin = {-66, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //
    UIT_OL uit_ol_pulse(feed_ratio = feed_ratio, liquidcontrol_ratio = liquidcontrol_ratio, uit.digester.X_su_start = 2.51579, uit.digester.X_aa_start = 0.533597, uit.digester.X_fa_start = 0.311654, uit.digester.X_c4_start = 0.473614, uit.digester.X_pro_start = 0.302616, uit.digester.X_ac_start = 1.2754, uit.digester.X_h2_start = 0.604288, uit.digester.X_c_start = 0, uit.digester.X_i_start = 32.5011, uit.digester.X_ch_start = {0.738396, 0.745401, 9.31384}, uit.digester.X_pr_start = {0.137016, 0.794926}, uit.digester.X_li_start = 0.763383, uit.digester.X_p_start = 0.749283, uit.digester.S_i_start = 0.187321, uit.digester.S_su_start = 0.0246661, uit.digester.S_aa_start = 0.0260058, uit.digester.S_fa_start = 0.0444515, uit.digester.S_va_start = 0.00351407, uit.digester.S_bu_start = 0.00644113, uit.digester.S_pro_start = 0.0508903, uit.digester.S_ac_start = 0.206254, uit.digester.S_h2_start = 6.87757e-07, uit.digester.S_ch4_start = 0.269498, uit.digester.S_ic_start = 0.231575, uit.digester.S_in_start = 0.142396, uit.digester.S_ip_start = 0.00506317, uit.digester.S_cat_start = 0.111241, uit.digester.S_ca_start = 3.86498e-05, uit.digester.S_mg_start = 6.43172e-05, uit.digester.S_an_start = 0.01604, uit.digester.ash_start = 12.9512, uit.digester.X_lig_start = 11.9834, uit.digester.S_gas_h2_start = 5.46713e-06, uit.digester.S_gas_ch4_start = 1.27501, uit.digester.S_gas_co2_start = 0.0164631, uit.digester.S_gas_nh3_start = 2.81158e-06, uit.digester.X_acp_start = 9.40062e-12, uit.digester.X_stru_start = 0.00972212, uit.digester.X_ccm_start = 0.00520435, uit.digester.X_mag_start = 1.38408e-9, uit.limPID.xi_start = 0.0227054, step_slurry(height = 0), step(height = -feed_ratio*(1 - liquidcontrol_ratio)*2.4e-4), step_silage(height = 0), step_tomatosouce(height = 2.4e-5), uit.digester.precipitation = true, uit.digester.ideality = false);
    //
    //ADM1_P.UIT_OL uit_higherstep(step_slurry(height = 0), step_silage(height = 0)) annotation(
    //        Placement(visible = true, transformation(origin = {-30, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //
    //UIT_OL uit_feedratio(feed_ratio = 0.3, step_slurry(height = 0), step_silage(height = 2.4e-5), pH_bar.k = 7.40565, Qch4_bar.k = 0.0100662, uit.digester.X_su_start = 3.33579, uit.digester.X_aa_start = 0.617263, uit.digester.X_fa_start = 0.340707, uit.digester.X_c4_start = 0.588298, uit.digester.X_pro_start = 0.394443, uit.digester.X_ac_start = 1.58728, uit.digester.X_h2_start = 0.76925, uit.digester.X_c_start = 0, uit.digester.X_i_start = 38.7348, uit.digester.X_ch_start = {1.04817, 0.899856, 13.1045}, uit.digester.X_pr_start = {0.150361, 0.959917}, uit.digester.X_li_start = 0.834207, uit.digester.X_p_start = 0.951686, uit.digester.S_i_start = 0.237922, uit.digester.S_su_start = 0.0246962, uit.digester.S_aa_start = 0.0260383, uit.digester.S_fa_start = 0.0445159, uit.digester.S_va_start = 0.00337488, uit.digester.S_bu_start = 0.00648072, uit.digester.S_pro_start = 0.0509667, uit.digester.S_ac_start = 0.221278, uit.digester.S_h2_start = 6.88586e-07, uit.digester.S_ch4_start = 0.328428, uit.digester.S_ic_start = 0.244466, uit.digester.S_in_start = 0.152886, uit.digester.S_ip_start = 0.00385423, uit.digester.S_cat_start = 0.109064, uit.digester.S_ca_start = 3.74676e-05, uit.digester.S_mg_start = 8.11035e-05, uit.digester.S_an_start = 0.014, uit.digester.ash_start = 13.9041, uit.digester.X_lig_start = 12.7707, uit.digester.S_gas_h2_start = 4.44812e-06, uit.digester.S_gas_ch4_start = 1.25697, uit.digester.S_gas_co2_start = 0.016745, uit.digester.S_gas_nh3_start = 2.97219e-06, uit.digester.X_acp_start = 8.43372e-12, uit.digester.X_stru_start = 0.00902089, uit.digester.X_ccm_start = 0.00486653, uit.digester.X_mag_start = 1.77975e-9, uit.limPID.xi_start = 0.0288498) annotation(
    //      Placement(visible = true, transformation(origin = {-72, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //
    Modelica.Blocks.Sources.Pulse pulse_silage(amplitude = 0.01368576, nperiod = -1, offset = 0, period(displayUnit = "s") = 86400, startTime(displayUnit = "Ms") = 1000000, width = 300/86400*100) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {5*86400, 1}, b = {1}) annotation(
      Placement(visible = true, transformation(origin = {20, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    transferFunction.u = uit_ol_pulse.qasquality.y;
    uit_ol.add1.u2 = 0;
    uit_ol_pulse.add1.u2 = pulse_silage.y;
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Multiple_UIT_OL;

  model UIT_linear_CL_dig_2
    parameter Integer m = 2 + 1;
    parameter Integer n = 2 + 1;
    parameter Real beta[m] = {0, -0.004507, 1.624e-9};
    parameter Real alpha[n] = {1, 7.841e-5, 2.246e-11};
    Real ISE(start = 0, fixed = true);
    //
    Modelica.Blocks.Sources.Step step(height = 1, offset = 0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-196, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {-52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {1, 0}, b = 0.0009*{1, 1e-6}, initType = Modelica.Blocks.Types.Init.InitialOutput, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {-20, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction1(a = alpha, b = beta, initType = Modelica.Blocks.Types.Init.InitialState, y_start = 0) annotation(
      Placement(visible = true, transformation(origin = {60, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    der(ISE) = 0;
//
    connect(step.y, feedback2.u1) annotation(
      Line(points = {{-185, -14}, {-61, -14}, {-61, 24}}, color = {0, 0, 127}));
    connect(feedback2.y, transferFunction.u) annotation(
      Line(points = {{-43, 24}, {-33, 24}, {-33, 22}}, color = {0, 0, 127}));
    connect(transferFunction.y, transferFunction1.u) annotation(
      Line(points = {{-9, 22}, {31, 22}, {31, 2}, {47, 2}}, color = {0, 0, 127}));
    connect(feedback2.u2, transferFunction1.y) annotation(
      Line(points = {{-52, 16}, {-50, 16}, {-50, -26}, {94, -26}, {94, 2}, {72, 2}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_linear_CL_dig_2;

  model UIT_CL_online
    parameter Integer m = 0 + 1;
    parameter Integer n = 1 + 1;
    parameter Real beta[m] = {0.001162};
    parameter Real alpha[n] = {1, 1.149e-5};
    Real ISE(start = 0, fixed = true);
    parameter Real feed_ratio = 0.22;
    //
    UIT uit(digester.X_su_start = 0.565044, digester.X_aa_start = 0.371645, digester.X_fa_start = 0.129986, digester.X_c4_start = 0.223898, digester.X_pro_start = 0.0881904, digester.X_ac_start = 0.511129, digester.X_h2_start = 0.187471, digester.X_c_start = 0, digester.X_i_start = 28.8257, digester.X_ch_start = {0.152025, 0.160662, 2.50754}, digester.X_pr_start = {0.0896949, 0.495966}, digester.X_li_start = 0.290954, digester.X_p_start = 0.327725, digester.S_i_start = 0.0819312, digester.S_su_start = 0.0224999, digester.S_aa_start = 0.0236754, digester.S_fa_start = 0.039656, digester.S_va_start = 0.00392825, digester.S_bu_start = 0.00533233, digester.S_pro_start = 0.0452273, digester.S_ac_start = 0.45836, digester.S_h2_start = 6.28146e-07, digester.S_ch4_start = 0.118711, digester.S_ic_start = 0.282775, digester.S_in_start = 0.171235, digester.S_ip_start = 0.00828052, digester.S_cat_start = 0.155805, digester.S_ca_start = 2.06144e-05, digester.S_mg_start = 2.16158e-05, digester.S_an_start = 0.02, digester.ash_start = 14.673, digester.X_lig_start = 14.8112, digester.S_gas_h2_start = 1.2074e-05, digester.S_gas_ch4_start = 1.40644, digester.S_gas_co2_start = 0.0144066, digester.S_gas_nh3_start = 5.27034e-06, digester.X_acp_start = 7.2534e-12, digester.X_stru_start = 0.0129804, digester.X_ccm_start = 0.00698337, digester.X_mag_start = 7.8361e-10, limPID.xi_start = 0.00707716) annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable slurry(table = [0, (1 - feed_ratio)*2.4e-4; 732, (1 - feed_ratio)*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-70, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable manure(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {14, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction(a = {1, 0.001245, 5.249e-9, 1.175e-14, 3.307e-21, 1.96e-28, 0}, b = {0.001011, 3.708e-8, 4.493e-13, 2.049e-18, 3.55e-24, 1.613e-30, 1.105e-37}) annotation(
      Placement(visible = true, transformation(origin = {-140, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {-28, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse_silage(amplitude = 0.0, nperiod = 1, offset = 0, period(displayUnit = "s") = 86400, startTime(displayUnit = "Ms") = 1000000, width = 300/86400) annotation(
      Placement(visible = true, transformation(origin = {-72, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback1 annotation(
      Placement(visible = true, transformation(origin = {-182, 18}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step_dig(height = 0.0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-232, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add4(k1 = -1) annotation(
      Placement(visible = true, transformation(origin = {174, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(
      Placement(visible = true, transformation(origin = {130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant gasquality_bar(k = 1.5254) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    der(ISE) = 0;
//
    connect(add1.y, uit.q[2]) annotation(
      Line(points = {{-17, 34}, {-2.5, 34}, {-2.5, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(manure.y, uit.q[1]) annotation(
      Line(points = {{25, 86}, {25, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(slurry.y, add1.u1) annotation(
      Line(points = {{-58, 38}, {-40, 38}, {-40, 40}}, color = {0, 0, 127}));
    connect(step_dig.y, feedback1.u1) annotation(
      Line(points = {{-220, 18}, {-190, 18}}, color = {0, 0, 127}));
    connect(feedback1.y, transferFunction.u) annotation(
      Line(points = {{-172, 18}, {-152, 18}}, color = {0, 0, 127}));
    connect(division.y, add4.u2) annotation(
      Line(points = {{142, 20}, {162, 20}, {162, 22}}, color = {0, 0, 127}));
    connect(gasquality_bar.y, add4.u1) annotation(
      Line(points = {{142, 54}, {162, 54}, {162, 34}}, color = {0, 0, 127}));
    connect(uit.y_gas[2], division.u1) annotation(
      Line(points = {{54, 4}, {82, 4}, {82, 26}, {118, 26}}, color = {0, 0, 127}));
    connect(uit.y_gas[3], division.u2) annotation(
      Line(points = {{54, 4}, {118, 4}, {118, 14}}, color = {0, 0, 127}));
    connect(feedback1.u2, add4.y) annotation(
      Line(points = {{-182, 26}, {-182, 72}, {200, 72}, {200, 28}, {186, 28}}, color = {0, 0, 127}));
    connect(transferFunction.y, add1.u2) annotation(
      Line(points = {{-128, 18}, {-40, 18}, {-40, 28}}, color = {0, 0, 127}));
    connect(step.y, uit.q[3]) annotation(
      Line(points = {{-28, -50}, {36, -50}, {36, 6}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_CL_online;

  model UIT_linear_CL_gasquality
    parameter Integer m = 2 + 1;
    parameter Integer n = 2 + 1;
    parameter Real beta[m] = {0, -0.004507, 1.624e-9};
    parameter Real alpha[n] = {1, 7.841e-5, 2.246e-11};
    Real ISE(start = 0, fixed = true);
    //
    Modelica.Blocks.Sources.Step step(height = 1, offset = 0, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-196, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Feedback feedback2 annotation(
      Placement(visible = true, transformation(origin = {-52, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction tf_gasquality(a = {1, 1.43e-5, 6.047e-11, 8.008e-17, 3.006e-23}, b = {-7.016e-8, -1.696e-14, 1.931e-21}) annotation(
      Placement(visible = true, transformation(origin = {60, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.TransferFunction transferFunction2(a = {1, 0.001245, 5.249e-9, 1.175e-14, 3.307e-21, 1.96e-28, 0}, b = {0.001011, 3.708e-8, 4.493e-13, 2.049e-18, 3.55e-24, 1.613e-30, 1.105e-37}) annotation(
      Placement(visible = true, transformation(origin = {-20, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    der(ISE) = 0;
//
    connect(step.y, feedback2.u1) annotation(
      Line(points = {{-185, -14}, {-61, -14}, {-61, 24}}, color = {0, 0, 127}));
    connect(transferFunction2.u, feedback2.y) annotation(
      Line(points = {{-32, 54}, {-32, 24}, {-42, 24}}, color = {0, 0, 127}));
    connect(transferFunction2.y, tf_gasquality.u) annotation(
      Line(points = {{-8, 54}, {48, 54}, {48, 42}}, color = {0, 0, 127}));
    connect(tf_gasquality.y, feedback2.u2) annotation(
      Line(points = {{72, 42}, {84, 42}, {84, -14}, {-52, -14}, {-52, 16}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_linear_CL_gasquality;

  model UIT_CL_online_
    parameter Integer m = 0 + 1;
    parameter Integer n = 1 + 1;
    parameter Real beta[m] = {0.001162};
    parameter Real alpha[n] = {1, 1.149e-5};
    Real ISE(start = 0, fixed = true);
    parameter Real feed_ratio = 0.22;
    //
    UIT uit(digester.X_su_start = 0.565044, digester.X_aa_start = 0.371645, digester.X_fa_start = 0.129986, digester.X_c4_start = 0.223898, digester.X_pro_start = 0.0881904, digester.X_ac_start = 0.511129, digester.X_h2_start = 0.187471, digester.X_c_start = 0, digester.X_i_start = 28.8257, digester.X_ch_start = {0.152025, 0.160662, 2.50754}, digester.X_pr_start = {0.0896949, 0.495966}, digester.X_li_start = 0.290954, digester.X_p_start = 0.327725, digester.S_i_start = 0.0819312, digester.S_su_start = 0.0224999, digester.S_aa_start = 0.0236754, digester.S_fa_start = 0.039656, digester.S_va_start = 0.00392825, digester.S_bu_start = 0.00533233, digester.S_pro_start = 0.0452273, digester.S_ac_start = 0.45836, digester.S_h2_start = 6.28146e-07, digester.S_ch4_start = 0.118711, digester.S_ic_start = 0.282775, digester.S_in_start = 0.171235, digester.S_ip_start = 0.00828052, digester.S_cat_start = 0.155805, digester.S_ca_start = 2.06144e-05, digester.S_mg_start = 2.16158e-05, digester.S_an_start = 0.02, digester.ash_start = 14.673, digester.X_lig_start = 14.8112, digester.S_gas_h2_start = 1.2074e-05, digester.S_gas_ch4_start = 1.40644, digester.S_gas_co2_start = 0.0144066, digester.S_gas_nh3_start = 5.27034e-06, digester.X_acp_start = 7.2534e-12, digester.X_stru_start = 0.0129804, digester.X_ccm_start = 0.00698337, digester.X_mag_start = 7.8361e-10, limPID.xi_start = 0.00707716) annotation(
      Placement(visible = true, transformation(origin = {44, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable slurry(table = [0, (1 - feed_ratio)*2.4e-4; 732, (1 - feed_ratio)*2.4e-4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-70, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable manure(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {14, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add1 annotation(
      Placement(visible = true, transformation(origin = {-28, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Pulse pulse_silage(amplitude = 0.0, nperiod = 1, offset = 0, period(displayUnit = "s") = 86400, startTime(displayUnit = "Ms") = 1000000, width = 300/86400) annotation(
      Placement(visible = true, transformation(origin = {-72, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add3(k2 = -1) annotation(
      Placement(visible = true, transformation(origin = {152, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant dig_bar(k = 7.44982) annotation(
      Placement(visible = true, transformation(origin = {116, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Add add4(k1 = -1) annotation(
      Placement(visible = true, transformation(origin = {174, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Math.Division division annotation(
      Placement(visible = true, transformation(origin = {130, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant gasquality_bar(k = 1.5254) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//
    der(ISE) = 0;
//
    connect(add1.y, uit.q[2]) annotation(
      Line(points = {{-17, 34}, {-2.5, 34}, {-2.5, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(manure.y, uit.q[1]) annotation(
      Line(points = {{25, 86}, {25, 6}, {36, 6}}, color = {0, 0, 127}));
    connect(slurry.y, add1.u1) annotation(
      Line(points = {{-58, 38}, {-40, 38}, {-40, 40}}, color = {0, 0, 127}));
    connect(dig_bar.y, add3.u2) annotation(
      Line(points = {{127, -18}, {140, -18}}, color = {0, 0, 127}));
    connect(uit.y_dig[1], add3.u1) annotation(
      Line(points = {{54, -2}, {74, -2}, {74, -6}, {140, -6}}, color = {0, 0, 127}));
    connect(pulse_silage.y, uit.q[3]) annotation(
      Line(points = {{-60, -36}, {36, -36}, {36, 6}}, color = {0, 0, 127}));
    connect(division.y, add4.u2) annotation(
      Line(points = {{142, 20}, {162, 20}, {162, 22}}, color = {0, 0, 127}));
    connect(gasquality_bar.y, add4.u1) annotation(
      Line(points = {{142, 54}, {162, 54}, {162, 34}}, color = {0, 0, 127}));
    connect(uit.y_gas[2], division.u1) annotation(
      Line(points = {{54, 4}, {82, 4}, {82, 26}, {118, 26}}, color = {0, 0, 127}));
    connect(uit.y_gas[3], division.u2) annotation(
      Line(points = {{54, 4}, {118, 4}, {118, 14}}, color = {0, 0, 127}));
    connect(manure.y, add1.u2) annotation(
      Line(points = {{26, 86}, {48, 86}, {48, 28}, {-40, 28}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"),
      Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})));
  end UIT_CL_online_;

  model Multiple_Flores
    Flores flores_base annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Flores flores_lowca(inflow.ca = 0.007, inflow.mg = 0) annotation(
      Placement(visible = true, transformation(origin = {-70, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Flores flores_lowmg(inflow.ca = 0.0, inflow.mg = 0.013) annotation(
      Placement(visible = true, transformation(origin = {-70, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Flores flores_highca(inflow.ca = 0.007*8, inflow.mg = 0) annotation(
      Placement(visible = true, transformation(origin = {-24, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Flores flores_highmg(inflow.ca = 0.0, inflow.mg = 0.013*8) annotation(
      Placement(visible = true, transformation(origin = {-28, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    annotation(
      experiment(StartTime = 0, StopTime = 6.32448e+07, Tolerance = 1e-6, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Multiple_Flores;

  model Sensitivity_UIT
    UIT_OL uit_ol;
    UIT_OL uit_ol_k_hyd_xchm(uit.digester.k_hyd_xchm = 0.5);
    UIT_OL uit_ol_km_ac(uit.digester.k_m_ac = 5);
    Real SI_k_hyd_xchm, SI_k_m_ac;
  equation
    SI_k_hyd_xchm = uit_ol.uit.digester.k_hyd_xchm*(uit_ol.uit.Gas_Meter.x_ch4 - uit_ol_k_hyd_xchm.uit.Gas_Meter.x_ch4)/(uit_ol.uit.digester.k_hyd_xchm - uit_ol_k_hyd_xchm.uit.digester.k_hyd_xchm);
    SI_k_m_ac = uit_ol.uit.digester.k_m_ac*(uit_ol.uit.Gas_Meter.x_ch4 - uit_ol_km_ac.uit.Gas_Meter.x_ch4)/(uit_ol.uit.digester.k_m_ac - uit_ol_km_ac.uit.digester.k_m_ac);
    annotation(
      experiment(StartTime = 0, StopTime = 1e+06, Tolerance = 1e-06, Interval = 360.101),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Sensitivity_UIT;

  model Sgo_AC
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    Real Sample_time = 86400*11;
    Real delta_prova = 86400*10;
    //  ADM1_P.BlockLibrary.Digester digester(X_su_start = 0.156028,
    //X_aa_start = 0.435487,
    //X_fa_start = 0.273309,
    //X_c4_start = 0.175828,
    //X_pro_start = 0.0599003,
    //X_ac_start = 0.431741,
    //X_h2_start = 0.175683,
    //X_c_start = 0.291302,
    //X_i_start = 10.8967,
    //X_ch_start = {1.02655e-67,0.229839,0.000260655},
    //X_pr_start = {6.05665e-68,1.33439},
    //X_li_start = 1.27877,
    //X_p_start = 0.487235,
    //S_i_start = 0.0154883,
    //S_su_start = 0.0393944,
    //S_aa_start = 0.0415751,
    //S_fa_start = 0.146442,
    //S_va_start = 0.0065279,
    //S_bu_start = 0.0073302,
    //S_pro_start = 0.0393866,
    //S_ac_start = 0.0462823,
    //S_h2_start = 9.716e-07,
    //S_ch4_start = 0.0395999,
    //S_ic_start = 0.0978747,
    //S_in_start = 0.0486144,
    //S_ip_start = 0.0041804,
    //S_cat_start = 0.105552,
    //S_ca_start = 6.80009e-06,
    //S_mg_start = 7.20234e-06,
    //S_an_start = 0.061095,
    //ash_start = 7.86867,
    //X_lig_start = 0.266717,
    //S_gas_h2_start = 4.5979e-05,
    //S_gas_ch4_start = 1.18341,
    //S_gas_co2_start = 0.0197639,
    //S_gas_nh3_start = 2.89279e-07,
    //X_acp_start = 1.98538e-19,
    //X_stru_start = -4.81656e-20,
    //X_ccm_start = -4.07459e-15,
    //X_mag_start = 716434e-12,
    //f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester_AC digester(S_aa_start = 0.054, S_ac_start = 0.06, S_an_start = 0.05, S_bu_start = 0.01, S_ca_start = 1e-18, S_cat_start = 0.096, S_ch4_start = 0.032, S_fa_start = 0.17, S_gas_ch4_start = 0.95, S_gas_co2_start = 0.023, S_gas_h2_start = 1.2e-6, S_gas_n2_start = 3e-8, S_gas_nh3_start = 1.2e-7, S_h2_start = 1.2e-6, S_i_start = 0.2, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.0031, S_mg_start = 1e-18, S_n2_start = 1e-10, S_pro_start = 0.15, S_su_start = 0.07, S_va_start = 0.008, X_aa_start = 0.207, X_ac_start = 0.29, X_acp_start = 1e-18, X_c4_start = 0.1, X_c_start = 0.28, X_ccm_start = 1e-18, X_ch_start = {0.2, 0.99, 0.000000000000000260655}, X_fa_start = 0.19, X_h2_start = 0.112, X_i_start = 9.8, X_li_start = 1, X_lig_start = 1e-20, X_mag_start = 1e-18, X_p_start = 0.045, X_pr_start = {0.66, 4.4}, X_pro_start = 0.026, X_stru_start = 1e-18, X_su_start = 0.09, ideality = false, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {40, -10}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    //  ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {110, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Ti = 12000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 4, strict = false, xi_start = 0.00303443, yMax = 100000, yMin = 0, y_start = 0.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_AC sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {158, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci Sludge(COD_VS_CH = 32*6/180, COD_VS_LI = 2.9, COD_VS_PR = 1.42, TKN = true, an = 0.04, f_Xbiom_ch = 0.1, f_Xc_in = 0, f_Xch_s = 0.3, f_Xpr_s = 0.5, f_ch_si = 0.25, f_ch_xc = 0.2, f_ch_xi = 0.25, f_li_xc = 0.3, f_pr_si = 0.55, f_pr_xc = 0.3, f_pr_xi = 0.55, f_si_xc = 0.1, f_xi_xc = 0.1, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sludge_dynamic.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-54, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed1_ADM1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci Expired_yogurt(COD_VS_CH = 32*6/180, COD_VS_LI = 2.9, COD_VS_PR = 1.42, TKN = false, an = 0.04, f_Xc_in = 0, f_Xch_s = 0, f_Xpr_s = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/yogurt.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC batch(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_tot = 900/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 8, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {170, 90}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Batch(k = 37 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {112, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-156, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable acetato(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/Acetato_20220401_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 11*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {150, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed2_ADM1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable T_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_T_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Open_AC open(S_aa_start = 0.0353, S_ac_start = 0.0065, S_an_start = 0.05, S_bu_start = 0.0052, S_ca_start = 1e-18, S_cat_start = 0.099, S_ch4_start = 0.17, S_fa_start = 0.085, S_gas_ch4_start = 1.41, S_gas_co2_start = 0.145, S_gas_h2_start = 1.1e-5, S_gas_n2_start = 8.5e-5, S_gas_nh3_start = 7.6e-6, S_h2_start = 6.3e-7, S_i_start = 0.34, S_ic_start = 0.085, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-18, S_n2_start = 1e-18, S_pro_start = 0.1, S_su_start = 0.052, S_va_start = 0.0044, V_tot = 30, X_aa_start = 0.227, X_ac_start = 0.304, X_acp_start = 1e-18, X_c4_start = 0.103, X_c_start = 0.175, X_ccm_start = 1e-18, X_ch_start = {0.158, 1.12, 1e-18}, X_fa_start = 0.199, X_h2_start = 0.12, X_i_start = 9.7, X_li_start = 0.854, X_lig_start = 1e-18, X_mag_start = 1e-18, X_p_start = 0.0486, X_pr_start = {0.509, 4.46}, X_pro_start = 0.03, X_stru_start = 1e-18, X_su_start = 0.0995, ideality = false, kla = 2, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {107, -43}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable V_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_V_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_V", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Batch(k = 800/1e6) annotation(
      Placement(visible = true, transformation(origin = {80, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Open(k = 4/1e3) annotation(
      Placement(visible = true, transformation(origin = {50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Open(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {50, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Gas_Meter_stream GasMeter_Open annotation(
      Placement(visible = true, transformation(origin = {134, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable VS_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeVS_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-156, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CODtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeCODtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCODtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-130, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CHtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeCHtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCHtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-104, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable PRtot_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbePRtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-78, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable LItot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeLItot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeLItot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-52, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TVFA_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeTVFA_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {0, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable SingleVFA_meas(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeSingleVFAs_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbepH_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {52, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Alk_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeAlk_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {78, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {104, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasComposition(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeBiogasComposition_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasComposition_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {130, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasFlowrate(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeBiogasFlowRate_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasFlowRate_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {156, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_PLC(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbepH_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {26, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//Calculation of batch (re)initial conditions
    batch.Xsu_restart = open.X_su*batch.V_inoculum/batch.V_liq;
    batch.Xaa_restart = open.X_aa*batch.V_inoculum/batch.V_liq;
    batch.Xfa_restart = open.X_fa*batch.V_inoculum/batch.V_liq;
    batch.Xc4_restart = open.X_c4*batch.V_inoculum/batch.V_liq;
    batch.Xpro_restart = open.X_pro*batch.V_inoculum/batch.V_liq;
    batch.Xac_restart = open.X_ac*batch.V_inoculum/batch.V_liq;
    batch.Xh2_restart = open.X_h2*batch.V_inoculum/batch.V_liq;
    batch.Xc_restart = open.X_c*batch.V_inoculum/batch.V_liq;
    batch.Xi_restart = open.X_i*batch.V_inoculum/batch.V_liq;
    batch.Xch_restart = open.X_ch*batch.V_inoculum/batch.V_liq;
    batch.Xpr_restart = open.X_pr*batch.V_inoculum/batch.V_liq;
    batch.Xli_restart = open.X_li*batch.V_inoculum/batch.V_liq;
    batch.Xp_restart = open.X_p*batch.V_inoculum/batch.V_liq;
    batch.Si_restart = open.S_i*batch.V_inoculum/batch.V_liq;
    batch.Ssu_restart = open.S_su*batch.V_inoculum/batch.V_liq;
    batch.Saa_restart = open.S_su*batch.V_inoculum/batch.V_liq;
    batch.Sfa_restart = open.S_fa*batch.V_inoculum/batch.V_liq;
    batch.Sva_restart = open.S_va*batch.V_inoculum/batch.V_liq;
    batch.Sbu_restart = open.S_bu*batch.V_inoculum/batch.V_liq;
    batch.Spro_restart = open.S_pro*batch.V_inoculum/batch.V_liq;
    batch.Sac_restart = (open.S_ac*batch.V_inoculum + 1.488/1000)/batch.V_liq;
//batch.Sac_restart = (open.S_ac*batch.V_inoculum)/batch.V_liq;
    batch.Sh2_restart = open.S_h2*batch.V_inoculum/batch.V_liq;
    batch.Sch4_restart = open.S_ch4*batch.V_inoculum/batch.V_liq;
    batch.Sic_restart = (open.S_ic*batch.V_inoculum + 0.00860234*batch.V_water)/batch.V_liq;
    batch.Sin_restart = open.S_in*batch.V_inoculum/batch.V_liq;
    batch.Sip_restart = open.S_ip*batch.V_inoculum/batch.V_liq;
    batch.Scat_restart = (open.S_cat*batch.V_inoculum + 0.028088*batch.V_water)/batch.V_liq;
    batch.Sca_restart = open.S_ca*batch.V_inoculum/batch.V_liq;
    batch.Smg_restart = open.S_mg*batch.V_inoculum/batch.V_liq;
    batch.San_restart = open.S_an*batch.V_inoculum/batch.V_liq;
    batch.ash_restart = open.ash*batch.V_inoculum/batch.V_liq;
    batch.Xlig_restart = open.X_lig*batch.V_inoculum/batch.V_liq;
    batch.Sn2_restart = 1.569e-6;
    batch.Sgas_h2_restart = 9.765e-6;
    batch.Sgas_ch4_restart = 0.000248;
    batch.Sgas_co2_restart = 2.7145e-5;
    batch.Sgas_nh3_restart = 3.878e-12;
    batch.Sgas_n2_restart = 0.0368397;
    batch.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time then
      reinit(batch.X_su, batch.Xsu_restart);
      reinit(batch.X_aa, batch.Xaa_restart);
      reinit(batch.X_fa, batch.Xfa_restart);
      reinit(batch.X_c4, batch.Xc4_restart);
      reinit(batch.X_pro, batch.Xpro_restart);
      reinit(batch.X_ac, batch.Xac_restart);
      reinit(batch.X_h2, batch.Xh2_restart);
      reinit(batch.X_c, batch.Xc_restart);
      reinit(batch.X_i, batch.Xi_restart);
      reinit(batch.X_ch, batch.Xch_restart);
      reinit(batch.X_pr, batch.Xpr_restart);
      reinit(batch.X_li, batch.Xli_restart);
      reinit(batch.X_p, batch.Xp_restart);
      reinit(batch.S_i, batch.Si_restart);
      reinit(batch.S_su, batch.Ssu_restart);
      reinit(batch.S_aa, batch.Saa_restart);
      reinit(batch.S_fa, batch.Sfa_restart);
      reinit(batch.S_va, batch.Sva_restart);
      reinit(batch.S_bu, batch.Sbu_restart);
      reinit(batch.S_pro, batch.Spro_restart);
      reinit(batch.S_ac, batch.Sac_restart);
      reinit(batch.S_h2, batch.Sh2_restart);
      reinit(batch.S_ch4, batch.Sch4_restart);
      reinit(batch.S_ic, batch.Sic_restart);
      reinit(batch.S_in, batch.Sin_restart);
      reinit(batch.S_ip, batch.Sip_restart);
      reinit(batch.S_cat, batch.Scat_restart);
      reinit(batch.S_ca, batch.Sca_restart);
      reinit(batch.S_mg, batch.Smg_restart);
      reinit(batch.S_an, batch.San_restart);
      reinit(batch.ash, batch.ash_restart);
      reinit(batch.X_lig, batch.Xlig_restart);
      reinit(batch.S_n2, batch.Sn2_restart);
      reinit(batch.S_gas_n2, batch.Sgas_n2_restart);
      reinit(batch.S_gas_ch4, batch.Sgas_ch4_restart);
      reinit(batch.S_gas_co2, batch.Sgas_co2_restart);
      reinit(batch.S_gas_nh3, batch.Sgas_nh3_restart);
      reinit(batch.S_gas_h2, batch.Sgas_h2_restart);
      reinit(batch.Vcum_ch4, batch.Vcum_ch4_restart);
    end when;
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{48, 4}, {48, 22}, {102, 22}}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-28, 72}, {-28, 40}, {38, 40}, {38, 7}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {41, 72}, {41, 7}}, color = {0, 0, 127}));
    connect(Expired_yogurt.outlet, digester.inlet) annotation(
      Line(points = {{-52, 22}, {-12, 22}, {-12, -3}, {26, -3}}));
    connect(Sludge.outlet, digester.inlet) annotation(
      Line(points = {{-52, -28}, {-12, -28}, {-12, -3}, {26, -3}}));
    connect(T_Batch.y, batch.T_op) annotation(
      Line(points = {{123, 64}, {131.5, 64}, {131.5, 82}, {160, 82}}, color = {0, 0, 127}));
    connect(Y_Conc.y, Expired_yogurt.inlet) annotation(
      Line(points = {{-107, 44}, {-88, 44}, {-88, 26}, {-68, 26}}, color = {0, 0, 127}));
    connect(S_Conc.y, Sludge.inlet) annotation(
      Line(points = {{-107, -18}, {-88, -18}, {-88, -24}, {-68, -24}}, color = {0, 0, 127}));
    connect(T_Feed.y, Expired_yogurt.T_op) annotation(
      Line(points = {{-145, 0}, {-80, 0}, {-80, 22}, {-68, 22}}, color = {0, 0, 127}));
    connect(T_Feed.y, Sludge.T_op) annotation(
      Line(points = {{-145, 0}, {-134, 0}, {-134, -64}, {-80, -64}, {-80, -28}, {-68, -28}}, color = {0, 0, 127}));
    connect(Pressure.y[1], PID_Pgas.u_m) annotation(
      Line(points = {{-42, 72}, {-36, 72}, {-36, 48}, {-6, 48}, {-6, 60}}, color = {0, 0, 127}));
    connect(Y_Flowrate.y[1], Expired_yogurt.Q) annotation(
      Line(points = {{-106, 18}, {-88, 18}, {-88, 24}, {-68, 24}}, color = {0, 0, 127}));
    connect(S_Flowrate.y[1], Sludge.Q) annotation(
      Line(points = {{-106, -44}, {-88, -44}, {-88, -26}, {-68, -26}}, color = {0, 0, 127}));
    connect(T_Digester.y[1], digester.T_op) annotation(
      Line(points = {{3, -80}, {16, -80}, {16, -21}, {27, -21}}, color = {0, 0, 127}));
    connect(V_Digester.y[1], digester.V_liq) annotation(
      Line(points = {{4, -54}, {10, -54}, {10, -18}, {26, -18}}, color = {0, 0, 127}));
    connect(V_Batch.y, batch.V_liq) annotation(
      Line(points = {{91, 84}, {160, 84}}, color = {0, 0, 127}));
    connect(digester.outlet, open.inlet) annotation(
      Line(points = {{54, -22}, {72, -22}, {72, -39}, {91, -39}}));
    connect(V_Open.y, open.V_liq) annotation(
      Line(points = {{62, -50}, {94, -50}}, color = {0, 0, 127}));
    connect(T_Open.y, open.T_op) annotation(
      Line(points = {{62, -84}, {82, -84}, {82, -54}, {94, -54}}, color = {0, 0, 127}));
    connect(open.outlet, sink_vec.inlet) annotation(
      Line(points = {{126, -48}, {138.5, -48}, {138.5, -57}, {148, -57}}));
    connect(open.Biogas_Out, GasMeter_Open.Biogas_In) annotation(
      Line(points = {{116, -36}, {116, -10}, {126, -10}}));
    annotation(
      experiment(StartTime = 0, StopTime = 4.4672e+06, Tolerance = 1e-06, Interval = 1902.56),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=stateselection -d=bltdump -d=",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Sgo_AC;

  model Sgo_AC_noXc
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    Real Sample_time1 = 86400*11;
    Real delta_prova1 = 86400*10;
    Real Sample_time2 = 86400*11;
    Real delta_prova2 = 86400*10;
    //  ADM1_P.BlockLibrary.Digester digester(X_su_start = 0.156028,
    //X_aa_start = 0.435487,
    //X_fa_start = 0.273309,
    //X_c4_start = 0.175828,
    //X_pro_start = 0.0599003,
    //X_ac_start = 0.431741,
    //X_h2_start = 0.175683,
    //X_c_start = 0.291302,
    //X_i_start = 10.8967,
    //X_ch_start = {1.02655e-67,0.229839,0.000260655},
    //X_pr_start = {6.05665e-68,1.33439},
    //X_li_start = 1.27877,
    //X_p_start = 0.487235,
    //S_i_start = 0.0154883,
    //S_su_start = 0.0393944,
    //S_aa_start = 0.0415751,
    //S_fa_start = 0.146442,
    //S_va_start = 0.0065279,
    //S_bu_start = 0.0073302,
    //S_pro_start = 0.0393866,
    //S_ac_start = 0.0462823,
    //S_h2_start = 9.716e-07,
    //S_ch4_start = 0.0395999,
    //S_ic_start = 0.0978747,
    //S_in_start = 0.0486144,
    //S_ip_start = 0.0041804,
    //S_cat_start = 0.105552,
    //S_ca_start = 6.80009e-06,
    //S_mg_start = 7.20234e-06,
    //S_an_start = 0.061095,
    //ash_start = 7.86867,
    //X_lig_start = 0.266717,
    //S_gas_h2_start = 4.5979e-05,
    //S_gas_ch4_start = 1.18341,
    //S_gas_co2_start = 0.0197639,
    //S_gas_nh3_start = 2.89279e-07,
    //X_acp_start = 1.98538e-19,
    //X_stru_start = -4.81656e-20,
    //X_ccm_start = -4.07459e-15,
    //X_mag_start = 716434e-12,
    //f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester_AC digester(COD_VS_LI = 2.5, S_aa_start = 0.054, S_ac_start = 0.06, S_an_start = 0.05, S_bu_start = 0.01, S_ca_start = 0.015, S_cat_start = 0.096, S_ch4_start = 0.032, S_fa_start = 0.17, S_gas_ch4_start = 0.95, S_gas_co2_start = 0.023, S_gas_h2_start = 1.2e-6, S_gas_n2_start = 3e-8, S_gas_nh3_start = 1.2e-7, S_h2_start = 1.2e-6, S_i_start = 0.2, S_ic_start = 0.091, S_in_start = 0.038, S_ip_start = 0.0018, S_mg_start = 0.0019, S_n2_start = 1e-10, S_pro_start = 0.15, S_su_start = 0.07, S_va_start = 0.008, X_aa_start = 0.207, X_ac_start = 0.29, X_acp_start = 1e-18, X_c4_start = 0.1, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.25, 0.85, 1e-20}, X_fa_start = 0.19, X_h2_start = 0.112, X_i_start = 9.8, X_li_start = 1, X_lig_start = 1e-20, X_mag_start = 1e-18, X_p_start = 0.045, X_pr_start = {0.71, 4.25}, X_pro_start = 0.026, X_stru_start = 1e-18, X_su_start = 0.09, ideality = false, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {40, -2}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    //  ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Ti = 12000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 4, strict = false, xi_start = 0.00303443, yMax = 100000, yMin = 0, y_start = 0.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_AC sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {158, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci Sludge(COD_VS_CH = 32*6/180, TKN = true, an = 0.04, f_Xbiom_ch = 0.1, f_Xc_in = 0, f_Xch_s = 0.4, f_Xpr_s = 0.4, f_ch_si = 0.25, f_ch_xc = 0.2, f_ch_xi = 0.25, f_li_xc = 0.3, f_pr_si = 0.55, f_pr_xc = 0.3, f_pr_xi = 0.55, f_si_xc = 0.1, f_xi_xc = 0.1, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sludge_dynamic.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed1_ADM1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci Expired_yogurt(COD_VS_CH = 32*6/180, TKN = false, an = 0.04, f_Xc_in = 0, f_Xch_s = 0, f_Xpr_s = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/yogurt.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC Acetato_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_tot = 900/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 8, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 68}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Batch(k = 37 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {78, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-156, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable acetato_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/Acetato_20220401_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 11*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed2_ADM1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable T_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_T_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Open_AC open(S_aa_start = 0.0353, S_ac_start = 0.0065, S_an_start = 0.05, S_bu_start = 0.0052, S_ca_start = 0.015, S_cat_start = 0.099, S_ch4_start = 0.17, S_fa_start = 0.085, S_gas_ch4_start = 1.41, S_gas_co2_start = 0.145, S_gas_h2_start = 1.1e-5, S_gas_n2_start = 8.5e-5, S_gas_nh3_start = 7.6e-6, S_h2_start = 6.3e-7, S_i_start = 0.34, S_ic_start = 0.085, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 0.0019, S_n2_start = 1e-18, S_pro_start = 0.1, S_su_start = 0.052, S_va_start = 0.0044, V_tot = 30, X_aa_start = 0.227, X_ac_start = 0.304, X_acp_start = 1e-18, X_c4_start = 0.103, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.22, 0.85, 1e-20}, X_fa_start = 0.199, X_h2_start = 0.12, X_i_start = 9.7, X_li_start = 0.77, X_lig_start = 1e-18, X_mag_start = 1e-18, X_p_start = 0.046, X_pr_start = {0.58, 4.2}, X_pro_start = 0.03, X_stru_start = 1e-18, X_su_start = 0.0995, ideality = false, kla = 2, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {109, -35}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable V_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_V_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_V", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Batch(k = 800/1e6) annotation(
      Placement(visible = true, transformation(origin = {78, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Open(k = 7.5/1e3) annotation(
      Placement(visible = true, transformation(origin = {50, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Open(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {50, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream GasMeter_Open annotation(
      Placement(visible = true, transformation(origin = {134, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable VS_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeVS_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CODtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeCODtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCODtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CHtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeCHtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCHtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable PRtot_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbePRtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable LItot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeLItot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeLItot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TVFA_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeTVFA_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {0, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable SingleVFA_meas(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeSingleVFAs_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbepH_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Alk_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeAlk_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasComposition(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeBiogasComposition_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasComposition_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasFlowrate(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeBiogasFlowRate_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasFlowRate_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_PLC(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbepH_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable bmp_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/Acetato_20220401_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 11*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC BMP_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_tot = 900/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 8, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 100}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  equation
//Calculation of Acetato_A. (re)initial conditions
    Acetato_A.Xsu_restart = open.X_su*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xaa_restart = open.X_aa*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xfa_restart = open.X_fa*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xc4_restart = open.X_c4*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xpro_restart = open.X_pro*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xac_restart = open.X_ac*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xh2_restart = open.X_h2*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xc_restart = open.X_c*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xi_restart = open.X_i*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xch_restart = open.X_ch*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xpr_restart = open.X_pr*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xli_restart = open.X_li*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xp_restart = open.X_p*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Si_restart = open.S_i*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Ssu_restart = open.S_su*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Saa_restart = open.S_su*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sfa_restart = open.S_fa*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sva_restart = open.S_va*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sbu_restart = open.S_bu*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Spro_restart = open.S_pro*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sac_restart = (open.S_ac*Acetato_A.V_inoculum + 1.488/1000)/Acetato_A.V_liq;
//batch.Sac_restart = (open.S_ac*batch.V_inoculum)/batch.V_liq;
    Acetato_A.Sh2_restart = open.S_h2*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sch4_restart = open.S_ch4*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sic_restart = (open.S_ic*Acetato_A.V_inoculum + 0.00860234*Acetato_A.V_water)/Acetato_A.V_liq;
    Acetato_A.Sin_restart = open.S_in*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sip_restart = open.S_ip*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Scat_restart = (open.S_cat*Acetato_A.V_inoculum + 0.028088*Acetato_A.V_water)/Acetato_A.V_liq;
    Acetato_A.Sca_restart = open.S_ca*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Smg_restart = open.S_mg*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.San_restart = open.S_an*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.ash_restart = open.ash*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Xlig_restart = open.X_lig*Acetato_A.V_inoculum/Acetato_A.V_liq;
    Acetato_A.Sn2_restart = 1.569e-6;
    Acetato_A.Sgas_h2_restart = 9.765e-6;
    Acetato_A.Sgas_ch4_restart = 0.000248;
    Acetato_A.Sgas_co2_restart = 2.7145e-5;
    Acetato_A.Sgas_nh3_restart = 3.878e-12;
    Acetato_A.Sgas_n2_restart = 0.0368397;
    Acetato_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time1 then
      reinit(Acetato_A.X_su, Acetato_A.Xsu_restart);
      reinit(Acetato_A.X_aa, Acetato_A.Xaa_restart);
      reinit(Acetato_A.X_fa, Acetato_A.Xfa_restart);
      reinit(Acetato_A.X_c4, Acetato_A.Xc4_restart);
      reinit(Acetato_A.X_pro, Acetato_A.Xpro_restart);
      reinit(Acetato_A.X_ac, Acetato_A.Xac_restart);
      reinit(Acetato_A.X_h2, Acetato_A.Xh2_restart);
      reinit(Acetato_A.X_c, Acetato_A.Xc_restart);
      reinit(Acetato_A.X_i, Acetato_A.Xi_restart);
      reinit(Acetato_A.X_ch, Acetato_A.Xch_restart);
      reinit(Acetato_A.X_pr, Acetato_A.Xpr_restart);
      reinit(Acetato_A.X_li, Acetato_A.Xli_restart);
      reinit(Acetato_A.X_p, Acetato_A.Xp_restart);
      reinit(Acetato_A.S_i, Acetato_A.Si_restart);
      reinit(Acetato_A.S_su, Acetato_A.Ssu_restart);
      reinit(Acetato_A.S_aa, Acetato_A.Saa_restart);
      reinit(Acetato_A.S_fa, Acetato_A.Sfa_restart);
      reinit(Acetato_A.S_va, Acetato_A.Sva_restart);
      reinit(Acetato_A.S_bu, Acetato_A.Sbu_restart);
      reinit(Acetato_A.S_pro, Acetato_A.Spro_restart);
      reinit(Acetato_A.S_ac, Acetato_A.Sac_restart);
      reinit(Acetato_A.S_h2, Acetato_A.Sh2_restart);
      reinit(Acetato_A.S_ch4, Acetato_A.Sch4_restart);
      reinit(Acetato_A.S_ic, Acetato_A.Sic_restart);
      reinit(Acetato_A.S_in, Acetato_A.Sin_restart);
      reinit(Acetato_A.S_ip, Acetato_A.Sip_restart);
      reinit(Acetato_A.S_cat, Acetato_A.Scat_restart);
      reinit(Acetato_A.S_ca, Acetato_A.Sca_restart);
      reinit(Acetato_A.S_mg, Acetato_A.Smg_restart);
      reinit(Acetato_A.S_an, Acetato_A.San_restart);
      reinit(Acetato_A.ash, Acetato_A.ash_restart);
      reinit(Acetato_A.X_lig, Acetato_A.Xlig_restart);
      reinit(Acetato_A.S_n2, Acetato_A.Sn2_restart);
      reinit(Acetato_A.S_gas_n2, Acetato_A.Sgas_n2_restart);
      reinit(Acetato_A.S_gas_ch4, Acetato_A.Sgas_ch4_restart);
      reinit(Acetato_A.S_gas_co2, Acetato_A.Sgas_co2_restart);
      reinit(Acetato_A.S_gas_nh3, Acetato_A.Sgas_nh3_restart);
      reinit(Acetato_A.S_gas_h2, Acetato_A.Sgas_h2_restart);
      reinit(Acetato_A.Vcum_ch4, Acetato_A.Vcum_ch4_restart);
    end when;
//
//Calculation of BMP_A. (re)initial conditions
    BMP_A.Xsu_restart = open.X_su*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xaa_restart = open.X_aa*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xfa_restart = open.X_fa*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xc4_restart = open.X_c4*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xpro_restart = open.X_pro*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xac_restart = open.X_ac*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xh2_restart = open.X_h2*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xc_restart = open.X_c*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xi_restart = open.X_i*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xch_restart = open.X_ch*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xpr_restart = open.X_pr*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xli_restart = open.X_li*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xp_restart = open.X_p*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Si_restart = open.S_i*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Ssu_restart = open.S_su*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Saa_restart = open.S_su*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sfa_restart = open.S_fa*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sva_restart = open.S_va*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sbu_restart = open.S_bu*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Spro_restart = open.S_pro*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sac_restart = (open.S_ac*BMP_A.V_inoculum + 1.488/1000)/BMP_A.V_liq;
//batch.Sac_restart = (open.S_ac*batch.V_inoculum)/batch.V_liq;
    BMP_A.Sh2_restart = open.S_h2*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sch4_restart = open.S_ch4*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sic_restart = (open.S_ic*BMP_A.V_inoculum + 0.00860234*BMP_A.V_water)/BMP_A.V_liq;
    BMP_A.Sin_restart = open.S_in*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sip_restart = open.S_ip*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Scat_restart = (open.S_cat*BMP_A.V_inoculum + 0.018088*BMP_A.V_water)/BMP_A.V_liq;
    BMP_A.Sca_restart = open.S_ca*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Smg_restart = open.S_mg*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.San_restart = open.S_an*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.ash_restart = open.ash*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Xlig_restart = open.X_lig*BMP_A.V_inoculum/BMP_A.V_liq;
    BMP_A.Sn2_restart = 1.569e-6;
    BMP_A.Sgas_h2_restart = 9.765e-6;
    BMP_A.Sgas_ch4_restart = 0.000248;
    BMP_A.Sgas_co2_restart = 2.7145e-5;
    BMP_A.Sgas_nh3_restart = 3.878e-12;
    BMP_A.Sgas_n2_restart = 0.0368397;
    BMP_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time1 then
      reinit(BMP_A.X_su, BMP_A.Xsu_restart);
      reinit(BMP_A.X_aa, BMP_A.Xaa_restart);
      reinit(BMP_A.X_fa, BMP_A.Xfa_restart);
      reinit(BMP_A.X_c4, BMP_A.Xc4_restart);
      reinit(BMP_A.X_pro, BMP_A.Xpro_restart);
      reinit(BMP_A.X_ac, BMP_A.Xac_restart);
      reinit(BMP_A.X_h2, BMP_A.Xh2_restart);
      reinit(BMP_A.X_c, BMP_A.Xc_restart);
      reinit(BMP_A.X_i, BMP_A.Xi_restart);
      reinit(BMP_A.X_ch, BMP_A.Xch_restart);
      reinit(BMP_A.X_pr, BMP_A.Xpr_restart);
      reinit(BMP_A.X_li, BMP_A.Xli_restart);
      reinit(BMP_A.X_p, BMP_A.Xp_restart);
      reinit(BMP_A.S_i, BMP_A.Si_restart);
      reinit(BMP_A.S_su, BMP_A.Ssu_restart);
      reinit(BMP_A.S_aa, BMP_A.Saa_restart);
      reinit(BMP_A.S_fa, BMP_A.Sfa_restart);
      reinit(BMP_A.S_va, BMP_A.Sva_restart);
      reinit(BMP_A.S_bu, BMP_A.Sbu_restart);
      reinit(BMP_A.S_pro, BMP_A.Spro_restart);
      reinit(BMP_A.S_ac, BMP_A.Sac_restart);
      reinit(BMP_A.S_h2, BMP_A.Sh2_restart);
      reinit(BMP_A.S_ch4, BMP_A.Sch4_restart);
      reinit(BMP_A.S_ic, BMP_A.Sic_restart);
      reinit(BMP_A.S_in, BMP_A.Sin_restart);
      reinit(BMP_A.S_ip, BMP_A.Sip_restart);
      reinit(BMP_A.S_cat, BMP_A.Scat_restart);
      reinit(BMP_A.S_ca, BMP_A.Sca_restart);
      reinit(BMP_A.S_mg, BMP_A.Smg_restart);
      reinit(BMP_A.S_an, BMP_A.San_restart);
      reinit(BMP_A.ash, BMP_A.ash_restart);
      reinit(BMP_A.X_lig, BMP_A.Xlig_restart);
      reinit(BMP_A.S_n2, BMP_A.Sn2_restart);
      reinit(BMP_A.S_gas_n2, BMP_A.Sgas_n2_restart);
      reinit(BMP_A.S_gas_ch4, BMP_A.Sgas_ch4_restart);
      reinit(BMP_A.S_gas_co2, BMP_A.Sgas_co2_restart);
      reinit(BMP_A.S_gas_nh3, BMP_A.Sgas_nh3_restart);
      reinit(BMP_A.S_gas_h2, BMP_A.Sgas_h2_restart);
      reinit(BMP_A.Vcum_ch4, BMP_A.Vcum_ch4_restart);
    end when;
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{48.28, 11.68}, {48.28, 29.68}, {102.28, 29.68}}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 80}, {-28, 80}, {-28, 48}, {38, 48}, {38, 15}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{5, 80}, {40, 80}, {40, 15}}, color = {0, 0, 127}));
    connect(Expired_yogurt.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, 29}, {-11.2, 29}, {-11.2, 4}, {26.8, 4}}));
    connect(Sludge.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, -21}, {-11.2, -21}, {-11.2, 4}, {26.8, 4}}));
    connect(T_Batch.y, Acetato_A.T_op) annotation(
      Line(points = {{89, 70}, {107.5, 70}, {107.5, 60}, {128, 60}}, color = {0, 0, 127}));
    connect(Y_Conc.y, Expired_yogurt.inlet) annotation(
      Line(points = {{-107, 52}, {-88, 52}, {-88, 34}, {-68, 34}}, color = {0, 0, 127}));
    connect(S_Conc.y, Sludge.inlet) annotation(
      Line(points = {{-107, -10}, {-88, -10}, {-88, -16}, {-68, -16}}, color = {0, 0, 127}));
    connect(T_Feed.y, Expired_yogurt.T_op) annotation(
      Line(points = {{-145, 8}, {-80, 8}, {-80, 30}, {-68, 30}}, color = {0, 0, 127}));
    connect(T_Feed.y, Sludge.T_op) annotation(
      Line(points = {{-145, 8}, {-134, 8}, {-134, -56}, {-80, -56}, {-80, -20}, {-68, -20}}, color = {0, 0, 127}));
    connect(Pressure.y[1], PID_Pgas.u_m) annotation(
      Line(points = {{-43, 80}, {-37, 80}, {-37, 56}, {-7, 56}, {-7, 68}}, color = {0, 0, 127}));
    connect(Y_Flowrate.y[1], Expired_yogurt.Q) annotation(
      Line(points = {{-107, 26}, {-89, 26}, {-89, 32}, {-69, 32}}, color = {0, 0, 127}));
    connect(S_Flowrate.y[1], Sludge.Q) annotation(
      Line(points = {{-107, -36}, {-89, -36}, {-89, -18}, {-69, -18}}, color = {0, 0, 127}));
    connect(T_Digester.y[1], digester.T_op) annotation(
      Line(points = {{3, -72}, {16, -72}, {16, -13}, {27, -13}}, color = {0, 0, 127}));
    connect(V_Digester.y[1], digester.V_liq) annotation(
      Line(points = {{3, -46}, {9, -46}, {9, -10}, {25, -10}}, color = {0, 0, 127}));
    connect(V_Batch.y, Acetato_A.V_liq) annotation(
      Line(points = {{89, 104}, {116.5, 104}, {116.5, 62}, {128, 62}}, color = {0, 0, 127}));
    connect(digester.outlet, open.inlet) annotation(
      Line(points = {{53.68, -13.88}, {71.68, -13.88}, {71.68, -25.88}, {90.68, -25.88}}));
    connect(V_Open.y, open.V_liq) annotation(
      Line(points = {{61, -42}, {95, -42}}, color = {0, 0, 127}));
    connect(T_Open.y, open.T_op) annotation(
      Line(points = {{61, -76}, {81, -76}, {81, -45}, {95, -45}}, color = {0, 0, 127}));
    connect(open.outlet, sink_vec.inlet) annotation(
      Line(points = {{125.32, -40.1}, {138.82, -40.1}, {138.82, -49.1}, {148.32, -49.1}}));
    connect(open.Biogas_Out, GasMeter_Open.Biogas_In) annotation(
      Line(points = {{117.5, -28.88}, {117.5, -1.88}, {126, -1.88}}));
    connect(V_Batch.y, BMP_A.V_liq) annotation(
      Line(points = {{89, 104}, {119.5, 104}, {119.5, 94}, {128, 94}}, color = {0, 0, 127}));
    connect(T_Batch.y, BMP_A.T_op) annotation(
      Line(points = {{89, 70}, {108, 70}, {108, 92}, {128, 92}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 4.4672e+06, Tolerance = 1e-06, Interval = 1902.56),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=stateselection -d=bltdump -d=",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Sgo_AC_noXc;

  model Sgo_AC_noXc_VS
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    Real Sample_time1 = 86400*(11);
    Real delta_prova1 = 86400*(10);
    Real Sample_time2 = 86400*23;
    Real delta_prova2 = 86400*22;
    //  ADM1_P.BlockLibrary.Digester digester(X_su_start = 0.156028,
    //X_aa_start = 0.435487,
    //X_fa_start = 0.273309,
    //X_c4_start = 0.175828,
    //X_pro_start = 0.0599003,
    //X_ac_start = 0.431741,
    //X_h2_start = 0.175683,
    //X_c_start = 0.291302,
    //X_i_start = 10.8967,
    //X_ch_start = {1.02655e-67,0.229839,0.000260655},
    //X_pr_start = {6.05665e-68,1.33439},
    //X_li_start = 1.27877,
    //X_p_start = 0.487235,
    //S_i_start = 0.0154883,
    //S_su_start = 0.0393944,
    //S_aa_start = 0.0415751,
    //S_fa_start = 0.146442,
    //S_va_start = 0.0065279,
    //S_bu_start = 0.0073302,
    //S_pro_start = 0.0393866,
    //S_ac_start = 0.0462823,
    //S_h2_start = 9.716e-07,
    //S_ch4_start = 0.0395999,
    //S_ic_start = 0.0978747,
    //S_in_start = 0.0486144,
    //S_ip_start = 0.0041804,
    //S_cat_start = 0.105552,
    //S_ca_start = 6.80009e-06,
    //S_mg_start = 7.20234e-06,
    //S_an_start = 0.061095,
    //ash_start = 7.86867,
    //X_lig_start = 0.266717,
    //S_gas_h2_start = 4.5979e-05,
    //S_gas_ch4_start = 1.18341,
    //S_gas_co2_start = 0.0197639,
    //S_gas_nh3_start = 2.89279e-07,
    //X_acp_start = 1.98538e-19,
    //X_stru_start = -4.81656e-20,
    //X_ccm_start = -4.07459e-15,
    //X_mag_start = 716434e-12,
    //f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester_AC digester(S_aa_start = 0.054, S_ac_start = 0.06, S_an_start = 0.05, S_bu_start = 0.01, S_ca_start = 0.015, S_cat_start = 0.096, S_ch4_start = 0.032, S_fa_start = 0.17, S_gas_ch4_start = 0.95, S_gas_co2_start = 0.023, S_gas_h2_start = 1.2e-6, S_gas_n2_start = 3e-8, S_gas_nh3_start = 1.2e-7, S_h2_start = 1.2e-6, S_i_start = 0.2, S_ic_start = 0.091, S_in_start = 0.038, S_ip_start = 0.0018, S_mg_start = 0.0019, S_n2_start = 1e-10, S_pro_start = 0.15, S_su_start = 0.07, S_va_start = 0.008, X_aa_start = 0.207, X_ac_start = 0.29, X_acp_start = 1e-18, X_c4_start = 0.1, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.4, 0.45, 1e-20}, X_fa_start = 0.19, X_h2_start = 0.112, X_i_start = 11, X_li_start = 1, X_lig_start = 1e-20, X_mag_start = 1e-18, X_p_start = 0.045, X_pr_start = {0.5, 0.65}, X_pro_start = 0.026, X_stru_start = 1e-18, X_su_start = 0.09, kla = 150, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, -6}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    //  ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Ti = 12000*1.5, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 4*10, strict = false, xi_start = 0.00303443, yMax = 1000000, yMin = 0, y_start = 0.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_AC sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {158, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci_VS Sludge(COD_VS_CH = 32*6/180, TKN = true, an = 0.04, f_Xc_in = 0, f_Xch_s = 0.9, f_Xpr_s = 0.9, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.3, f_si_xc = 0.1, f_xi_xc = 0.1, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/sludge_dynamic.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Pressure(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed1_ADM1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci Expired_yogurt(COD_VS_CH = 32*6/180, TKN = false, an = 0.04, f_Xc_in = 0, f_Xch_s = 0, f_Xpr_s = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/yogurt.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC Acetato_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_inoculum = 339/1e6, V_tot = 900/1e6, V_add = 461/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 6, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 68}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Batch(k = 37 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {78, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-156, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable acetato_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/Acetato_20220401_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 11*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed2_ADM1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable T_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_T_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Open_AC open(S_aa_start = 0.0353, S_ac_start = 0.0065, S_an_start = 0.05, S_bu_start = 0.0052, S_ca_start = 0.015, S_cat_start = 0.099, S_ch4_start = 0.17, S_fa_start = 0.085, S_gas_ch4_start = 1.41, S_gas_co2_start = 0.145, S_gas_h2_start = 1.1e-5, S_gas_n2_start = 8.5e-5, S_gas_nh3_start = 7.6e-6, S_h2_start = 6.3e-7, S_i_start = 0.34, S_ic_start = 0.085, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 0.0019, S_n2_start = 1e-18, S_pro_start = 0.1, S_su_start = 0.052, S_va_start = 0.0044, T_op_mean = 298.15, V_tot = 30, X_aa_start = 0.227, X_ac_start = 0.304, X_acp_start = 1e-18, X_c4_start = 0.103, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.22, 0.85, 1e-20}, X_fa_start = 0.199, X_h2_start = 0.12, X_i_start = 9.7, X_li_start = 0.77, X_lig_start = 1e-18, X_mag_start = 1e-18, X_p_start = 0.046, X_pr_start = {0.58, 4.2}, X_pro_start = 0.03, X_stru_start = 1e-18, X_su_start = 0.0995, ideality = false, kla = 5, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {109, -35}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable V_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/Input_V_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_V", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Batch(k = 800/1e6) annotation(
      Placement(visible = true, transformation(origin = {78, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Open(k = 3/1e3) annotation(
      Placement(visible = true, transformation(origin = {50, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Open(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {50, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream GasMeter_Open annotation(
      Placement(visible = true, transformation(origin = {134, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable VS_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeVS_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CODtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeCODtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCODtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CHtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeCHtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCHtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable PRtot_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbePRtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable LItot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeLItot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeLItot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TVFA_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeTVFA_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {0, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable SingleVFA_meas(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeSingleVFAs_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbepH_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Alk_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeAlk_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasComposition(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeBiogasComposition_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasComposition_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasFlowrate(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeBiogasFlowRate_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasFlowRate_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_PLC(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbepH_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable res_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_new/Residuo_20220413_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 23*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC RES_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_inoculum = 550/1e6, V_tot = 900/1e6, V_add = 250/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 6, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 100}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasCumulated(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic/ProbeBiogasCumulated_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasCumulated_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {182, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//Calculation of Acetato_A. (re)initial conditions
    Acetato_A.Xsu_restart = (open.X_su*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xaa_restart = (open.X_aa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xfa_restart = (open.X_fa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xc4_restart = (open.X_c4*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpro_restart = (open.X_pro*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xac_restart = (open.X_ac*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xh2_restart = (open.X_h2*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xc_restart = (open.X_c*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xi_restart = (open.X_i*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xch1_restart = (open.X_ch[1]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xch2_restart = (open.X_ch[2]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpr1_restart = (open.X_pr[1]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpr2_restart = (open.X_pr[2]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xli_restart = (open.X_li*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xp_restart = (open.X_p*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Si_restart = (open.S_i*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Ssu_restart = (open.S_su*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Saa_restart = (open.S_aa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sfa_restart = (open.S_fa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sva_restart = (open.S_va*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sbu_restart = (open.S_bu*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Spro_restart = (open.S_pro*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sac_restart = (open.S_ac*Acetato_A.V_inoculum + 3.22776572668113*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sh2_restart = (open.S_h2*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sch4_restart = (open.S_ch4*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sic_restart = (open.S_ic*Acetato_A.V_inoculum + 0.00835970802523634*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sin_restart = (open.S_in*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sip_restart = (open.S_ip*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Scat_restart = (open.S_cat*Acetato_A.V_inoculum + 0.0676896780763162*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sca_restart = (open.S_ca*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Smg_restart = (open.S_mg*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.San_restart = (open.S_an*Acetato_A.V_inoculum + 0.02*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.ash_restart = (open.ash*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xlig_restart = (open.X_lig*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sn2_restart = 1.569e-6;
    Acetato_A.Sgas_h2_restart = 9.765e-6;
    Acetato_A.Sgas_ch4_restart = 0.000248;
    Acetato_A.Sgas_co2_restart = 2.7145e-5;
    Acetato_A.Sgas_nh3_restart = 3.878e-12;
    Acetato_A.Sgas_n2_restart = 0.0368397;
    Acetato_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time1 then
      reinit(Acetato_A.X_su, Acetato_A.Xsu_restart);
      reinit(Acetato_A.X_aa, Acetato_A.Xaa_restart);
      reinit(Acetato_A.X_fa, Acetato_A.Xfa_restart);
      reinit(Acetato_A.X_c4, Acetato_A.Xc4_restart);
      reinit(Acetato_A.X_pro, Acetato_A.Xpro_restart);
      reinit(Acetato_A.X_ac, Acetato_A.Xac_restart);
      reinit(Acetato_A.X_h2, Acetato_A.Xh2_restart);
      reinit(Acetato_A.X_c, Acetato_A.Xc_restart);
      reinit(Acetato_A.X_i, Acetato_A.Xi_restart);
      reinit(Acetato_A.X_ch[1], Acetato_A.Xch1_restart);
      reinit(Acetato_A.X_ch[2], Acetato_A.Xch2_restart);
      reinit(Acetato_A.X_pr[1], Acetato_A.Xpr1_restart);
      reinit(Acetato_A.X_pr[2], Acetato_A.Xpr2_restart);
      reinit(Acetato_A.X_li, Acetato_A.Xli_restart);
      reinit(Acetato_A.X_p, Acetato_A.Xp_restart);
      reinit(Acetato_A.S_i, Acetato_A.Si_restart);
      reinit(Acetato_A.S_su, Acetato_A.Ssu_restart);
      reinit(Acetato_A.S_aa, Acetato_A.Saa_restart);
      reinit(Acetato_A.S_fa, Acetato_A.Sfa_restart);
      reinit(Acetato_A.S_va, Acetato_A.Sva_restart);
      reinit(Acetato_A.S_bu, Acetato_A.Sbu_restart);
      reinit(Acetato_A.S_pro, Acetato_A.Spro_restart);
      reinit(Acetato_A.S_ac, Acetato_A.Sac_restart);
      reinit(Acetato_A.S_h2, Acetato_A.Sh2_restart);
      reinit(Acetato_A.S_ch4, Acetato_A.Sch4_restart);
      reinit(Acetato_A.S_ic, Acetato_A.Sic_restart);
      reinit(Acetato_A.S_in, Acetato_A.Sin_restart);
      reinit(Acetato_A.S_ip, Acetato_A.Sip_restart);
      reinit(Acetato_A.S_cat, Acetato_A.Scat_restart);
      reinit(Acetato_A.S_ca, Acetato_A.Sca_restart);
      reinit(Acetato_A.S_mg, Acetato_A.Smg_restart);
      reinit(Acetato_A.S_an, Acetato_A.San_restart);
      reinit(Acetato_A.ash, Acetato_A.ash_restart);
      reinit(Acetato_A.X_lig, Acetato_A.Xlig_restart);
      reinit(Acetato_A.S_n2, Acetato_A.Sn2_restart);
      reinit(Acetato_A.S_gas_n2, Acetato_A.Sgas_n2_restart);
      reinit(Acetato_A.S_gas_ch4, Acetato_A.Sgas_ch4_restart);
      reinit(Acetato_A.S_gas_co2, Acetato_A.Sgas_co2_restart);
      reinit(Acetato_A.S_gas_nh3, Acetato_A.Sgas_nh3_restart);
      reinit(Acetato_A.S_gas_h2, Acetato_A.Sgas_h2_restart);
      reinit(Acetato_A.Vcum_ch4, Acetato_A.Vcum_ch4_restart);
    end when;
//
//Calculation of RES_A.(re)initial conditions
    RES_A.Xsu_restart = (open.X_su*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xaa_restart = (open.X_aa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xfa_restart = (open.X_fa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xc4_restart = (open.X_c4*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpro_restart = (open.X_pro*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xac_restart = (open.X_ac*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xh2_restart = (open.X_h2*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xc_restart = (open.X_c*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xi_restart = (open.X_i*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xch1_restart = (open.X_ch[1]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xch2_restart = (open.X_ch[2]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpr1_restart = (open.X_pr[1]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpr2_restart = (open.X_pr[2]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xli_restart = (open.X_li*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xp_restart = (open.X_p*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Si_restart = (open.S_i*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Ssu_restart = (open.S_su*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Saa_restart = (open.S_aa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sfa_restart = (open.S_fa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sva_restart = (open.S_va*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sbu_restart = (open.S_bu*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Spro_restart = (open.S_pro*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sac_restart = (open.S_ac*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sh2_restart = (open.S_h2*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sch4_restart = (open.S_ch4*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sic_restart = (open.S_ic*RES_A.V_inoculum + 0.00866028179693023*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sin_restart = (open.S_in*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sip_restart = (open.S_ip*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Scat_restart = (open.S_cat*RES_A.V_inoculum + 0.0200002846049894*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sca_restart = (open.S_ca*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Smg_restart = (open.S_mg*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.San_restart = (open.S_an*RES_A.V_inoculum + 0.02*RES_A.V_add)/RES_A.V_liq;
    RES_A.ash_restart = (open.ash*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xlig_restart = (open.X_lig*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sn2_restart = 1.569e-6;
    RES_A.Sgas_h2_restart = 9.765e-6;
    RES_A.Sgas_ch4_restart = 0.000248;
    RES_A.Sgas_co2_restart = 2.7145e-5;
    RES_A.Sgas_nh3_restart = 3.878e-12;
    RES_A.Sgas_n2_restart = 0.0368397;
    RES_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time2 then
      reinit(RES_A.X_su, RES_A.Xsu_restart);
      reinit(RES_A.X_aa, RES_A.Xaa_restart);
      reinit(RES_A.X_fa, RES_A.Xfa_restart);
      reinit(RES_A.X_c4, RES_A.Xc4_restart);
      reinit(RES_A.X_pro, RES_A.Xpro_restart);
      reinit(RES_A.X_ac, RES_A.Xac_restart);
      reinit(RES_A.X_h2, RES_A.Xh2_restart);
      reinit(RES_A.X_c, RES_A.Xc_restart);
      reinit(RES_A.X_i, RES_A.Xi_restart);
      reinit(RES_A.X_ch[1], RES_A.Xch1_restart);
      reinit(RES_A.X_ch[2], RES_A.Xch2_restart);
      reinit(RES_A.X_pr[1], RES_A.Xpr1_restart);
      reinit(RES_A.X_pr[2], RES_A.Xpr2_restart);
      reinit(RES_A.X_li, RES_A.Xli_restart);
      reinit(RES_A.X_p, RES_A.Xp_restart);
      reinit(RES_A.S_i, RES_A.Si_restart);
      reinit(RES_A.S_su, RES_A.Ssu_restart);
      reinit(RES_A.S_aa, RES_A.Saa_restart);
      reinit(RES_A.S_fa, RES_A.Sfa_restart);
      reinit(RES_A.S_va, RES_A.Sva_restart);
      reinit(RES_A.S_bu, RES_A.Sbu_restart);
      reinit(RES_A.S_pro, RES_A.Spro_restart);
      reinit(RES_A.S_ac, RES_A.Sac_restart);
      reinit(RES_A.S_h2, RES_A.Sh2_restart);
      reinit(RES_A.S_ch4, RES_A.Sch4_restart);
      reinit(RES_A.S_ic, RES_A.Sic_restart);
      reinit(RES_A.S_in, RES_A.Sin_restart);
      reinit(RES_A.S_ip, RES_A.Sip_restart);
      reinit(RES_A.S_cat, RES_A.Scat_restart);
      reinit(RES_A.S_ca, RES_A.Sca_restart);
      reinit(RES_A.S_mg, RES_A.Smg_restart);
      reinit(RES_A.S_an, RES_A.San_restart);
      reinit(RES_A.ash, RES_A.ash_restart);
      reinit(RES_A.X_lig, RES_A.Xlig_restart);
      reinit(RES_A.S_n2, RES_A.Sn2_restart);
      reinit(RES_A.S_gas_n2, RES_A.Sgas_n2_restart);
      reinit(RES_A.S_gas_ch4, RES_A.Sgas_ch4_restart);
      reinit(RES_A.S_gas_co2, RES_A.Sgas_co2_restart);
      reinit(RES_A.S_gas_nh3, RES_A.Sgas_nh3_restart);
      reinit(RES_A.S_gas_h2, RES_A.Sgas_h2_restart);
      reinit(RES_A.Vcum_ch4, RES_A.Vcum_ch4_restart);
    end when;
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 8}, {50, 29.68}, {102.28, 29.68}}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 80}, {-28, 80}, {-28, 48}, {40, 48}, {40, 11}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{5, 80}, {43, 80}, {43, 11}}, color = {0, 0, 127}));
    connect(Expired_yogurt.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, 29}, {-11.2, 29}, {-11.2, 1}, {28, 1}}));
    connect(Sludge.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, -21}, {-11.2, -21}, {-11.2, 1}, {28, 1}}));
    connect(Y_Conc.y, Expired_yogurt.inlet) annotation(
      Line(points = {{-107, 52}, {-88, 52}, {-88, 34}, {-68, 34}}, color = {0, 0, 127}));
    connect(S_Conc.y, Sludge.inlet) annotation(
      Line(points = {{-107, -10}, {-88, -10}, {-88, -16}, {-68, -16}}, color = {0, 0, 127}));
    connect(T_Feed.y, Expired_yogurt.T_op) annotation(
      Line(points = {{-145, 8}, {-80, 8}, {-80, 30}, {-68, 30}}, color = {0, 0, 127}));
    connect(T_Feed.y, Sludge.T_op) annotation(
      Line(points = {{-145, 8}, {-134, 8}, {-134, -56}, {-80, -56}, {-80, -20}, {-68, -20}}, color = {0, 0, 127}));
    connect(Pressure.y[1], PID_Pgas.u_m) annotation(
      Line(points = {{-43, 80}, {-37, 80}, {-37, 56}, {-7, 56}, {-7, 68}}, color = {0, 0, 127}));
    connect(Y_Flowrate.y[1], Expired_yogurt.Q) annotation(
      Line(points = {{-107, 26}, {-89, 26}, {-89, 32}, {-69, 32}}, color = {0, 0, 127}));
    connect(S_Flowrate.y[1], Sludge.Q) annotation(
      Line(points = {{-107, -36}, {-89, -36}, {-89, -18}, {-69, -18}}, color = {0, 0, 127}));
    connect(T_Digester.y[1], digester.T_op) annotation(
      Line(points = {{3, -72}, {16, -72}, {16, -17}, {29, -17}}, color = {0, 0, 127}));
    connect(V_Digester.y[1], digester.V_liq) annotation(
      Line(points = {{3, -46}, {9, -46}, {9, -13}, {29, -13}}, color = {0, 0, 127}));
    connect(digester.outlet, open.inlet) annotation(
      Line(points = {{56, -18}, {71.68, -18}, {71.68, -25.88}, {90.68, -25.88}}));
    connect(V_Open.y, open.V_liq) annotation(
      Line(points = {{61, -42}, {95, -42}}, color = {0, 0, 127}));
    connect(T_Open.y, open.T_op) annotation(
      Line(points = {{61, -76}, {81, -76}, {81, -45}, {95, -45}}, color = {0, 0, 127}));
    connect(open.outlet, sink_vec.inlet) annotation(
      Line(points = {{125.32, -40.1}, {138.82, -40.1}, {138.82, -49.1}, {148.32, -49.1}}));
    connect(open.Biogas_Out, GasMeter_Open.Biogas_In) annotation(
      Line(points = {{117.5, -28.88}, {117.5, -1.88}, {126, -1.88}}));
    connect(V_Batch.y, Acetato_A.V_liq) annotation(
      Line(points = {{90, 104}, {110, 104}, {110, 62}, {128, 62}}, color = {0, 0, 127}));
    connect(V_Batch.y, RES_A.V_liq) annotation(
      Line(points = {{90, 104}, {118, 104}, {118, 94}, {128, 94}}, color = {0, 0, 127}));
    connect(T_Batch.y, RES_A.T_op) annotation(
      Line(points = {{90, 70}, {100, 70}, {100, 92}, {128, 92}}, color = {0, 0, 127}));
    connect(T_Batch.y, Acetato_A.T_op) annotation(
      Line(points = {{90, 70}, {100, 70}, {100, 60}, {128, 60}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 8.4672e+06, Tolerance = 1e-06, Interval = 3615.37),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=stateselection -d=bltdump -d=",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Sgo_AC_noXc_VS;

  model TopLevel
    Sgo_AC_noXc_VS Nominal annotation(
      Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Sgo_AC_noXc_VS Optimal(digester.k_m_ac = 6.3, Acetato_A.k_m_ac = 6.3, digester.k_m_aa = 13.1, Acetato_A.k_m_aa = 13.1) annotation(
      Placement(visible = true, transformation(origin = {-40, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    annotation(
      experiment(StartTime = 0, StopTime = 8.4672e+06, Tolerance = 1e-6, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end TopLevel;

  model Sgo_AC_noXc_VS_198
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    Real Sample_time1 = 86400*(111);
    Real delta_prova1 = 86400*(110);
    Real Sample_time2 = 86400*123;
    Real delta_prova2 = 86400*122;
    //  ADM1_P.BlockLibrary.Digester digester(X_su_start = 0.156028,
    //X_aa_start = 0.435487,
    //X_fa_start = 0.273309,
    //X_c4_start = 0.175828,
    //X_pro_start = 0.0599003,
    //X_ac_start = 0.431741,
    //X_h2_start = 0.175683,
    //X_c_start = 0.291302,
    //X_i_start = 10.8967,
    //X_ch_start = {1.02655e-67,0.229839,0.000260655},
    //X_pr_start = {6.05665e-68,1.33439},
    //X_li_start = 1.27877,
    //X_p_start = 0.487235,
    //S_i_start = 0.0154883,
    //S_su_start = 0.0393944,
    //S_aa_start = 0.0415751,
    //S_fa_start = 0.146442,
    //S_va_start = 0.0065279,
    //S_bu_start = 0.0073302,
    //S_pro_start = 0.0393866,
    //S_ac_start = 0.0462823,
    //S_h2_start = 9.716e-07,
    //S_ch4_start = 0.0395999,
    //S_ic_start = 0.0978747,
    //S_in_start = 0.0486144,
    //S_ip_start = 0.0041804,
    //S_cat_start = 0.105552,
    //S_ca_start = 6.80009e-06,
    //S_mg_start = 7.20234e-06,
    //S_an_start = 0.061095,
    //ash_start = 7.86867,
    //X_lig_start = 0.266717,
    //S_gas_h2_start = 4.5979e-05,
    //S_gas_ch4_start = 1.18341,
    //S_gas_co2_start = 0.0197639,
    //S_gas_nh3_start = 2.89279e-07,
    //X_acp_start = 1.98538e-19,
    //X_stru_start = -4.81656e-20,
    //X_ccm_start = -4.07459e-15,
    //X_mag_start = 716434e-12,
    //f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester_AC digester(N_PR = 8.25, S_aa_start = 0.054, S_ac_start = 0.06, S_an_start = 0.05, S_bu_start = 0.01, S_ca_start = 0.015, S_cat_start = 0.096, S_ch4_start = 0.032, S_fa_start = 0.17, S_gas_ch4_start = 0.95, S_gas_co2_start = 0.023, S_gas_h2_start = 1.2e-6, S_gas_n2_start = 3e-8, S_gas_nh3_start = 1.2e-7, S_h2_start = 1.2e-6, S_i_start = 0.2, S_ic_start = 0.091, S_in_start = 0.038, S_ip_start = 0.0018, S_mg_start = 0.0019, S_n2_start = 1e-10, S_pro_start = 0.15, S_su_start = 0.07, S_va_start = 0.008, X_aa_start = 0.207, X_ac_start = 0.29, X_acp_start = 1e-18, X_c4_start = 0.1, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.4, 0.45, 1e-20}, X_fa_start = 0.19, X_h2_start = 0.112, X_i_start = 11, X_li_start = 1, X_lig_start = 1e-20, X_mag_start = 1e-18, X_p_start = 0.045, X_pr_start = {0.5, 0.65}, X_pro_start = 0.026, X_stru_start = 1e-18, X_su_start = 0.09, kla = 150, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, -6}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    //  ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Ti = 12000*1.5, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 60, strict = false, xi_start = 0.00303443, yMax = 1000000, yMin = 0, y_start = 0.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_AC sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {158, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci_VS Sludge(COD_VS_CH = 32*6/180, TKN = true, an = 0.04, f_Xc_in = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.3, f_si_xc = 0.1, f_xi_xc = 0.1, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/S_Conc.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "S_Conc", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable P_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/P_PLC_Digester.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/S_Flowrate_PLC.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "S_Flowrate_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci Expired_yogurt(COD_VS_CH = 32*6/180, TKN = false, an = 0.04, f_Xc_in = 0, f_Xch_s = 0, f_Xpr_s = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Y_Conc.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Y_Conc", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC Acetato_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_add = 461/1e6, V_inoculum = 339/1e6, V_tot = 900/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 4, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 68}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Batch(k = 37 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {78, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-156, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable acetato_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Acetato_20220401_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 111*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Y_Flowrate_PLC.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Y_Flowrate_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable T_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/T_PLC_Digester.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Open_AC open(S_aa_start = 0.0353, S_ac_start = 0.0065, S_an_start = 0.05, S_bu_start = 0.0052, S_ca_start = 0.015, S_cat_start = 0.099, S_ch4_start = 0.17, S_fa_start = 0.085, S_gas_ch4_start = 1.41, S_gas_co2_start = 0.145, S_gas_h2_start = 1.1e-5, S_gas_n2_start = 8.5e-5, S_gas_nh3_start = 7.6e-6, S_h2_start = 6.3e-7, S_i_start = 0.34, S_ic_start = 0.085, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 0.0019, S_n2_start = 1e-18, S_pro_start = 0.1, S_su_start = 0.052, S_va_start = 0.0044, T_op_mean = 298.15, V_tot = 30, X_aa_start = 0.227, X_ac_start = 0.304, X_acp_start = 1e-18, X_c4_start = 0.103, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.22, 0.85, 1e-20}, X_fa_start = 0.199, X_h2_start = 0.12, X_i_start = 9.7, X_li_start = 0.77, X_lig_start = 1e-18, X_mag_start = 1e-18, X_p_start = 0.046, X_pr_start = {0.58, 4.2}, X_pro_start = 0.03, X_stru_start = 1e-18, X_su_start = 0.0995, ideality = false, kla = 5, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {109, -35}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable V_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/V_Digester.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_V", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Batch(k = 800/1e6) annotation(
      Placement(visible = true, transformation(origin = {78, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Open(k = 3/1e3) annotation(
      Placement(visible = true, transformation(origin = {50, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Open(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {50, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream GasMeter_Open annotation(
      Placement(visible = true, transformation(origin = {134, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable VS_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeVS_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CODtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeCODtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCODtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CHtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeCHtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCHtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable PRtot_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbePRtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable LItot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeLItot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeLItot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TVFA_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeTVFA_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {0, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable SingleVFA_meas(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeSingleVFAs_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbepH_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Alk_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeAlk_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasComposition(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeBiogasComposition_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasComposition_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasFlowrate(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeBiogasFlowRate_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasFlowRate_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_PLC(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbepH_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable res_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Residuo_20220413_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 123*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC RES_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_add = 250/1e6, V_inoculum = 550/1e6, V_tot = 900/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 4, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 100}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasCumulated(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeBiogasCumulated_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasCumulated_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {182, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//Reinitialize cumulated methane volume from digester for comparison with experimental data
    when time > 8640000 then
      reinit(digester.Vcum_ch4_L, 0);
    end when;
//Calculation of Acetato_A. (re)initial conditions
    Acetato_A.Xsu_restart = (open.X_su*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xaa_restart = (open.X_aa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xfa_restart = (open.X_fa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xc4_restart = (open.X_c4*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpro_restart = (open.X_pro*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xac_restart = (open.X_ac*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xh2_restart = (open.X_h2*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xc_restart = (open.X_c*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xi_restart = (open.X_i*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xch1_restart = (open.X_ch[1]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xch2_restart = (open.X_ch[2]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpr1_restart = (open.X_pr[1]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpr2_restart = (open.X_pr[2]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xli_restart = (open.X_li*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xp_restart = (open.X_p*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Si_restart = (open.S_i*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Ssu_restart = (open.S_su*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Saa_restart = (open.S_aa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sfa_restart = (open.S_fa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sva_restart = (open.S_va*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sbu_restart = (open.S_bu*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Spro_restart = (open.S_pro*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sac_restart = (open.S_ac*Acetato_A.V_inoculum + 3.22776572668113*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sh2_restart = (open.S_h2*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sch4_restart = (open.S_ch4*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sic_restart = (open.S_ic*Acetato_A.V_inoculum + 0.00835970802523634*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sin_restart = (open.S_in*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sip_restart = (open.S_ip*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Scat_restart = (open.S_cat*Acetato_A.V_inoculum + 0.0676896780763162*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sca_restart = (open.S_ca*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Smg_restart = (open.S_mg*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.San_restart = (open.S_an*Acetato_A.V_inoculum + 0.02*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.ash_restart = (open.ash*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xlig_restart = (open.X_lig*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sn2_restart = 1.569e-6;
    Acetato_A.Sgas_h2_restart = 9.765e-6;
    Acetato_A.Sgas_ch4_restart = 0.000248;
    Acetato_A.Sgas_co2_restart = 2.7145e-5;
    Acetato_A.Sgas_nh3_restart = 3.878e-12;
    Acetato_A.Sgas_n2_restart = 0.0368397;
    Acetato_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time1 then
      reinit(Acetato_A.X_su, Acetato_A.Xsu_restart);
      reinit(Acetato_A.X_aa, Acetato_A.Xaa_restart);
      reinit(Acetato_A.X_fa, Acetato_A.Xfa_restart);
      reinit(Acetato_A.X_c4, Acetato_A.Xc4_restart);
      reinit(Acetato_A.X_pro, Acetato_A.Xpro_restart);
      reinit(Acetato_A.X_ac, Acetato_A.Xac_restart);
      reinit(Acetato_A.X_h2, Acetato_A.Xh2_restart);
      reinit(Acetato_A.X_c, Acetato_A.Xc_restart);
      reinit(Acetato_A.X_i, Acetato_A.Xi_restart);
      reinit(Acetato_A.X_ch[1], Acetato_A.Xch1_restart);
      reinit(Acetato_A.X_ch[2], Acetato_A.Xch2_restart);
      reinit(Acetato_A.X_pr[1], Acetato_A.Xpr1_restart);
      reinit(Acetato_A.X_pr[2], Acetato_A.Xpr2_restart);
      reinit(Acetato_A.X_li, Acetato_A.Xli_restart);
      reinit(Acetato_A.X_p, Acetato_A.Xp_restart);
      reinit(Acetato_A.S_i, Acetato_A.Si_restart);
      reinit(Acetato_A.S_su, Acetato_A.Ssu_restart);
      reinit(Acetato_A.S_aa, Acetato_A.Saa_restart);
      reinit(Acetato_A.S_fa, Acetato_A.Sfa_restart);
      reinit(Acetato_A.S_va, Acetato_A.Sva_restart);
      reinit(Acetato_A.S_bu, Acetato_A.Sbu_restart);
      reinit(Acetato_A.S_pro, Acetato_A.Spro_restart);
      reinit(Acetato_A.S_ac, Acetato_A.Sac_restart);
      reinit(Acetato_A.S_h2, Acetato_A.Sh2_restart);
      reinit(Acetato_A.S_ch4, Acetato_A.Sch4_restart);
      reinit(Acetato_A.S_ic, Acetato_A.Sic_restart);
      reinit(Acetato_A.S_in, Acetato_A.Sin_restart);
      reinit(Acetato_A.S_ip, Acetato_A.Sip_restart);
      reinit(Acetato_A.S_cat, Acetato_A.Scat_restart);
      reinit(Acetato_A.S_ca, Acetato_A.Sca_restart);
      reinit(Acetato_A.S_mg, Acetato_A.Smg_restart);
      reinit(Acetato_A.S_an, Acetato_A.San_restart);
      reinit(Acetato_A.ash, Acetato_A.ash_restart);
      reinit(Acetato_A.X_lig, Acetato_A.Xlig_restart);
      reinit(Acetato_A.S_n2, Acetato_A.Sn2_restart);
      reinit(Acetato_A.S_gas_n2, Acetato_A.Sgas_n2_restart);
      reinit(Acetato_A.S_gas_ch4, Acetato_A.Sgas_ch4_restart);
      reinit(Acetato_A.S_gas_co2, Acetato_A.Sgas_co2_restart);
      reinit(Acetato_A.S_gas_nh3, Acetato_A.Sgas_nh3_restart);
      reinit(Acetato_A.S_gas_h2, Acetato_A.Sgas_h2_restart);
      reinit(Acetato_A.Vcum_ch4, Acetato_A.Vcum_ch4_restart);
    end when;
//
//Calculation of RES_A.(re)initial conditions
    RES_A.Xsu_restart = (open.X_su*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xaa_restart = (open.X_aa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xfa_restart = (open.X_fa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xc4_restart = (open.X_c4*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpro_restart = (open.X_pro*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xac_restart = (open.X_ac*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xh2_restart = (open.X_h2*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xc_restart = (open.X_c*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xi_restart = (open.X_i*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xch1_restart = (open.X_ch[1]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xch2_restart = (open.X_ch[2]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpr1_restart = (open.X_pr[1]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpr2_restart = (open.X_pr[2]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xli_restart = (open.X_li*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xp_restart = (open.X_p*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Si_restart = (open.S_i*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Ssu_restart = (open.S_su*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Saa_restart = (open.S_aa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sfa_restart = (open.S_fa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sva_restart = (open.S_va*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sbu_restart = (open.S_bu*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Spro_restart = (open.S_pro*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sac_restart = (open.S_ac*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sh2_restart = (open.S_h2*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sch4_restart = (open.S_ch4*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sic_restart = (open.S_ic*RES_A.V_inoculum + 0.00866028179693023*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sin_restart = (open.S_in*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sip_restart = (open.S_ip*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Scat_restart = (open.S_cat*RES_A.V_inoculum + 0.0200002846049894*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sca_restart = (open.S_ca*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Smg_restart = (open.S_mg*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.San_restart = (open.S_an*RES_A.V_inoculum + 0.02*RES_A.V_add)/RES_A.V_liq;
    RES_A.ash_restart = (open.ash*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xlig_restart = (open.X_lig*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sn2_restart = 1.569e-6;
    RES_A.Sgas_h2_restart = 9.765e-6;
    RES_A.Sgas_ch4_restart = 0.000248;
    RES_A.Sgas_co2_restart = 2.7145e-5;
    RES_A.Sgas_nh3_restart = 3.878e-12;
    RES_A.Sgas_n2_restart = 0.0368397;
    RES_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time2 then
      reinit(RES_A.X_su, RES_A.Xsu_restart);
      reinit(RES_A.X_aa, RES_A.Xaa_restart);
      reinit(RES_A.X_fa, RES_A.Xfa_restart);
      reinit(RES_A.X_c4, RES_A.Xc4_restart);
      reinit(RES_A.X_pro, RES_A.Xpro_restart);
      reinit(RES_A.X_ac, RES_A.Xac_restart);
      reinit(RES_A.X_h2, RES_A.Xh2_restart);
      reinit(RES_A.X_c, RES_A.Xc_restart);
      reinit(RES_A.X_i, RES_A.Xi_restart);
      reinit(RES_A.X_ch[1], RES_A.Xch1_restart);
      reinit(RES_A.X_ch[2], RES_A.Xch2_restart);
      reinit(RES_A.X_pr[1], RES_A.Xpr1_restart);
      reinit(RES_A.X_pr[2], RES_A.Xpr2_restart);
      reinit(RES_A.X_li, RES_A.Xli_restart);
      reinit(RES_A.X_p, RES_A.Xp_restart);
      reinit(RES_A.S_i, RES_A.Si_restart);
      reinit(RES_A.S_su, RES_A.Ssu_restart);
      reinit(RES_A.S_aa, RES_A.Saa_restart);
      reinit(RES_A.S_fa, RES_A.Sfa_restart);
      reinit(RES_A.S_va, RES_A.Sva_restart);
      reinit(RES_A.S_bu, RES_A.Sbu_restart);
      reinit(RES_A.S_pro, RES_A.Spro_restart);
      reinit(RES_A.S_ac, RES_A.Sac_restart);
      reinit(RES_A.S_h2, RES_A.Sh2_restart);
      reinit(RES_A.S_ch4, RES_A.Sch4_restart);
      reinit(RES_A.S_ic, RES_A.Sic_restart);
      reinit(RES_A.S_in, RES_A.Sin_restart);
      reinit(RES_A.S_ip, RES_A.Sip_restart);
      reinit(RES_A.S_cat, RES_A.Scat_restart);
      reinit(RES_A.S_ca, RES_A.Sca_restart);
      reinit(RES_A.S_mg, RES_A.Smg_restart);
      reinit(RES_A.S_an, RES_A.San_restart);
      reinit(RES_A.ash, RES_A.ash_restart);
      reinit(RES_A.X_lig, RES_A.Xlig_restart);
      reinit(RES_A.S_n2, RES_A.Sn2_restart);
      reinit(RES_A.S_gas_n2, RES_A.Sgas_n2_restart);
      reinit(RES_A.S_gas_ch4, RES_A.Sgas_ch4_restart);
      reinit(RES_A.S_gas_co2, RES_A.Sgas_co2_restart);
      reinit(RES_A.S_gas_nh3, RES_A.Sgas_nh3_restart);
      reinit(RES_A.S_gas_h2, RES_A.Sgas_h2_restart);
      reinit(RES_A.Vcum_ch4, RES_A.Vcum_ch4_restart);
    end when;
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 8}, {50, 29.68}, {102.28, 29.68}}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 80}, {-28, 80}, {-28, 48}, {40, 48}, {40, 11}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{5, 80}, {43, 80}, {43, 11}}, color = {0, 0, 127}));
    connect(Expired_yogurt.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, 29}, {-11.2, 29}, {-11.2, 1}, {28, 1}}));
    connect(Sludge.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, -21}, {-11.2, -21}, {-11.2, 1}, {28, 1}}));
    connect(Y_Conc.y, Expired_yogurt.inlet) annotation(
      Line(points = {{-107, 52}, {-88, 52}, {-88, 34}, {-68, 34}}, color = {0, 0, 127}));
    connect(S_Conc.y, Sludge.inlet) annotation(
      Line(points = {{-107, -10}, {-88, -10}, {-88, -16}, {-68, -16}}, color = {0, 0, 127}));
    connect(T_Feed.y, Expired_yogurt.T_op) annotation(
      Line(points = {{-145, 8}, {-80, 8}, {-80, 30}, {-68, 30}}, color = {0, 0, 127}));
    connect(T_Feed.y, Sludge.T_op) annotation(
      Line(points = {{-145, 8}, {-134, 8}, {-134, -56}, {-80, -56}, {-80, -20}, {-68, -20}}, color = {0, 0, 127}));
    connect(P_Digester.y[1], PID_Pgas.u_m) annotation(
      Line(points = {{-43, 80}, {-37, 80}, {-37, 56}, {-7, 56}, {-7, 68}}, color = {0, 0, 127}));
    connect(Y_Flowrate.y[1], Expired_yogurt.Q) annotation(
      Line(points = {{-107, 26}, {-89, 26}, {-89, 32}, {-69, 32}}, color = {0, 0, 127}));
    connect(S_Flowrate.y[1], Sludge.Q) annotation(
      Line(points = {{-107, -36}, {-89, -36}, {-89, -18}, {-69, -18}}, color = {0, 0, 127}));
    connect(T_Digester.y[1], digester.T_op) annotation(
      Line(points = {{3, -72}, {16, -72}, {16, -17}, {29, -17}}, color = {0, 0, 127}));
    connect(V_Digester.y[1], digester.V_liq) annotation(
      Line(points = {{3, -46}, {9, -46}, {9, -13}, {29, -13}}, color = {0, 0, 127}));
    connect(digester.outlet, open.inlet) annotation(
      Line(points = {{56, -18}, {71.68, -18}, {71.68, -25.88}, {90.68, -25.88}}));
    connect(V_Open.y, open.V_liq) annotation(
      Line(points = {{61, -42}, {95, -42}}, color = {0, 0, 127}));
    connect(T_Open.y, open.T_op) annotation(
      Line(points = {{61, -76}, {81, -76}, {81, -45}, {95, -45}}, color = {0, 0, 127}));
    connect(open.outlet, sink_vec.inlet) annotation(
      Line(points = {{125.32, -40.1}, {138.82, -40.1}, {138.82, -49.1}, {148.32, -49.1}}));
    connect(open.Biogas_Out, GasMeter_Open.Biogas_In) annotation(
      Line(points = {{117.5, -28.88}, {117.5, -1.88}, {126, -1.88}}));
    connect(V_Batch.y, Acetato_A.V_liq) annotation(
      Line(points = {{90, 104}, {110, 104}, {110, 62}, {128, 62}}, color = {0, 0, 127}));
    connect(V_Batch.y, RES_A.V_liq) annotation(
      Line(points = {{90, 104}, {118, 104}, {118, 94}, {128, 94}}, color = {0, 0, 127}));
    connect(T_Batch.y, RES_A.T_op) annotation(
      Line(points = {{90, 70}, {100, 70}, {100, 92}, {128, 92}}, color = {0, 0, 127}));
    connect(T_Batch.y, Acetato_A.T_op) annotation(
      Line(points = {{90, 70}, {100, 70}, {100, 60}, {128, 60}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 1.71072e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=stateselection -d=bltdump -d=",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Sgo_AC_noXc_VS_198;
  
  model Sgo_AC_noXc_VS_198_BMP
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    Real Sample_time1 = 86400*(111);
    Real delta_prova1 = 86400*(110);
    Real Sample_time2 = 86400*123;
    Real delta_prova2 = 86400*122;
    Real Sample_time3 = 86400*123;
    Real delta_prova3 = 86400*122;
    //  ADM1_P.BlockLibrary.Digester digester(X_su_start = 0.156028,
    //X_aa_start = 0.435487,
    //X_fa_start = 0.273309,
    //X_c4_start = 0.175828,
    //X_pro_start = 0.0599003,
    //X_ac_start = 0.431741,
    //X_h2_start = 0.175683,
    //X_c_start = 0.291302,
    //X_i_start = 10.8967,
    //X_ch_start = {1.02655e-67,0.229839,0.000260655},
    //X_pr_start = {6.05665e-68,1.33439},
    //X_li_start = 1.27877,
    //X_p_start = 0.487235,
    //S_i_start = 0.0154883,
    //S_su_start = 0.0393944,
    //S_aa_start = 0.0415751,
    //S_fa_start = 0.146442,
    //S_va_start = 0.0065279,
    //S_bu_start = 0.0073302,
    //S_pro_start = 0.0393866,
    //S_ac_start = 0.0462823,
    //S_h2_start = 9.716e-07,
    //S_ch4_start = 0.0395999,
    //S_ic_start = 0.0978747,
    //S_in_start = 0.0486144,
    //S_ip_start = 0.0041804,
    //S_cat_start = 0.105552,
    //S_ca_start = 6.80009e-06,
    //S_mg_start = 7.20234e-06,
    //S_an_start = 0.061095,
    //ash_start = 7.86867,
    //X_lig_start = 0.266717,
    //S_gas_h2_start = 4.5979e-05,
    //S_gas_ch4_start = 1.18341,
    //S_gas_co2_start = 0.0197639,
    //S_gas_nh3_start = 2.89279e-07,
    //X_acp_start = 1.98538e-19,
    //X_stru_start = -4.81656e-20,
    //X_ccm_start = -4.07459e-15,
    //X_mag_start = 716434e-12,
    //f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Digester_AC digester(N_PR = 8.25, S_aa_start = 0.054, S_ac_start = 0.06, S_an_start = 0.05, S_bu_start = 0.01, S_ca_start = 0.015, S_cat_start = 0.096, S_ch4_start = 0.032, S_fa_start = 0.17, S_gas_ch4_start = 0.95, S_gas_co2_start = 0.023, S_gas_h2_start = 1.2e-6, S_gas_n2_start = 3e-8, S_gas_nh3_start = 1.2e-7, S_h2_start = 1.2e-6, S_i_start = 0.2, S_ic_start = 0.091, S_in_start = 0.038, S_ip_start = 0.0018, S_mg_start = 0.0019, S_n2_start = 1e-10, S_pro_start = 0.15, S_su_start = 0.07, S_va_start = 0.008, X_aa_start = 0.207, X_ac_start = 0.29, X_acp_start = 1e-18, X_c4_start = 0.1, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.4, 0.45, 1e-20}, X_fa_start = 0.19, X_h2_start = 0.112, X_i_start = 11, X_li_start = 1, X_lig_start = 1e-20, X_mag_start = 1e-18, X_p_start = 0.045, X_pr_start = {0.5, 0.65}, X_pro_start = 0.026, X_stru_start = 1e-18, X_su_start = 0.09, kla = 150, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, -6}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    //  ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), f_ch_xb = 0.1, f_li_xb = 0.1, f_pr_xb = 0.1, f_xi_xb = 0.7, ideality = false, k_dis = 0.5, k_hyd_xchm = 0.3, k_hyd_xli = 0.3, k_hyd_xprs = 0.3, multihyd = false, nW = nW, noXc = false, precipitation = true) annotation(
    //    Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Ti = 12000*1.5, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialState, k = 60, strict = false, xi_start = 0.00303443, yMax = 1000000, yMin = 0, y_start = 0.2) annotation(
      Placement(visible = true, transformation(origin = {-6, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Sink_AC sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {158, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci_VS Sludge(COD_VS_CH = 32*6/180, TKN = true, an = 0.04, f_Xc_in = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.3, f_si_xc = 0.1, f_xi_xc = 0.1, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/S_Conc.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "S_Conc", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable P_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/P_PLC_Digester.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable S_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/S_Flowrate_PLC.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "S_Flowrate_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci Expired_yogurt(COD_VS_CH = 32*6/180, TKN = false, an = 0.04, f_Xc_in = 0, f_Xch_s = 0, f_Xpr_s = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Conc(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Y_Conc.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Y_Conc", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC Acetato_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_add = 461/1e6, V_inoculum = 339/1e6, V_tot = 900/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 2, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 70}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Batch(k = 37 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {78, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Feed(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {-156, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable acetato_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Acetato_20220401_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 111*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Y_Flowrate(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Y_Flowrate_PLC.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Y_Flowrate_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-118, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable T_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/T_PLC_Digester.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_T_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Open_AC open(S_aa_start = 0.0353, S_ac_start = 0.0065, S_an_start = 0.05, S_bu_start = 0.0052, S_ca_start = 0.015, S_cat_start = 0.099, S_ch4_start = 0.17, S_fa_start = 0.085, S_gas_ch4_start = 1.41, S_gas_co2_start = 0.145, S_gas_h2_start = 1.1e-5, S_gas_n2_start = 8.5e-5, S_gas_nh3_start = 7.6e-6, S_h2_start = 6.3e-7, S_i_start = 0.34, S_ic_start = 0.085, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 0.0019, S_n2_start = 1e-18, S_pro_start = 0.1, S_su_start = 0.052, S_va_start = 0.0044, T_op_mean = 298.15, V_tot = 30, X_aa_start = 0.227, X_ac_start = 0.304, X_acp_start = 1e-18, X_c4_start = 0.103, X_c_start = 1e-20, X_ccm_start = 1e-18, X_ch_start = {0.22, 0.85, 1e-20}, X_fa_start = 0.199, X_h2_start = 0.12, X_i_start = 9.7, X_li_start = 0.77, X_lig_start = 1e-18, X_mag_start = 1e-18, X_p_start = 0.046, X_pr_start = {0.58, 4.2}, X_pro_start = 0.03, X_stru_start = 1e-18, X_su_start = 0.0995, ideality = false, kla = 5, multihyd = true, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {109, -35}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable V_Digester(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/V_Digester.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_V", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-8, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Batch(k = 800/1e6) annotation(
      Placement(visible = true, transformation(origin = {78, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant V_Open(k = 3/1e3) annotation(
      Placement(visible = true, transformation(origin = {50, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant T_Open(k = 25 + 273.15) annotation(
      Placement(visible = true, transformation(origin = {50, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream GasMeter_Open annotation(
      Placement(visible = true, transformation(origin = {134, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable VS_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeVS_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeVS_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CODtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeCODtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCODtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable CHtot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeCHtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeCHtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable PRtot_meas(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbePRtot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbePRtot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable LItot_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeLItot_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeLItot_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TVFA_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeTVFA_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTVFA_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {0, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable SingleVFA_meas(columns = integer({2, 3, 4, 5}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeSingleVFAs_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeSingleVFAs_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbepH_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {52, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Alk_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeAlk_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeAlk_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {78, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable TAN_meas(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeTAN_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeTAN_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {104, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasComposition(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeBiogasComposition_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasComposition_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {130, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasFlowrate(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeBiogasFlowRate_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasFlowRate_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {156, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable pH_PLC(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbepH_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbepH_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {26, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable res_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/Residuo_20220413_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 123*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Batch_AC RES_A(S_aa_start = 0, S_ac_start = 0, S_an_start = 0.05, S_bu_start = 0, S_ca_start = 1e-10, S_cat_start = 0.096, S_ch4_start = 0, S_fa_start = 0, S_gas_ch4_start = 0, S_gas_co2_start = 0, S_gas_h2_start = 0, S_gas_nh3_start = 0, S_h2_start = 0, S_i_start = 0, S_ic_start = 0.091, S_in_start = 0.03, S_ip_start = 0.003, S_mg_start = 1e-10, S_pro_start = 0, S_su_start = 0, S_va_start = 0, V_add = 250/1e6, V_inoculum = 550/1e6, V_tot = 900/1e6, X_aa_start = 0, X_ac_start = 0, X_acp_start = 1e-18, X_c4_start = 0, X_c_start = 0, X_ccm_start = 1e-18, X_ch_start = {0, 0.0, 0.0}, X_fa_start = 0, X_h2_start = 0, X_i_start = 0, X_li_start = 0, X_lig_start = 0, X_mag_start = 1e-18, X_p_start = 0, X_pr_start = {0.0, 0.0}, X_pro_start = 0, X_stru_start = 1e-18, X_su_start = 0, ash_start = 0, ideality = false, kla = 10, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 100}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable GasCumulated(columns = integer({2, 3}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/ProbeBiogasCumulated_meas_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 100*86400, table = [0, 0; 1, 1; 2, 4], tableName = "ProbeBiogasCumulated_meas", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {182, -116}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADM1_P.BlockLibrary.BMP_AC BMP_A(T_op_mean = 310.15, V_add = 132/1e6, V_feed = 118/1e6, V_inoculum = 550/1e6, V_tot = 900/1e6, ideality = false, kla = 10, multihyd = true, noXc = true, precipitation = false)  annotation(
      Placement(visible = true, transformation(origin = {137, 133}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable bmp_A(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = LibraryPath + "/Codig_Ari_Aprile 2023/txt_dynamic_198/BMP_20220413_CH4cum.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 123*86400, table = [0, 0; 1, 1; 2, 4], tableName = "NmLCH4_cum", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {170, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//Reinitialize cumulated methane volume from digester for comparison with experimental data
    when time > 8640000 then
      reinit(digester.Vcum_ch4_L, 0);
    end when;
//Calculation of Acetato_A. (re)initial conditions
    Acetato_A.Xsu_restart = (open.X_su*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xaa_restart = (open.X_aa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xfa_restart = (open.X_fa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xc4_restart = (open.X_c4*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpro_restart = (open.X_pro*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xac_restart = (open.X_ac*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xh2_restart = (open.X_h2*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xc_restart = (open.X_c*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xi_restart = (open.X_i*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xch1_restart = (open.X_ch[1]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xch2_restart = (open.X_ch[2]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpr1_restart = (open.X_pr[1]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xpr2_restart = (open.X_pr[2]*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xli_restart = (open.X_li*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xp_restart = (open.X_p*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Si_restart = (open.S_i*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Ssu_restart = (open.S_su*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Saa_restart = (open.S_aa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sfa_restart = (open.S_fa*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sva_restart = (open.S_va*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sbu_restart = (open.S_bu*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Spro_restart = (open.S_pro*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sac_restart = (open.S_ac*Acetato_A.V_inoculum + 3.22776572668113*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sh2_restart = (open.S_h2*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sch4_restart = (open.S_ch4*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sic_restart = (open.S_ic*Acetato_A.V_inoculum + 0.00835970802523634*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sin_restart = (open.S_in*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sip_restart = (open.S_ip*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Scat_restart = (open.S_cat*Acetato_A.V_inoculum + 0.0676896780763162*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sca_restart = (open.S_ca*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Smg_restart = (open.S_mg*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.San_restart = (open.S_an*Acetato_A.V_inoculum + 0.02*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.ash_restart = (open.ash*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Xlig_restart = (open.X_lig*Acetato_A.V_inoculum + 0*Acetato_A.V_add)/Acetato_A.V_liq;
    Acetato_A.Sn2_restart = 1.569e-6;
    Acetato_A.Sgas_h2_restart = 9.765e-6;
    Acetato_A.Sgas_ch4_restart = 0.000248;
    Acetato_A.Sgas_co2_restart = 2.7145e-5;
    Acetato_A.Sgas_nh3_restart = 3.878e-12;
    Acetato_A.Sgas_n2_restart = 0.0368397;
    Acetato_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time1 then
      reinit(Acetato_A.X_su, Acetato_A.Xsu_restart);
      reinit(Acetato_A.X_aa, Acetato_A.Xaa_restart);
      reinit(Acetato_A.X_fa, Acetato_A.Xfa_restart);
      reinit(Acetato_A.X_c4, Acetato_A.Xc4_restart);
      reinit(Acetato_A.X_pro, Acetato_A.Xpro_restart);
      reinit(Acetato_A.X_ac, Acetato_A.Xac_restart);
      reinit(Acetato_A.X_h2, Acetato_A.Xh2_restart);
      reinit(Acetato_A.X_c, Acetato_A.Xc_restart);
      reinit(Acetato_A.X_i, Acetato_A.Xi_restart);
      reinit(Acetato_A.X_ch[1], Acetato_A.Xch1_restart);
      reinit(Acetato_A.X_ch[2], Acetato_A.Xch2_restart);
      reinit(Acetato_A.X_pr[1], Acetato_A.Xpr1_restart);
      reinit(Acetato_A.X_pr[2], Acetato_A.Xpr2_restart);
      reinit(Acetato_A.X_li, Acetato_A.Xli_restart);
      reinit(Acetato_A.X_p, Acetato_A.Xp_restart);
      reinit(Acetato_A.S_i, Acetato_A.Si_restart);
      reinit(Acetato_A.S_su, Acetato_A.Ssu_restart);
      reinit(Acetato_A.S_aa, Acetato_A.Saa_restart);
      reinit(Acetato_A.S_fa, Acetato_A.Sfa_restart);
      reinit(Acetato_A.S_va, Acetato_A.Sva_restart);
      reinit(Acetato_A.S_bu, Acetato_A.Sbu_restart);
      reinit(Acetato_A.S_pro, Acetato_A.Spro_restart);
      reinit(Acetato_A.S_ac, Acetato_A.Sac_restart);
      reinit(Acetato_A.S_h2, Acetato_A.Sh2_restart);
      reinit(Acetato_A.S_ch4, Acetato_A.Sch4_restart);
      reinit(Acetato_A.S_ic, Acetato_A.Sic_restart);
      reinit(Acetato_A.S_in, Acetato_A.Sin_restart);
      reinit(Acetato_A.S_ip, Acetato_A.Sip_restart);
      reinit(Acetato_A.S_cat, Acetato_A.Scat_restart);
      reinit(Acetato_A.S_ca, Acetato_A.Sca_restart);
      reinit(Acetato_A.S_mg, Acetato_A.Smg_restart);
      reinit(Acetato_A.S_an, Acetato_A.San_restart);
      reinit(Acetato_A.ash, Acetato_A.ash_restart);
      reinit(Acetato_A.X_lig, Acetato_A.Xlig_restart);
      reinit(Acetato_A.S_n2, Acetato_A.Sn2_restart);
      reinit(Acetato_A.S_gas_n2, Acetato_A.Sgas_n2_restart);
      reinit(Acetato_A.S_gas_ch4, Acetato_A.Sgas_ch4_restart);
      reinit(Acetato_A.S_gas_co2, Acetato_A.Sgas_co2_restart);
      reinit(Acetato_A.S_gas_nh3, Acetato_A.Sgas_nh3_restart);
      reinit(Acetato_A.S_gas_h2, Acetato_A.Sgas_h2_restart);
      reinit(Acetato_A.Vcum_ch4, Acetato_A.Vcum_ch4_restart);
    end when;
//
//Calculation of RES_A.(re)initial conditions
    RES_A.Xsu_restart = (open.X_su*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xaa_restart = (open.X_aa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xfa_restart = (open.X_fa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xc4_restart = (open.X_c4*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpro_restart = (open.X_pro*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xac_restart = (open.X_ac*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xh2_restart = (open.X_h2*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xc_restart = (open.X_c*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xi_restart = (open.X_i*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xch1_restart = (open.X_ch[1]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xch2_restart = (open.X_ch[2]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpr1_restart = (open.X_pr[1]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xpr2_restart = (open.X_pr[2]*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xli_restart = (open.X_li*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xp_restart = (open.X_p*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Si_restart = (open.S_i*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Ssu_restart = (open.S_su*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Saa_restart = (open.S_aa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sfa_restart = (open.S_fa*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sva_restart = (open.S_va*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sbu_restart = (open.S_bu*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Spro_restart = (open.S_pro*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sac_restart = (open.S_ac*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sh2_restart = (open.S_h2*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sch4_restart = (open.S_ch4*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sic_restart = (open.S_ic*RES_A.V_inoculum + 0.00866028179693023*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sin_restart = (open.S_in*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sip_restart = (open.S_ip*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Scat_restart = (open.S_cat*RES_A.V_inoculum + 0.0200002846049894*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sca_restart = (open.S_ca*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Smg_restart = (open.S_mg*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.San_restart = (open.S_an*RES_A.V_inoculum + 0.02*RES_A.V_add)/RES_A.V_liq;
    RES_A.ash_restart = (open.ash*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Xlig_restart = (open.X_lig*RES_A.V_inoculum + 0*RES_A.V_add)/RES_A.V_liq;
    RES_A.Sn2_restart = 1.569e-6;
    RES_A.Sgas_h2_restart = 9.765e-6;
    RES_A.Sgas_ch4_restart = 0.000248;
    RES_A.Sgas_co2_restart = 2.7145e-5;
    RES_A.Sgas_nh3_restart = 3.878e-12;
    RES_A.Sgas_n2_restart = 0.0368397;
    RES_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time2 then
      reinit(RES_A.X_su, RES_A.Xsu_restart);
      reinit(RES_A.X_aa, RES_A.Xaa_restart);
      reinit(RES_A.X_fa, RES_A.Xfa_restart);
      reinit(RES_A.X_c4, RES_A.Xc4_restart);
      reinit(RES_A.X_pro, RES_A.Xpro_restart);
      reinit(RES_A.X_ac, RES_A.Xac_restart);
      reinit(RES_A.X_h2, RES_A.Xh2_restart);
      reinit(RES_A.X_c, RES_A.Xc_restart);
      reinit(RES_A.X_i, RES_A.Xi_restart);
      reinit(RES_A.X_ch[1], RES_A.Xch1_restart);
      reinit(RES_A.X_ch[2], RES_A.Xch2_restart);
      reinit(RES_A.X_pr[1], RES_A.Xpr1_restart);
      reinit(RES_A.X_pr[2], RES_A.Xpr2_restart);
      reinit(RES_A.X_li, RES_A.Xli_restart);
      reinit(RES_A.X_p, RES_A.Xp_restart);
      reinit(RES_A.S_i, RES_A.Si_restart);
      reinit(RES_A.S_su, RES_A.Ssu_restart);
      reinit(RES_A.S_aa, RES_A.Saa_restart);
      reinit(RES_A.S_fa, RES_A.Sfa_restart);
      reinit(RES_A.S_va, RES_A.Sva_restart);
      reinit(RES_A.S_bu, RES_A.Sbu_restart);
      reinit(RES_A.S_pro, RES_A.Spro_restart);
      reinit(RES_A.S_ac, RES_A.Sac_restart);
      reinit(RES_A.S_h2, RES_A.Sh2_restart);
      reinit(RES_A.S_ch4, RES_A.Sch4_restart);
      reinit(RES_A.S_ic, RES_A.Sic_restart);
      reinit(RES_A.S_in, RES_A.Sin_restart);
      reinit(RES_A.S_ip, RES_A.Sip_restart);
      reinit(RES_A.S_cat, RES_A.Scat_restart);
      reinit(RES_A.S_ca, RES_A.Sca_restart);
      reinit(RES_A.S_mg, RES_A.Smg_restart);
      reinit(RES_A.S_an, RES_A.San_restart);
      reinit(RES_A.ash, RES_A.ash_restart);
      reinit(RES_A.X_lig, RES_A.Xlig_restart);
      reinit(RES_A.S_n2, RES_A.Sn2_restart);
      reinit(RES_A.S_gas_n2, RES_A.Sgas_n2_restart);
      reinit(RES_A.S_gas_ch4, RES_A.Sgas_ch4_restart);
      reinit(RES_A.S_gas_co2, RES_A.Sgas_co2_restart);
      reinit(RES_A.S_gas_nh3, RES_A.Sgas_nh3_restart);
      reinit(RES_A.S_gas_h2, RES_A.Sgas_h2_restart);
      reinit(RES_A.Vcum_ch4, RES_A.Vcum_ch4_restart);
    end when;
//
//Calculation of BMP_A.(re)initial conditions
  BMP_A.Xsu_restart = (open.X_su*BMP_A.V_inoculum+BMP_A.X_su_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xaa_restart = (open.X_aa*BMP_A.V_inoculum+BMP_A.X_aa_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xfa_restart = (open.X_fa*BMP_A.V_inoculum+BMP_A.X_fa_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xc4_restart = (open.X_c4*BMP_A.V_inoculum+BMP_A.X_c4_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xpro_restart = (open.X_pro*BMP_A.V_inoculum+BMP_A.X_pro_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xac_restart = (open.X_ac*BMP_A.V_inoculum+BMP_A.X_ac_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xh2_restart = (open.X_h2*BMP_A.V_inoculum+BMP_A.X_h2_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xc_restart = (open.X_c*BMP_A.V_inoculum+BMP_A.X_c_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xi_restart = (open.X_i*BMP_A.V_inoculum+BMP_A.X_i_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xch1_restart = (open.X_ch[1]*BMP_A.V_inoculum+BMP_A.X_ch1_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xch2_restart = (open.X_ch[2]*BMP_A.V_inoculum+BMP_A.X_ch2_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xpr1_restart = (open.X_pr[1]*BMP_A.V_inoculum+BMP_A.X_pr1_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xpr2_restart = (open.X_pr[2]*BMP_A.V_inoculum+BMP_A.X_pr2_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xli_restart = (open.X_li*BMP_A.V_inoculum+BMP_A.X_li_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xp_restart = (open.X_p*BMP_A.V_inoculum+BMP_A.X_p_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Si_restart = (open.S_i*BMP_A.V_inoculum+BMP_A.S_i_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Ssu_restart = (open.S_su*BMP_A.V_inoculum+BMP_A.S_su_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Saa_restart = (open.S_aa*BMP_A.V_inoculum+BMP_A.S_aa_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sfa_restart = (open.S_fa*BMP_A.V_inoculum+BMP_A.S_fa_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sva_restart = (open.S_va*BMP_A.V_inoculum+BMP_A.S_va_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sbu_restart = (open.S_bu*BMP_A.V_inoculum+BMP_A.S_bu_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Spro_restart = (open.S_pro*BMP_A.V_inoculum+BMP_A.S_pro_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sac_restart = (open.S_ac*BMP_A.V_inoculum+BMP_A.S_ac_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sh2_restart = (open.S_h2*BMP_A.V_inoculum+BMP_A.S_h2_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sch4_restart = (open.S_ch4*BMP_A.V_inoculum+BMP_A.S_ch4_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sic_restart = (open.S_ic*BMP_A.V_inoculum+BMP_A.S_ic_feed*BMP_A.V_feed+0.00866028179693023*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sin_restart = (open.S_in*BMP_A.V_inoculum+BMP_A.S_in_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sip_restart = (open.S_ip*BMP_A.V_inoculum+BMP_A.S_ip_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Scat_restart = (open.S_cat*BMP_A.V_inoculum+BMP_A.S_cat_feed*BMP_A.V_feed+0.0200002846049894*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Sca_restart = (open.S_ca*BMP_A.V_inoculum+BMP_A.S_ca_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Smg_restart = (open.S_mg*BMP_A.V_inoculum+BMP_A.S_mg_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.San_restart = (open.S_an*BMP_A.V_inoculum+BMP_A.S_an_feed*BMP_A.V_feed+0.02*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.ash_restart = (open.ash*BMP_A.V_inoculum+BMP_A.ash_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  BMP_A.Xlig_restart = (open.X_lig*BMP_A.V_inoculum+BMP_A.X_lig_feed*BMP_A.V_feed+0*BMP_A.V_add)/BMP_A.V_liq;
  
    BMP_A.Sn2_restart = 1.569e-6;
    BMP_A.Sgas_h2_restart = 9.765e-6;
    BMP_A.Sgas_ch4_restart = 0.000248;
    BMP_A.Sgas_co2_restart = 2.7145e-5;
    BMP_A.Sgas_nh3_restart = 3.878e-12;
    BMP_A.Sgas_n2_restart = 0.0368397;
    BMP_A.Vcum_ch4_restart = 0;
//Reinitialization of batch test
    when time > Sample_time3 then
      reinit(BMP_A.X_su, BMP_A.Xsu_restart);
      reinit(BMP_A.X_aa, BMP_A.Xaa_restart);
      reinit(BMP_A.X_fa, BMP_A.Xfa_restart);
      reinit(BMP_A.X_c4, BMP_A.Xc4_restart);
      reinit(BMP_A.X_pro, BMP_A.Xpro_restart);
      reinit(BMP_A.X_ac, BMP_A.Xac_restart);
      reinit(BMP_A.X_h2, BMP_A.Xh2_restart);
      reinit(BMP_A.X_c, BMP_A.Xc_restart);
      reinit(BMP_A.X_i, BMP_A.Xi_restart);
      reinit(BMP_A.X_ch[1], BMP_A.Xch1_restart);
      reinit(BMP_A.X_ch[2], BMP_A.Xch2_restart);
      reinit(BMP_A.X_pr[1], BMP_A.Xpr1_restart);
      reinit(BMP_A.X_pr[2], BMP_A.Xpr2_restart);
      reinit(BMP_A.X_li, BMP_A.Xli_restart);
      reinit(BMP_A.X_p, BMP_A.Xp_restart);
      reinit(BMP_A.S_i, BMP_A.Si_restart);
      reinit(BMP_A.S_su, BMP_A.Ssu_restart);
      reinit(BMP_A.S_aa, BMP_A.Saa_restart);
      reinit(BMP_A.S_fa, BMP_A.Sfa_restart);
      reinit(BMP_A.S_va, BMP_A.Sva_restart);
      reinit(BMP_A.S_bu, BMP_A.Sbu_restart);
      reinit(BMP_A.S_pro, BMP_A.Spro_restart);
      reinit(BMP_A.S_ac, BMP_A.Sac_restart);
      reinit(BMP_A.S_h2, BMP_A.Sh2_restart);
      reinit(BMP_A.S_ch4, BMP_A.Sch4_restart);
      reinit(BMP_A.S_ic, BMP_A.Sic_restart);
      reinit(BMP_A.S_in, BMP_A.Sin_restart);
      reinit(BMP_A.S_ip, BMP_A.Sip_restart);
      reinit(BMP_A.S_cat, BMP_A.Scat_restart);
      reinit(BMP_A.S_ca, BMP_A.Sca_restart);
      reinit(BMP_A.S_mg, BMP_A.Smg_restart);
      reinit(BMP_A.S_an, BMP_A.San_restart);
      reinit(BMP_A.ash, BMP_A.ash_restart);
      reinit(BMP_A.X_lig, BMP_A.Xlig_restart);
      reinit(BMP_A.S_n2, BMP_A.Sn2_restart);
      reinit(BMP_A.S_gas_n2, BMP_A.Sgas_n2_restart);
      reinit(BMP_A.S_gas_ch4, BMP_A.Sgas_ch4_restart);
      reinit(BMP_A.S_gas_co2, BMP_A.Sgas_co2_restart);
      reinit(BMP_A.S_gas_nh3, BMP_A.Sgas_nh3_restart);
      reinit(BMP_A.S_gas_h2, BMP_A.Sgas_h2_restart);
      reinit(BMP_A.Vcum_ch4, BMP_A.Vcum_ch4_restart);
    end when;
//
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 8}, {50, 29.68}, {102.28, 29.68}}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 80}, {-28, 80}, {-28, 48}, {40, 48}, {40, 11}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{5, 80}, {43, 80}, {43, 11}}, color = {0, 0, 127}));
    connect(Expired_yogurt.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, 29}, {-11.2, 29}, {-11.2, 1}, {28, 1}}));
    connect(Sludge.outlet, digester.inlet) annotation(
      Line(points = {{-51.2, -21}, {-11.2, -21}, {-11.2, 1}, {28, 1}}));
    connect(Y_Conc.y, Expired_yogurt.inlet) annotation(
      Line(points = {{-107, 52}, {-88, 52}, {-88, 34}, {-68, 34}}, color = {0, 0, 127}));
    connect(S_Conc.y, Sludge.inlet) annotation(
      Line(points = {{-107, -10}, {-88, -10}, {-88, -16}, {-68, -16}}, color = {0, 0, 127}));
    connect(T_Feed.y, Expired_yogurt.T_op) annotation(
      Line(points = {{-145, 8}, {-80, 8}, {-80, 30}, {-68, 30}}, color = {0, 0, 127}));
    connect(T_Feed.y, Sludge.T_op) annotation(
      Line(points = {{-145, 8}, {-134, 8}, {-134, -56}, {-80, -56}, {-80, -20}, {-68, -20}}, color = {0, 0, 127}));
    connect(P_Digester.y[1], PID_Pgas.u_m) annotation(
      Line(points = {{-43, 80}, {-37, 80}, {-37, 56}, {-7, 56}, {-7, 68}}, color = {0, 0, 127}));
    connect(Y_Flowrate.y[1], Expired_yogurt.Q) annotation(
      Line(points = {{-107, 26}, {-89, 26}, {-89, 32}, {-69, 32}}, color = {0, 0, 127}));
    connect(S_Flowrate.y[1], Sludge.Q) annotation(
      Line(points = {{-107, -36}, {-89, -36}, {-89, -18}, {-69, -18}}, color = {0, 0, 127}));
    connect(T_Digester.y[1], digester.T_op) annotation(
      Line(points = {{3, -72}, {16, -72}, {16, -17}, {29, -17}}, color = {0, 0, 127}));
    connect(V_Digester.y[1], digester.V_liq) annotation(
      Line(points = {{3, -46}, {9, -46}, {9, -13}, {29, -13}}, color = {0, 0, 127}));
    connect(digester.outlet, open.inlet) annotation(
      Line(points = {{56, -18}, {71.68, -18}, {71.68, -25.88}, {90.68, -25.88}}));
    connect(V_Open.y, open.V_liq) annotation(
      Line(points = {{61, -42}, {95, -42}}, color = {0, 0, 127}));
    connect(T_Open.y, open.T_op) annotation(
      Line(points = {{61, -76}, {81, -76}, {81, -45}, {95, -45}}, color = {0, 0, 127}));
    connect(open.outlet, sink_vec.inlet) annotation(
      Line(points = {{125.32, -40.1}, {138.82, -40.1}, {138.82, -49.1}, {148.32, -49.1}}));
    connect(open.Biogas_Out, GasMeter_Open.Biogas_In) annotation(
      Line(points = {{117.5, -28.88}, {117.5, -1.88}, {126, -1.88}}));
    connect(V_Batch.y, Acetato_A.V_liq) annotation(
      Line(points = {{90, 104}, {110, 104}, {110, 64}, {128, 64}}, color = {0, 0, 127}));
    connect(V_Batch.y, RES_A.V_liq) annotation(
      Line(points = {{90, 104}, {118, 104}, {118, 94}, {128, 94}}, color = {0, 0, 127}));
    connect(T_Batch.y, RES_A.T_op) annotation(
      Line(points = {{90, 70}, {100, 70}, {100, 92}, {128, 92}}, color = {0, 0, 127}));
    connect(T_Batch.y, Acetato_A.T_op) annotation(
      Line(points = {{90, 70}, {100, 70}, {100, 62}, {128, 62}}, color = {0, 0, 127}));
  connect(V_Batch.y, BMP_A.V_liq) annotation(
      Line(points = {{90, 104}, {110, 104}, {110, 128}, {127, 128}}, color = {0, 0, 127}));
  connect(T_Batch.y, BMP_A.T_op) annotation(
      Line(points = {{90, 70}, {100, 70}, {100, 125}, {127, 125}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 1.71072e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=stateselection -d=bltdump -d=",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Sgo_AC_noXc_VS_198_BMP;
  annotation(
    uses(Modelica(version = "4.0.0"), Modelica_LinearSystems2(version = "2.4.0")));
end ADM1_P;
