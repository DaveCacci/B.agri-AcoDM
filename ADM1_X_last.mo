package ADM1_P
  import SI = Modelica.Units.SI;
  import NSI = Modelica.Units.NonSI;
  //import Modelica.Constants.*;
  //import R = Modelica.Constants.R;
  extends Modelica.Icons.Package;
  constant Real R(unit = "bar/(kmol/m3)/K") = 0.083145 "Gas law constant";

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
    Real tCOd(fixed = false, start = 0);
    Real pCOd(fixed = false, start = 0);
    Real tBMP_COd(fixed = false, start = 0);
    Real tLI_in "g/m3";
    Real fd_tCOd "kgCOD/kgCOD";
    Real fd_pCOd "kgCOD/kgCOD";
    Real pLI_VS_in "gLI/kgVS";
    //
    //Composition of feeding substrates
    parameter Real f_newbio_BMP = 0.08 "Substrates COD fraction resulting in new biomass during BMP tests [kgCOD/kgCOD]";
    parameter Real f_Xc_in = 0.10 "Fraction of substrate #1 COD entering the digester in the aggregated form, X_c [kgCOD/kgCOD]";
    //
    parameter Real sCH;
    parameter Real sPR;
    //Catenacci and NIR parameters
    parameter Real tac "mcCaCO3/L";
    parameter Real ts "gTS/kg";
    parameter Real vs_ts "%TS";
    parameter Real tbmp_vs "NmLCH4/gVS";
  end Feed_variables_Catenacci;

  record Feed_variables_NIR
    //TO BE SEPARATED IN ARI E DAVE
    //Feed composition: only "Real" for dynamic trajectory specified in "All" model or in the model block from Combi
    //Feed composition: "parameter" for fixed value specified here or in "All" model
    //
    SI.MassFraction u(fixed = false, start = 0) "Moisture content in substrate  [kgH20/kg]";
    SI.MassFraction v(fixed = false, start = 0) "Volatile fraction of total solids in substrate  [kgVS/kgTS]";
    SI.Density d(fixed = false, start = 0) "Density of substrate [kg/m3]";
    //NIR parameters
    parameter Real protein(unit = "%TS");
    parameter Real lipid(unit = "%TS");
    parameter Real starch(unit = "%TS");
    parameter Real hemicellulose(unit = "%TS");
    parameter Real cellulose(unit = "%TS");
    parameter Real adl(unit = "%TS");
    //
    parameter Real bd_cell(unit = "%Cell") = 50;
    parameter Real bd_hemicell(unit = "%Hemicell") = 50;
    parameter Real bd_pr(unit = "%Protein") = 50;
    parameter Real bd_li(unit = "%VS") = 50;
    parameter Real f_pr_s = 0.5;
    parameter Real f_pr_r = 0.5;
    parameter Boolean liquid;
    //Catenacci and NIR parameters
    parameter Real tac "mcCaCO3/L";
    parameter Real ts "gTS/kg";
    parameter Real vs_ts "%TS";
    parameter Real tbmp_vs "NmLCH4/gVS";
  end Feed_variables_NIR;

  record Feed_variables_Direct
    //TO BE SEPARATED IN ARI E DAVE
    //Feed composition: only "Real" for dynamic trajectory specified in "All" model or in the model block from Combi
    //Feed composition: "parameter" for fixed value specified here or in "All" model
    //
    //
    //Direct parameters
    parameter Real xli(unit = "gCOD/L");
    parameter Real xpr(unit = "gCOD/L");
    parameter Real xi(unit = "gCOD/L");
    parameter Real xc(unit = "gCOD/L");
    parameter Real xch(unit = "gCOD/L");
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
    parameter Real aa(unit = "gCOD/L");
    parameter Real ac(unit = "gCOD/L");
    parameter Real an(unit = "mol/L");
    parameter Real bu "gCOD/L";
    parameter Real ca "mol/L";
    parameter Real cat;
    parameter Real ch4(unit = "gCOD/L");
    parameter Real fa;
    parameter Real h2(unit = "gCOD/L");
    parameter Real mg "mol/L";
    parameter Real ortop "mgP/L";
    parameter Real pro(unit = "gCOD/L");
    parameter Real si(unit = "gCOD/L");
    parameter Real su(unit = "gCOD/L");
    parameter Real tan "mgN/L";
    parameter Real tic(unit = "mgC/L");
    parameter Real va "gCOD/L";
    parameter Real xaa(unit = "gCOD/L");
    parameter Real xac(unit = "gCOD/L");
    parameter Real xc4(unit = "gCOD/L");
    parameter Real xfa(unit = "gCOD/L");
    parameter Real xh2(unit = "gCOD/L");
    parameter Real xpro(unit = "gCOD/L");
    parameter Real xsu(unit = "gCOD/L");
    //
    parameter Real ph;
  end Feed_variables_Common;

  record StateVariablesADM1_mpp
    //MPP submodel (X_salt are states)
    Types.MolarDensity_M X_acp(fixed = true, start = 1e-6, nominal = 1e-12, stateSelect = StateSelect.always) "mol/L rimetti true!";
    Types.MolarDensity_M X_stru(fixed = true, start = 1e-6, nominal = 1e-12, stateSelect = StateSelect.always) "mol/L rimetti true!";
    Types.MolarDensity_M X_ccm(fixed = true, start = 1e-6, nominal = 1e-12, stateSelect = StateSelect.always) "mol/L";
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
    Real TAC(fixed = false, start = 0);
    Real VFA(fixed = false, start = 0);
    Real FOS_TAC(fixed = false, start = 0);
    Real VS(fixed = false, start = 0);
    Real N_NH4NH3(fixed = false, start = 0);
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
    Types.MolarDensity_M_Ksp_stru Ksp_stru(nominal = 1e-28);
    Types.MolarDensity_M_Ksp_acp Ksp_acp(nominal = 1e-13);
    Types.MolarDensity_M_Ksp_acp Ksp_ccm(nominal = 1e-9);
    SI.PerUnit SI_stru(nominal = 1);
    SI.PerUnit SI_acp(nominal = 1);
    SI.PerUnit SI_ccm(nominal = 1);
    SI.PerUnit arg_log_acp(nominal = 1e-12);
    SI.PerUnit arg_log_stru(nominal = 1e-12);
    SI.PerUnit arg_log_ccm(nominal = 1e-12);
    Real r_stru;
    Real r_ccm;
    Real r_acp;
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
    Types.MolarDensity_M S_h(fixed = true, start = 1.481088E-07, nominal = 1e-10, stateSelect = StateSelect.avoid) "8/10";
    Types.MolarDensity_M I(fixed = true, start = 3.6097E-01, nominal = 1e-10, stateSelect = StateSelect.avoid) "mol/L";
    //Algebraic variables that depends only on I (ionic force)
    SI.ActivityCoefficient g_mono(fixed = false, stateSelect = StateSelect.never);
    SI.ActivityCoefficient g_bi(fixed = false, stateSelect = StateSelect.never);
    SI.ActivityCoefficient g_tri(fixed = false, stateSelect = StateSelect.never);
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
    Real TAC;
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
    SI.MassConcentration X_c_in[6] "Complex particulate concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_i_in[4] "Particulate inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ch_in[3] "Particulate carbohydrates concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_pr_in[2] "Particulate proteins concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_li_in "Particulate lipids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_p_in "Particulate inert fraction from bacteria decay [kgCOD/m3]";
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
    Types.Pressure_bar p_gas_h2(fixed = false, start = 1.5e-05);
    Types.Pressure_bar p_gas_ch4(fixed = false, start = 0.582185);
    Types.Pressure_bar p_gas_co2(fixed = false, start = 0.382985);
    Types.Pressure_bar p_gas_h2o(fixed = false, start = 0.0557);
    Types.Pressure_bar p_gas_nh3(fixed = false, start = 1.5e-05);
    //Other algebraic variables
    //Real P_gas(fixed = true, start = 1.014);
    Real Q_gas(fixed = false, start = 1e-16);
    Real Q_gas_N(fixed = false, start = 0);
    Real CH4_cum(fixed = true, start = 0);
    Real f_xc[5];
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
    //Real k_m_c4_T; not found
    Real k_m_ac_T;
    Real k_m_h2_T;
    Real Ks_su_T;
    Real Ks_aa_T;
    Real Ks_fa_T;
    Real Ks_pro_T;
    //Real Ks_c4_T; not found
    Real Ks_ac_T;
    Real Ks_h2_T;
    Real k_dec_su_T;
    Real k_dec_aa_T;
    Real k_dec_fa_T;
    Real k_dec_pro_T;
    //Real k_dec_c4_T; not found
    Real k_dec_ac_T;
    Real k_dec_h2_T;
    Real KH_ch4(fixed = false, start = 0.00116);
    Real KH_co2(fixed = false, start = 0.0271);
    Real KH_h2(fixed = false, start = 7.38e-4);
    Real KH_nh3(fixed = false, start = 7.38e-4);
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
    Real r1(fixed = false, start = 0);
    Real r2[3](each fixed = false, each start = 0);
    Real r3[2](each fixed = false, each start = 0);
    Real r4(fixed = false, start = 0);
    Real r5(fixed = false, start = 0);
    Real r6(fixed = false, start = 0);
    Real r7(fixed = false, start = 0);
    Real r8(fixed = false, start = 0);
    Real r9(fixed = false, start = 0);
    Real r10(fixed = false, start = 0);
    Real r11(fixed = false, start = 0);
    Real r12(fixed = false, start = 0);
    Real r13(fixed = false, start = 0);
    Real r14(fixed = false, start = 0);
    Real r15(fixed = false, start = 0);
    Real r16(fixed = false, start = 0);
    Real r17(fixed = false, start = 0);
    Real r18(fixed = false, start = 0);
    Real r19(fixed = false, start = 0);
    Real rt8(fixed = false, start = 0);
    Real rt9(fixed = false, start = 0);
    Real rt10(fixed = false, start = 0);
    Real rt12(fixed = false, start = 0);
    // Process inhibition
    Real I_5(fixed = false, start = 1);
    Real I_6(fixed = false, start = 1);
    Real I_7(fixed = false, start = 1);
    Real I_8(fixed = false, start = 1);
    Real I_9(fixed = false, start = 1);
    Real I_10(fixed = false, start = 1);
    Real I_11(fixed = false, start = 1);
    Real I_12(fixed = false, start = 1);
    Real I_pH_aa(fixed = false, start = 1);
    Real I_pH_ac(fixed = false, start = 1);
    Real I_pH_h2(fixed = false, start = 1);
    Real I_in_lim(fixed = false, start = 1);
    Real I_ip_lim(fixed = false, start = 1);
    Real I_h2_fa(fixed = false, start = 1);
    Real I_h2_c4(fixed = false, start = 1);
    Real I_h2_pro(fixed = false, start = 1);
    Real I_nh3(fixed = false, start = 1);
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
    annotation(
      Documentation(info = "<html><p> This record contains the operational parameters and constants of the digester. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_operational;

  record StateVariablesADM1
    //Biomasses
    SI.MassConcentration X_su(fixed = true, start = 1.60571, stateSelect = StateSelect.always) "Monosaccharide degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_aa(fixed = true, start = 0.541365, stateSelect = StateSelect.always) "Amino Acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_fa(fixed = true, start = 0.213571, stateSelect = StateSelect.always) "Long chain fatty acid degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_c4(fixed = true, start = 0.412867, stateSelect = StateSelect.always) "C4 degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_pro(fixed = true, start = 0.248744, stateSelect = StateSelect.always) "Propionate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ac(fixed = true, start = 1.01593, stateSelect = StateSelect.always) "Acetate degrading organisms concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_h2(fixed = true, start = 0.463351, stateSelect = StateSelect.always) "Hydrogen degrading organisms concentration in digestate [kgCOD/m3]";
    //Particulate substrate
    SI.MassConcentration X_c(fixed = true, start = 0.0, stateSelect = StateSelect.always) "Complex particulate concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_i(fixed = true, start = 45.1488, stateSelect = StateSelect.always) "Particulate inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_ch[3](each fixed = true, each start = 0.0, each nominal = 1e-1, each stateSelect = StateSelect.always) "Particulate carbohydrates concentration in digestate [kgCOD/m3]; 1.09422";
    SI.MassConcentration X_pr[2](each fixed = true, each start = 0.0, each nominal = 1e-1, each stateSelect = StateSelect.always) "Particulate proteins concentration in digestate [kgCOD/m3]; 0.890377";
    SI.MassConcentration X_li(fixed = true, start = 0.325233, stateSelect = StateSelect.always) "Particulate lipids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration X_p(fixed = true, start = 0.325233, stateSelect = StateSelect.always) "Particulate inert fraction from bacteria decay [kgCOD/m3]";
    //
    //Soluble substrate
    SI.MassConcentration S_i(fixed = true, start = 2.06057e-08, stateSelect = StateSelect.always) "Soluble inerts concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_su(fixed = true, start = 0.0216284, stateSelect = StateSelect.always) "Soluble monosaccharides concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_aa(fixed = true, start = 0.0545847, stateSelect = StateSelect.always) "Soluble amino acids concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_fa(fixed = true, start = 0.0414486, stateSelect = StateSelect.always) "Soluble long chain fatty acids  concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_va(fixed = true, start = 0.00201259, stateSelect = StateSelect.always) "Valeric acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_bu(fixed = true, start = 0.0031565, stateSelect = StateSelect.always) "Butyric concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_pro(fixed = true, start = 0.0156237, stateSelect = StateSelect.always) "Propionic acid concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ac(fixed = true, start = 0.880519, stateSelect = StateSelect.always) "Acetic acid concentration in digestate [kgCOD/m3]";
    //Inorganic soluble components
    SI.MassConcentration S_h2(fixed = true, start = 4.11532e-07, stateSelect = StateSelect.always) "Soluble hydrogen concentration in digestate [kgCOD/m3]";
    SI.MassConcentration S_ch4(fixed = true, start = 0.0474429, stateSelect = StateSelect.always) "Soluble methane concentration in digestate [kgCOD/m3]";
    //Ionic total components
    Types.MolarDensity_M S_ic(fixed = true, start = 0.0312386, stateSelect = StateSelect.always) "Soluble inorganic carbon concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_in(fixed = true, start = 0.0242044, stateSelect = StateSelect.always) "Soluble inorganic nitrogen concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ip(fixed = true, start = 0.00659511, nominal = 1e-3, stateSelect = StateSelect.always) "8/10";
    Types.MolarDensity_M S_cat(fixed = false, start = 0.118805, nominal = 1e-2, stateSelect = StateSelect.always) "Soluble cationic ion concentration in digestate [kmol/m3]";
    Types.MolarDensity_M S_ca(fixed = true, start = 0.001 "0.00027486", nominal = 1e-4, stateSelect = StateSelect.always) "rimetti true!";
    Types.MolarDensity_M S_mg(fixed = true, start = 0.0128337, nominal = 1e-5, stateSelect = StateSelect.always) "rimetti true!";
    Types.MolarDensity_M S_an(fixed = false, start = 0.0200409, nominal = 1e-2, stateSelect = StateSelect.always);
    //
    //Gas components
    SI.MassConcentration S_gas_h2(fixed = true, start = 1.88676e-05, stateSelect = StateSelect.always);
    SI.MassConcentration S_gas_ch4(fixed = true, start = 1.48839, stateSelect = StateSelect.always);
    Types.MolarDensity_M S_gas_co2(fixed = true, start = 0.0144672, stateSelect = StateSelect.always);
    Types.MolarDensity_M S_gas_nh3(fixed = true, start = 1.88676e-05, nominal = 1e-5, stateSelect = StateSelect.always);
    annotation(
      Documentation(info = "<html><p> This record contains state variables and initial conditions. </p>
  <p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
  <p> Last review: <em> January 22, 2020 </em></p></html>"));
  end StateVariablesADM1;

  record ParametersADM1_stoichiometric
    parameter Integer nC = 26;
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
    //Mass fractions (kg_i/kg)
    final parameter Real y_PR[5] = {MW_i[i]*Protein[i]/MW_PR for i in 1:5};
    final parameter Real y_CH[5] = {MW_i[i]*Carbohydrate[i]/MW_CH for i in 1:5};
    final parameter Real y_LI[5] = {MW_i[i]*Lipid[i]/MW_LI for i in 1:5};
    final parameter Real y_BM[5] = {MW_i[i]*Biomass[i]/MW_BM for i in 1:5};
    //Elemental composition (kmol_i/kgCOD)
    final parameter Real i_CH[5] = {y_CH[i]/MW_i[i]/COD_VS_CH for i in 1:5};
    final parameter Real i_PR[5] = {y_PR[i]/MW_i[i]/COD_VS_PR for i in 1:5};
    final parameter Real i_LI[5] = {y_LI[i]/MW_i[i]/COD_VS_LI for i in 1:5};
    final parameter Real i_BM[5] = {y_BM[i]/MW_i[i]/COD_VS_BM for i in 1:5};
    final parameter Real i_XP[5] = {0.0301, 0, 0, 0.0043, 0.00021};
    //It is possible to change what follows for conversions in Feed and Sink. Advice to keep it unchanged in digester.
    parameter Real N_PR(unit = "kgVS/kgN") = 7.5 "conversion factor for effluent proteins to organic nitrogen";
    parameter Real COD_VS_CH(unit = "kgCOD/kgVS") = 32*y_CH[1]/12 + 8*y_CH[2] - 16*y_CH[3]/16 - 24*y_CH[4]/14 + 40*y_CH[5]/31 + 48*0/32 "COD conversion factor for influent carbohydrates";
    parameter Real COD_VS_PR(unit = "kgCOD/kgVS") = 32*y_PR[1]/12 + 8*y_PR[2] - 16*y_PR[3]/16 - 24*y_PR[4]/14 + 40*y_PR[5]/31 + 48*0/32 "1.58 COD conversion factor for influent proteins";
    parameter Real COD_VS_LI(unit = "kgCOD/kgVS") = 32*y_LI[1]/12 + 8*y_LI[2] - 16*y_LI[3]/16 - 24*y_LI[4]/14 + 40*y_LI[5]/31 + 48*0/32 "COD conversion factor for influent lipids";
    parameter Real COD_VS_BM(unit = "kgCOD/kgVS") = 32*y_BM[1]/12 + 8*y_BM[2] - 16*y_BM[3]/16 - 24*y_BM[4]/14 + 40*y_BM[5]/31 + 48*0/32 "COD conversion factor for influent lipids";
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
    parameter Real f_si_xb(unit = "kgCOD/kgCOD") = 0.02 "yield of soluble inerts from disintegration of complex particulates";
    parameter Real f_xi_xb(unit = "kgCOD/kgCOD") = 0.08 "fP from Wett et al 2006. Yield of particulate inerts from disintegration of complex particulates";
    parameter Real f_ch_xb(unit = "kgCOD/kgCOD") = 0.275 "yield of carbohydrates from disintegration of complex particulates";
    parameter Real f_pr_xb(unit = "kgCOD/kgCOD") = 0.275 "yield of proteins from disintegration of complex particulates";
    parameter Real f_li_xb(unit = "kgCOD/kgCOD") = 0.350 "yield of lipids from disintegration of complex particulates";
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
    parameter Real k_dis(unit = "1/d") = 1.54 "1.2 complex particulate disintegration first order constant";
    parameter Real k_hyd_xcr = 0.1;
    parameter Real k_hyd_xcs = 0.01;
    parameter Real k_hyd_xchr = 1;
    parameter Real k_hyd_xchm = 0.3;
    parameter Real k_hyd_xchs = 0.01;
    parameter Real k_hyd_xprr = 1;
    parameter Real k_hyd_xprs = 0.2;
    parameter Real k_hyd_xli = 0.3;
    final parameter Real k_hyd[8] = {k_hyd_xcr, k_hyd_xcs, k_hyd_xchr, k_hyd_xchm, k_hyd_xchs, k_hyd_xprr, k_hyd_xprs, k_hyd_xli};
    parameter Real Tref_khyd[8] = fill(308.15, 8);
    parameter Real k_m_su(unit = "kgCODs/kgCODx/d") = 8 " 38 30 maximum uptake rate for monosaccharide degrading organisms";
    parameter Real k_m_aa(unit = "kgCODs/kgCODx/d") = 8 "50 maximum uptake rate amino acid degrading organisms";
    parameter Real k_m_fa(unit = "kgCODs/kgCODx/d") = 6 "6 maximum uptake rate for long chain fatty acid degrading organisms";
    parameter Real k_m_c4(unit = "kgCODs/kgCODx/d") = 20 "20 maximum uptake rate for c4 degrading organisms";
    parameter Real k_m_pro(unit = "kgCODs/kgCODx/d") = 20 "13 maximum uptake rate for propionate degrading organisms";
    parameter Real k_m_ac(unit = "kgCODs/kgCODx/d") = 8 "maximum uptake rate for acetate degrading organisms";
    parameter Real k_m_h2(unit = "kgCODs/kgCODx/d") = 35 "maximum uptake rate for hydrogen degrading organisms";
    parameter Real Ks_su(unit = "kgCOD/m3") = 0.5 "half saturation constant for monosaccharidedegradation";
    parameter Real Ks_aa(unit = "kgCOD/m3") = 0.3 "0.3 half saturation constant for amino acid degradation";
    parameter Real Ks_fa(unit = "kgCOD/m3") = 0.4 "half saturation constant for long chain fatty acid degrading organisms";
    parameter Real Ks_c4(unit = "kgCOD/m3") = 0.1 "half saturation constant for c4 degrading organisms";
    parameter Real Ks_pro(unit = "kgCOD/m3") = 0.3 "0.3 half saturation constant for propionate degrading organisms";
    parameter Real Ks_ac(unit = "kgCOD/m3") = 0.15 "0.15 half saturation constant for acetate degrading organisms";
    parameter Real Ks_h2(unit = "kgCOD/m3") = 2.5e-5 "half saturation constant for hydrogen degrading organisms";
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
    parameter Real convKa(unit = "kmol/m3") = 1;
    //MPP submodel
    constant Real deltaH0_Ksp_stru(unit = "J/mol") = -22600 "enthalpy of reaction of struvite formation. Rontenltap et al 2007 as 22.6 kJ/mol; ; 98.82 kJ/mol; Struvite precipitation is endo up to 30°C and eso between 30-60°C";
    constant Real deltaH0_Ksp_acp(unit = "J/mol") = 54000 "enthalpy of reaction of calcium phosphate formation??; 310 g/mol*26.1 J/g = 8091 J/mol";
    constant Real deltaH0_Ksp_ccm(unit = "J/mol") = -8000 "enthalpy of reaction of calcium phosphate formation??; 310 g/mol*26.1 J/g = 8091 J/mol";
    final parameter Real pKsp_acp(unit = "conc") = 28.92 "New value from PCM?";
    final parameter Real kcryst_acp(unit = "d-1") = 3*(24*60);
    final parameter Real pKsp_stru(unit = "conc") = 13.6 "New value from PCM? Also Ronteltap et al. 2007";
    final parameter Real kcryst_stru(unit = "d-1") = 5*(24*60);
    final parameter Real pKsp_ccm(unit = "conc") = 8.480 "New value from PCM?";
    final parameter Real kcryst_ccm(unit = "d-1") = 0.35*(24*60);
    annotation(
      Documentation(info = "<html><p> This record contains the physiochemical parameters as reported in the Anaerobic Digestion Model No. 1 ADM1 (Batstone et al., 2002. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> December 06, 2020 </em></p></html>"));
  end ParametersADM1_physiochemical;

  record OtherVariables_MassBalance
    Real V_in_cum(fixed = true, start = 0);
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
    Real Vcum(fixed = true, start = 0);
    Real Vcum_ch4(fixed = true, start = 0);
    annotation(
      Documentation(info = "<html><p> This record contains other variables used for calculating mass balances. </p>
<p><em> @Arianna Catenacci, Politecnico di Milano</em></p>
<p> Last review: <em> January 22, 2021 </em></p></html>"));
  end OtherVariables_MassBalance;

  record Settable_composites
    //To be used only in Feed and Sink. These fractions are on COD basis!!
    //Xc fractioning
    parameter SI.MassFraction f_xi_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_ch_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_pr_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_li_xc(nominal = 1e-1) = 0.2;
    parameter SI.MassFraction f_si_xc(nominal = 1e-1) = 1 - (f_xi_xc + f_pr_xc + f_li_xc + f_ch_xc);
    //
    //Xi fractioning (same fractioning between macromolecus of Xi and f_xi*Xc)
    parameter Real f_ch_xi = 0.1 "COD fraction of carbohydrates from particulate inerts Xi [kgCOD/kgCOD]";
    parameter Real f_pr_xi = 0.55 "COD fraction of proteins from particulate inerts Xi [kgCOD/kgCOD]";
    parameter Real f_li_xi = 1 - (f_ch_xi + f_pr_xi);
    //
    //Si fractioning
    parameter Real f_ch_si(unit = "kgCOD/kgCOD") = 0.6 "fraction of carbohydrates in Si";
    parameter Real f_pr_si(unit = "kgCOD/kgCOD") = 0.4 "fraction of proteins Si";
    parameter Real f_li_si(unit = "kgCOD/kgCOD") = 1 - f_ch_si - f_pr_si "fraction of lipids in Si";
    //Composition of bacteria
    parameter Real f_Xbiom_ch(unit = "kgCOD/kgCOD") = 0.195 "Carbohydrates content in biomass";
    parameter Real f_Xbiom_pr(unit = "kgCOD/kgCOD") = 0.8 "Proteins content in biomass";
    parameter Real f_Xbiom_li(unit = "kgCOD/kgCOD") = 1 - f_Xbiom_ch - f_Xbiom_pr "Lipids content in biomass";
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
    Real Q_ch4_N(fixed = false, start = 0);
    Real Q_co2_N(fixed = false, start = 0);
    Real Q_h2_N(fixed = false, start = 0);
  end OtherVariables_GasMeter;

  package Interfaces
    connector Feed_stream_vec
      flow SI.VolumeFlowRate Q;
      Real dummy;
      parameter Integer nXch;
      parameter Integer nXpr;
      constant Integer N_ip = 1 "5";
      constant Integer N_in = 1 "3";
      constant Integer N_ic = 1 "4";
      constant Integer N_an = 1 "2";
      constant Integer N_cat = 1 "2";
      parameter Integer nW;
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
      stream SI.MassConcentration X_c[6];
      stream SI.MassConcentration X_ch[3];
      stream SI.MassConcentration X_pr[2];
      stream SI.MassConcentration X_li;
      stream SI.MassConcentration X_p;
      //stream SI.MassConcentration X_lig;
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
      annotation(
        Diagram(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}),
        Icon(graphics = {Ellipse(origin = {-0.36, 0.24}, fillColor = {255, 255, 127}, fillPattern = FillPattern.Solid, extent = {{-98.36, 98.24}, {98.36, -98.24}}, endAngle = 360)}));
    end Gas_stream;
  end Interfaces;

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
  end Icons;

  package BlockLibrary
    model Feed_Source_NIR
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.BlockLibrary.Feed_Source_Common;
      extends ADM1_P.Feed_variables_NIR;
      Modelica.Blocks.Interfaces.RealInput inlet[26] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
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
      Real tBMPth_pr = 496;
      Real tBMPth_li = 1014;
      Real tBMPth_ch = 415;
      Real tBMPth_su = 415;
    equation
//Inputs
      TS_in = if steady == true then ts else inlet[1];
      VS_in = if steady == true then vs_ts*TS_in/100 else inlet[2]*TS_in/100;
      pH = if steady == true then ph else inlet[3];
      Alk_in = if steady == true then tac else inlet[4];
      Ammonium_in = if steady == true or liquid == false then tan else inlet[5];
      Fosfates_in = if steady == true or liquid == false then ortop else inlet[6];
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
      outlet.S_i[1] = outlet.S_i[end]*f_ch_si "gCOD/L";
      outlet.S_i[2] = outlet.S_i[end]*f_pr_si "gCOD/L";
      outlet.S_i[3] = outlet.S_i[end]*f_li_si "gCOD/L";
//
//Computation of variables X_c and X_i (Biernacki)
//Computation of variables X_ch, X_pr, X_li (gCOD/L; Biernacki)
//
      outlet.X_c[end] = 0;
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
//
//  outlet.X_i[end] = 0;
//Da cambiare COD_VS lignina. Posso anche scriverlo come (1-BDch)*CH_in se non ho differenze tra COD_VS lignina e altri
      outlet.X_i[1] = TS_in/100*((100 - BD_cell)/100*Cellulose_in*COD_VS[15] + (100 - BD_hemicell)/100*Hemicellulose_in*COD_VS[15] + Lignin_in*COD_VS[15]);
      outlet.X_i[2] = TS_in/100*((100 - BD_pr)/100*CP_in*COD_VS[16]);
      outlet.X_i[3] = TS_in/100*((100 - BD_li)/100*EE_in*COD_VS[17]);
      outlet.X_i[end] = sum(outlet.X_i[i] for i in 1:3);
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
      S_hco3 = if liquid == false then outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h) else Alk_mol - (S_acm + S_prom + S_bum + S_vam) - S_oh - (outlet.S_in - S_nh4) + S_h - S_hpo4 - 2*S_po4 + S_h3po4 - 2*S_co3 "mol/L";
      outlet.S_ic = if liquid == false then tic/12/1000 else (S_hco3*(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h))/Ka_co2 "mol/L";
      outlet.S_in = Ammonium_in/14/1000 "mol/L";
      outlet.S_ip = Fosfates_in/30.973762/1000 "mol/L";
      outlet.S_an = an "mol/L";
      outlet.S_cat = if liquid == false then cat else (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 "mol/L";
      outlet.S_ca = Ca_in;
      outlet.S_mg = Mg_in;
      outlet.ash = TS_in - VS_in;
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_NLS,LOG_NLS_V,LOG_STATS", s = "dassl", variableFilter = ".*"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ");
    end Feed_Source_NIR;

    partial model Feed_Source_Common
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.ParametersADM1_physiochemical;
      extends ADM1_P.Feed_variables_Common;
      extends ADM1_P.Settable_composites;
      extends ADM1_P.ParametersADM1_stoichiometric;
      extends ADM1_P.Lumped_variables;
      Modelica.Blocks.Interfaces.RealInput Q annotation(
        Placement(visible = true, transformation(origin = {-72, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(nW = nW) annotation(
        Placement(visible = true, transformation(origin = {92, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput T_op annotation(
        Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Simulating choices
      parameter Integer nXin;
      parameter Integer nW = 1;
      parameter Boolean steady = true "setti parametro";
      //Other parameters (to easily simulate parallel steady states)
      //Flores S_an_in: 0
      //To simulate a solid matrix with parameters: Carbonates/Phosphates/S_an_in/Ca/Mg = 0.0
      //Feed input characteristics (Ari+Dave)
      //
      //Not sure about MW_XP
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_ch_si*COD_VS_CH + f_li_si*COD_VS_LI + f_pr_si*COD_VS_PR, f_pr_xc*COD_VS_PR + f_li_xc*COD_VS_LI + f_ch_xc*COD_VS_CH + f_xi_xc*COD_VS[nC] + f_si_xc*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_ch_xi*COD_VS_CH + f_pr_xi*COD_VS_PR + f_li_xi*COD_VS_LI, 1.54} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_ch_si*MW_CH + f_li_si*MW_LI + f_pr_si*MW_PR, f_pr_xc*MW_PR + f_li_xc*MW_LI + f_ch_xc*MW_CH + f_xi_xc*MW[25] + f_si_xc*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_ch_xi*MW_CH + f_pr_xi*MW_PR + f_li_xi*MW_LI, 76} "g/mol";
    equation
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
      outlet.X_stru = 0;
      outlet.X_acp = 0;
      outlet.X_ccm = 0;
//Sommare a TAC E TAN i sali? Quando misuro diluisco...
//Lumped Feed characteristic
      TAC = (S_hco3 + 2*S_co3 + S_oh + S_acm + S_prom + S_bum + S_vam - S_h + S_nh3 + S_hpo4 + 2*S_po4 - S_h3po4)*50*1000 "Alkalinity as mgCaCO3/L";
//
      VFA = (outlet.S_ac/COD_VS[7]/MW[7] + outlet.S_pro/COD_VS[6]/MW[6] + outlet.S_bu/COD_VS[5]/MW[5] + outlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
//Aggiungere Xp!!
      VS = (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (outlet.X_su + outlet.X_aa + outlet.X_fa + outlet.X_c4 + outlet.X_pro + outlet.X_ac + outlet.X_h2)*f_Xbiom_li/COD_VS_LI + (outlet.S_su + sum(outlet.X_ch[i] for i in 1:3))/COD_VS_CH + (outlet.S_aa + sum(outlet.X_pr[2] for i in 1:2))/COD_VS_PR + (outlet.S_fa + outlet.X_li)/COD_VS_LI + outlet.S_i[end]/COD_VS[13] + outlet.X_i[end]/COD_VS[25] + outlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13]) "Volatile Solid content in the digester as gVS/L";
//
      N_NH4NH3 = outlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va + outlet.X_aa + outlet.X_ac + outlet.X_c[end] + outlet.X_c4 + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_fa + outlet.X_h2 + outlet.X_i[end] + outlet.X_li + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_pro + outlet.X_su "Total COD concentration as gCOD/L";
      COD_sol = outlet.S_aa + outlet.S_ac + outlet.S_bu + outlet.S_ch4 + outlet.S_fa + outlet.S_h2 + outlet.S_i[end] + outlet.S_pro + outlet.S_su + outlet.S_va;
      CH_tot = (outlet.S_su + sum(outlet.X_ch[i] for i in 1:3) + outlet.X_c[end]*f_ch_xc + f_ch_si*outlet.S_i[1] + outlet.X_i[1] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_ch)/COD_VS_CH "Total CH concentration as gGlu/L";
      PR_tot_BCA = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_ch_xc + f_pr_si*outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (outlet.S_aa + sum(outlet.X_pr[i] for i in 1:2) + outlet.X_c[end]*f_pr_xc + f_pr_si*outlet.S_i[2] + outlet.X_i[2] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (outlet.S_fa + outlet.X_li + outlet.X_c[end]*f_li_xc + f_li_si*outlet.S_i[3] + outlet.X_i[3] + (outlet.X_aa + outlet.X_ac + outlet.X_c4 + outlet.X_fa + outlet.X_h2 + outlet.X_pro + outlet.X_su)*f_Xbiom_li)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (outlet.S_su + f_ch_si*outlet.S_i[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (outlet.S_aa + f_pr_si*outlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (outlet.S_aa + f_pr_si*outlet.S_i[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (outlet.S_fa + f_li_si*outlet.S_i[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Common;

    model Feed_Source_Direct
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.BlockLibrary.Feed_Source_Common;
      extends ADM1_P.Feed_variables_Direct;
      Modelica.Blocks.Interfaces.RealInput inlet[31] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      //Other parameters (to easily simulate parallel steady states)
      //Flores S_an_in: 0
      //To simulate a solid matrix with parameters: Carbonates/Phosphates/S_an_in/Ca/Mg = 0.0
      parameter Boolean inputpH;
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
// ADD lignin
      outlet.X_p = 0;
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
      outlet.ash = 0;
      Alk_mol = S_hco3 + (S_acm + S_prom + S_bum + S_vam) + S_oh + (outlet.S_in - S_nh4) - S_h + S_hpo4 + 2*S_po4 - S_h3po4 + 2*S_co3 "mol/L";
      annotation(
        __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
    end Feed_Source_Direct;

    model Feed_Source_Catenacci
      //Verified on S.Antonio, BSM2 e Ari
      extends ADM1_P.BlockLibrary.Feed_Source_Common;
      extends ADM1_P.Feed_variables_Catenacci;
      Modelica.Blocks.Interfaces.RealInput inlet[21] annotation(
        Placement(visible = true, transformation(origin = {-72, -88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, -18}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
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
      alpha = if pVS_in == 0 then 0 else (pVS_in - VS_in)/(pVS_in - sVS_in);
//Computation of COD components
      pLI_VS_in = pLI_pVS_in*(1 - alpha)*pVS_in/VS_in;
//
      tLI_in = pLI_VS_in*VS_in*d/1000 + outlet.S_fa*1000/COD_VS[17];
//
      COD_VFA = outlet.S_ac + outlet.S_pro + outlet.S_bu + outlet.S_va "gCOD/L, COD associated to VFA";
      tCOd = if TKN == true then COD_VFA + tCH_in*COD_VS[15]/1000 + (tPR_in*d/1000 - Ammonium_in)*COD_VS[16]*N_PR/1000 + tLI_in*COD_VS[17]/1000 else COD_VFA + tCH_in*COD_VS[15]/1000 + tPR_in*COD_VS_PR_BCA/1000 + tLI_in*COD_VS[17]/1000 "gCOD/L, total COD as sum of total CH, PR, LI and VFA";
      pCOd = tCOd - COD_VFA - outlet.S_su - outlet.S_fa - outlet.S_aa "gCOD/L, particulate COD";
      tBMP_COd = tBMP_VS_in/tCOd*VS_in*d/1000 "NmLCH4/gCOD, BMP referred to the unit mass of total COD";
      fd_tCOd = if tBMP_COd == 0 then 1 else tBMP_COd/(R*100*273.15/101325/2/32*10^6*(1 - f_newbio_BMP)) "Problema dello Yogurth: se BMP nullo, significa tutto degradabile";
      tCOd*fd_tCOd = COD_VFA + outlet.S_aa + outlet.S_su + outlet.S_fa + pCOd*fd_pCOd;
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
      outlet.X_c[end] = pCOd*f_Xc_in;
      outlet.X_c[1] = outlet.X_c[end]*f_ch_xc;
      outlet.X_c[2] = outlet.X_c[end]*f_pr_xc;
      outlet.X_c[3] = outlet.X_c[end]*f_li_xc;
      outlet.X_c[4] = outlet.X_c[end]*f_xi_xc;
      outlet.X_c[5] = outlet.X_c[end]*f_si_xc;
//
      outlet.X_i[end] = pCOd*(1 - fd_pCOd) - outlet.X_c[end]*f_xi_xc;
      outlet.X_i[1] = outlet.X_i[end]*f_ch_xi;
      outlet.X_i[2] = outlet.X_i[end]*f_pr_xi;
      outlet.X_i[3] = outlet.X_i[end]*f_li_xi;
//
      outlet.X_ch[2] = (tCH_in - sCH_in)*COD_VS[15]/1000 - (outlet.X_i[end]*f_ch_xi + outlet.X_c[end]*f_ch_xc + outlet.X_c[end]*f_xi_xc*f_ch_xi);
      outlet.X_ch[1] = 0;
      outlet.X_ch[3] = 0;
//Input sempre da TKN
      outlet.X_pr[2] = if TKN == true then (tPR_in*d/1000 - Ammonium_in)*COD_VS_PR*N_PR/1000 - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi) else (tPR_in - sPR_in)/1000*COD_VS_PR_BCA - (outlet.X_i[end]*f_pr_xi + outlet.X_c[end]*f_pr_xc + outlet.X_c[end]*f_xi_xc*f_pr_xi);
      outlet.X_pr[1] = 0;
//
      outlet.X_li = tLI_in*COD_VS[17]/1000 - outlet.S_fa - (outlet.X_i[end]*f_li_xi + outlet.X_c[end]*f_li_xc + outlet.X_c[end]*f_xi_xc*f_li_xi);
//
      outlet.X_p = 0;
//
      Alk_mol = Alk_in/100*2/1000 "mol/L";
      S_hco3 = if Alk_in == 0 then outlet.S_ic*Ka_co2/(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h) else Alk_mol - (S_acm + S_prom + S_bum + S_vam) - S_oh - (outlet.S_in - S_nh4) + S_h - S_hpo4 - 2*S_po4 + S_h3po4 - 2*S_co3 "mol/L";
      outlet.S_ic = if Alk_in == 0 then tic/12/1000 else (S_hco3*(S_h + Ka_co2 + Ka_hco3*Ka_co2/S_h))/Ka_co2 "mol/L";
      outlet.S_in = Ammonium_in/14/1000 "mol/L";
      outlet.S_ip = Fosfates_in/31/1000 "mol/L";
      outlet.S_an = an "mol/L";
      outlet.S_cat = (-S_nh4) - S_h - 2*outlet.S_ca - 2*outlet.S_mg + outlet.S_an + S_hco3 + S_oh + S_acm + S_prom + S_bum + S_vam + 2*S_hpo4 + S_h2po4 + 3*S_po4 + 2*S_co3 "mol/L";
      outlet.S_ca = ca;
      outlet.S_mg = mg;
      outlet.ash = TS_in - VS_in;
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
    equation
      Biogas_In.p_gas_h2o = inStream(Biogas_In.p_gas_h2o);
      Biogas_In.p_gas_h2 = inStream(Biogas_In.p_gas_h2);
      Biogas_In.p_gas_ch4 = inStream(Biogas_In.p_gas_ch4);
      Biogas_In.p_gas_co2 = inStream(Biogas_In.p_gas_co2);
      Biogas_In.p_gas_nh3 = inStream(Biogas_In.p_gas_nh3);
      Biogas_In.P_gas = Biogas_In.p_gas_ch4 + Biogas_In.p_gas_co2 + Biogas_In.p_gas_h2 + Biogas_In.p_gas_nh3 + Biogas_In.p_gas_h2o;
//
      x_ch4 = Biogas_In.p_gas_ch4/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_co2 = Biogas_In.p_gas_co2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_h2 = Biogas_In.p_gas_h2/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      x_nh3 = Biogas_In.p_gas_nh3/(Biogas_In.P_gas - Biogas_In.p_gas_h2o);
      Q_ch4_N = Biogas_In.Q_gas_N*x_ch4*1000 "Methane rate [L/d] at standard conditions; occhio wet/dry!!";
      Q_co2_N = Biogas_In.Q_gas_N*x_co2*1000 "Carbon dioxide rate [L/d] at standard conditions";
      Q_h2_N = Biogas_In.Q_gas_N*x_h2*1000 "Hydrogen rate [L/d] at standard conditions";
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
        f_xi[i] = if noEvent(inlet.X_i[end] == 0) then 1/3 else inlet.X_i[i]/inlet.X_i[end];
      end for;
      for i in 1:3 loop
        f_si[i] = if noEvent(inlet.S_i[end] == 0) then 1/3 else inlet.S_i[i]/inlet.S_i[end];
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
      N_NH4NH3 = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
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
      Modelica.Blocks.Interfaces.RealOutput Spilling annotation(
        Placement(visible = true, transformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {108, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_ch_si*COD_VS_CH + f_li_si*COD_VS_LI + f_pr_si*COD_VS_PR, f_pr_xc*COD_VS_PR + f_li_xc*COD_VS_LI + f_ch_xc*COD_VS_CH + f_xi_xc*COD_VS[nC] + f_si_xc*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_ch_xi*COD_VS_CH + f_pr_xi*COD_VS_PR + f_li_xi*COD_VS_LI, 1.54} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_ch_si*MW_CH + f_li_si*MW_LI + f_pr_si*MW_PR, f_pr_xc*MW_PR + f_li_xc*MW_LI + f_ch_xc*MW_CH + f_xi_xc*MW[25] + f_si_xc*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_ch_xi*MW_CH + f_pr_xi*MW_PR + f_li_xi*MW_LI, 76} "g/mol";
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
//
      inlet.X_pr[1] = Spilling;
//Block variables
      TAC = 1e-3 "Alkalinity as mgCaCO3/L";
//
      VFA = (inlet.S_ac/COD_VS[7]/MW[7] + inlet.S_pro/COD_VS[6]/MW[6] + inlet.S_bu/COD_VS[5]/MW[5] + inlet.S_va/COD_VS[4]/MW[4])*60*1000 "VFA as mgCH3COOH/L";
//
      FOS_TAC = VFA/TAC "Ratio between acidity and alkalinity";
////Aggiungere Xp!!
      VS = (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_ch/COD_VS_CH + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_pr/COD_VS_PR + (inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2)*f_Xbiom_li/COD_VS_LI + (inlet.S_su + sum(inlet.X_ch[i] for i in 1:3))/COD_VS_CH + (inlet.S_aa + sum(inlet.X_pr[2] for i in 1:2))/COD_VS_PR + (inlet.S_fa + inlet.X_li)/COD_VS_LI + inlet.S_i[end]/COD_VS[13] + inlet.X_i[end]/COD_VS[25] + inlet.X_c[end]*(f_ch_xc/COD_VS_CH + f_pr_xc/COD_VS_PR + f_li_xc/COD_VS_LI + f_xi_xc/COD_VS[25] + f_si_xc/COD_VS[13]) "Volatile Solid content in the digester as gVS/L";
//
      N_NH4NH3 = inlet.S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c[end] + inlet.X_c4 + sum(inlet.X_ch[i] for i in 1:3) + inlet.X_fa + inlet.X_h2 + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_pro + inlet.X_su "Total COD concentration as gCOD/L";
      COD_sol = inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va;
      CH_tot = (inlet.S_su + sum(inlet.X_ch[i] for i in 1:3) + inlet.X_c[end]*f_ch_xc + f_ch_si*inlet.S_i[1] + inlet.X_i[end]*f_ch_xi + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_ch)/COD_VS_CH "Total CH concentration as gGlu/L";
      PR_tot_BCA = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_ch_xc + f_pr_si*inlet.S_i[2] + inlet.X_i[end]*f_pr_xi + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (inlet.S_aa + sum(inlet.X_pr[i] for i in 1:2) + inlet.X_c[end]*f_pr_xc + f_pr_si*inlet.S_i[2] + inlet.X_i[end]*f_pr_xi + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_pr)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (inlet.S_fa + inlet.X_li + inlet.X_c[end]*f_li_xc + f_li_si*inlet.S_i[3] + inlet.X_i[end]*f_li_xi + (inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su)*f_Xbiom_li)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (inlet.S_su + f_ch_si*inlet.S_i[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (inlet.S_aa + f_pr_si*inlet.S_i[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (inlet.S_aa + f_pr_si*inlet.S_i[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (inlet.S_fa + f_li_si*inlet.S_i[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
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
      Real r_stru;
      Real r_ccm;
      Real r_acp;
      Real n1, n6, n13;
      //Real r_add[3];
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[3]*COD_VS_LI + f_si[2]*COD_VS_PR, f_xc[2]*COD_VS_PR + f_xc[3]*COD_VS_LI + f_xc[1]*COD_VS_CH + f_xc[4]*COD_VS[nC] + f_xc[5]*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[3]*MW_LI + f_si[2]*MW_PR, f_xc[2]*MW_PR + f_xc[3]*MW_LI + f_xc[1]*MW_CH + f_xc[4]*MW[25] + f_xc[5]*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76} "g/mol";
    equation
//Composite fractioning from feed mixing and consequent elemental compositions
      for i in 1:5 loop
        f_xc[i] = if noEvent(noXc == true) then 1/5 else X_c_in[i]/X_c_in[end];
      end for;
      for i in 1:3 loop
        f_xi[i] = if noEvent(X_i_in[end] == 0) then 1/3 else X_i_in[i]/X_i_in[end];
      end for;
      for i in 1:3 loop
        f_si[i] = if noEvent(S_i_in[end] == 0) then 1/3 else S_i_in[i]/S_i_in[end];
      end for;
      i_XI = {i_CH[1]*f_xi[1] + i_PR[1]*f_xi[2] + i_LI[1]*f_xi[3], 0, 0, i_PR[4]*f_xi[2], i_LI[5]*f_xi[3]};
      i_SI = {i_CH[1]*f_si[1] + i_PR[1]*f_si[2] + i_LI[1]*f_si[3], 0, 0, i_PR[4]*f_si[2], i_LI[5]*f_si[3]};
      i_XC = {f_xc[3]*i_LI[1] + f_xc[2]*i_PR[1] + f_xc[1]*i_CH[1] + f_xc[4]*i_XI[1] + f_xc[5]*i_SI[1], 0, 0, f_xc[2]*i_PR[4] + f_xc[4]*i_XI[4] + f_xc[5]*i_SI[4], f_xc[3]*i_LI[5] + f_xc[4]*i_XI[5] + f_xc[5]*i_SI[5]};
//I calculation
      10000*(I - 0.5*(S_ca*2^2 + S_po4*3^2 + S_nh4*1^2 + S_mg*2^2 + S_hpo4*2^2 + S_h2po4*1^2 + S_hco3*1^2 + S_cat*1^2 + S_an*1^2 + S_co3*2^2 + 1^2*(S_acm/COD_VS[7]/MW[7] + S_prom/COD_VS[6]/MW[6] + S_bum/COD_VS[5]/MW[5] + S_vam/COD_VS[4]/MW[4]))) = ionic_force;
//I = 0.36;
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
      Ksp_acp = 10^(-pKsp_acp)*exp(deltaH0_Ksp_acp/(R*100)*(1/T_ref - 1/T_op));
      Ksp_stru = 10^(-pKsp_stru)*exp(deltaH0_Ksp_stru/(R*100)*(1/T_ref - 1/T_op));
      Ksp_ccm = 10^(-pKsp_ccm)*exp(deltaH0_Ksp_ccm/(R*100)*(1/T_ref - 1/T_op));
      SI_acp = log10(arg_log_acp);
      SI_stru = log10(arg_log_stru);
      SI_ccm = log10(arg_log_ccm);
      rp1 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rp2 = if precipitation == false then 0.0 else (1 + Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rd1 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_acp))/2*kcryst_acp/(24*60)*(X_acp - 0)*((10^(SI_acp))^(1/5) - 1)^2;
      rd2 = if precipitation == false then 0.0 else (1 - Functions.regSign(SI_stru))/2*kcryst_stru/(24*60)*(X_stru - 0)*((10^(SI_stru))^(1/3) - 1)^2;
      rp3 = if noEvent(precipitation == false) then 0.0 else (1 + Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      rd3 = if noEvent(precipitation == false) then 0.0 else (1 - Functions.regSign(SI_ccm))/2*kcryst_ccm/(24*60)*(X_ccm - 0)*((10^(SI_ccm))^(1/2) - 1)^2;
      24*3600*der(X_ccm) = Q/V_liq*(-X_ccm) + rp3*24*60 - rd3*24*60 + r_ccm;
      24*3600*der(X_acp) = Q/V_liq*(-X_acp) + rp1*24*60 - rd1*24*60 + r_acp;
      24*3600*der(X_stru) = Q/V_liq*(-X_stru) + rp2*24*60 - rd2*24*60 + r_stru;
      r_stru = if noEvent(Functions.regSign(X_stru) == -1) then -1000*X_stru else 0;
      r_acp = if noEvent(Functions.regSign(X_acp) == -1) then -1000*X_acp else 0;
      r_ccm = if noEvent(Functions.regSign(X_ccm) == -1) then -1000*X_ccm else 0;
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
      rt10 = kla*(S_co2 - KH_co2*p_gas_co2);
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
      der(X_ch[1]) = Q/V_liq*(X_ch_in[1] - X_ch[1]) - r2[1];
      der(X_ch[3]) = Q/V_liq*(X_ch_in[3] - X_ch[3]) - r2[3];
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
      24*3600*der(S_ic) = Q/V_liq*(S_ic_in - S_ic) - (v1*r1 + v2*sum(r2[i] for i in 1:size(r2, 1)) + v3*sum(r3[i] for i in 1:size(r3, 1)) + v4*r4 + v5*r5 + v6*r6 + v7*r7 + v8*r8 + v9*r9 + v10*r10 + v11*r11 + v12*r12 + v13*(r13 + r14 + r15 + r16 + r17 + r18 + r19)) - rt10 - (rp3 - rd3)*24*60;
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
      24*3600*der(S_mg) = Q/V_liq*(S_mg_in - S_mg) - (rp2 - rd2)*24*60;
      24*3600*der(S_an) = Q/V_liq*(S_an_in - S_an);
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
//  der(S_h) + der(S_cat) + der(S_h)*S_in*Ka_nh4/(Ka_nh4+S_h)^2 + S_h/(Ka_nh4+S_h)*der(S_in) = (der(S_ac/Ac_conv)*Ka_ac/(S_h+Ka_ac)-der(S_h)*Ka_ac*S_ac/Ac_conv/(S_h+Ka_ac)^2) + (der(S_pro/Pro_conv)*Ka_pro/(S_h+Ka_pro)-der(S_h)*Ka_pro*S_pro/Pro_conv/(S_h+Ka_pro)^2) + (der(S_bu/Bu_conv)*Ka_bu/(S_h+Ka_bu)-der(S_h)*Ka_bu*S_bu/Bu_conv/(S_h+Ka_bu)^2) + (der(S_va/Va_conv)*Ka_va/(S_h+Ka_va)-der(S_h)*Ka_va*S_va/Va_conv/(S_h+Ka_va)^2) + der(S_an) + Ka_co2/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*((S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)*(S_h*der(S_ic)+S_ic*der(S_h))-(S_ic*S_h*der(S_h)*(Ka_co2+2*S_h))) + 2*Ka_co2*Ka_hco3/(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)^2*(der(S_ic)*(S_h^2+Ka_co2*S_h+Ka_co2*Ka_hco3)-S_ic*der(S_h)*(2*S_h+Ka_co2))- Ka_h2o*convKa/(S_h)^2*der(S_h) + 3*(Ka_h3po4*Ka_h2po4*Ka_hpo4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*(der(S_ip)*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + 2*(Ka_h3po4*Ka_h2po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((S_ip*der(S_h)+ S_h*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h)))) + (Ka_h3po4/(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)^2*((2*S_ip*S_h*der(S_h)+ S_h^2*der(S_ip))*(S_h^3+Ka_h3po4*S_h^2+Ka_h3po4*Ka_h2po4*S_h+Ka_h3po4*Ka_h2po4*Ka_hpo4)-S_ip*S_h^2*(3*S_h^2*der(S_h)+2*Ka_h3po4*S_h*der(S_h)+Ka_h3po4*Ka_h2po4*der(S_h))));
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
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13]) "Volatile Solid content in the digester as gVS/L";
//
      N_NH4NH3 = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su "Total COD concentration as gCOD/L";
      COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
      CH_tot = (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH "Total CH concentration as gGlu/L";
      PR_tot_BCA = (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (S_fa + X_li + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
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
//Da mettere in dinamico?
      outlet.ash = inlet.ash;
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = max(1e-16, V_liq/Q) "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
//
//MASS BALANCES
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_p + X_aa + X_ac + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_c "Particulate COD concentration";
      COD_balance_in = inlet.Q*(inlet.X_p + inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)));
      COD_balance_out = outlet.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
      24*3600*der(V_in_cum) = inlet.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = inlet.Q*(i_XP[1]*inlet.X_p + inlet.S_ic + i_XC[1]*inlet.X_c[end] + i_SI[1]*inlet.S_i[end] + i_XI[1]*inlet.X_i[end] + i_CH[1]*sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + i_PR[1]*sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + i_LI[1]*inlet.X_li + C_su*inlet.S_su + i_PR[1]*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + i_BM[1]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + X_ccm_in);
      IC_balance_out = outlet.Q*(i_XP[1]*X_p + S_ic + i_SI[1]*S_i + i_XI[1]*X_i + i_CH[1]*sum(X_ch[i] for i in 1:size(X_ch, 1)) + i_PR[1]*sum(X_pr[i] for i in 1:size(X_pr, 1)) + i_LI[1]*X_li + C_su*S_su + i_PR[1]*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + i_BM[1]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + i_XC[1]*X_c + X_ccm);
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
    end Digester;

    model Open
      extends ADM1_P.BlockLibrary.PartialDigester;
      extends ADM1_P.Icons.SludgeDischarge;
      ADM1_P.Interfaces.Feed_stream_vec inlet(X = 1, nW = nW) annotation(
        Placement(visible = true, transformation(origin = {-74, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADM1_P.Interfaces.Feed_stream_vec outlet(X = 1, nW = nW) annotation(
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
      inlet.X_h2 = inStream({inlet.X_h2[1]}) "dummy never used";
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
      inlet.X_i[:] = fill(0, size(inlet.X_i, 1)) "dummy never used";
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
      outlet.X_h2 = 0.1*inStream(inlet.X_h2);
      outlet.X_i = 0.1*inStream(inlet.X_i);
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
      outlet.X_c = 0.1*inStream(inlet.X_c);
      outlet.X_ch = 0.1*inStream(inlet.X_ch);
      outlet.X_pr = 0.1*inStream(inlet.X_pr);
      outlet.X_li = 0.1*inStream(inlet.X_li);
      outlet.X_su = 0.1*inStream(inlet.X_su);
      outlet.X_aa = 0.1*inStream(inlet.X_aa);
      outlet.X_fa = 0.1*inStream(inlet.X_fa);
      outlet.X_c4 = 0.1*inStream(inlet.X_c4);
      outlet.X_pro = 0.1*inStream(inlet.X_pro);
      outlet.X_ac = 0.1*inStream(inlet.X_ac);
      outlet.X_stru = inStream(inlet.X_stru);
      outlet.X_acp = inStream(inlet.X_acp);
      outlet.X_ccm = inStream(inlet.X_ccm);
      outlet.X_p = 0.1*inStream(inlet.X_p);
      outlet.ash = 0.1*inStream(inlet.ash);
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
        r_stru = if noEvent(Functions.regSign(X_stru) == -1) then -1000*X_stru else 0;
        r_acp = if noEvent(Functions.regSign(X_acp) == -1) then -1000*X_acp else 0;
        r_ccm = if noEvent(Functions.regSign(X_ccm) == -1) then -1000*X_ccm else 0;
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
      Modelica.Blocks.Interfaces.RealOutput P_gas annotation(
        Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-12, 94}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
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
//Da mettere come input sicchè non esiste come variabile di stato da inizializzare
      ash_in = 0;
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
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
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
      Real COD_VS[nC] = {1.07, 1.53, 2.87, 208/102, 160/88, 112/74, 64/60, 7.94, 3.99, 0, 0, 0, f_si[1]*COD_VS_CH + f_si[3]*COD_VS_LI + f_si[2]*COD_VS_PR, f_xc[2]*COD_VS_PR + f_xc[3]*COD_VS_LI + f_xc[1]*COD_VS_CH + f_xc[4]*COD_VS[nC] + f_xc[5]*COD_VS[13], COD_VS_CH, COD_VS_PR, COD_VS_LI, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, COD_VS_BM, f_xi[1]*COD_VS_CH + f_xi[2]*COD_VS_PR + f_xi[3]*COD_VS_LI, 1.54} "gCOD/gVS";
      Real MW[nC] = {180.16, 87.40, 256.42, 102.13, 88.10, 74.08, 60.05, 2.02, 16.04, MW_i[1], MW_i[4], MW_i[5], f_si[1]*MW_CH + f_si[3]*MW_LI + f_si[2]*MW_PR, f_xc[2]*MW_PR + f_xc[3]*MW_LI + f_xc[1]*MW_CH + f_xc[4]*MW[25] + f_xc[5]*MW[13], MW_CH, MW_PR, MW_LI, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, MW_BM, f_xi[1]*MW_CH + f_xi[2]*MW_PR + f_xi[3]*MW_LI, 76} "g/mol";
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
      for i in 1:5 loop
        f_xc[i] = if noEvent(noXc == true) then 1/5 else X_c_in[i]/X_c_in[end];
      end for;
      for i in 1:3 loop
        f_xi[i] = if noEvent(X_i_in[end] == 0) then 1/3 else X_i_in[i]/X_i_in[end];
      end for;
      for i in 1:3 loop
        f_si[i] = if noEvent(S_i_in[end] == 0) then 1/3 else S_i_in[i]/S_i_in[end];
      end for;
      i_XI = {i_CH[1]*f_xi[1] + i_PR[1]*f_xi[2] + i_LI[1]*f_xi[3], 0, 0, i_PR[4]*f_xi[2], i_LI[5]*f_xi[3]};
      i_SI = {i_CH[1]*f_si[1] + i_PR[1]*f_si[2] + i_LI[1]*f_si[3], 0, 0, i_PR[4]*f_si[2], i_LI[5]*f_si[3]};
      i_XC = {f_xc[3]*i_LI[1] + f_xc[2]*i_PR[1] + f_xc[1]*i_CH[1] + f_xc[4]*i_XI[1] + f_xc[5]*i_SI[1], 0, 0, f_xc[2]*i_PR[4] + f_xc[4]*i_XI[4] + f_xc[5]*i_SI[4], f_xc[3]*i_LI[5] + f_xc[4]*i_XI[5] + f_xc[5]*i_SI[5]};
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
      VS = (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_ch_xb/COD_VS_CH + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_pr_xb/COD_VS_PR + (X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2)*f_li_xb/COD_VS_LI + (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)))/COD_VS_CH + (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)))/COD_VS_PR + (S_fa + X_li)/COD_VS_LI + S_i/COD_VS[13] + X_i/COD_VS[25] + X_c*(f_xc[1]/COD_VS_CH + f_xc[2]/COD_VS_PR + f_xc[3]/COD_VS_LI + f_xc[4]/COD_VS[25] + f_xc[5]/COD_VS[13]) "Volatile Solid content in the digester as gVS/L";
//
      N_NH4NH3 = S_in*14*1000 "Ammonium + Ammonia concentration from kit analysis as mgN/L";
      COD_tot = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va + X_aa + X_ac + X_c + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su "Total COD concentration as gCOD/L";
      COD_sol = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va;
      CH_tot = (S_su + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_c*f_xc[1] + S_i*f_si[1] + X_i*f_xi[1] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_ch_xb)/COD_VS_CH "Total CH concentration as gGlu/L";
      PR_tot_BCA = (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR_BCA "Total PR concentration as gBSA/L";
      PR_tot_TKN = (S_aa + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_c*f_xc[2] + S_i*f_si[2] + X_i*f_xi[2] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_pr_xb)/COD_VS_PR/N_PR "Total PR concentration as gN/L";
      LI_tot = (S_fa + X_li + X_c*f_xc[3] + S_i*f_si[3] + X_i*f_xi[3] + (X_aa + X_ac + X_c4 + X_fa + X_h2 + X_pro + X_su)*f_li_xb)/COD_VS_LI "Total LI concentration as glipid/L";
      CH_sol = (S_su + S_i*f_si[1])/COD_VS_CH "Soluble CH concentration as gGlu/L";
      PR_sol_BCA = (S_aa + S_i*f_si[2])/COD_VS_PR_BCA "Soluble PR concentration as gBSA/L";
      PR_sol_TKN = (S_aa + S_i*f_si[2])/COD_VS_PR/N_PR "Soluble PR concentration as gN/L";
      LI_sol = (S_fa + S_i*f_si[3])/COD_VS_LI "Soluble LI concentration as glipid/L";
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
//Da mettere in dinamico?
      outlet.ash = inlet.ash;
//
//DIGESTER'S OPERATIVE PARAMETERS
      HRT = V_liq/Q "Hyraulic Retention Time [d]";
      OLR = COD_balance_in/V_liq "Organic Loading Rate [kgCOD/m3/d]";
//
//MASS BALANCES
//COD Balance
      COD_S = S_aa + S_ac + S_bu + S_ch4 + S_fa + S_h2 + S_i + S_pro + S_su + S_va "Soluble COD concentration";
      COD_X = X_p + X_aa + X_ac + X_c4 + sum(X_ch[i] for i in 1:size(X_ch, 1)) + X_fa + X_h2 + X_i + X_li + sum(X_pr[i] for i in 1:size(X_pr, 1)) + X_pro + X_su + X_c "Particulate COD concentration";
      COD_balance_in = inlet.Q*(inlet.X_p + inlet.S_aa + inlet.S_ac + inlet.S_bu + inlet.S_ch4 + inlet.S_fa + inlet.S_h2 + inlet.S_i[end] + inlet.S_pro + inlet.S_su + inlet.S_va + inlet.X_aa + inlet.X_ac + inlet.X_c4 + inlet.X_fa + inlet.X_h2 + inlet.X_pro + inlet.X_su + sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + inlet.X_c[end] + inlet.X_i[end] + inlet.X_li + sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)));
      COD_balance_out = outlet.Q*(COD_S + COD_X);
      COD_balance_gas = Biogas_Out.Q_gas_N*(p_gas_ch4/P_gas/(R/64*273.15/1.01325) + p_gas_h2/P_gas/(R/16*273.15/1.01325));
      24*3600*der(CH4_cum) = ((1 - Y_ac)*r11 + (1 - Y_h2)*r12)*V_liq;
      24*3600*der(V_in_cum) = inlet.Q;
      24*3600*der(COD_balance_in_cum) = COD_balance_in;
      24*3600*der(COD_balance_out_cum) = COD_balance_out;
      24*3600*der(COD_balance_gas_cum) = COD_balance_gas;
//Inorganic Carbon Balance
      IC_balance_in = inlet.Q*(i_XP[1]*inlet.X_p + inlet.S_ic + i_XC[1]*inlet.X_c[end] + i_SI[1]*inlet.S_i[end] + i_XI[1]*inlet.X_i[end] + i_CH[1]*sum(inlet.X_ch[i] for i in 1:size(inlet.X_ch, 1)) + i_PR[1]*sum(inlet.X_pr[i] for i in 1:size(inlet.X_pr, 1)) + i_LI[1]*inlet.X_li + C_su*inlet.S_su + i_PR[1]*inlet.S_aa + C_fa*inlet.S_fa + C_va*inlet.S_va + C_bu*inlet.S_bu + C_pro*inlet.S_pro + C_ac*inlet.S_ac + C_ch4*inlet.S_ch4 + i_BM[1]*(inlet.X_su + inlet.X_aa + inlet.X_fa + inlet.X_c4 + inlet.X_pro + inlet.X_ac + inlet.X_h2) + X_ccm_in);
      IC_balance_out = outlet.Q*(i_XP[1]*X_p + S_ic + i_SI[1]*S_i + i_XI[1]*X_i + i_CH[1]*sum(X_ch[i] for i in 1:size(X_ch, 1)) + i_PR[1]*sum(X_pr[i] for i in 1:size(X_pr, 1)) + i_LI[1]*X_li + C_su*S_su + i_PR[1]*S_aa + C_fa*S_fa + C_va*S_va + C_bu*S_bu + C_pro*S_pro + C_ac*S_ac + C_ch4*S_ch4 + i_BM[1]*(X_su + X_aa + X_fa + X_c4 + X_pro + X_ac + X_h2) + i_XC[1]*X_c + X_ccm);
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
      liquidoutlet.X_i = inStream(inlet.X_i) "dummy never used";
      liquidoutlet.S_i = inStream(inlet.S_i) "dummy never used";
      liquidoutlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
      liquidoutlet.S_su = inStream(inlet.S_su);
      liquidoutlet.S_aa = inStream(inlet.S_aa);
      liquidoutlet.S_fa = inStream(inlet.S_fa);
      liquidoutlet.S_va = inStream(inlet.S_va);
      liquidoutlet.S_bu = inStream(inlet.S_bu);
      liquidoutlet.S_pro = inStream(inlet.S_pro);
      liquidoutlet.S_ac = inStream(inlet.S_ac);
      liquidoutlet.S_h2 = inStream(inlet.S_h2);
      liquidoutlet.S_ch4 = inStream(inlet.S_ch4);
      liquidoutlet.S_ic = inStream(inlet.S_ic);
      liquidoutlet.S_in = inStream(inlet.S_in);
      liquidoutlet.S_ip = inStream(inlet.S_ip);
      liquidoutlet.S_cat = inStream(inlet.S_cat);
      liquidoutlet.S_ca = inStream(inlet.S_ca);
      liquidoutlet.S_mg = inStream(inlet.S_mg);
      liquidoutlet.S_an = inStream(inlet.S_an);
      liquidoutlet.X_c = inStream(inlet.X_c);
      liquidoutlet.X_ch = inStream(inlet.X_ch);
      liquidoutlet.X_pr = inStream(inlet.X_pr);
      liquidoutlet.X_li = inStream(inlet.X_li);
      liquidoutlet.X_su = inStream(inlet.X_su);
      liquidoutlet.X_aa = inStream(inlet.X_aa);
      liquidoutlet.X_fa = inStream(inlet.X_fa);
      liquidoutlet.X_c4 = inStream(inlet.X_c4);
      liquidoutlet.X_pro = inStream(inlet.X_pro);
      liquidoutlet.X_ac = inStream(inlet.X_ac);
      liquidoutlet.X_stru = inStream(inlet.X_stru);
      liquidoutlet.X_acp = inStream(inlet.X_acp);
      liquidoutlet.X_ccm = inStream(inlet.X_ccm);
      liquidoutlet.X_p = inStream(inlet.X_p);
      liquidoutlet.ash = inStream(inlet.ash);
//Solid Outlet
      solidoutlet.Q + liquidoutlet.Q + inlet.Q = 0;
      solidoutlet.X_i = inStream(inlet.X_i) "dummy never used";
      solidoutlet.S_i = inStream(inlet.S_i) "dummy never used";
      solidoutlet.X_h2 = inStream(inlet.X_h2) "dummy never used";
      solidoutlet.S_su = inStream(inlet.S_su);
      solidoutlet.S_aa = inStream(inlet.S_aa);
      solidoutlet.S_fa = inStream(inlet.S_fa);
      solidoutlet.S_va = inStream(inlet.S_va);
      solidoutlet.S_bu = inStream(inlet.S_bu);
      solidoutlet.S_pro = inStream(inlet.S_pro);
      solidoutlet.S_ac = inStream(inlet.S_ac);
      solidoutlet.S_h2 = inStream(inlet.S_h2);
      solidoutlet.S_ch4 = inStream(inlet.S_ch4);
      solidoutlet.S_ic = inStream(inlet.S_ic);
      solidoutlet.S_in = inStream(inlet.S_in);
      solidoutlet.S_ip = inStream(inlet.S_ip);
      solidoutlet.S_cat = inStream(inlet.S_cat);
      solidoutlet.S_ca = inStream(inlet.S_ca);
      solidoutlet.S_mg = inStream(inlet.S_mg);
      solidoutlet.S_an = inStream(inlet.S_an);
      solidoutlet.X_c = inStream(inlet.X_c);
      solidoutlet.X_ch = inStream(inlet.X_ch);
      solidoutlet.X_pr = inStream(inlet.X_pr);
      solidoutlet.X_li = inStream(inlet.X_li);
      solidoutlet.X_su = inStream(inlet.X_su);
      solidoutlet.X_aa = inStream(inlet.X_aa);
      solidoutlet.X_fa = inStream(inlet.X_fa);
      solidoutlet.X_c4 = inStream(inlet.X_c4);
      solidoutlet.X_pro = inStream(inlet.X_pro);
      solidoutlet.X_ac = inStream(inlet.X_ac);
      solidoutlet.X_stru = inStream(inlet.X_stru);
      solidoutlet.X_acp = inStream(inlet.X_acp);
      solidoutlet.X_ccm = inStream(inlet.X_ccm);
      solidoutlet.X_p = inStream(inlet.X_p);
      solidoutlet.ash = inStream(inlet.ash);
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Text(origin = {0, -6}, extent = {{-100, 100}, {100, 60}}, textString = "ScrewPress"), Polygon(origin = {0, -38}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Line(origin = {1.09038, -17.0811}, points = {{-71.0904, -56.9189}, {-61.0904, -48.9189}, {-79.0904, -20.9189}, {54.9096, 63.0811}, {78.9096, 29.0811}, {78.9096, 11.0811}, {72.9096, 11.0811}, {72.9096, 23.0811}, {-57.0904, -56.9189}, {-47.0904, -64.9189}, {-29.0904, -64.9189}, {72.9096, 23.0811}, {72.9096, 11.0811}}), Line(origin = {0.727027, -14.0048}, points = {{-70.727, -33.9952}, {-60.727, -49.9952}, {71.273, 32.0048}, {59.273, 50.0048}, {-70.727, -33.9952}, {-60.727, -49.9952}, {-44.727, -39.9952}}), Polygon(origin = {1, -16}, fillColor = {108, 82, 2}, fillPattern = FillPattern.VerticalCylinder, points = {{-71, -58}, {-61, -50}, {-79, -22}, {55, 62}, {79, 28}, {79, 10}, {73, 10}, {73, 22}, {-67, -64}, {-71, -58}, {-67, -64}, {-71, -58}}), Polygon(origin = {0, -13}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, points = {{-70, -35}, {-62, -47}, {72, 33}, {62, 47}, {-70, -35}, {-64, -31}, {-70, -35}}), Polygon(origin = {-52, -47}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {-36, -78}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, points = {{-20, 4}, {-10, -4}, {-4, -4}, {-4, -6}, {0, -6}, {0, -4}, {8, -4}, {20, 6}, {-16, 6}, {-16, 6}, {-20, 4}}), Polygon(origin = {14, -30}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Polygon(origin = {28, -22}, lineColor = {0, 0, 255}, fillColor = {255, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, points = {{-30, -20}, {-26, -20}, {-26, -26}, {-22, -26}, {-28, -32}, {-34, -26}, {-30, -26}, {-30, -20}}), Polygon(origin = {-32, -33}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {-10, -19}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {10, -7}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {30, 5}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}}), Polygon(origin = {52, 19}, fillColor = {138, 138, 138}, fillPattern = FillPattern.Solid, points = {{-16, 13}, {-18, 11}, {16, -13}, {18, -11}, {18, -11}, {18, -11}, {-16, 13}})}),
        Documentation(info = "Icon for a secondary clarifier"));
    end ScrewPress;
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

  model Stream_top
    ADM1_P.Multiple_stream_onehyd multiple_stream_onehyd(digester_.ideality = true) annotation(
      Placement(visible = true, transformation(origin = {-29, 1}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleManure(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_CattleManure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Literature_Input_CattleSlurry.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_MaizeSilage(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/S.Antonio_Input_MaizeSilage.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-224, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Input_CattleManure.y, multiple_stream_onehyd.Input_CattleManure) annotation(
      Line(points = {{-210, 38}, {-46, 38}, {-46, 10}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Input_CattleSlurry.y, multiple_stream_onehyd.Input_CattleSlurry) annotation(
      Line(points = {{-210, 6}, {-46, 6}, {-46, 4}}, color = {0, 0, 127}, thickness = 0.5));
    connect(Input_MaizeSilage.y, multiple_stream_onehyd.Input_MaizeSilage) annotation(
      Line(points = {{-212, -24}, {-46, -24}, {-46, -2}}, color = {0, 0, 127}, thickness = 0.5));
    annotation(
      experiment(StartTime = 0, StopTime = 50000, Tolerance = 1e-06, Interval = 50),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Stream_top;

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

  model Test_stream_fractions
    ADM1_P.BlockLibrary.Feeding_Tank_stream2 feeding_Tank_stream2 annotation(
      Placement(visible = true, transformation(origin = {6, -34}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
    BlockLibrary.Sink sink annotation(
      Placement(visible = true, transformation(origin = {44, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-222, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_real_stream feed2(Carbonates_in = 100, Flores = true, S_an_in = 0, TS = 100, T_op_mean(displayUnit = "kK"), vs_ts = 78, Xpr = 0.20, steady = true) annotation(
      Placement(visible = true, transformation(origin = {-70, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 80; 732, 80], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-170, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_real_stream feed_Source_real_stream(Carbonates_in = 100, Flores = true, S_an_in = 0, TS = 100, T_op_mean(displayUnit = "kK"), vs_ts = 78, Xpr = 0.10, steady = true) annotation(
      Placement(visible = true, transformation(origin = {-52, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 190; 732, 190], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-152, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-204, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Input_Flores_BSM2.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Flores", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-236, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 190; 732, 190], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-184, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_real_stream feed_Source_real_stream1(Carbonates_in = 100, Flores = true, S_an_in = 0, TS = 100, T_op_mean(displayUnit = "kK"), vs_ts = 78, Xpr = 0.10, steady = true) annotation(
      Placement(visible = true, transformation(origin = {-84, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(feeding_Tank_stream2.outlet, sink.inlet) annotation(
      Line(points = {{28, -34}, {27, -34}, {27, -6}, {34, -6}}));
    connect(Input_CattleSlurry.y, feed2.inlet[2:end]) annotation(
      Line(points = {{-210, 6}, {-77, 6}, {-77, -32}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable.y, feed2.inlet[1]) annotation(
      Line(points = {{-159, 26}, {-77, 26}, {-77, -32}}, color = {0, 0, 127}));
    connect(feed2.outlet, feeding_Tank_stream2.inlet2) annotation(
      Line(points = {{-61, -35}, {-15, -35}, {-15, -36}}));
    connect(timeTable1.y, feed_Source_real_stream.inlet[1]) annotation(
      Line(points = {{-141, 68}, {-59, 68}, {-59, 10}}, color = {0, 0, 127}));
    connect(combiTimeTable.y, feed_Source_real_stream.inlet[2:end]) annotation(
      Line(points = {{-193, 48}, {-60, 48}, {-60, 10}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source_real_stream.outlet, feeding_Tank_stream2.inlet1) annotation(
      Line(points = {{-44, 8}, {-16, 8}, {-16, -28}}));
    connect(timeTable2.y, feed_Source_real_stream1.inlet[1]) annotation(
      Line(points = {{-173, -18}, {-91, -18}, {-91, -76}}, color = {0, 0, 127}));
    connect(combiTimeTable1.y, feed_Source_real_stream1.inlet[2:end]) annotation(
      Line(points = {{-225, -38}, {-92, -38}, {-92, -76}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source_real_stream1.outlet, feeding_Tank_stream2.inlet3) annotation(
      Line(points = {{-76, -78}, {-16, -78}, {-16, -42}}));
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
  end Test_stream_fractions;

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
  end Flores;

  model SAntonio_double
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(S_h(fixed = true, start = 7.17353e-8), V_gas = (1527 - 1350)*2 + 1.6*706.5*(6 - 4.5), V_liq = 1350*2 + 706.5*4.5, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, multihyd = true, nW = nW, noXc = true, precipitation = false, k_m_ac = 5.6, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 150) annotation(
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
    BlockLibrary.Digester postidigester(S_h(fixed = true, start = 7.17353e-8), V_gas = (1527 - 1350)*2 + 1.6*706.5*(6 - 4.5), V_liq = 1350*2 + 706.5*4.5, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, multihyd = true, nW = nW, noXc = true, precipitation = false, k_m_ac = 5.6, k_m_c4 = 14, k_m_fa = 8, k_m_pro = 13, k_m_su = 11, kla = 100) annotation(
      Placement(visible = true, transformation(origin = {96, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID limPID(Nd = 10, Ti = 120000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 37537, strict = false, yMax = 10000, yMin = 0, y_start = 1500) annotation(
      Placement(visible = true, transformation(origin = {130, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 300, offset = 1400, startTime(displayUnit = "ks") = 86400*20) annotation(
      Placement(visible = true, transformation(origin = {180, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 12.8; 732, 12.8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 37; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_CattleSlurry.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_NIR maize(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, liquid = false, steady = false, tan = 764) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_NIR manure(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, liquid = false, ortop = 441, steady = false, tan = 520) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 130; 732, 130], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_Manure.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleManure", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Feed_Source_NIR slurry(an = 0.02, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, liquid = true, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Recycle recycle(recycledQ = 100) annotation(
      Placement(visible = true, transformation(origin = {58, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    connect(timeTable.y, manure.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, 42}}, color = {0, 0, 127}));
    connect(timeTable2.y, maize.Q) annotation(
      Line(points = {{-103, -20}, {-103, -34}, {-85, -34}, {-85, -52}}, color = {0, 0, 127}));
    connect(timeTable3.y, slurry.Q) annotation(
      Line(points = {{-101, 32}, {-101, 18}, {-83, 18}, {-83, 0}}, color = {0, 0, 127}));
    connect(timeTable.y, slurry.T_op) annotation(
      Line(points = {{-94, -74}, {-84, -74}, {-84, -2}}, color = {0, 0, 127}));
    connect(timeTable4.y, manure.Q) annotation(
      Line(points = {{-103, 82}, {-103, 44}, {-83, 44}}, color = {0, 0, 127}));
    connect(combiTimeTable.y, slurry.inlet) annotation(
      Line(points = {{-153, 12}, {-83, 12}, {-83, 0}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable2.y, manure.inlet) annotation(
      Line(points = {{-151, 60}, {-83, 60}, {-83, 44}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable.y, maize.T_op) annotation(
      Line(points = {{-94, -74}, {-85, -74}, {-85, -54}}, color = {0, 0, 127}));
    connect(combiTimeTable1.y, maize.inlet) annotation(
      Line(points = {{-155, -40}, {-85, -40}, {-85, -52}}, color = {0, 0, 127}, thickness = 0.5));
    connect(step1.y, PID_Pgas.u_m) annotation(
      Line(points = {{-36, 86}, {-32, 86}, {-32, 42}, {-6, 42}, {-6, 60}}, color = {0, 0, 127}));
    connect(step1.y, limPID.u_m) annotation(
      Line(points = {{-36, 86}, {-30, 86}, {-30, 38}, {130, 38}, {130, 42}}, color = {0, 0, 127}));
    connect(manure.outlet, digester.inlet) annotation(
      Line(points = {{-68, 42}, {-46, 42}, {-46, 22}, {28, 22}}));
    connect(slurry.outlet, digester.inlet) annotation(
      Line(points = {{-68, -2}, {12, -2}, {12, 22}, {28, 22}}));
    connect(maize.outlet, digester.inlet) annotation(
      Line(points = {{-70, -54}, {-2, -54}, {-2, 22}, {28, 22}}));
    connect(postidigester.outlet, recycle.inlet) annotation(
      Line(points = {{104, 14}, {100, 14}, {100, -18}, {70, -18}}));
    connect(recycle.outlet, digester.inlet) annotation(
      Line(points = {{50, -18}, {10, -18}, {10, 22}, {28, 22}}));
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
    Flores Normal(digester.ideality = true) annotation(
      Placement(visible = true, transformation(origin = {-64, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Flores HighCa(feed_Source_Ari.Ca = 0.007*8, digester.ideality = true, feed_Source_Ari.Mg = 1e-5) annotation(
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

  package Calibration
    //within Calibration;

    model sampler_with_oclk
      parameter SI.Time Ts = 0.5;
      Modelica.Blocks.Interfaces.RealInput u annotation(
        Placement(visible = true, transformation(origin = {-148, 4}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      discrete Modelica.Blocks.Interfaces.RealOutput y annotation(
        Placement(visible = true, transformation(origin = {124, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Modelica.Blocks.Interfaces.BooleanOutput clk(start = false) annotation(
        Placement(visible = true, transformation(origin = {-10, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
      Boolean c(start = false);
      //Real u=sin(time);
    equation
      clk = c;
    algorithm
      when sample(0, Ts) then
        y := u;
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
  end Calibration;

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
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    Real Xpr_start;
    Real Sample_time = 86400*11;
    Real delta_prova = 86400*10;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(S_gas_ch4(fixed = false), S_gas_co2(fixed = false), S_gas_h2(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 0.077 - 0.051, V_liq = 0.051, X_aa(start = 0.61), X_ac(start = 0.44), X_c(start = 0.1), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, k_hyd_xchm = 0.2, k_hyd_xli = 0.2, k_hyd_xprs = 0.15, kla = 80, multihyd = false, nW = nW, noXc = false, p_gas_ch4(fixed = true, start = 0.65), p_gas_co2(fixed = true), p_gas_h2(fixed = true), precipitation = true) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Td = 0.1, Ti = 11000, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.NoInit, k = 11, strict = false, xi_start = 0.026, yMax = 10000, yMin = 0, y_start = 0.29) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci feed_Source_Ari(COD_VS_CH = 32*6/180, COD_VS_LI = 2.9, COD_VS_PR = 1.42, TKN = true, an = 0.04, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.3, f_si_xc = 0.0, f_xi_xc = 0.2, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/sludge_dynamic.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/Input_P_PLC_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_P_PLC", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-78, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0, offset = 1.035, startTime(displayUnit = "ks") = 1000) annotation(
      Placement(visible = true, transformation(origin = {-50, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 310.15; 732, 310.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed1_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-116, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_dynamic/Input_BMP_B0_Feed1_2023.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_BMP_Feed1_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-146, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_Catenacci feed_Source_Ari_vec_(COD_VS_CH = 32*6/180, COD_VS_LI = 2.9, COD_VS_PR = 1.42, TKN = false, an = 0.04, f_Xc_in = 0, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, steady = false) annotation(
      Placement(visible = true, transformation(origin = {-60, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable3(columns = integer({2}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_dynamic/Input_Q_Feed2_ADM1_2022.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Q_Feed2_ADM1", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 3600, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-144, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable5(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/yogurt.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-142, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 308.15; 732, 308.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {88, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Batch_ batch(S_h(fixed = true, start = 7.17353e-8), X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = false, k_dis = 1.2, multihyd = false, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {138, 30}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step1(height = 0.02, offset = 0.2, startTime(displayUnit = "ks") = 1000) annotation(
      Placement(visible = true, transformation(origin = {26, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    Xpr_start = digester.X_pr[2];
    when time == Sample_time then
      reinit(batch.X_pr[2], Xpr_start);
    end when;
    connect(digester.Biogas_Out, Gas_Meter.Biogas_In) annotation(
      Line(points = {{50, 28}, {50, 52}}));
    connect(PID_Pgas.u_s, digester.P_gas) annotation(
      Line(points = {{-18, 72}, {-20, 72}, {-20, 30}, {40, 30}}, color = {0, 0, 127}));
    connect(timeTable1.y, digester.T_op) annotation(
      Line(points = {{-30, -78}, {28, -78}, {28, 4}}, color = {0, 0, 127}));
    connect(feed_Source_Ari.outlet, digester.inlet) annotation(
      Line(points = {{-51, -31}, {12, -31}, {12, 22}, {28, 22}}));
    connect(digester.outlet, sink_vec.inlet) annotation(
      Line(points = {{56, 2}, {76, 2}, {76, 0}}));
    connect(Input_CattleSlurry.y, feed_Source_Ari.inlet) annotation(
      Line(points = {{-102, -20}, {-68, -20}, {-68, -24}}, color = {0, 0, 127}, thickness = 0.5));
    connect(timeTable.y, feed_Source_Ari.T_op) annotation(
      Line(points = {{-99, -70}, {-67, -70}, {-67, -30}}, color = {0, 0, 127}));
    connect(timeTable.y, feed_Source_Ari_vec_.T_op) annotation(
      Line(points = {{-99, -70}, {-68, -70}, {-68, 0}}, color = {0, 0, 127}));
    connect(combiTimeTable3.y[1], feed_Source_Ari_vec_.Q) annotation(
      Line(points = {{-132, 6}, {-68, 6}, {-68, 2}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable5.y, feed_Source_Ari_vec_.inlet) annotation(
      Line(points = {{-130, 26}, {-68, 26}, {-68, 2}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source_Ari_vec_.outlet, digester.inlet) annotation(
      Line(points = {{-52, 0}, {4, 0}, {4, 22}, {28, 22}}));
    connect(timeTable3.y, batch.T_op) annotation(
      Line(points = {{99, -74}, {124, -74}, {124, 19}}, color = {0, 0, 127}));
    connect(PID_Pgas.y, digester.u) annotation(
      Line(points = {{6, 72}, {42, 72}, {42, 30}}, color = {0, 0, 127}));
    connect(combiTimeTable1.y[1], feed_Source_Ari.Q) annotation(
      Line(points = {{-104, -40}, {-68, -40}, {-68, -28}}, color = {0, 0, 127}, thickness = 0.5));
    connect(combiTimeTable.y[1], PID_Pgas.u_m) annotation(
      Line(points = {{-66, 40}, {-6, 40}, {-6, 60}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 846720, Tolerance = 1e-06, Interval = 360.153),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest ",
      __OpenModelica_simulationFlags(lv = "LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
  end Sgo;

  model SAntonio
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
    ADM1_P.BlockLibrary.Feed_Source_NIR maize(tan = 764, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_MaizeSilage_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 37; 732, 37], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/txt_new/sAntonio_CattleSlurry_nir.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_CattleSlurry", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 130; 732, 130], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR slurry(an = 0.02, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = true) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 12.8; 732, 12.8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR manure(tan = 520, ortop = 441, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
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
    connect(timeTable2.y, maize.Q) annotation(
      Line(points = {{-103, -20}, {-103, -34}, {-85, -34}, {-85, -52}}, color = {0, 0, 127}));
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
    annotation(
      experiment(StartTime = 0, StopTime = 3.1536e+07, Tolerance = 1e-06, Interval = 3600),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --std=latest -d=stateselection -d=bltdump",
      __OpenModelica_simulationFlags(lv = "-LOG_STDOUT,LOG_ASSERT,LOG_STATS", s = "dassl", variableFilter = ".*"));
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

  model Fragea
    parameter Integer nXin = 30;
    parameter Integer nW = 1;
    //Stream checked over Flores on 28/03/2023 and over S.Antonio
    //Matteo suggerisce di mettere solo realInput (no input) e poi tenere la porta fino al livello più alto (base, intermedio, alto)
    //Equazioni specificate nel modello di livello in cui attacchi la sorgente (CpombiTimeTable)
    //Puoi poi testare pezzi singoli anche intermedi attaccandoci a quel livello i tuoi input
    ADM1_P.BlockLibrary.Digester digester(I(fixed = false), S_h(fixed = true, start = 7.17353e-8), V_gas = 3000*2/3, V_liq = 3000*2, X_aa(start = 0.61), X_ac(start = 0.44), X_c4(start = 0.23), X_ch_in(start = {0, 1, 0}), X_fa(start = 0.17), X_h2(start = 0.21), X_pro(start = 0.07), X_su(start = 0.17), ideality = true, k_dis = 1.2, multihyd = true, nW = nW, noXc = true, precipitation = false) annotation(
      Placement(visible = true, transformation(origin = {42, 14}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
    ADM1_P.BlockLibrary.Gas_Meter_stream Gas_Meter annotation(
      Placement(visible = true, transformation(origin = {58, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Continuous.LimPID PID_Pgas(Nd = 10, Td = 0.1, Ti = 0.5, controllerType = Modelica.Blocks.Types.SimpleController.PID, initType = Modelica.Blocks.Types.Init.NoInit, k = 1.5, strict = false, yMax = 20000, yMin = 0) annotation(
      Placement(visible = true, transformation(origin = {-6, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 46 + 273.15; 732, 46 + 273.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-42, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable(table = [0, 315.15; 732, 315.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-106, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR maizesilage(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-78, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/S.Antonio_Input_MaizeSilage.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_MaizeSilage", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-166, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable2(table = [0, 30; 732, 30], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/Fragea_Input_PastaUovo.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_PastaUovo", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-164, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable3(table = [0, 8; 732, 8], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-112, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR pastauovo(f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable4(table = [0, 4; 732, 4], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {-114, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Feed_Source_NIR farinetta(tan = 520, ortop = 441, f_ch_xc = 0.2, f_li_xc = 0.3, f_pr_xc = 0.2, f_si_xc = 0, nW = nW, nXin = nXin, steady = false, liquid = false) annotation(
      Placement(visible = true, transformation(origin = {-76, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.CombiTimeTable combiTimeTable2(columns = integer({3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/Fragea_Input_Farinetta.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_Farinetta", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
      Placement(visible = true, transformation(origin = {-162, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    BlockLibrary.Sink_vec sink_vec1(nW = nW) annotation(
      Placement(visible = true, transformation(origin = {136, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable5(table = [0, 280.15; 160, 300.15; 190, 300.15; 365, 280; 525, 300; 555, 300; 732, 280.15], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {58, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.TimeTable timeTable6(table = [0, 0; 732, 0], timeScale = 86400) annotation(
      Placement(visible = true, transformation(origin = {82, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    ADM1_P.BlockLibrary.Recycle recycle(recycledQ = 38) annotation(
      Placement(visible = true, transformation(origin = {52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Step step(height = 0.0, offset = 1.035, startTime(displayUnit = "Ms") = 1000000) annotation(
      Placement(visible = true, transformation(origin = {-48, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    connect(digester.outlet, sink_vec1.inlet) annotation(
      Line(points = {{56, 2}, {126, 2}, {126, -10}}));
    connect(digester.outlet, recycle.inlet) annotation(
      Line(points = {{56, 2}, {72, 2}, {72, -20}, {64, -20}}));
    connect(recycle.outlet, digester.inlet) annotation(
      Line(points = {{44, -20}, {20, -20}, {20, 22}, {28, 22}}));
    connect(step.y, PID_Pgas.u_m) annotation(
      Line(points = {{-36, 86}, {-34, 86}, {-34, 52}, {-6, 52}, {-6, 60}}, color = {0, 0, 127}));
    annotation(
      experiment(StartTime = 0, StopTime = 6e+07, Tolerance = 1e-09, Interval = 3600.14),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
      __OpenModelica_simulationFlags(lv = "LOG_NLS_NEWTON_DIAG", s = "dassl", variableFilter = ".*"));
  end Fragea;

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

  package Functions
    function regSign
      input Real u;
      output Real y;
    algorithm
      y := Modelica.Fluid.Utilities.regStep(u, 1, -1);
    end regSign;
  end Functions;

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
    Modelica.Blocks.Sources.CombiTimeTable Input_CattleSlurry(columns = integer({2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32}), extrapolation = Modelica.Blocks.Types.Extrapolation.NoExtrapolation, fileName = "C:/Users/lenovo/Desktop/KINGSTON/DOTTORATO/Modelica/Pilot_plant/Codig_Ari_Aprile 2023/sludge_complete_new.txt", smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = 0, table = [0, 0; 1, 1; 2, 4], tableName = "Input_complete", tableOnFile = true, timeEvents = Modelica.Blocks.Types.TimeEvents.Always, timeScale = 86400, verboseExtrapolation = true, verboseRead = true) annotation(
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
  equation
    connect(Input_CattleSlurry.y, feed_Source.inlet) annotation(
      Line(points = {{-53, -22}, {-10, -22}, {-10, -8}, {-20, -8}}, color = {0, 0, 127}, thickness = 0.5));
    connect(feed_Source.outlet, sink_vec.inlet) annotation(
      Line(points = {{6, -13}, {51, -13}, {51, -19}, {50.8, -19}}));
    connect(timeTable1.y, feed_Source.T_op) annotation(
      Line(points = {{-94, -74}, {-10, -74}, {-10, -12}, {-20, -12}}, color = {0, 0, 127}));
    connect(timeTable.y[1], feed_Source.Q) annotation(
      Line(points = {{-36, 2}, {-20, 2}, {-20, -8}}, color = {0, 0, 127}));
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
  annotation(
    uses(Modelica(version = "4.0.0")));
end ADM1_P;
